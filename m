Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF0C257AD3
	for <lists+dri-devel@lfdr.de>; Mon, 31 Aug 2020 15:50:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1835A6E283;
	Mon, 31 Aug 2020 13:50:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C96B6E283
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 13:50:07 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CAAAB20FC3
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 13:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598881807;
 bh=ztLmZ+941EYqr7AcuVlAnDkvVWFOEg0Wm9jORnDkfUk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=vYV/FGnlQ06Mj/nnQX76wRgv2qFhTHS7eVvVPBLvjpO93baFcabyDVe+wYQC1Lh/9
 /QyPf451GSDyQH6zTMXYOggTlJyPDU0J/9TRQJa1M3PVfN8lyPGbPgU2+hcUYgPH/W
 y7q1CTt1RI1xlnnrSJpNG2oXDCfTI9ekdZZNsZj0=
Received: by mail-ej1-f45.google.com with SMTP id nw23so7184539ejb.4
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 06:50:06 -0700 (PDT)
X-Gm-Message-State: AOAM531QPU6fVbwFPWL0uS4ePWiZdywePak63AWTNOpKRqC8r56pLNQs
 t3cvaMdVeg+iA4ZU9B/xVeQItDTDOOILQfvwpk4=
X-Google-Smtp-Source: ABdhPJzSNDPf0SiyxO/14ODP0ki5tEh8fCdOy7QMsQkV/SOOG8rXrfpgfQiPmDMwBNPvJpjGjdhWCIJ1LfOLyjDXiZU=
X-Received: by 2002:a17:906:8401:: with SMTP id
 n1mr1217460ejx.215.1598881805398; 
 Mon, 31 Aug 2020 06:50:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200829142501.31478-1-krzk@kernel.org>
 <CGME20200829142607eucas1p137f06c4bac607652e972f4c49d1a9982@eucas1p1.samsung.com>
 <20200829142501.31478-10-krzk@kernel.org>
 <84ec0795-2b7f-adde-4277-2238cede8c24@samsung.com>
In-Reply-To: <84ec0795-2b7f-adde-4277-2238cede8c24@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Mon, 31 Aug 2020 15:49:54 +0200
X-Gmail-Original-Message-ID: <CAJKOXPdTz0LScEFMzJtUytHo3zHwGd=w=EOpqOc04wvoLEhchQ@mail.gmail.com>
Message-ID: <CAJKOXPdTz0LScEFMzJtUytHo3zHwGd=w=EOpqOc04wvoLEhchQ@mail.gmail.com>
Subject: Re: [RFT 10/10] arm64: dts: exynos: Enable Arizona interrupt
 controller in Exynos5433 TM2
To: Marek Szyprowski <m.szyprowski@samsung.com>
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
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Mark Brown <broonie@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Chanwoo Choi <cw00.choi@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Sangbeom Kim <sbkim73@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 dri-devel@lists.freedesktop.org, Thomas Gleixner <tglx@linutronix.de>,
 Sylwester Nawrocki <snawrocki@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 31 Aug 2020 at 15:12, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>
>
> On 29.08.2020 16:25, Krzysztof Kozlowski wrote:
> > The Wolfson Arizona codec is interrupt controller which is required by
> > bindings.  This fixes dtbs_check warnings like:
> >
> >    arch/arm64/boot/dts/exynos/exynos5433-tm2e.dt.yaml: wm5110-codec@0: 'interrupt-controller' is a required property
> >    arch/arm64/boot/dts/exynos/exynos5433-tm2e.dt.yaml: wm5110-codec@0: '#interrupt-cells' is a required property
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>
> However I really wonder if it makes sense to expose this to DTS. Indeed,
> the main MFD device of the WM5110 chip is interrupt controller, but its
> interrupts are requested internally by the respective drivers.

In such case maybe the schema should be updated? Feel free to send a
follow up or a replacement patch for this one.

Best regards,
Krzysztof
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
