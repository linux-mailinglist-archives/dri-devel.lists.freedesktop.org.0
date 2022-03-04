Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2650D4CDCD6
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 19:42:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB69911303F;
	Fri,  4 Mar 2022 18:42:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [85.215.255.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47B0011303F
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Mar 2022 18:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1646419297;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=/MUNtByHB8GFgXjsMc5MkPuL29UEpObxA5Rw7m+X2Xo=;
 b=fL8XEwIZi2ZMz43WgoEOuyZb8z8NbJXKj0rr4h0RiCsJjc/3hRrl1WHyf2bIixqEWH
 tfYRUmLH0Q85HwuxfHnj9mO6Vu0vyqyyyndHrXDbtnH2c2Rmo16WPpaDexWCS6sBsz80
 Q3X6VZspePaRmu4nDZmyc+PDY352NUBeEOQYUKGaXI5d5Lg0E7EhtHMaTm58TGNWR0mi
 cfi0OdAzkI7PtnGqdadjC0qarYvzQG/UFXp4YfjYD54Q+vdGNhnktLPlxP2+8LFdATtK
 JyCjtFVGswgiC6BKUegXPEUY56Vm2L1a8bgYPkqB+eSkgjFZ2x/45/b4sOQ38EOt7q1p
 feiw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7gpw91N5y2S3i8QUWw=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.40.1 DYNA|AUTH)
 with ESMTPSA id n729cey24Ifb7os
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Fri, 4 Mar 2022 19:41:37 +0100 (CET)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [Letux-kernel] [PATCH v16 1/4] drm/bridge: dw-hdmi: introduce
 dw_hdmi_enable_poll()
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <NWG88R.ZTPBZB4D9J5Z@crapouillou.net>
Date: Fri, 4 Mar 2022 19:41:36 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <02FDA8C2-68FD-4EB8-9846-AF510D16424D@goldelico.com>
References: <cover.1645895582.git.hns@goldelico.com>
 <e54838849f80454b863f9f5634dd10f79ef7bb8f.1645895582.git.hns@goldelico.com>
 <983e9064-17ad-e646-f37d-ca9173ba0967@baylibre.com>
 <C8AE9A7A-E288-4637-ACAD-40CD33CD5F8C@goldelico.com>
 <3E620AF4-402E-45EA-9D92-92EAEA9647F5@goldelico.com>
 <SHH68R.Z3J9KSY0GQVA2@crapouillou.net>
 <ABC1BD09-383B-4499-B034-340CE88725B3@goldelico.com>
 <RUI68R.Z009SPJAAD8N1@crapouillou.net>
 <F0F8F36B-3A0A-476C-8C7D-566255C629C6@goldelico.com>
 <a52702bd-c929-8170-8896-d34ba82aba3c@baylibre.com>
 <VYB88R.ATGIVGZ13PFM1@crapouillou.net>
 <929BF693-D54F-40F0-BB61-520301D1C31F@goldelico.com>
 <8JF88R.9V5YQ3Q6E8QO2@crapouillou.net>
 <5CC8B441-AA50-45F5-A5D3-2F40F72A1B50@goldelico.com>
 <NWG88R.ZTPBZB4D9J5Z@crapouillou.net>
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
Cc: Paul Boddie <paul@boddie.org.uk>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-mips <linux-mips@vger.kernel.org>, Robert Foss <robert.foss@linaro.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Maxime Ripard <maxime@cerno.tech>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> Am 04.03.2022 um 19:33 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
>=20
>=20
> Le ven., mars 4 2022 at 19:15:13 +0100, H. Nikolaus Schaller =
<hns@goldelico.com> a =C3=A9crit :
>> Hi Paul,
>>> Am 04.03.2022 um 19:04 schrieb Paul Cercueil <paul@crapouillou.net>:
>>> Le ven., mars 4 2022 at 18:51:14 +0100, H. Nikolaus Schaller =
<hns@goldelico.com> a =C3=A9crit :
>>>> Hi Paul, Neil,
>>>>> Am 04.03.2022 um 17:47 schrieb Paul Cercueil =
<paul@crapouillou.net>:
>>>>> =46rom what I understood in Nikolaus' last message, HDMI hotplug =
is actually correctly detected, so there's no need for polling. What is =
missing is the call to drm_kms_helper_hotplug_event *somewhere*, so that =
the information is correctly relayed to userspace.
>>>> Exactly.
>>>> As Maxime pointed out it should already be called by =
drm_helper_hpd_irq_event() in dw_hdmi_irq() but isn't
>>>> because mode_config.poll_enabled isn't enabled.
>>>> So we can either
>>>> a) enable mode_config.poll_enabled so that it is called by =
drm_helper_hpd_irq_event() or
>>>> b) make drm_kms_helper_hotplug_event() being called explicitly in =
dw_hdmi_irq().
>>>>   We could guard that by mode_config.poll_enabled to avoid =
drm_kms_helper_hotplug_event()
>>>>   being called twice (but I think the "changed" mechanism will take =
care of).
>>>>> I think this issue can be fixed by calling =
drm_bridge_connector_enable_hpd() on the connector in ingenic-drm-drv.c.
>>>> I don't see yet how this would solve it, but it may work.
>>> dw_hdmi_irq() calls drm_bridge_hpd_notify(), which would call =
bridge->hpd_cb() if it was non-NULL.
>> Ok, this is a case c).
>> I vaguely remember having tried to analyse what bridge->hpd_cb is but =
stopped since it is NULL...
>>> Calling drm_bridge_connector_enable_hpd() will set the =
bridge->hpd_cb() callback to point to drm_bridge_connector_hpd_cb(), =
which itself will call drm_kms_helper_hotplug_event(). Therefore, all =
that is missing is one call to drm_bridge_connector_enable_hpd().
>> Ah, ok, I see.
>>>> Anyways, this all is a missing feature (sometimes called "bug") of =
the *dw-hdmi driver* and IMHO
>>>> neither of the connector nor the ingenic-drm-drv.
>> Well, a little more analysis shows that =
drm_bridge_connector_enable_hpd is called
>> in the *-drv.c for some other plaforms:
>> =
https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/imx/dcss/dc=
ss-dev.c#L292
>> =
https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/imx/dcss/dc=
ss-kms.c#L145
>> =
https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/omapdrm/oma=
p_drv.c#L393
>> =
https://elixir.bootlin.com/linux/v5.17-rc6/source/drivers/gpu/drm/msm/hdmi=
/hdmi.c#L317
>>>> So I think it should not be solved outside dw-hdmi.
>> Hm. Can we call drm_bridge_connector_enable_hpd() from inside =
dw-hdmi?
>> Or would this be the solution if merged? (I currently can't try =
code).
>> =
https://lore.kernel.org/lkml/a7d0b013-6114-07b3-0a7b-0d17db8a3982@cogentem=
bedded.com/T/
>=20
> Looks correct to me. It has been reviewed by two people so I believe =
it will be merged very soon.

Great. I will try asap. If it works we can drop all our private ideas...

And focus on the last missing piece for jz4780 HDMI: the output format =
negotiation (which still is not working properly - but I have to analyse =
why).

BR and thanks,
Nikolaus

