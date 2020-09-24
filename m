Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8576276A2B
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 09:12:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B224893B9;
	Thu, 24 Sep 2020 07:12:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A53A3893B9
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 07:12:06 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0C1F32396E
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 07:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600931526;
 bh=UDFf9zKKT215PJxE5sijK4UJkPNcOvhvwV4Nit05mAg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=n2N34GJj2eQoMaxpisQMeyGItdpyUbDCkeqodubc3ikpwfYXxf1m+M9Qx6+m53uhm
 bFxW3xg1ST/jvt9rZFv/ykb0el8pwwu+gdEW9ZfAOE7P89cysX9oX3yuYhT/Wmr3OK
 q/Q560qR7mr/Uv8YbaNzmfvUciJZ7BgvjsF/dW6c=
Received: by mail-ej1-f47.google.com with SMTP id e23so3027246eja.3
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 00:12:05 -0700 (PDT)
X-Gm-Message-State: AOAM530M2dtg6TalnWZ5kxw/hBk634ZtZRT1Oqi4viNwnXKa/m3IKuRg
 smjnUsRkg+eLaYRVxb96ImZImxKevdY/RweREsw=
X-Google-Smtp-Source: ABdhPJwd6VYdAtbK3+XjtsTzCKRZ3Zhu0deviv6thxbcXtQbmFjSRU1wDVkfK3IrycpIpytL9VH0ObTJ5D5DAQk7odo=
X-Received: by 2002:a17:906:8401:: with SMTP id
 n1mr3118087ejx.215.1600931524506; 
 Thu, 24 Sep 2020 00:12:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200922152839.2744-1-krzk@kernel.org>
 <fe4609b5-5aab-46ed-5280-9a4742b97fe5@ti.com>
 <20200923205857.5af407ee@archlinux>
In-Reply-To: <20200923205857.5af407ee@archlinux>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 24 Sep 2020 09:11:52 +0200
X-Gmail-Original-Message-ID: <CAJKOXPdWD47OvK7qQ4Md2t3U=NmSf=j5hNjBq4+8CgZKLdup=Q@mail.gmail.com>
Message-ID: <CAJKOXPdWD47OvK7qQ4Md2t3U=NmSf=j5hNjBq4+8CgZKLdup=Q@mail.gmail.com>
Subject: Re: [PATCH v2] MAINTAINERS: add Dan Murphy as TP LP8xxx drivers
 maintainer
To: Jonathan Cameron <jic23@kernel.org>, Lee Jones <lee.jones@linaro.org>
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-iio@vger.kernel.org, linux-pm@vger.kernel.org,
 Sebastian Reichel <sre@kernel.org>, dri-devel@lists.freedesktop.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Dan Murphy <dmurphy@ti.com>,
 Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 23 Sep 2020 at 22:01, Jonathan Cameron <jic23@kernel.org> wrote:
>
> On Wed, 23 Sep 2020 11:53:33 -0500
> Dan Murphy <dmurphy@ti.com> wrote:
>
> > Hello
> >
> > On 9/22/20 10:28 AM, Krzysztof Kozlowski wrote:
> > > Milo Kim's email in TI bounces with permanent error (550: Invalid
> > > recipient).  Last email from him on LKML was in 2017.  Move Milo Kim to
> > > credits and add Dan Murphy from TI to look after:
> > >   - TI LP855x backlight driver,
> > >   - TI LP8727 charger driver,
> > >   - TI LP8788 MFD (ADC, LEDs, charger and regulator) drivers.
> > >
> > > Cc: Dan Murphy <dmurphy@ti.com>
> > > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> >
> > Acked-by: Dan Murphy <dmurphy@ti.com>
> >
> Not sure who will pick this one up, but
> Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

I guess whoever is first. :)
This spans across systems but the common part is MFD, so maybe Lee -
could you pick it up?

Best regards,
Krzysztof
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
