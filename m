Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C3A415AC2
	for <lists+dri-devel@lfdr.de>; Thu, 23 Sep 2021 11:19:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF0CD6E0FE;
	Thu, 23 Sep 2021 09:19:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76ED76E0FE
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Sep 2021 09:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1632388764;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=Hmi9mDxMfGmpjf9AOoTu/Kv4h8mKdoxBjvMO/ClKwfg=;
 b=T4nKTAs2TMJptDF6hDMgt5dfZkhW7h4sBoXgnXkLCypfm3pHCqyjTanS/6OGlr2WN0
 q9bPStXLyVb5q8z78jLkp8baZOU6aQRbKEIt09KDBgVQdyZxz3uRYfRMd3WPOzTiSRF6
 PJa73gJZ9cUquSC7tegweW1PNxNVSZyPTxssQOMzxbtNsegEQVMp0tChULU34LXKmnA3
 CQTsn/HkBt6FRoxXTJ1Q9ZTmlhpPA+KOLM20q4TpHF8fA5yt6kobcMwgcEXEe5BDwR9Q
 lyfPnCHaFapyp34wPg382YYFdY/5yqyd8PBJNfNQ+DqQMJRt1qktd9KreMWsixwkszNu
 zd/Q==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7gpw91N5y2S3iMUQeg=="
X-RZG-CLASS-ID: mo00
Received: from mbp-13-nikolaus.fritz.box
 by smtp.strato.de (RZmta 47.33.8 SBL|AUTH)
 with ESMTPSA id I01f74x8N9JNJBX
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Thu, 23 Sep 2021 11:19:23 +0200 (CEST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v3 6/6] drm/ingenic: Attach bridge chain to encoders
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <RTPVZQ.WN90B9MHPMZ13@crapouillou.net>
Date: Thu, 23 Sep 2021 11:19:23 +0200
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-mips <linux-mips@vger.kernel.org>, list@opendingux.net,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <896D04E4-4058-474B-8BD2-7F21B1C754E4@goldelico.com>
References: <20210922205555.496871-1-paul@crapouillou.net>
 <20210922205555.496871-7-paul@crapouillou.net>
 <32234186-1802-4FDF-801A-B14E48FB86D8@goldelico.com>
 <RTPVZQ.WN90B9MHPMZ13@crapouillou.net>
To: Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3445.104.21)
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

Hi Paul,

> Am 23.09.2021 um 10:49 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
> Hi Nikolaus,
>=20
> Le jeu., sept. 23 2021 at 07:52:08 +0200, H. Nikolaus Schaller =
<hns@goldelico.com> a =C3=A9crit :
>> Hi Paul,
>> thanks for another update.
>> We have been delayed to rework the CI20 HDMI code on top of your =
series
>> but it basically works in some situations. There is for example a =
problem
>> if the EDID reports DRM_COLOR_FORMAT_YCRCB422 but it appears to be =
outside
>> of your series.
>=20
> I think the SoC can output YCbCr as well, but I never tried to use it.

Maybe there is code missing or something else. We have not yet deeply =
researched.
Except that when ignoring DRM_COLOR_FORMAT_YCRCB422 capability it uses =
RGB
and works.

>=20
>>> +		ret =3D drm_bridge_attach(encoder, &ib->bridge, NULL,
>>> +					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>> DRM_BRIDGE_ATTACH_NO_CONNECTOR makes it fundamentally incompatible
>> with synopsys/dw_hdmi.c
>> That driver checks for DRM_BRIDGE_ATTACH_NO_CONNECTOR being NOT =
present,
>> since it wants to register its own connector through =
dw_hdmi_connector_create().
>> It does it for a reason: the dw-hdmi is a multi-function driver which =
does
>> HDMI and DDC/EDID stuff in a single driver (because I/O registers and =
power
>> management seem to be shared).
>=20
> The IT66121 driver does all of that too, and does not need =
DRM_BRIDGE_ATTACH_NO_CONNECTOR. The drm_bridge_funcs struct has =
callbacks to handle cable detection and DDC stuff.
>=20
>> Since I do not see who could split this into a separate bridge and a =
connector driver
>> and test it on multiple SoC platforms (there are at least 3 or 4), I =
think modifying
>> the fundamentals of the dw-hdmi architecture just to get CI20 HDMI =
working is not
>> our turf.
>=20
> You could have a field in the dw-hdmi pdata structure, that would =
instruct the driver whether or not it should use the new API. Ugly, I =
know, and would probably duplicate a lot of code, but that would allow =
other drivers to be updated at a later date.

Yes, would be very ugly.

But generally who has the knowledge (and time) to do this work?
And has a working platform to test (jz4780 isn't a good development =
environment)?

The driver seems to have a turbulent history starting 2013 in =
staging/imx and
apparently it was generalized since then... Is Laurent currently dw-hdmi =
maintainer?

>=20
>> Therefore the code here should be able to detect if =
drm_bridge_attach() already
>> creates and attaches a connector and then skip the code below.
>=20
> Not that easy, unfortunately. On one side we have dw-hdmi which checks =
that DRM_BRIDGE_ATTACH_NO_CONNECTOR is not set, and on the other side we =
have other drivers like the IT66121 which will fail if this flag is not =
set.

Ok, I see. You have to handle contradicting cases here.

Would it be possible to run it with DRM_BRIDGE_ATTACH_NO_CONNECTOR first
and retry if it fails without?

But IMHO the return value (in error case) is not well defined. So there
must be a test if a connector has been created (I do not know how this
would work).

Another suggestion: can you check if there is a downstream connector =
defined in
device tree (dw-hdmi does not need such a definition)?
If not we call it with 0 and if there is one we call it with
DRM_BRIDGE_ATTACH_NO_CONNECTOR and create one?

Just some ideas how to solve without touching hdmi drivers.

BR and thanks,
Nikolaus=
