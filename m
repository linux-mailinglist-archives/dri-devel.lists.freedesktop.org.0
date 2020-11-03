Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FE72A4746
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 15:08:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB2356ECA8;
	Tue,  3 Nov 2020 14:08:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CF036ECA8
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 14:08:13 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id i2so19199786ljg.4
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Nov 2020 06:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=0w+rja1f0+G0RfOXnBBK3uQA6RuMQSPbDSi88HYNgNM=;
 b=R+YTXLaJT5LRB3SDG2U3aax6E3yLKCcwuhgc0epoTouJXakmiduZUDKre0YfVNipLB
 Mwo2Jud2dYkQ/ZvFyfwGQOa6VTksioP5O29eQUPcXYMfyTLG+qSt324jyOPAf6hojUgh
 d9aT6C3bEvljUsUbYxF23i/Ti2xq+/SX0kgdra6S6LqjDmXzTp6pWEWrI21oEP6ycB/N
 uhcmT2bbDWO37G7PDyxVu3/4Cm8DoiYal6vtkHGLqM+dfZudapXDtZGkcApEENYCRTTY
 a50ZzOaTiyjnGvI73R8A0Nar0VXQWXec+3G5X/gxeP9SsU7Zl7Fy4GAR5ADMg3Kjex8f
 m2jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=0w+rja1f0+G0RfOXnBBK3uQA6RuMQSPbDSi88HYNgNM=;
 b=kKwaYFKIJJSgweYSS6eFPzUiheQZJvyvNRm0WxNgWSRxwAXcDi5hz4vVg9vEOm7eaG
 L4lpHnyxwzM3EM8mwSA2Eart3Wf2WcEZV9oQpY0ha/zyh44exrp++ogdhJL1hm3o0Sd3
 Ovf/tEM8Ka5J6/pBDBhlH3R7kKEuDH+suDZHlO5zq/5ffYQLBL1WgBNnEvSx3cucziSX
 3zGLbjTFbpqd/Be/LIzmzmj8A5a9KoXzd5himF8oPzDTI8GXOe+RbvXqC0z1uJsGYQ4j
 zk1Va6+lYVaEjeINBviRDPomEZOOGJqSs6BfPCRr9AvZ1uAmLj6JS8uhWYORDpoJWv89
 3baw==
X-Gm-Message-State: AOAM531R8dBPjO7mCIyR9NponZd4ctyF9SRDRBdqYp0CxUzQc3Yyyr4+
 LzYlKbiVgH7NfIH50IF1Dv6y3NyAHN4xUaF7yfk=
X-Google-Smtp-Source: ABdhPJwl8ry5bPgxL7i4vb9WG0Em25+04gn0ilBPCIMhAiAHYx2hDHAioJBclKwKX5YWNigaffZFyk2LI5y4hopgEH8=
X-Received: by 2002:a2e:7815:: with SMTP id t21mr8217735ljc.217.1604412491411; 
 Tue, 03 Nov 2020 06:08:11 -0800 (PST)
MIME-Version: 1.0
References: <20201030125149.8227-1-s.nawrocki@samsung.com>
 <CGME20201030125303eucas1p14a9de4111ffafc1870527abdea0994c9@eucas1p1.samsung.com>
 <20201030125149.8227-4-s.nawrocki@samsung.com>
 <522dd3d8-7c76-92c6-ab1e-7e04797b3e9f@samsung.com>
 <20bc744b-bbb1-8803-3844-97d59f708f43@samsung.com>
In-Reply-To: <20bc744b-bbb1-8803-3844-97d59f708f43@samsung.com>
From: Chanwoo Choi <cwchoi00@gmail.com>
Date: Tue, 3 Nov 2020 23:07:34 +0900
Message-ID: <CAGTfZH1wsdoFki1nUJ73DFvgOMDhTTXfx-Bmt=kUHxfpKDJ3rQ@mail.gmail.com>
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
Reply-To: cwchoi00@gmail.com
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Linux PM list <linux-pm@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@samsung.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Chanwoo Choi <cw00.choi@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Georgi Djakov <georgi.djakov@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sylwester,

On Tue, Nov 3, 2020 at 9:32 PM Sylwester Nawrocki
<s.nawrocki@samsung.com> wrote:
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

OK.

-- 
Best Regards,
Chanwoo Choi
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
