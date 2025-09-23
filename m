Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B14DB95038
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 10:36:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3E8510E594;
	Tue, 23 Sep 2025 08:36:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vinarskis.com header.i=@vinarskis.com header.b="fHApz0RV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-10627.protonmail.ch (mail-10627.protonmail.ch
 [79.135.106.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D20910E5AC
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 08:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
 s=protonmail; t=1758616572; x=1758875772;
 bh=36wGYpuu29aWoxY4/k1QrrP8i5Y0zUpVWuiRxXPR8fY=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=fHApz0RVITdZg1tf9qnyf0aw2LS9nBnWe0dZJSTvAO/7tupXU8gAnmmkA4DFQKZdG
 F0LBghPLHLvZLiT8VKqkz++c1FgZrgs6YuFBZXdvF5PbhFUHVjm7+k+/4whxxXT1w/
 0dulULVJlDsb3yYotkQUTraHEiEdOhFheppQonoMtqAxrNWrCAMm75UlmxYgkd6A+W
 ASY3D0FhstmBDoVZSvxIUVkGwcuqlJo2DfPY1g6OUPAPLHzQWMj0OmSEHWih7ddYA5
 g92BzUzdx1aC8w0iNvVq6RR7AQfW3uz2AJ7eu4epnsq8C2KyUQKjx9eKk73/QDCmWO
 TRx4oT/M35f2g==
Date: Tue, 23 Sep 2025 08:36:08 +0000
To: Lee Jones <lee@kernel.org>
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Hans de Goede <hansg@kernel.org>,
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
 Jacopo Mondi <jacopo@jmondi.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, threeway@gmail.com,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5 3/4] leds: led-class: Add devicetree support to
 led_get()
Message-ID: <L7z33cG0mE3y_WEFhvHRJ-wbjg2kxIBVMV0C9qCifJx1DTAyMYyokyKWErFXEuzra3Kjt4pcUZ1VtzRWLBbKVNewDvJtyqPdcHMXUp4h0G0=@vinarskis.com>
In-Reply-To: <20250916160707.GA3893363@google.com>
References: <20250910-leds-v5-0-bb90a0f897d5@vinarskis.com>
 <20250910-leds-v5-3-bb90a0f897d5@vinarskis.com>
 <20250911081540.GD9224@google.com>
 <b875f811-6371-4ff4-9cc2-a0a2c82a569c@kernel.org>
 <g7xkdervsknmcwjg4qgloj643b4itjlfeyiipvsrborszgrhlg@zrp65nvfueqk>
 <20250916160707.GA3893363@google.com>
Feedback-ID: 158356072:user:proton
X-Pm-Message-ID: 9fddac5264039b46b6df9b51ab3c5969c12c32b0
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






On Tuesday, September 16th, 2025 at 18:07, Lee Jones <lee@kernel.org> wrote=
:

>=20
>=20
> On Tue, 16 Sep 2025, Bjorn Andersson wrote:
>=20
> > On Thu, Sep 11, 2025 at 11:01:00AM +0200, Hans de Goede wrote:
> >=20
> > > Hi Lee,
> > >=20
> > > On 11-Sep-25 10:15 AM, Lee Jones wrote:
> > >=20
> > > > On Wed, 10 Sep 2025, Aleksandrs Vinarskis wrote:
> > > >=20
> > > > > From: Hans de Goede hansg@kernel.org
> > > > >=20
> > > > > Add 'name' argument to of_led_get() such that it can lookup LEDs =
in
> > > > > devicetree by either name or index.
> > > > >=20
> > > > > And use this modified function to add devicetree support to the g=
eneric
> > > > > (non devicetree specific) [devm_]led_get() function.
> > > > >=20
> > > > > This uses the standard devicetree pattern of adding a -names stri=
ng array
> > > > > to map names to the indexes for an array of resources.
> > > > >=20
> > > > > Reviewed-by: Andy Shevchenko andy.shevchenko@gmail.com
> > > > > Reviewed-by: Lee Jones lee@kernel.org
> > > >=20
> > > > Remind me why this can't go in through LED again?
> > >=20
> > > I don't think anyone has discussed how to merge this yet.
> > >=20
> > > I believe that the LED tree is the correct tree to merge this
> > > entire series through, once the DT bits have been reviewed.
> >=20
> > Unless there are some strong reasons (that I'm failing to spot), we
> > should merge the DeviceTree binding and implementation through the LED
> > tree. Then I merge the DTS change through the Qualcomm DT tree once the
> > bindings are available in linux-next.

Hi Bjorn,

The bindings are now in linux-next. Could you please pick the DTS change?

Thanks,
Alex

>=20
>=20
> 1-3 have been applied to the LED tree already.
>=20
> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
