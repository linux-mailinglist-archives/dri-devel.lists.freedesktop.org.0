Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 272BF7FA0CC
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 14:21:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B39010E290;
	Mon, 27 Nov 2023 13:21:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3DB610E290
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 13:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1701091271; x=1732627271;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3f3W/zCExRpERTrtvRVhd6LxhDLUKOt67dv+M4QmBRw=;
 b=lLy47fo9lpHIVy3EYY0NIlouCAeG0SwE30IRij0baGrW57V9ufNQCxGk
 QM7cTG911iWC5VjgyMIJ+p7kJGZEqCw0U69Q2IdFpbq6GvfesPXJjUQ6S
 91VO33M7bTshHJk9XYzdlSKAYzrBtYQywVjmqEtRG23jGISpQce0Mw3DZ
 IRUfEUWHDjIhnxwL/q1RUfZCk/33gxdNOKT87qunZKsXXWcKTiHDOjLYt
 FMLSAkhBAflO8PSfaRIJcmM2KoxHN0QeyKesyMHkCcYheA2XnAOsImthj
 bjoOd4rBD7zCswmggAU2uBliqjdKa7kDRUskO5xq5dKIF8yL9lQ8Kp7bl w==;
X-IronPort-AV: E=Sophos;i="6.04,230,1695679200"; d="scan'208";a="34192151"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 27 Nov 2023 14:21:08 +0100
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 98ECC280075;
 Mon, 27 Nov 2023 14:21:08 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: tony@atomide.com, dri-devel@lists.freedesktop.org,
 Michael Walle <mwalle@kernel.org>
Subject: Re: [PATCH 1/6] dt-bindings: tc358775: Add support for tc358765
Date: Mon, 27 Nov 2023 14:21:08 +0100
Message-ID: <5735396.DvuYhMxLoT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20231127124430.2153227-1-mwalle@kernel.org>
References: <20231126163247.10131-1-tony@atomide.com>
 <20231127124430.2153227-1-mwalle@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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
Cc: mripard@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
 ivo.g.dimitrov.75@gmail.com, Michael Walle <mwalle@kernel.org>,
 krzysztof.kozlowski+dt@linaro.org, jonas@kwiboo.se, pavel@ucw.cz,
 tzimmermann@suse.de, merlijn@wizzup.org, neil.armstrong@linaro.org,
 sre@kernel.org, dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com, simhavcs@gmail.com,
 rfoss@kernel.org, philipp@uvos.xyz, jernej.skrabec@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Am Montag, 27. November 2023, 13:44:30 CET schrieb Michael Walle:
> Hi,
>=20
> > The tc358765 is similar to tc358775 except for the stdby-gpios.
>=20
> Bad timing (for me). I'm about to send a bigger patch series for the
> tc358775 which fixes the (completely) broken initialialization. And also
> contains some of your fixes.
>=20
> That being said, I intend to make the standby gpio optional also for the
> tc358755, because it might just be hardwired on the board.
>=20
> But second, I'm really curious if this bridge is working for you correctly
> as it is at the moment. One particular thing I've noticed is that you must
> release the reset while both the clock and the data lanes are in LP11 mod=
e.
> Otherwise, the bridge won't work properly (i.e. horizontally shifted
> picture, or no picture at all).

Apparently this seems to be true for all Toshiba DSI bridges. The power on=
=20
sequence for TC9595 (TC358767) also requires LP-11 before releasing the res=
et=20
signal RESX. Additionally LP-11 is requires for using the DP AUX channel.
This also relates to the patch set from Dmitry [1].

Best regards,
Alexander

[1] https://lore.kernel.org/dri-devel/20231016165355.1327217-1-dmitry.barys=
hkov@linaro.org/

> What DSI host controller are you using?
>=20
> -michael


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


