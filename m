Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7DB7CB229
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 20:18:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2FC210E0B0;
	Mon, 16 Oct 2023 18:18:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0EF910E0B0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 18:18:32 +0000 (UTC)
Received: from i53875b5b.versanet.de ([83.135.91.91] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1qsSAc-0007vZ-Ly; Mon, 16 Oct 2023 20:18:26 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Chris Morgan <macroalpha82@gmail.com>, Dragan Simic <dsimic@manjaro.org>
Subject: Re: [PATCH 3/5] drm/panel: st7703: Add Powkiddy RGB30 Panel Support
Date: Mon, 16 Oct 2023 20:18:25 +0200
Message-ID: <2140189.3Lj2Plt8kZ@diego>
In-Reply-To: <e52152b6783e3fce9aebb64a553c6922@manjaro.org>
References: <20231013183918.225666-1-macroalpha82@gmail.com>
 <CADcbR4+i_B26g_gLrjTm8dxVzprb-WHRrx=r07wKhcJuei+96w@mail.gmail.com>
 <e52152b6783e3fce9aebb64a553c6922@manjaro.org>
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
 kernel@puri.sm, krzysztof.kozlowski+dt@linaro.org, neil.armstrong@linaro.org,
 sam@ravnborg.org, Chris Morgan <macromorgan@hotmail.com>,
 dri-devel@lists.freedesktop.org, sebastian.reichel@collabora.com,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 Ondrej Jirman <megi@xff.cz>,
 Guido =?ISO-8859-1?Q?G=FCnther?= <guido.gunther@puri.sm>, jagan@edgeble.ai
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Am Montag, 16. Oktober 2023, 18:07:52 CEST schrieb Dragan Simic:
> On 2023-10-16 17:52, Chris Morgan wrote:
> > Confirmed that those pending patches DO fix the panel suspend issues.=20
> > Thank you.
>=20
> Awesome, that's great to hear!  Perhaps a "Tested-by" in the original=20
> LKML thread [1] could help with having the patch pulled sooner.
>=20
> Links:
> [1]=20
> https://lore.kernel.org/lkml/33b72957-1062-1b66-85eb-c37dc5ca259b@redhat.=
com/T/
>=20
>=20
> > On Mon, Oct 16, 2023 at 3:41=E2=80=AFAM Guido G=C3=BCnther <guido.gunth=
er@puri.sm>=20
> > wrote:
> >>=20
> >> Hi Chris,
> >> On Fri, Oct 13, 2023 at 01:39:16PM -0500, Chris Morgan wrote:
> >> > From: Chris Morgan <macromorgan@hotmail.com>
> >> >
> >> > The Powkiddy RGB30 4 inch panel is a 4 inch 720x720 DSI panel used in
> >> > the Powkiddy RGB30 handheld gaming device. Add support for it.
> >> >
> >> > TODO: The panel seems to not resume properly from suspend. I've
> >> > confirmed on the other ST7703 based devices it works correctly.

so this TODO item could go away, right?
I can remove it when applying the patch, just want to make sure
all review comments are addressed - only the suspend thing it seems.


Thanks
Heiko


