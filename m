Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7EC97E92B
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 11:58:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBCF210E3C9;
	Mon, 23 Sep 2024 09:58:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nJnTgZZv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE24310E3C9
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 09:58:32 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2f75c0b78fbso39805891fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 02:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727085511; x=1727690311; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Ub4XgTiDaTnG37jRiFm9Y2Fc+WlrLGpXlCWkejMfFT4=;
 b=nJnTgZZvE6MTnZCY1Mw8v8S6ZIl8/O0RMXgaANeKdAlY49tNHPzOv9OPMFUAaUaoZF
 A0VTiZ/TmHZBU0EF/bad3v97e01CRhZ1/lFrYcU88a0LDbfSWoZpGXsiVxvE5S6g2pv3
 4ZZlUvfT1YMuwCa4bALInu8kLsMmNGrU3+iAraR0Nv+1CKyeY37ZRu1He+g/p+EZR2pv
 WEYYf5eSNH9p79kfbZY0KgDsV2UrW4ObzSknm9SOe2l2vRKTdhV/0YNCFHomADhDKufe
 Nw+zK7MsOf8EC+IBWz3sJX0N6J1kx6pcAI5rJ+F6pKPECbteKfSN0nYc7oeh8ECnUFz3
 vNeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727085511; x=1727690311;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ub4XgTiDaTnG37jRiFm9Y2Fc+WlrLGpXlCWkejMfFT4=;
 b=BkOhbFx/sQfXn4qAy61Nfob69DipYtsdI53v+mHePbjH/N5HdUObxaQTSqYUD08XDh
 4hjHHipG1rRr7qJxRAn0QuwfRuZ+G54jCtVrUX6Gfrgx0VEJJn4ZUdVWeYo+eiq2H+4h
 xYn6pbNH2vQdp6o4IRL0gre1XjmZhAhp8SE2GojPy0VTHWUNryg5u+qs38Ms7UFnDJ4T
 fpfferMh2iQuu682iy3lrFywrImBP+Pu0HEFuajxcRdbgn2OWeLhphFtgUYGSmCTeLIS
 QaVkbnyKSyll0WRquLZPVGNy6UIK5pze9IeayhDRvavVwWjiyMKLskI9Lu3plyyGiIhY
 PtLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXb6x2Iboq6QT9sH15/P+Qky84WCI5INYXLaBwSqlV565m5e3WlgVq9SJ9dl9SEfNMD2lI6WSA5LjU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/BCvNoors+HcuNC1yxC/EyqyeRb0TEVKa+8BU/EuMH6HDj5Sb
 HDu7bdObTYVGriEgtYRUjudTrwxHtOQMzzh5aoaOrX1/4kgWIaQ7GqITGxhizlw=
X-Google-Smtp-Source: AGHT+IF70YCd6NPOg2g1uNWxOpDA5cEHVgZRGvQWfOhS4sHNqYU0tUy6qbj/ZoxZsUYtksuWhlIynw==
X-Received: by 2002:a05:6512:1309:b0:536:568f:c5ed with SMTP id
 2adb3069b0e04-536ac2d6909mr5891988e87.1.1727085510477; 
 Mon, 23 Sep 2024 02:58:30 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5368709684dsm3220907e87.148.2024.09.23.02.58.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2024 02:58:30 -0700 (PDT)
Date: Mon, 23 Sep 2024 12:58:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
 Justin Stitt <justinstitt@google.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH] drm/msm/hdmi: drop pll_cmp_to_fdata from hdmi_phy_8998
Message-ID: <utahvquemchnryqnbhuv2rfxqcgfowqqhjrbs3xtxej7ts47km@bbir4nq2mfwv>
References: <20240922-msm-drop-unused-func-v1-1-c5dc083415b8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240922-msm-drop-unused-func-v1-1-c5dc083415b8@linaro.org>
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

On Sun, Sep 22, 2024 at 12:14:48AM GMT, Dmitry Baryshkov wrote:
> The pll_cmp_to_fdata() was never used by the working code. Drop it to
> prevent warnings with W=1 and clang.
> 
> Reported-by: Jani Nikula <jani.nikula@intel.com>
> Closes: https://lore.kernel.org/dri-devel/3553b1db35665e6ff08592e35eb438a574d1ad65.1725962479.git.jani.nikula@intel.com
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c | 9 ---------
>  1 file changed, 9 deletions(-)
> 


And of course

Fixes: caedbf17c48d ("drm/msm: add msm8998 hdmi phy/pll support")

-- 
With best wishes
Dmitry
