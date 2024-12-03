Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 080529E1E0B
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 14:45:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 218F410E13B;
	Tue,  3 Dec 2024 13:45:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VC5WjcCH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7747F10E13B
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 13:45:38 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2ffe4569fbeso49179041fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2024 05:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733233537; x=1733838337; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=h7CuYR8KvWJReWOTnCLxKMKX9kriMN+zYqjEqTbxeIk=;
 b=VC5WjcCH/F+Pk6mJqLOgZPDk999DSTVdb+LNP3l9YUACYWS1JjHsEbFMLPQAdcHv7z
 Ssdllwu4F+kNP56JueG8DH3i4zvw4sGnRrRn8dAibZPUyYAxJcdbMi6gwTy3ob00hkEr
 Yy67yriAxkSLnY78so+LS+WoIjFvsz+Zx18oFB3xIBwWWjqoKpnshuEd6ofmGl2ABDd5
 Mh25HYPomNDpt2UWtJRGnjd7uBBDceeI2kfoQtgUq32kCFASAck9ewxPYURKMpqdfCkK
 /Bv0V0aHgJN1NF0ogOG4kCRgynqTSKFsgaooM9Tu8cqv593UvFq252huKmdV7mD6blsB
 aNRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733233537; x=1733838337;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h7CuYR8KvWJReWOTnCLxKMKX9kriMN+zYqjEqTbxeIk=;
 b=BLJCqeEN3br+7y3T/sCPmJxCnrc0QbLg3LYWJVYoLqQl6OYVSLchf/JAYDXFOKohGC
 jirITkjtHUgK1JI+a3fcuqsbnMz7+vBMMVKjz7MdD4kdxA/an9wwkF5s7wKsPSL/g34l
 joVFawd0QcAHQ4aT+0BwWiLn/NQwpm1hrHC7CHt0Vmv/Mo4EHBSK6O1U0nscPPsesQ1A
 8SvJscbgGAPty1X8P/RaSvfjDwa6MCJi929H9oNtI/RKwUd8b60zuAX9h6XILFt37bj+
 9rGF1LZZOd4WfxkDw+dAB1XWxrk36VSWDsqFMn72194Ey+MQgsLwi5TprQ8tYpwRjk3t
 ossw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1OLQoJLlvVQqyue5dBA+6brpok6qsuaOQwi5cyvNC+v4BciM1ZeqUFapEynxiElT1QIQ09r0Haiw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yym3Or9ProeIR6djFzz/O2LjqLfSiLKDxPvl0TTMCh9X8bHOq8d
 zDhSKEr7kjpzaVI+M8oS8X3cxzJLGgumC4aaVR7rGyAUhwDmbI2I085bjBLlOU0=
X-Gm-Gg: ASbGncuQoFdK7efaX+culikbX/4U1mxCv31VRmlKXxk+Xp4wLTKG1FeU3odFOa3RN48
 FVLNO9v7rDbUy5fcx/tOqorU2gWQ64VO6/MU4es5YxcRzVwq6SkCVTaloYriNj8YxHbThpHSSlQ
 aZfvVEeQRVFeTnkxabQ8Rh/ah802YgTCGHVkSX1fsw2EBl6foGsJ33HRuImNQMoJ+p0ixwkJY2t
 fxaml9GGvCJ/guX4CtcDDj9I5PxJEWUCWQw5V+P37HRUFuHOfzwGE5EUx0w+ymK33TFFOnpxxYk
 Skgc4s8AmBz7AgHrGrjt/2lWwDbqwQ==
X-Google-Smtp-Source: AGHT+IEQO2NjaeNHOLixDzUv5WxZZEQUwkB4QYOykvSvxBbAYeu3SAKM3mDIg44l5ud5IGEEf6uCAA==
X-Received: by 2002:a05:651c:21a:b0:2ff:de64:c44f with SMTP id
 38308e7fff4ca-2ffde64c57emr59876511fa.1.1733233536627; 
 Tue, 03 Dec 2024 05:45:36 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30009665bf3sm2615041fa.113.2024.12.03.05.45.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2024 05:45:35 -0800 (PST)
Date: Tue, 3 Dec 2024 15:45:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>, 
 Doug Anderson <dianders@chromium.org>, Johan Hovold <johan@kernel.org>, 
 Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH 0/4] drm/msm/dp: ST_DISPLAY_OFF hpd cleanup
Message-ID: <pzj44gbpadhmfbausv2swkzvh6fhbwxj5a6uw6f3orstjqcmnq@jpdhvdthfkju>
References: <20241202-hpd_display_off-v1-0-8d0551847753@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202-hpd_display_off-v1-0-8d0551847753@quicinc.com>
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

On Mon, Dec 02, 2024 at 04:38:59PM -0800, Abhinav Kumar wrote:
> HPD state machine in msm dp display driver manages the state transitions
> between various HPD events and the expected state of driver to make sure
> both match up.
> 
> Although originally done with the intent of managing userspace interactions
> and interactions with compliance equipment, over period of time,
> changes to this piece of code has become quite difficult to manage.
> 
> Although, unwinding this logic will take some time and will be spread over
> various changes, to start things, this series tries to get rid of the
> ST_DISPLAY_OFF state as firstly, its really not an hpd state but a state
> of the display overall. Coupled with this, there are quite a few checks
> in the current code, the origins of which need to be re-visited OR are unclear
> which seem unlikely or redundant. With DP controller on newer chipsets supporting
> multiple streams, this has become increasingly difficult to work with.
> 
> This series removes the redundant state checks and simplifies the logic as an
> attempt to get rid of this ST_DISPLAY_OFF state.
> 
> Note: This series has been tested with sa8775p and sc7180 devices with multiple
> monitors and also multiple dongles with no noticeable regressions.
> Both of these devices use native DP PHY though. Hence, if this series can
> be verified on some devices with USBC-DP combo PHY with the help of the other
> developers, that will be great.

Don't you also have an RB5 (for pmic-typec) and SM83(?)50-HDK for
pmic-glink?

What kind of userspace were you testing with? Have you tested pure fbcon
/ drm_client?

> 
> To: Rob Clark <robdclark@gmail.com>
> To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> To: Sean Paul <sean@poorly.run>
> To: Marijn Suijten <marijn.suijten@somainline.org>
> To: David Airlie <airlied@gmail.com>
> To: Simona Vetter <simona@ffwll.ch>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Cc: Stephen Boyd <swboyd@chromium.org>
> Cc: Doug Anderson <dianders@chromium.org>
> Cc: Johan Hovold <johan@kernel.org>
> Cc: Bjorn Andersson <quic_bjorande@quicinc.com>
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
> Abhinav Kumar (4):
>       drm/msm/dp: remove redundant checks related to ST_DISPLAY_OFF in plug/irq_ipd handlers
>       drm/msm/dp: remove redundant ST_DISPLAY_OFF checks in msm_dp_bridge_atomic_enable()
>       drm/msm/dp: replace ST_DISPLAY_OFF with power_on in msm_dp_hpd_unplug_handle()
>       drm/msm/dp: remove ST_DISPLAY_OFF as a hpd_state
> 
>  drivers/gpu/drm/msm/dp/dp_display.c | 23 ++---------------------
>  1 file changed, 2 insertions(+), 21 deletions(-)
> ---
> base-commit: 798bb342e0416d846cf67f4725a3428f39bfb96b
> change-id: 20241202-hpd_display_off-6051aa510f23
> 
> Best regards,
> -- 
> Abhinav Kumar <quic_abhinavk@quicinc.com>
> 

-- 
With best wishes
Dmitry
