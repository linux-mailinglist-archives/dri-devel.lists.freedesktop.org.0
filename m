Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C1725C729
	for <lists+dri-devel@lfdr.de>; Thu,  3 Sep 2020 18:41:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F04536E200;
	Thu,  3 Sep 2020 16:41:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C0726E200
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 16:41:51 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id b16so3630767ioj.4
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Sep 2020 09:41:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Wd2vM2P8GP7stt4qpcMkqIPITIt3Ct2eJFilR5ppWPI=;
 b=mg7voTPVk+nuSb26TQup65ldYg0fvCpGrYJCBFYub83tVAXzHtsM/v5cHnlrvAa77K
 Jd9rAL8GUDD22cONqaF9PJTT5BRB+He5R/bvfhHQAA7QXtcTGdoHEGd/J8C+fdRepdrV
 9/CdRDMtdjOuttsk3TkSjoR69RKCCsTEyXLoqBkCGztqzmL8+v9DnQOk4I2o1AMKQp6D
 R/HO4MPf7eqtNnU+shQBP3qBo0t4kY7vRFzrPuqy3CKlIuxyfT0tdvs/jEzPpDFrrkyX
 9NXGXfXtl+Flhl6HehOmpkfNAIkoZevGacISwhk+kKa6ynrkhjNQqM0X8lH5Pd2XtdsR
 m7Kw==
X-Gm-Message-State: AOAM533UMPQN2EmcEidvygL7o4JzNFPvB0mFcKJBLidXvTwU8bWNAT9F
 9N2oEbgnmc2vCZjl2cBEiQ==
X-Google-Smtp-Source: ABdhPJzDecNUqKQf1RpxUDZRVZ3zNdbS9KNP+UvJxBO5cwkdQiDLk1fX4u9oDum9yV0Oyy8pM76AHg==
X-Received: by 2002:a6b:8fc9:: with SMTP id r192mr3940678iod.24.1599151311395; 
 Thu, 03 Sep 2020 09:41:51 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id k16sm1482659ioc.15.2020.09.03.09.41.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 09:41:50 -0700 (PDT)
Received: (nullmailer pid 2923306 invoked by uid 1000);
 Thu, 03 Sep 2020 16:41:49 -0000
Date: Thu, 3 Sep 2020 10:41:49 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 01/10] dt-bindings: arm: samsung: pmu: Use
 unevaluatedProperties
Message-ID: <20200903164149.GA2922901@bogus>
References: <20200829142501.31478-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200829142501.31478-1-krzk@kernel.org>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Mark Brown <broonie@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Chanwoo Choi <cw00.choi@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sangbeom Kim <sbkim73@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Sylwester Nawrocki <snawrocki@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Aug 29, 2020 at 04:24:52PM +0200, Krzysztof Kozlowski wrote:
> Additional properties actually might appear (e.g. assigned-clocks) so
> use unevaluatedProperties to fix dtbs_check warnings like:
> 
>   arch/arm64/boot/dts/exynos/exynos5433-tm2.dt.yaml: system-controller@105c0000:
>     'assigned-clock-parents', 'assigned-clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  Documentation/devicetree/bindings/arm/samsung/pmu.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

NAK. See https://lore.kernel.org/r/CAL_JsqKPXJxsHPS34_TCf9bwgKxZNSV4mvQR-WKRnknQVtGGxQ@mail.gmail.com/
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
