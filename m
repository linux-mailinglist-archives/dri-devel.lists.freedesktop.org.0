Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DD77CBC8A
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 09:44:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6A3E10E27F;
	Tue, 17 Oct 2023 07:44:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA4DD10E27F
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Oct 2023 07:44:08 +0000 (UTC)
Received: from i53875b5b.versanet.de ([83.135.91.91] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1qsekB-0005qD-9e; Tue, 17 Oct 2023 09:43:59 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH 3/5] drm/panel: st7703: Add Powkiddy RGB30 Panel Support
Date: Tue, 17 Oct 2023 09:43:57 +0200
Message-ID: <3022818.687JKscXgg@diego>
In-Reply-To: <SN6PR06MB53428A7534F1AB449688AA67A5D7A@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20231013183918.225666-1-macroalpha82@gmail.com>
 <2140189.3Lj2Plt8kZ@diego>
 <SN6PR06MB53428A7534F1AB449688AA67A5D7A@SN6PR06MB5342.namprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
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
Cc: megous@megous.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, kernel@puri.sm, sam@ravnborg.org,
 neil.armstrong@linaro.org, sebastian.reichel@collabora.com,
 dri-devel@lists.freedesktop.org, Chris Morgan <macroalpha82@gmail.com>,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 Ondrej Jirman <megi@xff.cz>,
 Guido =?ISO-8859-1?Q?G=FCnther?= <guido.gunther@puri.sm>, jagan@edgeble.ai,
 Dragan Simic <dsimic@manjaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Chris,

Am Montag, 16. Oktober 2023, 20:26:58 CEST schrieb Chris Morgan:
> On Mon, Oct 16, 2023 at 08:18:25PM +0200, Heiko St=C3=BCbner wrote:
> > Hi,
> >=20
> > Am Montag, 16. Oktober 2023, 18:07:52 CEST schrieb Dragan Simic:
> > > On 2023-10-16 17:52, Chris Morgan wrote:
> > > > Confirmed that those pending patches DO fix the panel suspend issue=
s.=20
> > > > Thank you.
> > >=20
> > > Awesome, that's great to hear!  Perhaps a "Tested-by" in the original=
=20
> > > LKML thread [1] could help with having the patch pulled sooner.
> > >=20
> > > Links:
> > > [1]=20
> > > https://lore.kernel.org/lkml/33b72957-1062-1b66-85eb-c37dc5ca259b@red=
hat.com/T/
> > >=20
> > >=20
> > > > On Mon, Oct 16, 2023 at 3:41=E2=80=AFAM Guido G=C3=BCnther <guido.g=
unther@puri.sm>=20
> > > > wrote:
> > > >>=20
> > > >> Hi Chris,
> > > >> On Fri, Oct 13, 2023 at 01:39:16PM -0500, Chris Morgan wrote:
> > > >> > From: Chris Morgan <macromorgan@hotmail.com>
> > > >> >
> > > >> > The Powkiddy RGB30 4 inch panel is a 4 inch 720x720 DSI panel us=
ed in
> > > >> > the Powkiddy RGB30 handheld gaming device. Add support for it.
> > > >> >
> > > >> > TODO: The panel seems to not resume properly from suspend. I've
> > > >> > confirmed on the other ST7703 based devices it works correctly.
> >=20
> > so this TODO item could go away, right?
> > I can remove it when applying the patch, just want to make sure
> > all review comments are addressed - only the suspend thing it seems.
>=20
> That is correct, but let me send a v2 of this instead. I'll remove this
> verbiage among other fixes. End users wanted me to see if I could get
> this panel to run at precisely 60hz, which I believe I am able to do
> with the addition of a new PLL clock in clk_rk3568. I believe I have
> taken every constraint detailed in the datasheet to heart for the new
> frequency I'll be requesting. By using the frequency of 292500000 for
> the VPLL I can get the panel running at 59.969hz which in my view is
> close enough to the ideal 59.98hz.
>=20
> I also accidentally left the UART2 active even though this device has
> no exposed UART port, so I need to fix that too by disabling it.
>=20
> Lastly I'll add my tested by to the dri-devel patches as well.

too late ;-)

Looks like your mail and me applying the series happened at a similar
time and I just saw your mail.

So if you want to change the dts now, please do a followup patch.

Thanks
Heiko


