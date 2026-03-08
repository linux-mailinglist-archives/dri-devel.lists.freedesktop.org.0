Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qO4fK9aTrWlH4gEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 16:20:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A264230ECA
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 16:20:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46BCA10E00B;
	Sun,  8 Mar 2026 15:20:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icenowy.me header.i=uwu@icenowy.me header.b="Jac2YNsO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B151D10E00B
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Mar 2026 15:20:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1772983245; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=E0b/616QuJYpt+5dG3PHA7BaD2UQxlThM3sNExvTa/m5t4QsQXhvP9vqPrRwD3NUH3RWBen0MXs10o6vhySlr6BMOP71a9SetXUq5YAwZST/u4nMPECCOBsvoX9AyqGihRc4uJ952+zSApUyy3pzNL0dYER0ff+NYS5qGn3B7m4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1772983245;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=+hKz4oZxaXFlYnxidKhF297T0Odp1J8970g3IHYrFIE=; 
 b=eYEx+igyWReCAsO9J4fXPo2QWARgVvHi6yiQBIY6AWT8vviLcWx0dvT6tCPvAMAwI4oG3GI0k7eba4AunT+R27gBTupO6AZNYaTKYmLWOTLj93y7gWV/g9yMYd9zkLB+i3hoCJF3L+1SYPhgDEho6SJTTdXTtYmHMSks8eISSSk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772983245; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=+hKz4oZxaXFlYnxidKhF297T0Odp1J8970g3IHYrFIE=;
 b=Jac2YNsOrupNnEN24BELCwMdKjxBGl/oENO8ewgTxgkZowKZYUsjbXJnEDwWNFFZ
 jNmCmB+qiKwspRAaPg+OcvMD8gFtXK4IZekgl8/7vaKKzEoH4mp7uFt9d69Xskcqp/s
 xGxvDGz2JMkQXJmWBpZ1gFzI/YDCkmnSvUNFpKdpiGsTcWGsT1jiH8VDEVbya5h6iWm
 QmCly3CCBM05OEjbwQNRQG8FWMqEqypGMgBOtOAIk7KxjEVUd6fxPU5J8bX1Ssb5tVK
 I7PE0BtDTZPWMmBXiU+yiojiMDaulC4OSQngrQqGis/YThpGkBqeTKHQsVu8pIeYn6V
 uypBs2vmew==
Received: by mx.zohomail.com with SMTPS id 177298324197880.90920625778244;
 Sun, 8 Mar 2026 08:20:41 -0700 (PDT)
Message-ID: <550775ac1f2abe555da6854cb7477e7813d5a20b.camel@icenowy.me>
Subject: Re: [PATCH v2 3/3] drm/nuvoton: add MA35D1 display controller driver
From: Icenowy Zheng <uwu@icenowy.me>
To: Joey Lu <a0987203069@gmail.com>, airlied@gmail.com, simona@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Sun, 08 Mar 2026 23:20:33 +0800
In-Reply-To: <b69d5393-f122-44e9-96d9-342f458c3487@gmail.com>
References: <20260129040532.382693-1-a0987203069@gmail.com>
 <20260129040532.382693-4-a0987203069@gmail.com>
 <8806eaf82fbef4cd51bb4e4bb44d60894b3504b4.camel@icenowy.me>
 <f556ef68-dac3-4652-ac21-ea4bbb4e912c@gmail.com>
 <9cccf8cd84b394f66b85e2af3bef0a3ecd154747.camel@icenowy.me>
 <b69d5393-f122-44e9-96d9-342f458c3487@gmail.com>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
MIME-Version: 1.0
X-ZohoMailClient: External
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
X-Rspamd-Queue-Id: 1A264230ECA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[icenowy.me,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[icenowy.me:s=zmail2];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:a0987203069@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:ychuang3@nuvoton.com,m:schung@nuvoton.com,m:yclu4@nuvoton.com,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[uwu@icenowy.me,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[uwu@icenowy.me,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[icenowy.me:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[icenowy.me:dkim,icenowy.me:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

=E5=9C=A8 2026-03-03=E4=BA=8C=E7=9A=84 16:15 +0800=EF=BC=8CJoey Lu=E5=86=99=
=E9=81=93=EF=BC=9A
>=20
> On 2/10/2026 8:02 PM, Icenowy Zheng wrote:
> > =E5=9C=A8 2026-02-09=E6=98=9F=E6=9C=9F=E4=B8=80=E7=9A=84 16:45 +0800=EF=
=BC=8CJoey Lu=E5=86=99=E9=81=93=EF=BC=9A
> > > On 2/6/2026 11:09 PM, Icenowy Zheng wrote:
> > > > =E5=9C=A8 2026-01-29=E6=98=9F=E6=9C=9F=E5=9B=9B=E7=9A=84 12:05 +080=
0=EF=BC=8CJoey Lu=E5=86=99=E9=81=93=EF=BC=9A
> > > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D 8< =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> > > > > +#endif
> > > > > diff --git a/drivers/gpu/drm/nuvoton/ma35_regs.h
> > > > > b/drivers/gpu/drm/nuvoton/ma35_regs.h
> > > > > new file mode 100644
> > > > > index 000000000000..0f4a7a13e7d8
> > > > > --- /dev/null
> > > > > +++ b/drivers/gpu/drm/nuvoton/ma35_regs.h
> > > > > @@ -0,0 +1,88 @@
> > > > > +/* SPDX-License-Identifier: GPL-2.0+ */
> > > > > +/*
> > > > > + * Nuvoton DRM driver
> > > > > + *
> > > > > + * Copyright (C) 2026 Nuvoton Technology Corp.
> > > > > + *
> > > > > + * Author: Joey Lu <a0987203069@gmail.com>
> > > > > + */
> > > > > +
> > > > > +#ifndef _MA35_REGS_H_
> > > > > +#define _MA35_REGS_H_
> > > > > +
> > > > > +#define MA35_FRAMEBUFFER_CONFIG=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 0x1518
> > > > Please check my Verisilicon DC8200 driver, which is already
> > > > part of
> > > > drm-misc-next now.
> > > >=20
> > > > The display controller here seems to be a earlier one from
> > > > Verisilicon.it looks like a DC8000, or maybe a more earlier
> > > > one?
> > > The DCU is a Vivante DCUltra IP rather than a DC8000 series.
> > >=20
> > > It's an earlier generation display controller and was customized
> > > for
> > > Nuvoton, so it doesn't have a public model ID.
> > >=20
> > > Because of that lineage, parts of the register layout and
> > > functionality
> > > remain similar to older DC IPs.
> > The kernel seems to dislike different drivers for similar IPs.
> >=20
> > > Please refer to MA35D1 datasheet for more details.
> > I checked it, and the register definitions looks compatible with
> > DC8000
> > registers at [1]. However no identification information is shown in
> > the
> > manual.

I brought up my MYIR MYD-LMA35 (with its stock OS yet), and I got the
following register value readings:

```
root@myd-lma35-emmc:~# ./busybox-armv7l devmem 0x40260020
0x00000000 # chip id
root@myd-lma35-emmc:~# ./busybox-armv7l devmem 0x40260024
0x00005560 # chip rev
root@myd-lma35-emmc:~# ./busybox-armv7l devmem 0x40260028
0x20200807 # date code
root@myd-lma35-emmc:~# ./busybox-armv7l devmem 0x40260030
0x00000305 # customer id
root@myd-lma35-emmc:~# ./busybox-armv7l devmem 0x40260098
0x0000000C # patch rev
root@myd-lma35-emmc:~# ./busybox-armv7l devmem 0x402600a4
0x00211110 # info
root@myd-lma35-emmc:~# ./busybox-armv7l devmem 0x402600a8
0x02000002 # product id
root@myd-lma35-emmc:~# ./busybox-armv7l devmem 0x402600e8
0x00000000
```

Most of these values look okay, although the chip id register reads out
0x0 (although this is weird, this matches how this IP is called --
DCUltraLite, without any number).

Decoding 0xA4 with the the document from Eswin results:
- DC is included (of course ;-) )
- Single AXI
- AHB interface
- SingleGPU configuration
- AXI bus width 128bit

Decoding 0xA8 (which seems to be a more new and detailed IP name
related register) results:
- Extra letter is "L-Lite" (well a little odd, because it should be =20
"UL-UltraLite"?)
- Product number is 0
- Product type is DC

Looks like the only bad thing here is the IP's numerical name is 0, but
matching revision 5560 customer 305 should be okay for this IP?

(BTW the revision number is between two recognized numbers in DC8000
driver from Eswin [1] (5551/5701), and the two numbers in DC8000 driver
are strictly smaller than the two numbers in DC8200 driver from T-Head
[2] (5720/5721), indicates that it should be something similar to
DC8000, which matches my previous thoughts; note that these two drivers
both only match the 2 known numbers, so this IP is surely neither
DC8000 nor DC8200)

[1]
https://github.com/rockos-riscv/rockos-kernel/blob/rockos-v6.6.y/drivers/gp=
u/drm/eswin/es_dc_hw.c
[2]
https://github.com/revyos/th1520-linux-kernel/blob/th1520-lts/drivers/gpu/d=
rm/verisilicon/vs_dc_hw.c

> >=20
> > I may get a MA35D1 board after the Lunar New Year (although it
> > looks a
> > little expensive), is it easy to bring up mainline kernal on
> > arbitary
> > MA35D1 boards?
> >=20
> > [1]
> > https://github.com/milkv-megrez/rockos-u-boot/blob/c9221cf2fa77d39c0b24=
1ab4b030c708e7ebe279/drivers/video/eswin/eswin_dc_reg.h
> Our team is actively working on upstreaming support for MA35D1. It is
> possible to bring up the mainline kernel on arbitrary MA35D1 boards,
> but=20
> for the best experience I strongly recommend using our Buildroot[1]
> or=20
> Yocto[2] tooling available on the official GitHub. These provide=20
> board-specific configurations and greatly simplify the process.
>=20
> If you decide to get an MA35D1 board yourself, our Buildroot/Yocto
> setup=20
> will help you get started quickly and ensure you have the right
> patches=20
> and configurations in place.
>=20
> Currently, the mainline kernel version is 6.6, which is sufficient
> for=20
> checking registers and basic functionality. For more complete feature
> support, our Buildroot/Yocto tooling remains the recommended path.

Ah I mean upstream kernel here. But it looks like it has at least
decent support? (Well I think otherwise the display driver won't be
sent to mailing list either)

>=20
> [1] https://github.com/OpenNuvoton/buildroot_2024
>=20
> [2] https://github.com/OpenNuvoton/MA35D1_yocto-v5.0
>=20
> Best regards,
>=20
> Joey
