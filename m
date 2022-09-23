Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 895C65E8585
	for <lists+dri-devel@lfdr.de>; Sat, 24 Sep 2022 00:02:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFA4E10EA34;
	Fri, 23 Sep 2022 22:02:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay.hostedemail.com (smtprelay0011.hostedemail.com
 [216.40.44.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CB0A10E9B0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 22:02:44 +0000 (UTC)
Received: from omf04.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay04.hostedemail.com (Postfix) with ESMTP id 6B5201A0739;
 Fri, 23 Sep 2022 22:02:40 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf04.hostedemail.com (Postfix) with ESMTPA id B26E420028; 
 Fri, 23 Sep 2022 22:02:19 +0000 (UTC)
Message-ID: <ac809b03c78355b52c4ce936cc5a4ed3dd303441.camel@perches.com>
Subject: Re: [PATCH v9 09/10] leds: flash: mt6370: Add MediaTek MT6370
 flashlight support
From: Joe Perches <joe@perches.com>
To: Han Jingoo <jingoohan1@gmail.com>, Andy Shevchenko
 <andy.shevchenko@gmail.com>, torvalds@linux-foundation.org, Andrew Morton
 <akpm@linux-foundation.org>, Julia.Lawall@inria.fr, 
 krzysztof.kozlowski@linaro.org
Date: Fri, 23 Sep 2022 15:02:28 -0700
In-Reply-To: <CAPOBaE7mcNqgQvsPpqewmq=Na9MC9RH5AW8CHn5ZJFAUsq6_eg@mail.gmail.com>
References: <20220830034042.9354-2-peterwu.pub@gmail.com>
 <20220830034042.9354-10-peterwu.pub@gmail.com>
 <CAPOBaE7rz2F-sij-LbYau6TRxFoOfmoUc=R__Z7iUrFWmZPgrg@mail.gmail.com>
 <CABtFH5+PuK4vptVNmpn4h2FCxNFp3wWvhUrOxgqArx4YxCY99w@mail.gmail.com>
 <CAHp75VeRgRdv54yO51nBwKx8O2pNLvOD2mrqn31zvx4ffSpCHw@mail.gmail.com>
 <CAPOBaE7mcNqgQvsPpqewmq=Na9MC9RH5AW8CHn5ZJFAUsq6_eg@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-1.fc36) 
MIME-Version: 1.0
X-Stat-Signature: icdqc5u914mweh6876zxemizkb1yinja
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: B26E420028
X-Spam-Status: No, score=-0.73
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX180tjz2i84oRN7SAvJ/UKULO1Sz9+vBSi8=
X-HE-Tag: 1663970539-507553
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
Cc: "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Alice Chen <alice_chen@richtek.com>, linux-iio <linux-iio@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 ChiYuan Huang <cy_huang@richtek.com>, Pavel Machek <pavel@ucw.cz>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Helge Deller <deller@gmx.de>,
 lee@kernel.org, ChiaEn Wu <peterwu.pub@gmail.com>,
 devicetree <devicetree@vger.kernel.org>, mazziesaccount@gmail.com,
 szuni chen <szunichen@gmail.com>, ChiaEn Wu <chiaen_wu@richtek.com>,
 Rob Herring <robh+dt@kernel.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, andriy.shevchenko@linux.intel.com,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Linux PM <linux-pm@vger.kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Mark Brown <broonie@kernel.org>, Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2022-09-23 at 14:34 -0700, Han Jingoo wrote:
> On Wed, Sep 21, 2022 Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> >=20
> > On Wed, Sep 21, 2022 at 4:48 AM ChiaEn Wu <peterwu.pub@gmail.com> wrote=
:
> > > On Sun, Sep 18, 2022 at 3:22 AM Han Jingoo <jingoohan1@gmail.com> wro=
te:
> > > > On Mon, Aug 29, 2022 ChiaEn Wu <peterwu.pub@gmail.com> wrote:
> >=20
> > > > > +#define MT6370_ITORCH_MIN_uA           25000
> > > > > +#define MT6370_ITORCH_STEP_uA          12500
> > > > > +#define MT6370_ITORCH_MAX_uA           400000
> > > > > +#define MT6370_ITORCH_DOUBLE_MAX_uA    800000
> > > > > +#define MT6370_ISTRB_MIN_uA            50000
> > > > > +#define MT6370_ISTRB_STEP_uA           12500
> > > > > +#define MT6370_ISTRB_MAX_uA            1500000
> > > > > +#define MT6370_ISTRB_DOUBLE_MAX_uA     3000000
> > > >=20
> > > > Use upper letters as below:
> >=20
> > For microseconds (and other -seconds) the common practice (I assume
> > historically) is to use upper letters, indeed. But for current it's
> > more natural to use small letters for unit multiplier as it's easier
> > to read and understand.

I think it's fine. see:

commit 22735ce857a2d9f4e6eec37c36be3fcf9d21d154
Author: Joe Perches <joe@perches.com>
Date:   Wed Jul 3 15:05:33 2013 -0700

    checkpatch: ignore SI unit CamelCase variants like "_uV"
   =20
    Many existing variable names use SI like variants that should be otherw=
ise
    obvious and acceptable.

