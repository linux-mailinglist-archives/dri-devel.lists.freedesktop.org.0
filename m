Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7AC9EBFA5
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 00:55:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3DF810EA0C;
	Tue, 10 Dec 2024 23:55:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="G1eAuNaQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC9F410EA0C
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 23:55:41 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-53f22fd6832so3326443e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 15:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733874940; x=1734479740; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=QaZTccrFdwBnijOAV+VQJ0MabSTqdmlDkCUExpbfNic=;
 b=G1eAuNaQf2iG4ZeBdHsJJFq63dBGBVu1E27lwr1LH75wy8RmRdGGI7C3bNJYVnYmcU
 kIFqAWFBZ5C/iQVTjA7hv8sm9hE+giGJkO+zsvZ8SO0+tl3Ne5zcGbZXuyyoXtymyX7k
 GXZsk0Ym+KPvti5vjSAAER7t0HOMCeDe4wC7t2LHtUeb79zW8fro5qDK2sZe3sbbhu3P
 AEKti+iyth8Mp6s74lWE4ue4g2kTWUAKn3l2uG1ERMI0dBIhE7zFKegdX1HAf2f13rME
 i03O5lT+UMcUDiVtWoOw44EQqBax6X7jG80fe/GTTSl/41bcwb0/Yv6RfT/MiW4yHytv
 L6/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733874940; x=1734479740;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QaZTccrFdwBnijOAV+VQJ0MabSTqdmlDkCUExpbfNic=;
 b=ce7+4uNX5n2ld5rOUvRAs2QwIPR2jCCdV7RfJ74iwLpVwGF7Ba6ix1j61mraMZpeNH
 QAZcDJDeAAgYq8/syE8YdH0WSrOqNt5PA8Xm5qA02pDCjt9/uN3DuXpLOdPGcPR2gVU7
 1Kf7SAMU8IFfex/amyKGxo/HEMEklJoYPhG2+DNmbOqGAHP7/pjiRm77u9V4Fc6wsxsI
 OE/EznU+WROmgenpzwOssCdmTMtGuWoDkyaFjM0uGY9ecsE0O945sJmBzUX2W1CkHnK3
 tfux4hGOniyeYyHs+s7X7VaKRXIOPgzlAiB3iwtsELuHgNBk5qt8i7SLSFj0FJ2UkMfq
 S+HQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWoVjHk8Q5ygjfFnhAba2TJdkisCK0H15ecVC/RKTVEjrkB3fTmGHy2RSAsAwEQWLvBh+wMcv1A/kc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyQjnQRt8HweZWQfvbkWaqVx2rGaIGv4JCQgpSIouGxOVLWHZdM
 R4YYL2xJphQBKIXikgWPXbLrc/2SbS0GzgJ6RWjdtGXz9mSDuJw3MGGQzpxbqAo=
X-Gm-Gg: ASbGnct8Qxf6CaTr2eQJstS1yGKnFL693ddmGSWMAozTcntAV/HBgQLQaYvXGoVX4u0
 gYI/2s/NFimPUAe2sC0HaVJ01cytudU2tzTSlBao2hGMzfJEe8ucWPFTaUE1vMP9WhtD6IqeTGj
 zK+1qS3jpBvxTVgse7Nhxf4DDeBbrZDUKX5YsQirtbrjl9057Q/4z1An1BGaQhGfwECncZOph/n
 cpt1I2Fcx3F69lo4YebUpl3sFnuJdesaMGz67C89yhE6N+o5RUrQELAjcYVIqLTL7qPwbuJ3S6C
 bpaxQr60B69YjeCkUPe+CZYrYdL0w/z5RQ==
X-Google-Smtp-Source: AGHT+IEqR0S7rTS9VZY7JOisSWbtpL7N6GcbvhCke9+P/tEVld1+jhG0IU1pO+4oYFJYfFY5K9gtWw==
X-Received: by 2002:a05:6512:ac8:b0:540:1dac:c042 with SMTP id
 2adb3069b0e04-5402a5d6c4bmr171539e87.8.1733874939550; 
 Tue, 10 Dec 2024 15:55:39 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5401a5360bcsm1065405e87.174.2024.12.10.15.55.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2024 15:55:38 -0800 (PST)
Date: Wed, 11 Dec 2024 01:55:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>, 
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Alexandre ARNOUD <aarnoud@me.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/4] drm/rockchip: dw_hdmi_qp: Add support for RK3588
 HDMI1 output
Message-ID: <vpy4foezirdhci4nvl5j4e7gf5dey3swj7xxzuzazzj6uhqnls@iyyhkpukb7yo>
References: <20241211-rk3588-hdmi1-v2-0-02cdca22ff68@collabora.com>
 <20241211-rk3588-hdmi1-v2-1-02cdca22ff68@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211-rk3588-hdmi1-v2-1-02cdca22ff68@collabora.com>
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

On Wed, Dec 11, 2024 at 01:06:14AM +0200, Cristian Ciocaltea wrote:
> Provide the basic support required to enable the second HDMI TX port
> found on RK3588 SoC.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 119 ++++++++++++++++++++-----
>  1 file changed, 96 insertions(+), 23 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
