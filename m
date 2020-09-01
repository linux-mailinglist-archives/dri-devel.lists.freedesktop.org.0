Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EE9258C7F
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 12:13:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C06A6E848;
	Tue,  1 Sep 2020 10:13:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F165B6E848
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 10:13:27 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id e16so873646wrm.2
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Sep 2020 03:13:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=60OSzGQnLdO/drci+KqV2aNKAQlqAAKks8TSNwdM2FY=;
 b=NYBcVCLc7m5v4IcyJXn7iQ22rlEKYHYsm2M/+TiskiCFKAnml1ukNcUBlClYHw0JhT
 ebVFHscyxVS+XiDmNU7Lo1F14ts7JzKsuW8qEXHcE0seH0XA56zHBHhZJOhfaI99RHd4
 0jr5wpy2bJRslGnVDEenJCEl2kchGggGCX88fwD7/mzMhXGV1ID3jI4tcpJ0nxXPdj57
 dJsDp6nnGuK5aXO7y196s62d9Kme4DFyEjo85U/o6OFBuZyNbg1sy1gNMFDBWodUKL3P
 BxnjRwo8ff6sd3jnb8J5KmMq0Xdi4A0Eh6B1uy6Z7VeywjDSV82X38J8v9LzlOotCNJT
 VCtQ==
X-Gm-Message-State: AOAM533gWJ7ob2uhzwykFbIEQLr38vOtVWpHLg0YAE45+QUWEviaaDmj
 tK5Q5s0QiqPsGD/7AYEByVA=
X-Google-Smtp-Source: ABdhPJxMqwy/axvlMjQ/xJnNPGIvM2iHQeNPPj3R8YD2jG1F8eJm1SltrAiVX5VChjwgA+YtEBCEew==
X-Received: by 2002:a05:6000:7:: with SMTP id h7mr1171095wrx.16.1598955206626; 
 Tue, 01 Sep 2020 03:13:26 -0700 (PDT)
Received: from kozik-lap ([194.230.155.106])
 by smtp.googlemail.com with ESMTPSA id c6sm1490149wrr.15.2020.09.01.03.13.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 01 Sep 2020 03:13:26 -0700 (PDT)
Date: Tue, 1 Sep 2020 12:13:22 +0200
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
Subject: Re: [PATCH 08/10] arm64: dts: exynos: Add compatibles to sysreg nodes
Message-ID: <20200901101322.GD23793@kozik-lap>
References: <20200829142501.31478-1-krzk@kernel.org>
 <20200829142501.31478-8-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200829142501.31478-8-krzk@kernel.org>
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

On Sat, Aug 29, 2020 at 04:24:59PM +0200, Krzysztof Kozlowski wrote:
> System register nodes, implementing syscon binding, should use
> appropriate compatible.  This fixes dtbs_check warnings:
> 
>   arch/arm64/boot/dts/exynos/exynos5433-tm2.dt.yaml: syscon@13b80000:
>     compatible: ['syscon'] is not valid under any of the given schemas
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  arch/arm64/boot/dts/exynos/exynos5433.dtsi | 6 +++---

Applied.

Best regards,
Krzysztof

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
