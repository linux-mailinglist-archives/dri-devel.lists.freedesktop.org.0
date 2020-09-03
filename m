Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EF925C74B
	for <lists+dri-devel@lfdr.de>; Thu,  3 Sep 2020 18:45:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B5476EA11;
	Thu,  3 Sep 2020 16:45:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4416D6EA11
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 16:45:20 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id g14so3682878iom.0
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Sep 2020 09:45:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZP59A809vUXPKAmKCl/+/Toy2Yc+dTL7EkzSdpcrdXA=;
 b=APwjyOxFAui5ueWAtkZfodi3gJGRrnwmfo2xz9uQ6Vn7/0lrjshiR9erWlYd9DSvn0
 kVcRWBgLBplEqA+pucRXEpnKc1dqKGdercAJWvxiTgQbvr1fJLzPeY41TxABbircRtKg
 hSaoF9+FMVldQrorNN+0r02B6VLMXv7GSuR7opiLi5GAo3GNgH6mj3wFK0pvtrjP/dZW
 gJJBCWDYiRcdIxOvatvD/8qOXKl/yyhJhhXB5dTjVZwvxCO7PWIEvq8MKd1lDsIacyXF
 y/r++yn6Hq2dBkKUIIpcaa7CuHWXZNBOPNjm/eO+0xeFFdykF12Nfc3wlhVgBePYbswJ
 KGrg==
X-Gm-Message-State: AOAM530QCGIB5IFZnO1ziFJ3pFgoiPUBCTEIkydaCcGpsFmJcFKzkkSM
 5smPbXwxS2EQJ5XAua0Nzg==
X-Google-Smtp-Source: ABdhPJz3QtFdJj9xf68T2MjYHLUlRhw4wqkk0yrCjfmHkP7HHKrqIxRy5KYmadUP48rBi4sy6gDkig==
X-Received: by 2002:a05:6638:d4f:: with SMTP id
 d15mr4016623jak.119.1599151518184; 
 Thu, 03 Sep 2020 09:45:18 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id p78sm1582218iod.0.2020.09.03.09.45.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 09:45:17 -0700 (PDT)
Received: (nullmailer pid 2928036 invoked by uid 1000);
 Thu, 03 Sep 2020 16:45:13 -0000
Date: Thu, 3 Sep 2020 10:45:13 -0600
From: Rob Herring <robh@kernel.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 01/10] dt-bindings: arm: samsung: pmu: Use
 unevaluatedProperties
Message-ID: <20200903164513.GB2925151@bogus>
References: <20200829142501.31478-1-krzk@kernel.org>
 <159897179515.47719.9922715760129781914.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <159897179515.47719.9922715760129781914.b4-ty@kernel.org>
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
 linux-samsung-soc@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>,
 David Airlie <airlied@linux.ie>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sangbeom Kim <sbkim73@samsung.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Sylwester Nawrocki <snawrocki@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 01, 2020 at 03:50:00PM +0100, Mark Brown wrote:
> On Sat, 29 Aug 2020 16:24:52 +0200, Krzysztof Kozlowski wrote:
> > Additional properties actually might appear (e.g. assigned-clocks) so
> > use unevaluatedProperties to fix dtbs_check warnings like:
> > 
> >   arch/arm64/boot/dts/exynos/exynos5433-tm2.dt.yaml: system-controller@105c0000:
> >     'assigned-clock-parents', 'assigned-clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Applied to
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> 
> Thanks!
> 
> [1/1] ASoC: samsung-i2s: Use unevaluatedProperties
>       commit: 8187d8300251a99e40e288be80bef6a15b7b22e4

Please revert or drop. All these 'unevaluatedProperties' changes are 
wrong.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
