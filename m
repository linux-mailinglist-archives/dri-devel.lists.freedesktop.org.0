Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44608177131
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 09:25:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 063766E9E7;
	Tue,  3 Mar 2020 08:24:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5302::8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 822FC6E4F8
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 07:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1583220192;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=plpeH8EGSE35H8X12uOBqaQIBPXMludcU3vzOLm2b3o=;
 b=CqXBnAr+qE11ek+HsspYwF5mouXurcwWhm0pq0inFFjmpFI4NgvMulmIiKzuACJTj0
 5u+8Q6ZnK7AXvO6PQjbrZ8C9qFNXS4kvACaVjMcTjyfv/rxtG6iCp8PcpJNPNPuD7tTj
 OjK4v3kBDrssUHvK134IpzJBtOPtSf/qR/3gekZ6PkeJ/V5pUS2PnHu33NT5q9ZsgBnq
 R1Wmzl/ufY3lhurIG71s9an3RFOFxYXm14HX0CFPK+APpftQsu7I/uu+u4iInaiYTKKA
 TZf2tLZ/9+8mr9Yq2hklvJU9wOje8Y6NX+9AtBB0jwRViQFRUDG//kPUkQ7Zn90p/AKB
 dAEw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGHPrpwDGvxw=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 46.2.0 DYNA|AUTH)
 with ESMTPSA id y0a02cw237MsFyj
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256
 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Tue, 3 Mar 2020 08:22:54 +0100 (CET)
Subject: Re: [RFC v2 3/8] drm: ingenic-drm: add MODULE_DEVICE_TABLE
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: H. Nikolaus Schaller <hns@goldelico.com>
In-Reply-To: <1583176897.3.4@crapouillou.net>
Date: Tue, 3 Mar 2020 08:22:54 +0100
Message-Id: <43C71BE9-01E6-4F8A-B194-3B632DF493D8@goldelico.com>
References: <cover.1582913973.git.hns@goldelico.com>
 <c1b214f88840309c0d05162d59f666c0f7375b95.1582913973.git.hns@goldelico.com>
 <1583176897.3.4@crapouillou.net>
To: Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3124)
X-Mailman-Approved-At: Tue, 03 Mar 2020 08:24:06 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Paul Boddie <paul@boddie.org.uk>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Paul Burton <paulburton@kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ralf Baechle <ralf@linux-mips.org>, linux-mips@vger.kernel.org,
 Andi Kleen <ak@linux.intel.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


> Am 02.03.2020 um 20:21 schrieb Paul Cercueil <paul@crapouillou.net>:
> =

> Hi Nikolaus,
> =

> =

> Le ven., f=E9vr. 28, 2020 at 19:19, H. Nikolaus Schaller <hns@goldelico.c=
om> a =E9crit :
>> so that the driver can load by matching the device tree
>> if compiled as module.
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>> ---
>> drivers/gpu/drm/ingenic/ingenic-drm.c | 2 ++
>> 1 file changed, 2 insertions(+)
>> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.c b/drivers/gpu/drm/ing=
enic/ingenic-drm.c
>> index 6d47ef7b148c..d8617096dd8e 100644
>> --- a/drivers/gpu/drm/ingenic/ingenic-drm.c
>> +++ b/drivers/gpu/drm/ingenic/ingenic-drm.c
>> @@ -844,6 +844,8 @@ static const struct of_device_id ingenic_drm_of_matc=
h[] =3D {
>> 	{ /* sentinel */ },
>> };
>> +MODULE_DEVICE_TABLE(of, ingenic_drm_of_match);
> =

> Please remove the blank line above the MODULE_DEVICE_TABLE() macro.

Ok.

> =

> -Paul
> =

>> +
>> static struct platform_driver ingenic_drm_driver =3D {
>> 	.driver =3D {
>> 		.name =3D "ingenic-drm",
>> --
>> 2.23.0
> =

> =


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
