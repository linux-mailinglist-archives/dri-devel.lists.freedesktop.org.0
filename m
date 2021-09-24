Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C722417100
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 13:40:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 816AF6EE01;
	Fri, 24 Sep 2021 11:40:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B56376EE01
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Sep 2021 11:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1632483617;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=x6aZQTYzEGnb3qjPGQGMoatLSWBGlhF56WQTTYF7HCM=;
 b=k5afyNNuKDgUkD15EZHJ43ApUTjytd1FGXOe2OCSgSjvvanVhIGwHsLIOjO1UFuYeO
 POAuPtu6uSyRiM4DqBFtl63h8ZhwGs22LFdCSbO3o9ow1nvRwArKLHHAUpXFH3dlNGpX
 P8w+bFccP1sG0/XQ5tPwWWPZQdlBrOGGiPTTOjBj/dZOo5QV9KIQyMMkXw87q4BvtxZ3
 f/SLODpR5P60dJ9DV/VWnYogQna5I0H8dUWK9drsyxC2LrUSgL6MY14xBkZtNb7/jjdU
 C9P9SmDHXBJkgmXE+rBgOluu+xMPxgI7k11T9Ok++oedZ5oQC9ofS+MO6zNmjNx4zWlI
 Auww==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHWElw47uAyI="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.33.8 SBL|AUTH)
 with ESMTPSA id I01f74x8OBeGOsI
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Fri, 24 Sep 2021 13:40:16 +0200 (CEST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v3 6/6] drm/ingenic: Attach bridge chain to encoders
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <B7B431EC-BC73-4B39-A03C-003347D8C239@goldelico.com>
Date: Fri, 24 Sep 2021 13:40:16 +0200
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-mips <linux-mips@vger.kernel.org>, list@opendingux.net,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Paul Boddie <paul@boddie.org.uk>
Content-Transfer-Encoding: quoted-printable
Message-Id: <B05E1F0C-223D-425C-AF1B-9175C4555F79@goldelico.com>
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
 <ABE75744-46FE-4F37-A14C-D996F36B7B0E@goldelico.com>
 <IXJWZQ.BZQ2M7FHYVJM@crapouillou.net>
 <B7B431EC-BC73-4B39-A03C-003347D8C239@goldelico.com>
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

> Am 23.09.2021 um 22:23 schrieb H. Nikolaus Schaller =
<hns@goldelico.com>:
>=20
>=20
>> Because your "it doesn't work" arguments have zero weight otherwise.
>=20
> I hope I still can find it. So I can't promise anything.
> We have had it complete in DTS and added code to parse it.
> It may have been wiped out by cleaning up patch series during rebase.

I was able to locate it and place it on top of your ingenic-drm-drv v3
and our synopsys hdmi v3 [1] (+ unpublished work).

This [2] should save you a lot of time making dw-hdmi work on jz4780 at =
all, so you can
focus on our mistakes instead of starting from scratch.

Features:
- based on v5.15-rc2
- (the first two patches are LetuxOS and build system related and can be =
ignored for this discussion)
- contains some significant patch from drm-next not yet upstream
- contains your v3 series as is
- (initially) disables your DRM_BRIDGE_ATTACH_NO_CONNECTOR (is reverted =
in the last patch)
- adds synopsys stuff and DT schema
- adds jz4780.dtsi and ci20.dts
- adds ci20_defconfig
- (adds some (optional) jz4780 specific features we likely do not need =
now)
- adds something to dw-hdmi to properly notify HPD
- adds a hdmi-regulator so that HPD power can be turned on/off
- (attempt to configure the dw-hdmi unwedge feature)
- then we add the hdmi-connector to replace the dw-hdmi connector to =
device tree
- and finally re-enable DRM_BRIDGE_ATTACH_NO_CONNECTOR

The result is
a) without the last patch I get a proper setup with framebuffer and =
edid.
Unfortunateley without any image on HDMI.

b) if last patch is included
(so that DRM_BRIDGE_ATTACH_NO_CONNECTOR is required as by your [patch v3 =
6/6] again)
I get:

[    4.351200] [drm:drm_bridge_attach [drm]] *ERROR* failed to attach =
bridge /hdmi@10180000 to encoder DPI-34: -22
[    4.474346] [drm:drm_bridge_attach [drm]] *ERROR* failed to attach =
bridge (null) to encoder DPI-34: -22
[    4.562125] ingenic-drm 13050000.lcdc0: Unable to attach bridge
[    4.568103] ingenic-drm: probe of 13050000.lcdc0 failed with error =
-22

Maybe you can spot the bug in the code much quicker than we can.

I do not know what Paul Boddie did differently if this initialization
with connector-hdmi works for him and does not fail likewise.

BR and thanks,
Nikolaus


[1]: =
https://lore.kernel.org/linux-mips/8e873f17fcc9aeb326d99b7c2c8cd25b61dca6f=
5.1628399442.git.hns@goldelico.com/T/
[2]: =
https://git.goldelico.com/?p=3Dletux-kernel.git;a=3Dshortlog;h=3Drefs/head=
s/upstream%2Bjz4780%2Bhdmi-connector
