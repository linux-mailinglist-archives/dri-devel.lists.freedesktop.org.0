Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 542DB2A45FD
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 14:12:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A78CF6EC88;
	Tue,  3 Nov 2020 13:12:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C02D6EC88
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 13:12:00 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E56112224E
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 13:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604409120;
 bh=+7JbMhytyRsTirCANMnMd4YOm4X/s5w+5rkhangGOng=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=corduBPVOuWsxLDXFIz7KhE212/D2r07oOD7+xj0uXZdL5BcpE4S8S7rmW1B/Y0fk
 FEWN+XtfAmcC1ddNMyCHJlnzlQmw6vKPqYs7FkkCAOhrCKGLYL0N2tgw/L6t5rhIiU
 eg+yrQq9bJIQ7KX5qIR3/Z4zx6Yln1cJG19yjGN4=
Received: by mail-ed1-f51.google.com with SMTP id w1so17069128edv.11
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Nov 2020 05:11:59 -0800 (PST)
X-Gm-Message-State: AOAM533sshOSglsO2sUHEXbtji8qiigxCrQgjTsk3oq8fPMwNlzRUJYG
 T/bhXKEgTeastom8zbJ9jzIZxkJ3BX+/y0i9zpo=
X-Google-Smtp-Source: ABdhPJwHKZSSgISev/UaBV8IU3ye6DvSnFWF3BfI0HEvigilb+i1KjnoOgFL5dDVnk7YhJPrLr+ubAF76ckyGXykGTM=
X-Received: by 2002:a05:6402:290:: with SMTP id
 l16mr20293009edv.104.1604409118468; 
 Tue, 03 Nov 2020 05:11:58 -0800 (PST)
MIME-Version: 1.0
References: <20201030125149.8227-1-s.nawrocki@samsung.com>
 <CGME20201030125303eucas1p14a9de4111ffafc1870527abdea0994c9@eucas1p1.samsung.com>
 <20201030125149.8227-4-s.nawrocki@samsung.com>
 <522dd3d8-7c76-92c6-ab1e-7e04797b3e9f@samsung.com>
 <20bc744b-bbb1-8803-3844-97d59f708f43@samsung.com>
In-Reply-To: <20bc744b-bbb1-8803-3844-97d59f708f43@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Tue, 3 Nov 2020 14:11:45 +0100
X-Gmail-Original-Message-ID: <CAJKOXPf_WP0+S70kT+38asBsQFTPKqw=hpvkoWx1Ec2qADz4-A@mail.gmail.com>
Message-ID: <CAJKOXPf_WP0+S70kT+38asBsQFTPKqw=hpvkoWx1Ec2qADz4-A@mail.gmail.com>
Subject: Re: [PATCH v7 3/6] PM / devfreq: exynos-bus: Add registration of
 interconnect child device
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
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
Cc: devicetree@vger.kernel.org,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?=
 <b.zolnierkie@samsung.com>, linux-pm@vger.kernel.org,
 Seung Woo Kim <sw0312.kim@samsung.com>, a.swigon@samsung.com,
 robh+dt@kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Chanwoo Choi <cw00.choi@samsung.com>, myungjoo.ham@samsung.com,
 dri-devel@lists.freedesktop.org, georgi.djakov@linaro.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 3 Nov 2020 at 13:32, Sylwester Nawrocki <s.nawrocki@samsung.com> wrote:
>
> Hi Chanwoo,
>
> On 03.11.2020 11:45, Chanwoo Choi wrote:
> > On 10/30/20 9:51 PM, Sylwester Nawrocki wrote:
> >> This patch adds registration of a child platform device for the exynos
> >> interconnect driver. It is assumed that the interconnect provider will
> >> only be needed when #interconnect-cells property is present in the bus
> >> DT node, hence the child device will be created only when such a property
> >> is present.
> >>
> >> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
>
> >>  drivers/devfreq/exynos-bus.c | 17 +++++++++++++++++
>
> > We don't need to  add 'select INTERCONNECT_EXYNOS' in Kconfig?
>
> I think by doing so we could run into some dependency issues.
>
> > Do you want to remain it as optional according to user?
> Yes, I would prefer to keep it selectable through defconfig.
> Currently it's only needed by one 32-bit ARM board.

I am fine with it as it is really optional.

You could consider then "imply" but then you would need to check for
dependencies (the same as with select).

Best regards,
Krzysztof
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
