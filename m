Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FA28C974A
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 00:27:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D21289CF6;
	Sun, 19 May 2024 22:27:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="tESPRw1Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C10A189CF6
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2024 22:27:49 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-51f2ebbd8a7so4503448e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2024 15:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716157668; x=1716762468; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=BO5+7Q1RQRDjYzltuBgr3Uv8DKIwV1or1RwSqwkaB4A=;
 b=tESPRw1YlijxWb70mQXTmFb/a0hAaa6Fq5yUfYRhRnKmksF/aCzUW5kZk3bd7I2W9e
 lnpmckzOHl91pomkmlqoICdoQlo+axvSfX05g3pFOZv+Lz/cPEVTkGbI6HcePHZfJPbu
 d9iEeDPhv7mfjJUfw14M+K478nZJj/G6C5fzqDNvaYQsWQzf+YRCN0N69Zwh0MtlF1pc
 7he1Bm64iFRdYRWtEVXYrX6m3Sm04a7WkmKRlMBNwVgI28vBdcIA7kdrQXw5/7gy2IJb
 YjFdmIwlQ58bPLRRYSPvm9waJsYyYTLOrjfPs5HlamhO7ava/pxSlyglV5RTAUsls36I
 fpPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716157668; x=1716762468;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BO5+7Q1RQRDjYzltuBgr3Uv8DKIwV1or1RwSqwkaB4A=;
 b=CIxQJzGnKIfOvp+eBH9+31h8JBvjfhKFS2T6rXf6J+vj/3Uwz49EU7tjxuuYNOxMQA
 VD7vuDmRcHJ8SsPSPOhSMLnvRszXDd4AsknWwi5OO1ubWPipjP6mKAidqtrrw/PoNUSj
 tKXZfvQ4cCjHFTTPVMtMKjkWUKwUfpyk/6+ISKqA40o5dk8Vi298GyWh2li141X9/dqb
 eWq7Wv+QAC6jouBiSgdYBTrZYZxNuAFPFbRD+o6SnxgBHgPbcIhF/RjawBpGZt/9SjO6
 y0bvSrWxF5hwwKuJpgAyOQN5sPrb/LXG/6uu2Exry6mMO26oGunKPPL1HcJPqkga9MHF
 HN/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAO5gHM96vDNFGVUm2PFt6xRO0cdioblZCELL6LmUwGjztYOSTRkX/oNFBDEQ2uU5UkPk2iKAs7jKrKI/ztpHG8SmZ75XJUXnAf89roGFC
X-Gm-Message-State: AOJu0Yx0KWPRNB1LM+aGaRVH1QFCZfRnIy0uXfiUc7JtiHxQaSv3TChX
 Mz1sOYipEFaI1Ugj3Xs48DoSX/m11jXSmb3YxxAkOfClhuxKM8n8t8yypFg0QPc=
X-Google-Smtp-Source: AGHT+IFqTuxKPtkN/mjCq5HFkdZDllEwxgfwR3L9gnYODcMnrP5qOTjww5c/3ELziv2p0XObtMoNIw==
X-Received: by 2002:a05:6512:23a7:b0:523:48f2:e3fd with SMTP id
 2adb3069b0e04-52348f2e4f3mr16139805e87.16.1716157668006; 
 Sun, 19 May 2024 15:27:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::8a5])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f39d2c84sm4046198e87.282.2024.05.19.15.27.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 May 2024 15:27:47 -0700 (PDT)
Date: Mon, 20 May 2024 01:27:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Linus Walleij <linus.walleij@linaro.org>,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/8] drm/panel: himax-hx83102: If prepare fails, disable
 GPIO before regulators
Message-ID: <puiekdzpevup372snquqey7mcn2axcgverd5syijcnhlziso7x@oqpxfpwvgajw>
References: <20240517213712.3135166-1-dianders@chromium.org>
 <20240517143643.6.Id0659a80147cf51e0ebb8fe7fee18db86851960d@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240517143643.6.Id0659a80147cf51e0ebb8fe7fee18db86851960d@changeid>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 17, 2024 at 02:36:41PM -0700, Douglas Anderson wrote:
> The enable GPIO should clearly be set low before turning off
> regulators. That matches both the inverse order that things were
> enabled and also the order in unprepare().
> 
> Fixes: 0ef94554dc40 ("drm/panel: himax-hx83102: Break out as separate driver")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>  drivers/gpu/drm/panel/panel-himax-hx83102.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
