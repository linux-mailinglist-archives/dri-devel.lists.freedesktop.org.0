Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2DFB51750
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 14:54:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1033510E2B5;
	Wed, 10 Sep 2025 12:54:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vinarskis.com header.i=@vinarskis.com header.b="PPbYFE0W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.protonmail.ch (mail-4323.protonmail.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEAA310E2B5
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 12:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
 s=protonmail; t=1757508854; x=1757768054;
 bh=PokhKJSZTXFCrGmMN/e6OXnW4hgUUtPyE2Nv9QDkEkU=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=PPbYFE0WjYXpLeP3xJkXhRvE7JkuJkEVtJjIKNTdgMH/YUtYX44AW+lTd8ESATSu9
 yJJpS0VCptZRhalCFAnur7KEPF87eRdwthsLplDtqo5HSwN2pSump+NsGMpXdeSp6j
 WNecwig7Okb871+Hk98KxTd+VCFSQMHpgy2eNlXJwgM/NKDi3Mij3ZtZjQIHmP7qgH
 0FWD6VCNvzkBPQXkPv3VLZfjfdasccKpJ8+Bog72jmJvynWfxiup13lFdM0n5gIvSk
 WNDbPqjyYC+HzwhJyBvKfPalAK4nQ4/KxQKVHTRZigTbQYXi6LzZw+SaDkd5MMAfYE
 R5XtCoU4r8Tiw==
Date: Wed, 10 Sep 2025 12:54:08 +0000
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: Hans de Goede <hansg@kernel.org>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
 Jacopo Mondi <jacopo@jmondi.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Daniel Thompson <danielt@kernel.org>, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, threeway@gmail.com,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5 3/4] leds: led-class: Add devicetree support to
 led_get()
Message-ID: <jsLJqyPfjA2iFNHMvAxgz-zO1WecVgleSahWgW_B5BshbYat4X1UqUuKpexfxlRxnD3oWlAnHqeLGpne8JebFV-ICVxvr5g-5nI8P2Q6dY8=@vinarskis.com>
In-Reply-To: <b9017909-1643-4cef-bfff-5b672dd73960@oss.qualcomm.com>
References: <20250910-leds-v5-0-bb90a0f897d5@vinarskis.com>
 <20250910-leds-v5-3-bb90a0f897d5@vinarskis.com>
 <b9017909-1643-4cef-bfff-5b672dd73960@oss.qualcomm.com>
Feedback-ID: 158356072:user:proton
X-Pm-Message-ID: 2ce1b8c37d3e00ed785d5c327f7ece8e07ee03ac
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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






On Wednesday, September 10th, 2025 at 14:22, Konrad Dybcio <konrad.dybcio@o=
ss.qualcomm.com> wrote:

>
>
> On 9/10/25 2:01 PM, Aleksandrs Vinarskis wrote:
>
> > From: Hans de Goede hansg@kernel.org
> >
> > Add 'name' argument to of_led_get() such that it can lookup LEDs in
> > devicetree by either name or index.
> >
> > And use this modified function to add devicetree support to the generic
> > (non devicetree specific) [devm_]led_get() function.
> >
> > This uses the standard devicetree pattern of adding a -names string arr=
ay
> > to map names to the indexes for an array of resources.
> >
> > Reviewed-by: Andy Shevchenko andy.shevchenko@gmail.com
> > Reviewed-by: Lee Jones lee@kernel.org
> > Reviewed-by: Linus Walleij linus.walleij@linaro.org
> > Signed-off-by: Hans de Goede hansg@kernel.org
> > Signed-off-by: Aleksandrs Vinarskis alex@vinarskis.com
> > ---
>
>
> I was thinking, perhaps we should introduce some sort of an exclusive
> access mechanism, so that the e.g. user (or malware) can't listen to
> uevents and immediately shut down the LED over sysfs

It is already done by the original series from Hans (linked in cover),
which was merged few years back. It is also the reason why this
approach is used instead of typically used trigger-source - that
would've indeed allowed anyone with access to sysfs to disable the
indicator.

As per Hans [1], v4l2-core would disable sysfs of privacy indicator:

    sd->privacy_led =3D led_get(sd->dev, "privacy-led")
    led_sysfs_disable(sd->privacy_led);


Of course, this security only holds if one has secure boot enforced,
kernel, modules, _and_ device-tree blobs are signed.

Regards,
Alex

[1] https://lore.kernel.org/all/daf442a6-b4d6-4213-8ec0-10397d682cc4@kernel=
.org/

>
> Konrad
