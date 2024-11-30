Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F179DEF64
	for <lists+dri-devel@lfdr.de>; Sat, 30 Nov 2024 09:41:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F211E10E339;
	Sat, 30 Nov 2024 08:41:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hdICzdFO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB27D10E230
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2024 08:41:00 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-53de92be287so3992621e87.1
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2024 00:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732956059; x=1733560859; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=baSKiqmiyUBLUvWuYCpPjjRWJYCxLBQMcRAYfb+5olo=;
 b=hdICzdFOrdm8WuIHMvBwLhPja/pDzq6rYi0Pl2vkmu3pEd1TqBnCdeQA49VZYdjT3j
 stGgBo099wdRU3ZaGU66sql23ZBP+J8n0TF/FhPxZND7lq1X4PXbV/9HAhQ8mPaE6og1
 iO77tCzWDmT8UnXIbGmBmVam8s7OBvxIwaVs3HHbX5dI5rz9Xfcf2pXcxbpPYXbLGmip
 nuKXttur7xGsZvrAdJaCrr5KOcYG0GrZdkWbrs1vrNRzUovrz3sDkFV0QBEaovdbVisZ
 HvVaZPH7mtUVh1iX5lfE4jit8x21lBVZzRlxiQ4siHn1eVt3X7PsAr/Yu10jHuukaxou
 eJaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732956059; x=1733560859;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=baSKiqmiyUBLUvWuYCpPjjRWJYCxLBQMcRAYfb+5olo=;
 b=hUnyGXPMC1GJ8Hlu32XCQnRN2SslkkXAxTpGYHGRyWkFaqRWCcYiWrGaJ9F/RK/2xP
 ix1yY5u2ml6iARITJDMPxeM5+zMTSsiFF/omSq1Pb4J2QgAoSfy3j+MSmhBRe0+pkR2+
 Y6SiUWo8vNtTf9NN9CqoT5cCPa1ONtnNpkOY4u7gUtryVRySiZ+GlY3JkRufgLq3Mhne
 GNZVgnbWxZD3+3hAkXRID37EPKA4dCHV5h1VO0ycGKZVbRaIRMWKGIg6cdIcFk8g9FaG
 OxZwTDJtnuYrrRarLIWpFATHGT75U4qIGl73WsVYzWilKo/bJ3c3TAifOwaDX9y9d9jy
 H2CA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWU3hObxpkMycNQtfIW66+gztmjuwKGUYGdzlsSbQ4oDaX7Ozl1rGABh/pmwGEVDYga1oB6M3B9mMg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzdx4V9BP0RiSaDmBSNIbmku+y00X7yU3yb880l7mNrF1RRy77V
 kA+t4alLAi4+Ktxdugi9+oquOfRpdJl7/2E+6MU6ycZfSyAPLungtIhuquwu6mU=
X-Gm-Gg: ASbGnctc8ptAzYcS7TsZcnmij7bcMnQPNyayXoRbV9IzZq8lq40NKR2HNLrmUklImOK
 V7Y6SQNQpiKp6CmdWe2kz4V7qTDR7NWT3T2vntFMijxNAwm3qC+rLpnwIBPMQEzmXKd9NS51oXU
 I+Eetr/xVG2/7yXJJcAEi8twpOhozJ/WIFBnCiRjgEaYGGcvLF7QkwAGIPSFmSKRN/N3wGna/IV
 blZ4srYnnP6XgEMcBKFUZ/CLVvZE0OkdI8oLC6Wp8lMOsTp4oMik/IUztNsh7/7yWIueiJVrb4U
 PSci+51+I7+5+tUUFaC3ntK68zi0jA==
X-Google-Smtp-Source: AGHT+IFBylZknNJ1o0HHBiqqvQUAQGaFj35b9oCZT+43x1VzxUT6UhVfLErgQC05RzQ8a1Hc2haFJA==
X-Received: by 2002:ac2:4c45:0:b0:53b:4a6c:1849 with SMTP id
 2adb3069b0e04-53df010b1b4mr13034366e87.35.1732956058823; 
 Sat, 30 Nov 2024 00:40:58 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df6497200sm704170e87.223.2024.11.30.00.40.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Nov 2024 00:40:58 -0800 (PST)
Date: Sat, 30 Nov 2024 10:40:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 kernel@collabora.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] drm/connector: hdmi: Add support for YUV420 format
 verification
Message-ID: <4eclfesrec6yv6fsleqmjxuvmefppflqyzacpr2gnng4bopqeb@zk4srnfucxnf>
References: <20241130-hdmi-conn-yuv-v1-0-254279a08671@collabora.com>
 <20241130-hdmi-conn-yuv-v1-2-254279a08671@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241130-hdmi-conn-yuv-v1-2-254279a08671@collabora.com>
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

On Sat, Nov 30, 2024 at 01:56:33AM +0200, Cristian Ciocaltea wrote:
> Provide the necessary constraints verification in
> sink_supports_format_bpc() in order to support handling of YUV420
> output format.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 40 +++++++++++++++++++++++--
>  1 file changed, 37 insertions(+), 3 deletions(-)

LGTM, please add KUnit tests.

-- 
With best wishes
Dmitry
