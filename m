Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 976A99316E8
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 16:37:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5CEF10E3EE;
	Mon, 15 Jul 2024 14:36:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="C4Pudde5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C88EE10E3F6
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 14:35:41 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-52ea5dc3c79so6138907e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 07:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721054140; x=1721658940; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=4CA0j0qYgma9RsWWWam732StHneIHgNV9F5zSymaHAA=;
 b=C4Pudde52N4koPGxCDcIYGQtXgC9mbMvpNog3lwCVJjHs0/VUvhrgC0TWzqBPhCkXh
 SoIPDXWkpflyF4dxd8GuuEKe0MldHnO9P7cORwo7/g2B3U8jYuhSaVfKc6JMbovgCrY1
 wdO0uT4/WTlfzJl6sjp1cN3AHZmZ6r8VnYPrOKuyxkAlQUcw4x7Hfnrd9cSWErvPp1AO
 9KW2mAPsDbUJbC2ld9d9OjMp7Co6wuk1oVErnn0cPgsoaY8+5YyDDVwkT3G/HGO3RFNx
 I1dfmBOxM4yZmz/DBvDi5IBupZbjRQkAJicQVeCjz2svwk7xEMl1ObVgWea4MF7vkgG6
 VYUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721054140; x=1721658940;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4CA0j0qYgma9RsWWWam732StHneIHgNV9F5zSymaHAA=;
 b=M4rXC0Ss7XZzvuNIzAEa/ERBQpXDIwKi0L2ltyrGuj18FGoP7NYNX8boO+uwEkW360
 /bmZ3COcFCQN4TzAJqLrjQVdKeGVgTvuVeM5G49YU/Znm05mZ7fQ9aOMECAIQSpL3gaU
 r4KZZDQE/0a6qaeBPJhsO8v5QnSuLnqiF5zuA+gVax3vylv0rWpGSRJdQ2WEGkRsxS8V
 R3EFeOguIVxUFHz4ieAs4WYlSX3R+btCipWlrs3FyUWFffTal6Z32wDoyYPW2bg9oPpe
 8SkFZuKsBo9IDpVjM6KCFGQtNkRg73zdTNlLlfLncn6hKSXl/sW8RaJuwvlTX361QNVe
 x30Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBRya9oMRElAj84aZWbRQUj8mK4XIHg0Zr93FQDpCMUUxOGM0436p61l3C8F5P9Mr50ElPx/iWan8YHuNAE235vvnDZoybb0EC5aCjO6PO
X-Gm-Message-State: AOJu0Yw2HSxnjGDHqPaQBE0noX3CxVPxyIkZ7N58LBjhFQL0jZErx2uo
 A/GjM2Gk2XT9pCG/8NOaOCQYORYSsbFi9Z+I9LZsW0zbz4i15m8SDu6WQ9shXSw=
X-Google-Smtp-Source: AGHT+IEBt3FSZn+bEEmg7cFHAOhGiDVl/Yrs6OE8f3qL4sJht2Gmf/gnilyQCrhbXPJA9//YuXWhDw==
X-Received: by 2002:a05:6512:e92:b0:52c:dfa0:dca0 with SMTP id
 2adb3069b0e04-52eb99d323bmr15414936e87.43.1721054139884; 
 Mon, 15 Jul 2024 07:35:39 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ed2539b80sm863331e87.299.2024.07.15.07.35.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jul 2024 07:35:39 -0700 (PDT)
Date: Mon, 15 Jul 2024 17:35:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>, 
 Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH v6 3/6] drm/msm/hdmi: add "qcom,hdmi-tx-8998" compatible
Message-ID: <ai4d3hmxomr4kavhbqgpi5olsq4r6r5abttjkvhn77lrepfbmj@qq7ytgkswe2i>
References: <20240715-hdmi-tx-v6-0-d27f029627ad@freebox.fr>
 <20240715-hdmi-tx-v6-3-d27f029627ad@freebox.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240715-hdmi-tx-v6-3-d27f029627ad@freebox.fr>
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

On Mon, Jul 15, 2024 at 02:21:16PM GMT, Marc Gonzalez wrote:
> Current driver already supports the msm8998 HDMI TX.
> We just need to add the compatible string.
> 
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> ---
>  drivers/gpu/drm/msm/hdmi/hdmi.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
