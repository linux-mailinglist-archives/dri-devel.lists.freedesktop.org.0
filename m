Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AE64CC47D
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 19:00:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 663AA10EAD7;
	Thu,  3 Mar 2022 18:00:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [85.215.255.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A96E710EAD7
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 18:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1646330388;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=S/Ajb9G7BzvTHaV25UD/SK5bUJk7mTLUkAHqeR66ezQ=;
 b=aEgtHOoTY5bTpPc3idG57z1HEaIhVL42kWXPjObiI7C3E4s7WfRAzDGT0kAceCRp2R
 E4SrJJaJoLyYy+Roupvo+vCYO1nSrQRSd8nuUXsZKtI4fDc/4tjal4KWHXyzBqU+XJ7o
 n8uQazYNwx0uKDbZY3s0R7sxQRwtL2RDDdEaxg9wCBRt22o0ck6PSD0fYtBDkt/yLneU
 OJHbA77pN49x9E1iBbXDRIuun/SAMwsLULf14HcR4uGARBVxDBSQD9cHPsq8VLQH8k1j
 mDDoy6KMXYeCQWXQhKfSbKfrF5AnmUe4LXkzUaCn/odMmWCBf4VQS59l00O5dNu9S2pq
 mL+g==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHWElw47tT+k="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.40.1 DYNA|AUTH)
 with ESMTPSA id n729cey23Hxl1Va
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Thu, 3 Mar 2022 18:59:47 +0100 (CET)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [Letux-kernel] [PATCH v16 1/4] drm/bridge: dw-hdmi: introduce
 dw_hdmi_enable_poll()
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <RUI68R.Z009SPJAAD8N1@crapouillou.net>
Date: Thu, 3 Mar 2022 18:59:47 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <F0F8F36B-3A0A-476C-8C7D-566255C629C6@goldelico.com>
References: <cover.1645895582.git.hns@goldelico.com>
 <e54838849f80454b863f9f5634dd10f79ef7bb8f.1645895582.git.hns@goldelico.com>
 <983e9064-17ad-e646-f37d-ca9173ba0967@baylibre.com>
 <C8AE9A7A-E288-4637-ACAD-40CD33CD5F8C@goldelico.com>
 <3E620AF4-402E-45EA-9D92-92EAEA9647F5@goldelico.com>
 <SHH68R.Z3J9KSY0GQVA2@crapouillou.net>
 <ABC1BD09-383B-4499-B034-340CE88725B3@goldelico.com>
 <RUI68R.Z009SPJAAD8N1@crapouillou.net>
To: Paul Cercueil <paul@crapouillou.net>,
 Neil Armstrong <narmstrong@baylibre.com>
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
Cc: Paul Boddie <paul@boddie.org.uk>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Maxime Ripard <maxime@cerno.tech>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 linux-mips <linux-mips@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul, Neil,

> Am 03.03.2022 um 18:20 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
> Hi Nikolaus,
>=20
> [snip]
>=20
>>> Well he said "the Ingenic DRM core" aka ingenic-drm-drv.c. You do =
have access to the main drm_device in the ingenic_drm_bind() function, =
so you can add it there (with a cleanup function calling =
drm_kms_helper_poll_fini() registered with drmm_add_action_or_reset()).
>> Well, do you really want to mix HPD detection between connector, =
Synopsys bridge and Ingenic DRM core? These are independent...
>> Or should be accessed only through the bridge chain pointers.
>> IMHO we should keep separate functions separate.
>=20
> The drm_kms_helper_poll_init() just says "this DRM device may have =
connectors that need to be polled" so it very well fits inside the main =
driver, IMHO.

As far as I understand, it has the side-effect to always set =
dev->mode_config.poll_enabled and
schedule_delayed_work() for all devices.
I am not sure if this is intended for arbitrary ingenic-drm devices. But =
you know better than me.


Hm. But wait, I think I now finally remember why I have proposed it the =
way it is!
It is always better to go back to requirements and find the least =
invasive solution.

- HPD IRQ works and calls dw_hdmi_irq() [as can be shown by adding =
printk()]
- it is just that the udevd is only notified if poll_enabled =3D true =
(but no polling takes place!).

An earlier version (v4) to fix this proposed to add an explicit call to =
drm_kms_helper_hotplug_event()
in dw_hdmi_irq() but that was rejected a while ago because =
drm_helper_hpd_irq_event() will already call it:

	https://www.spinics.net/lists/dri-devel/msg316846.html

Since this did not take into account that dev->mode_config.poll_enabled =
must be set true, I then proposed the
enable_poll() mechanism just to set this bit for the ingenic-dw-hdmi =
specialization.

So a HPD event is delivered to the dw-hdmi driver as dw_hdmi_irq() and =
that calls drm_helper_hpd_irq_event()
but not drm_kms_helper_hotplug_event() and user-space is not getting =
aware.

It is all a hack because we mix the dw-hdmi driver which originally did =
register its own connector
with an explicit connector...

In summary I now thing that the v4 patch is the simplest and least =
invasive solution.

We neither have to introduce a dw_hdmi_enable_poll() function or call =
drm_kms_helper_poll_init() anywhere.

It is just a single line to add to dw-hdmi. And neither touches =
ingenic-dw-hdmi nor ingenic-drm-drv.

So let's go back to v4 version (just modify commit message to better =
describe why we have to call
drm_kms_helper_hotplug_event() explicitly) and forget about =
alternatives.

BR,
Nikolaus=
