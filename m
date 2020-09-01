Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B1F258C69
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 12:11:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 043976E4D7;
	Tue,  1 Sep 2020 10:11:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C7E56E4D7
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 10:11:06 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id x14so836428wrl.12
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Sep 2020 03:11:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=A1v6htJY2C4gvkXRIZ2JmwZNQ3YQ4RL1hEFI5vq7g+8=;
 b=TjwlSktKhT2yomWutm98A+7QPkD2nYWjw/MQWc4QqVXm1mfZ+ZHcmPeQTcHFuygh6Z
 iaQ5l+jZ4+4rIO9Wz2T33d+j+CpWvcSZFzerkf8nXexCjHjjrrqfSb6+RSEGRjDa7REs
 lUxJKvPXCilJJCWGst9LZpMtxplgVMJUTq0y6dhEHdfttPpxHTi31Ekd8BjQi3gqJAOo
 mgwXILEVz/L+ybqii7LUjGk1RUcEVYwqjv88fKYKQG+GFpFHjbNtVDpddSMCUlA3hzom
 sO44ZL/To14eh7k2YaRsNUPI9+3BafF6+U9qlIUmRjlb4/KdEycTfS4tcRDnSaxgK5e3
 WHHw==
X-Gm-Message-State: AOAM530yC9+f6TrwzFlG4ANO9mRe+enQc+OSab+xnGLZLSoixFTFG5rO
 9q03FC12qBmjtw3oqe+0ynI=
X-Google-Smtp-Source: ABdhPJxg01k871o5GFupOXE7beNlZjBYGb1IghFWAqOoAnPRnvevcgE/10DHc6ya9jyFK9jTfOM1ag==
X-Received: by 2002:adf:f54c:: with SMTP id j12mr1037991wrp.265.1598955064678; 
 Tue, 01 Sep 2020 03:11:04 -0700 (PDT)
Received: from kozik-lap ([194.230.155.106])
 by smtp.googlemail.com with ESMTPSA id p16sm1468478wro.71.2020.09.01.03.11.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 01 Sep 2020 03:11:04 -0700 (PDT)
Date: Tue, 1 Sep 2020 12:11:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 01/10] dt-bindings: arm: samsung: pmu: Use
 unevaluatedProperties
Message-ID: <20200901101101.GB23793@kozik-lap>
References: <20200829142501.31478-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200829142501.31478-1-krzk@kernel.org>
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

Hi Rob,

Could you pick all of my dt-bindings schema patches if they are ok? From
this and other series. You already have few of them in your tree so it
will help to avoid conflicts.

I am afraid that subsystem maintainers can leave them to you and vice
versa :)

Best regards,
Krzysztof

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
