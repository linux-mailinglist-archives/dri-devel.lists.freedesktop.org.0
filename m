Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BA89E84CA
	for <lists+dri-devel@lfdr.de>; Sun,  8 Dec 2024 12:50:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFCCA10E32D;
	Sun,  8 Dec 2024 11:50:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LQ9kPO/z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5113710E32F
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Dec 2024 11:50:48 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-53f22fd6832so866357e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Dec 2024 03:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733658646; x=1734263446; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Oun+K+EMFqetiro2F/rNjcDe33esgYQxsDbhRp+6WB4=;
 b=LQ9kPO/zyeFiSJsp+Io88M4ANvO44JVF/+3KBVu1VWLr0A+lt7o6aFp45cCNtmhUeS
 OylMP3fWovtgj6U93JR4oDdhPYVGDtAIySTCkiQ4jphQUOZ9YNrVTywVS9X84WkCe6XK
 K4SjF07XPYgUr5H67XcZK0nvIdYoOxeW9vjsVOsgZxXEAVpigxCQ7QW0B/SAEhCwrJDn
 tR4BHFQLAKpe9CnLdnicDTpXIa5xdmtA7otVBiW5s2klE4iprgbXJjsv52M8fIB96eui
 S5K9mi6fAAw6vRASSlO2+lHDjaQsbMotUTI8ic4l4BMXdN/SxpqK3kx2BN4qiTa47A4H
 j+8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733658646; x=1734263446;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Oun+K+EMFqetiro2F/rNjcDe33esgYQxsDbhRp+6WB4=;
 b=Iwz7cyklYscAUFuVMMkpP9T4O8MaC6qtrZs1L1d8nzEm2/+XZaFmVtr7v3MXTind1z
 wc4lFFnv313FTpgFAJIpTzRB+an5MZ/OK5x/2iRvghLGCVvZU8DhIDY5AvLZGlnzGPBQ
 Gh9ErOKkcKsxtZ56k64a9lr64G9IDffzUbHf3fKEDMeAHwNnPXKrKCkgYt+KuqjtR+7N
 Xz5F6xIIhhGtTWzZ+lJZwhTpQ8wHpj4NkJiCJ3cINhco7J1IL5tJDYgEBs9qm9Iltgt0
 IwkhZ8QHQtKeKCAwzEy91C9UlNfIa7GcFa1pSjg+sfo2/xS+VPoz7du9J9ZjofZWZj/x
 8cUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5WlGd6UPGLiKVZEH6F87ltzeFAQVSy1V5hEA9GY5oMPKCJJe3L91nPQMZBJZo0V7nCZ57DrER86U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0vc52EfDZVrlD9qfRYeS1wA0nQIZZXIYXaNWAPSBJM0WiKXID
 Ox+8qrA9nmxfjG4Rqz7dTONqQrpAkhcLTIe2FiBzynUUwaoKl+U1S0zuhpXu0Uw=
X-Gm-Gg: ASbGncv6p9Cy4KMtVbGWSGsqKyhlVY7bOzsyVt7yK3PBH8Spr3Szgb4cF0PguekMqdm
 tQIOJCBhl07WqaBGuTdWUsNY6GFvqjCOoiRCVTu0oBoS9FKDkPCh/vF/s32LueRmYhEYjsHepMb
 eLc8fxCLQBCtZhb5k2WDVQEOLp0LYUDEEqN9XPUvEw0lIp+Wc1ueXSjpPlsLEeBekmf2Cw4Cniu
 vGRbE6lP93UsTLMt6wHRSzXx0gv/MBJogAvd2WTNkAhi0SCN2bQRRPOF7FS80McjMZscO635HQO
 pSlx4VihaxLPtdMQAbfQdrJk8sHwTA==
X-Google-Smtp-Source: AGHT+IFON8ulrpLU68pOJOmwTjUY9DTeD7p4bAWPDsvZgnewDN7qknWszAcJ9yPWcxocxPPFC1T4OQ==
X-Received: by 2002:a05:6512:2245:b0:53e:389d:8ce6 with SMTP id
 2adb3069b0e04-53e389d8e61mr2465693e87.28.1733658646469; 
 Sun, 08 Dec 2024 03:50:46 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5401b8f5842sm211406e87.130.2024.12.08.03.50.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Dec 2024 03:50:45 -0800 (PST)
Date: Sun, 8 Dec 2024 13:50:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, Guenter Roeck <groeck@chromium.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Vara Reddy <quic_varar@quicinc.com>, Rob Clark <robdclark@chromium.org>, 
 Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 26/45] drm/msm/dp: replace power_on with
 active_stream_cnt for dp_display
Message-ID: <7kok44t3q4dv7jsapvdq45t4lpoaxwkxe3f345ewpfyq3ndgoh@t532yskl2wys>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-26-f8618d42a99a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-26-f8618d42a99a@quicinc.com>
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

On Thu, Dec 05, 2024 at 08:31:57PM -0800, Abhinav Kumar wrote:
> For DP MST, the link clock and power domain resources stay on until
> both streams have been disabled OR we receive hotplug. Introduce an
> active_stream_cnt to track the number of active streams and necessary
> state handling. Replace the power_on variable with active_stream_cnt
> as power_on boolean works only for a single stream.

Okay, this answers one of my previous questions. Swapping these two
patches might be beneficial.

For this patch: 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_audio.c   |  2 +-
>  drivers/gpu/drm/msm/dp/dp_display.c | 42 ++++++++++++++++++++++++-------------
>  drivers/gpu/drm/msm/dp/dp_display.h |  3 ++-
>  3 files changed, 31 insertions(+), 16 deletions(-)
> 

-- 
With best wishes
Dmitry
