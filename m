Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2884258C77
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 12:12:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 730EC6E83E;
	Tue,  1 Sep 2020 10:12:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92EAE6E846
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 10:12:51 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id x14so842348wrl.12
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Sep 2020 03:12:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=giRtIzkTWnj/UGp/V4sDByGnQWeXY4LNtuNjTm7i638=;
 b=kh5J4td9pFH3W3ylYwSuwFx8lQ75R1x38CWT4Et6S+CJVHOYb2BAA8CBCL4CebtPPk
 fAq+ABg+ILPopTkXOkaGbdN461hmQ9E3bBjL2M4Sa7KkwQyPiTQUImi7pv2f6Gk4M2bh
 0MCRDAcv6/wlQSSzbUOWbobruFxPDWhAfn5MQs9dgx6NpLNgL/Xu22yFlF1sC7v/xwNs
 UwUa2pzCT5fAVg8Plue4T1lXASKF/Aa9mnq+f7nksO2GPlAn7m+n25pEIAx9yTy0sycs
 2C3zOldnJe/6DwmU1eqxlhApZlCc0jR1oi9pSfAonOgoka7m2f7C/AEgaWbcrvZddIhG
 xoAg==
X-Gm-Message-State: AOAM531nzbJ+Vz07QWY4oGEjkKKsLEApvoRtp6yBDfE179+dZXUwd4hc
 SCD8dyRpCJ328j4REDgTTV4=
X-Google-Smtp-Source: ABdhPJwK8OxvCf+LETTT3Ik4h2RI46o1x9bZbn8w3PgBgHR26b8+DSaVMTksnsrFbuik4iajwXifkA==
X-Received: by 2002:adf:9ed1:: with SMTP id b17mr1049306wrf.227.1598955170218; 
 Tue, 01 Sep 2020 03:12:50 -0700 (PDT)
Received: from kozik-lap ([194.230.155.106])
 by smtp.googlemail.com with ESMTPSA id h5sm2534234wrc.45.2020.09.01.03.12.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 01 Sep 2020 03:12:49 -0700 (PDT)
Date: Tue, 1 Sep 2020 12:12:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kukjin Kim <kgene@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Lee Jones <lee.jones@linaro.org>, Sangbeom Kim <sbkim73@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 alsa-devel@alsa-project.org
Subject: Re: [PATCH 07/10] arm64: dts: exynos: Replace deprecated "gpios"
 i2c-gpio property in Exynos5433
Message-ID: <20200901101246.GC23793@kozik-lap>
References: <20200829142501.31478-1-krzk@kernel.org>
 <20200829142501.31478-7-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200829142501.31478-7-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Sylwester Nawrocki <snawrocki@kernel.org>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Aug 29, 2020 at 04:24:58PM +0200, Krzysztof Kozlowski wrote:
> "gpios" property is deprecated.  Update the Exynos5433 DTS to fix
> dtbs_checks warnings like:
> 
>   arch/arm64/boot/dts/exynos/exynos5433-tm2.dt.yaml: i2c-gpio-0: 'sda-gpios' is a required property
>   arch/arm64/boot/dts/exynos/exynos5433-tm2.dt.yaml: i2c-gpio-0: 'scl-gpios' is a required property
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi | 4 ++--

Applied.

Best regards,
Krzysztof

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
