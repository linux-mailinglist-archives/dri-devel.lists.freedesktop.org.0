Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DBBA45526
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 06:59:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0813A10E212;
	Wed, 26 Feb 2025 05:59:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vQBtF8sw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA00010E212
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 05:59:15 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-5462ea9691cso7118895e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 21:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740549554; x=1741154354; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=eMzggIt5lpYzzVkzOTc1TnN8z6VsZzZu0ORTornTWUU=;
 b=vQBtF8swPX00v2Q1ed2rOJ7rOjZKcEdyVyxpcGNXcuSwbakAH5jLpngOV3jwnqYhMS
 3GFkHaw/TTELVHPdOSVCQ7BT4w2yfbv7aWjhKwkKGp539AHxYG2Esa2hsCF6UJY4bKuV
 GXR8pvpYBqaBGgNPGmztqnwG8gm4cS4ZpFF3cRu0hZUDMoQQ/c2w1QKY2wkJZJM9XgcG
 bIJchBfS80I6mb6XA3LjkJ8OTx3S7I5/W0cuqKJ1TTS8lYyoYYOj+rd1uQqmlErDFvby
 KkutIpPS/5x54HxHga9lizR1uz+L4+FLgR+f6pxC5BYK1nu0j0s0jWm/QJXazXF6DY+t
 u8tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740549554; x=1741154354;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eMzggIt5lpYzzVkzOTc1TnN8z6VsZzZu0ORTornTWUU=;
 b=R3mqvtoF52hzbSIXY9pG4FI2ns1FM4h07zexE7VVGcx8N2OyRpp5sYI9zQX2+cDpH1
 mLYtFBTeiVCJGE91xKsPS/NIG7ZFVaycU+F217g/YouKoWBATl0lKtBEvImO5hhnwKlV
 tGCxm83Ob3OhsOPD8fe73yWV9Gz9pZDgCFCXe5x9h95IP1446PfK392yssvHwoA5G/II
 eybhbg7P/bvt75Ddw97Jxljmrl9XNiDjG3Qqw89KAk5ablzrq7TuM+H1mlAJdYwsiS1+
 LqO3GWaBhRxClmvTpiJ4TNRbDZs6fufoa8h5jzAs9mS8FWw4jrDg+kW/mb8uY/4e80eS
 bu2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUwmLtrOtqHE9Apx8x6EWQECI0if93Ugq27M0RjsbdDQmbSeoX0RO2jyDM5SQe6aSUFbR9pqawjWg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNtVN7+t+6sNG/yyzpodQYPgPABgU3ygxgbphs81XtpD2TTGAc
 DaoWVBG8st9cs7LpOU4BE/tWMvhPYGeFn7VWPJ0Iz4tbmd8W0J0jZ07teDvJrIU=
X-Gm-Gg: ASbGnct1MNIwTF/B45vBdfpspaLQ0W7cJc5jU58Vk55yIeXVORHHZct4lBmMGQmgnDL
 tctNWkgStGArrjbo4vhNm5e5JBGae8Rt3wqEe2H4+HlGFrTqV8xaaM+SAnenx0n85pqEuOvzgS4
 Iwnko+099EoqdIFGAmY55KpNcFNbI4z2uAxZoVcxXaHkLJLXS9Pc65V/2i9adpxkbMPZcoCTACM
 pIF/GARrKvDmrJNEsgS70zh/v0IxG/RR15sUxBvwXyyu3yqdG/A/zPLFoubyiwQSHqDnI14trYF
 90DDXcuawO0C5/4aKEgeEsF6NjYVq7yaPuS3cXDQujYYNkhbLqNgX/GNZHdLF8sJVdq0c2HfnYN
 8SenzCw==
X-Google-Smtp-Source: AGHT+IEoS4qwP4ua72xrTF0W1n0ce2ri8eECexu7dt46ZDMlqiICPAa9TU2+args7SmvRiq5CJK7wA==
X-Received: by 2002:a05:6512:3f05:b0:545:646:7519 with SMTP id
 2adb3069b0e04-5493c39db7cmr2155507e87.0.1740549553775; 
 Tue, 25 Feb 2025 21:59:13 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-548514f4d50sm346333e87.176.2025.02.25.21.59.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 21:59:12 -0800 (PST)
Date: Wed, 26 Feb 2025 07:59:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 3/4] drm/panel: Add driver for DJN HX83112B LCD panel
Message-ID: <xnbncjxfpc3cideza5cemnhskdpedqpiatmvxj3eu3xgtrv24n@iky5ghkh4grs>
References: <20250225-fp3-display-v2-0-0b1f05915fae@lucaweiss.eu>
 <20250225-fp3-display-v2-3-0b1f05915fae@lucaweiss.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225-fp3-display-v2-3-0b1f05915fae@lucaweiss.eu>
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

On Tue, Feb 25, 2025 at 10:14:31PM +0100, Luca Weiss wrote:
> Add support for the 2160x1080 LCD panel from DJN (98-03057-6598B-I)
> bundled with a HX83112B driver IC, as found on the Fairphone 3
> smartphone.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
>  drivers/gpu/drm/panel/Kconfig                |  10 +
>  drivers/gpu/drm/panel/Makefile               |   1 +
>  drivers/gpu/drm/panel/panel-himax-hx83112b.c | 430 +++++++++++++++++++++++++++
>  3 files changed, 441 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
