Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B84D5415B86
	for <lists+dri-devel@lfdr.de>; Thu, 23 Sep 2021 11:56:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC82A6E064;
	Thu, 23 Sep 2021 09:56:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 140726E064
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Sep 2021 09:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1632390957;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=IDa2WRPuoV8CULciRg09mSJXzbHkCaX4O0lSs6y9dGE=;
 b=tkVfb50yJlQybJnTBzTJKcoVxEr+elg/cQMPH+u9N2TfkQZSpM09MifNmf9qLIMp1d
 QM5l5mfYcDcYxQVtOj03xV9In2oybH5VcPjASz3gYjbdQyyNmmEg53t6L/BE9vBLr0Ey
 Ii32vKYG44IxMYz/jARWiVOaBQJsIs/xxcIneYXgZREjvA47AS0FBfIsy/yZM1ZB8+Tl
 01SrcL9tss2omRiicmfXYjlkpzGkM+cux0U6J98p8YKqHyMNgqaxGiUV+Eti3UO/6e+I
 drqypRJaK7KpLoAQOB2Y9+IwNUkxKKIhuoNLljKM9JNJg3LoXRaZACwqElcM5UlGuD1X
 9/wg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7gpw91N5y2S3iMUQeg=="
X-RZG-CLASS-ID: mo00
Received: from mbp-13-nikolaus.fritz.box
 by smtp.strato.de (RZmta 47.33.8 SBL|AUTH)
 with ESMTPSA id I01f74x8N9tvJPn
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Thu, 23 Sep 2021 11:55:57 +0200 (CEST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v3 6/6] drm/ingenic: Attach bridge chain to encoders
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <YUxIkdGcGnBhcT0y@pendragon.ideasonboard.com>
Date: Thu, 23 Sep 2021 11:55:56 +0200
Cc: Paul Cercueil <paul@crapouillou.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, linux-mips <linux-mips@vger.kernel.org>,
 list@opendingux.net, dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Paul Boddie <paul@boddie.org.uk>
Content-Transfer-Encoding: quoted-printable
Message-Id: <3764505C-7CA9-40C4-8CFA-8B0F2361E6D5@goldelico.com>
References: <20210922205555.496871-1-paul@crapouillou.net>
 <20210922205555.496871-7-paul@crapouillou.net>
 <32234186-1802-4FDF-801A-B14E48FB86D8@goldelico.com>
 <RTPVZQ.WN90B9MHPMZ13@crapouillou.net>
 <896D04E4-4058-474B-8BD2-7F21B1C754E4@goldelico.com>
 <YUxIkdGcGnBhcT0y@pendragon.ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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

Hi Laurent,

> Am 23.09.2021 um 11:27 schrieb Laurent Pinchart =
<laurent.pinchart@ideasonboard.com>:
>=20
> Hi Nikolaus,
>=20
> On Thu, Sep 23, 2021 at 11:19:23AM +0200, H. Nikolaus Schaller wrote:
>>=20
>>>>> +		ret =3D drm_bridge_attach(encoder, &ib->bridge, NULL,
>>>>> +					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>>>>=20
>>>> DRM_BRIDGE_ATTACH_NO_CONNECTOR makes it fundamentally incompatible
>>>> with synopsys/dw_hdmi.c
>>>> That driver checks for DRM_BRIDGE_ATTACH_NO_CONNECTOR being NOT =
present,
>>>> since it wants to register its own connector through =
dw_hdmi_connector_create().
>>>> It does it for a reason: the dw-hdmi is a multi-function driver =
which does
>>>> HDMI and DDC/EDID stuff in a single driver (because I/O registers =
and power
>>>> management seem to be shared).
>>>=20
>>> The IT66121 driver does all of that too, and does not need
>>> DRM_BRIDGE_ATTACH_NO_CONNECTOR. The drm_bridge_funcs struct has
>>> callbacks to handle cable detection and DDC stuff.
>>>=20
>>>> Since I do not see who could split this into a separate bridge and =
a connector driver
>>>> and test it on multiple SoC platforms (there are at least 3 or 4), =
I think modifying
>>>> the fundamentals of the dw-hdmi architecture just to get CI20 HDMI =
working is not
>>>> our turf.
>>>=20
>>> You could have a field in the dw-hdmi pdata structure, that would
>>> instruct the driver whether or not it should use the new API. Ugly,
>>> I know, and would probably duplicate a lot of code, but that would
>>> allow other drivers to be updated at a later date.
>>=20
>> Yes, would be very ugly.
>>=20
>> But generally who has the knowledge (and time) to do this work?
>> And has a working platform to test (jz4780 isn't a good development =
environment)?
>>=20
>> The driver seems to have a turbulent history starting 2013 in =
staging/imx and
>> apparently it was generalized since then... Is Laurent currently =
dw-hdmi maintainer?
>=20
> "Maintainer" would be an overstatement. I've worked on that driver in
> the past, and I still use it, but don't have time to really maintain =
it.
> I've also been told that Synopsys required all patches for that driver
> developed using documentation under NDA to be submitted internally to
> them first before being published, so I decided to stop contributing
> instead of agreeing with this insane process. There's public
> documentation about the IP in some NXP reference manuals though, so it
> should be possible to still move forward without abiding by this rule.
>=20
>>>> Therefore the code here should be able to detect if =
drm_bridge_attach() already
>>>> creates and attaches a connector and then skip the code below.
>>>=20
>>> Not that easy, unfortunately. On one side we have dw-hdmi which
>>> checks that DRM_BRIDGE_ATTACH_NO_CONNECTOR is not set, and on the
>>> other side we have other drivers like the IT66121 which will fail if
>>> this flag is not set.
>>=20
>> Ok, I see. You have to handle contradicting cases here.
>>=20
>> Would it be possible to run it with DRM_BRIDGE_ATTACH_NO_CONNECTOR =
first
>> and retry if it fails without?
>>=20
>> But IMHO the return value (in error case) is not well defined. So =
there
>> must be a test if a connector has been created (I do not know how =
this
>> would work).
>>=20
>> Another suggestion: can you check if there is a downstream connector =
defined in
>> device tree (dw-hdmi does not need such a definition)?
>> If not we call it with 0 and if there is one we call it with
>> DRM_BRIDGE_ATTACH_NO_CONNECTOR and create one?
>=20
> I haven't followed the ful conversation, what the reason why
> DRM_BRIDGE_ATTACH_NO_CONNECTOR can't always be use here ?

The synopsys driver creates its own connector through =
dw_hdmi_connector_create()
because the IP handles DDC/EDID directly.

Hence it checks for ! DRM_BRIDGE_ATTACH_NO_CONNECTOR which seems to be =
the
right thing to do on current platforms that use it.

For CI20/jz4780 we just add a specialisation of the generic dw-hdmi to
make HDMI work.

Now this patch for drm/ingenic wants the opposite definition and create =
its own
connector. This fails even if we remove the check (then we have two =
interfering
connectors).

> We're moving
> towards requiring DRM_BRIDGE_ATTACH_NO_CONNECTOR for all new code, so =
it
> will have to be done eventually.

So from my view drm/ingenic wants to already enforce this rule and =
breaks dw-hdmi.

IMHO it should either handle this situation gracefully or include a fix =
for
dw-hdmi.c to keep it compatible.

BR and thanks,
Nikolaus

