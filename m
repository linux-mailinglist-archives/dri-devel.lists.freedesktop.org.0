Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C3F416574
	for <lists+dri-devel@lfdr.de>; Thu, 23 Sep 2021 20:52:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 717A189F2D;
	Thu, 23 Sep 2021 18:52:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AFFA89F2D
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Sep 2021 18:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1632423144;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=D/nNzjcVIyjeaLyDs+CZupmpViAqQGPNzKTL8+tuXA0=;
 b=HYQCtQOfD3n+rccNTwAIUVVi55ExNCtggGhsE9WRYZ9Fn1RSA6AyvRoO/Ch1URKDiE
 Wuly+SM4kb4uDMmITMK2glBxWxeALsnKns+w05URrUCgo89NuuemPnuosQnY0I7NLfSE
 0pYQb1D7jWZZO3iF1O/0wX8l49btVXgl1q9ZxzXnUA9n8pz+8uoqxGW+vdy8bHPv4P+i
 enyaPlT8pWK03z6ln3SLJpgsfq1Zx59LRd6YRWYGQhWwvMzxw2bJgksopZ32Zy+DxmKC
 B0boN+UjoiiqTCKzrFieq7yT97DFSmA58Z5RJysmHLCOUOY4K6NDnMmOJcmNEeBzqcKS
 dwkQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7gpw91N5y2S3iMUQeg=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.33.8 SBL|AUTH)
 with ESMTPSA id I01f74x8NIqNLz2
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Thu, 23 Sep 2021 20:52:23 +0200 (CEST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v3 6/6] drm/ingenic: Attach bridge chain to encoders
From: H. Nikolaus Schaller <hns@goldelico.com>
In-Reply-To: <7U2WZQ.D8DTPCJ0ZPKO3@crapouillou.net>
Date: Thu, 23 Sep 2021 20:52:23 +0200
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-mips <linux-mips@vger.kernel.org>, list@opendingux.net,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Paul Boddie <paul@boddie.org.uk>
Content-Transfer-Encoding: quoted-printable
Message-Id: <ABE75744-46FE-4F37-A14C-D996F36B7B0E@goldelico.com>
References: <20210922205555.496871-1-paul@crapouillou.net>
 <20210922205555.496871-7-paul@crapouillou.net>
 <32234186-1802-4FDF-801A-B14E48FB86D8@goldelico.com>
 <RTPVZQ.WN90B9MHPMZ13@crapouillou.net>
 <896D04E4-4058-474B-8BD2-7F21B1C754E4@goldelico.com>
 <YUxIkdGcGnBhcT0y@pendragon.ideasonboard.com>
 <3764505C-7CA9-40C4-8CFA-8B0F2361E6D5@goldelico.com>
 <YUxQ9k/CDYz20rYo@pendragon.ideasonboard.com>
 <B7C9EEE8-F999-4105-B805-1B32619A3847@goldelico.com>
 <7U2WZQ.D8DTPCJ0ZPKO3@crapouillou.net>
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

> Am 23.09.2021 um 15:30 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
> Hi Nikolaus,
>=20
> Le jeu., sept. 23 2021 at 13:41:28 +0200, H. Nikolaus Schaller =
<hns@goldelico.com> a =C3=A9crit :
>> Hi Laurent,
>> Ah, ok.
>> But then we still have issues.
>> Firstly I would assume that get_edid only works properly if it is =
initialized
>> through dw_hdmi_connector_create().
>> Next, in the current code, passing DRM_BRIDGE_ATTACH_NO_CONNECTOR to
>> dw_hdmi_bridge_attach() indeed does not call =
dw_hdmi_connector_create()
>> but returns 0.
>> This patch 6/6 makes drm/ingenic unconditionally require a connector
>> to be attached which is defined somewhere else (device tree e.g. =
"connector-hdmi")
>> unrelated to dw-hdmi. Current upstream code for drm/ingenic does not =
init/attach
>> such a connector on its own so it did work before.
>> I.e. I think we can't just use parts of dw-hdmi.
>=20
> The fact that Laurent is using dw-hdmi with =
DRM_BRIDGE_ATTACH_NO_CONNECTOR on Renesas makes me think that it's =
possible here as well. There's no reason why it shouldn't work with =
ingenic-drm.

That is interesting and Laurent can probably comment on differences =
between
his setup (I wasn't able to deduce what device you are referring to) and =
dw-hdmi.

For jz4780 we tried that first. I do not remember the exact reasons but =
we wasted
weeks trying to but failed to get it working. While the dw-hdmi =
connector simply works
on top of upstream and fails only if we apply your patch.

Another issue is how you want to tell connector-hdmi to use the extra =
i2c bus driver
for ddc which is not available directly as a standard i2c controller of =
the jz4780.

hdmi-connector.yaml defines:

  ddc-i2c-bus:
	description: phandle link to the I2C controller used for DDC =
EDID probing
	$ref: /schemas/types.yaml#/definitions/phandle

So we would need some ddc-i2c-bus =3D <&i2c-controller-inside-the =
dw-hdmi>.

But that i2c-controller-inside-the dw-hdmi does not exist in device tree
and can not be added unless someone significantly rewrites dw-hdmi to
register and expose it as i2c controller.

>=20
> The ingenic-drm driver does not need to create any connector. The =
"connector-hdmi" is connected to dw-hdmi as the "next bridge" in the =
list.

Sure. It does not *create* a connector. It expects that it can safely =
call
drm_bridge_connector_init() to get a pointer to a newly created =
connector.

But if we use the dw-hdmi connector, there is no such connector and =
"next bridge".

Or can you tell me how to make the dw-hdmi connector created by
dw_hdmi_connector_create() become the "next bridge" in the list for your =
driver?
But without significantly rewriting dw-hdmi.c (and testing).

>=20
>> If drm_bridge_attach() would return some errno if =
DRM_BRIDGE_ATTACH_NO_CONNECTOR
>> is set, initialization in ingenic_drm_bind() would fail likewise with =
"Unable to attach bridge".
>> So in any case dw-hdmi is broken by this drm/ingenic patch unless =
someone
>> reworks it to make it compatible.
>=20
> Where would the errno be returned? Why would drm_bridge_attach() =
return an error code?

Currently dw_hdmi_bridge_attach() returns 0 if it is asked to support
DRM_BRIDGE_ATTACH_NO_CONNECTOR.

This is not treated as an error by drm_bridge_attach().

Here it could return an error (-ENOTSUPP?) instead, to allow for error =
handling
by its caller.

But that raises an error message like "failed to attach bridge to =
encoder" and
the bridge is reset and detached.

>=20
>> Another issue is that dw_hdmi_connector_create() does not only do =
dcd/edid
>> but appears to detects hot plug and does some special initialization.
>> So we probably loose hotplug detect if we just use =
drm_bridge_funcs.get_edid().
>=20
> There's drm_bridge_funcs.detect().

You mean in dw-hdmi? Yes, it calls dw_hdmi_bridge_detect() which calls =
dw_hdmi_detect().
This does some read_hpd.

Anyways, this does not solve the problem that with your drm/ingenic =
proposal the
dw-hdmi subsystem (hdmi + ddc) can no longer be initialized properly =
unless someone
fixes either.

So IMHO this should be treated as a significant blocking point for your =
patch
because it breaks something that is working upstream and there seems to =
be no
rationale to change it.

Your commit message just says:
"All the bridges are now attached with DRM_BRIDGE_ATTACH_NO_CONNECTOR."
but gives no reason why.

I fully understand that you want to change it and Laurent said that it =
will become
standard in the far future. Therefore I suggest to find a way that you =
can find out
if a connector has already been created by drm_bridge_attach() to stay =
compatible
with current upstream code.

I even want to help here but I don't know how to detect the inverse of
drm_connector_attach_encoder(), i.e. =
is_drm_encoder_attached_to_any_connector().

BR and thanks,
Nikolaus



