Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2CEA2B952
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 03:53:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD97D10EA06;
	Fri,  7 Feb 2025 02:53:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NpVY6vrO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6666710EA06
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 02:53:38 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-53e3778bffdso1652010e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2025 18:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738896817; x=1739501617; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=4bQ7UzcBILiok8yPsKwu7aqylXDYRvrv0QMeB8LCUgk=;
 b=NpVY6vrOE0CdKMai5eUERlJwfjBWxZqxviGl/emNVWWn7CfyyF9ftcs9dze688i4qB
 q1LmA7ZH5N2SihBR0vExd6N6k5f5Qt078hs5pVN4RtVILU86HtzvEsUuEPqRZdldM0Vv
 sxJOKhcHX+41Lx3hXZ0yLE6+eKxdNtIrHfJegEmvwxTpFGNm2IUfN9Rc9R7KGBGvgLmw
 aIi4la8XI6VwYZpDS2Omx/ZNuLzIGrJ0/7hJsHM+yj6J5fnooKF6QLqhoVny2XiEwPHd
 I1wAKrIj0LZECGJy3XUmprZ/dgWupWaYgucq7imfW5KHzMePh46Wb8FKkmIMNjRfpYE/
 YboQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738896817; x=1739501617;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4bQ7UzcBILiok8yPsKwu7aqylXDYRvrv0QMeB8LCUgk=;
 b=Yujbp7hLnvpu7bGnbYoeGLCuAdnqH3+4QRsseW+ukaCzZ2tKh1peq5vnr78QyCTgMr
 zzqbbsqqJRfzwR4QYtRSQwBmPTs05ch/NbvHf1oLOMGZ49CgkDtNKI23VgQkAfsVuqE7
 ZaC6fKLaDUY6bEK57/vLNPAT5OdZvASE7yQjgqoYayuphTUtc1GTpaMq7Hn4FUvfw9JJ
 1euhzQgsvn8vrwMnd78zh5jnKHgNTaAw1f9aoG6X4r+ZpojYcv3SAkCKnWJNLZB9Up3p
 yEXSG0YAhrw1/Nj0skVNetUdl7SmTkWLROIlRFlalGd769MvEpUAnfePWU5RDr11uzqi
 4QUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPAVap0EII7kyAddFtPY8XDRGMmGvRniiRPY1LInfs7efhO2SeTlsGjg8j398TCEYxMXuct4YkQoc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywy/dmA6aRbby8MCLj+cUgfhaQ6Uw4Q2IDfIpoB/m7i12s84Nk5
 5h9KPnbBGHdQVbcZjVgWNhWwKPU3vFySIM1H7Vm3y31WqSeZsERh8CFWui0moSY=
X-Gm-Gg: ASbGncuME6J0uHkOzilJGcCcVAPEr/N5VugTbjFn5f25NaVE6QoQ/CNsAzxvsz3Lwc/
 L29oDmXtIiGKYDU3H6lyh2fVcB9N83UMDYh6cw9b5zSEAjPxDRNshDp2WU6uw6NR9wx6I4CEmea
 MRwv9uL5/j9lO0R2FId5aAaPgIRjSm25+Td5f5iA6u2yBCQo7E6jPxpfcy4Uurn0CrMW2O63Qc0
 sP9RsBvSCnBlwnpEbmCID5NBgSNC2CuvcDs3mXCVSlmD9+WkLzb3zhp+HoAlljQvWWbIE6rmoFl
 8Mhp9H+16NMGXndHSfqR1wPGQlrqR80WmntFrLw75M8o9K0sTXTmWAadFFa7MzZ2M5E1PWo=
X-Google-Smtp-Source: AGHT+IGImw4t66PXbBcvSoL+mAUZ3Fy9NEnPZ96ZWlrP0JGkhsvbwS8pOJeFaustkGSW8P8yeU5gjw==
X-Received: by 2002:a05:6512:3052:b0:542:21f5:b9cd with SMTP id
 2adb3069b0e04-54414a9d1d0mr367128e87.17.1738896816663; 
 Thu, 06 Feb 2025 18:53:36 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-544105558fbsm308903e87.76.2025.02.06.18.53.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 18:53:35 -0800 (PST)
Date: Fri, 7 Feb 2025 04:53:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
 Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Paul Kocialkowski <contact@paulk.fr>, Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v6 10/26] drm/bridge: add devm_drm_of_get_bridge_by_node()
Message-ID: <5izgpfrkxrcbcbzr7w5lpm6tidwl4lj66tmnm6l6xmncu6t3uk@2mswjcmi34el>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-10-9d6f2c9c3058@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206-hotplug-drm-bridge-v6-10-9d6f2c9c3058@bootlin.com>
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

On Thu, Feb 06, 2025 at 07:14:25PM +0100, Luca Ceresoli wrote:
> devm_drm_of_get_bridge(), which is based on graph links, is the recommended
> function to get a pointer to the following bridge.
> 
> This is valid even for panels, for which the recommended device tree
> description is via graph links and not (or not only) panel subnodes of a
> panel controller (e.g. "dsi@1234" controller node with a "panel@0"
> subnode).
> 
> However there are drivers supporting the panel subnode description in

I'd say, name them here (at least the one which we looked upon).

> addition to the graph links. For those drivers add a _by_node variant that
> takes the node of the target node.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 

-- 
With best wishes
Dmitry
