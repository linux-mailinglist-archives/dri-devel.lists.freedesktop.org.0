Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34952160CE5
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2020 09:21:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29C2C6E5C3;
	Mon, 17 Feb 2020 08:20:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5302::5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71AEA6E863
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 19:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1581708290;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=e3Rzzpo7xk9J4ECQBBols/BtjcoyLgBQyjDXgkqJ5t4=;
 b=b4ZLVR4MOkvOX7w0HP+X8TbahBlY0qjWGpdD+v73v0VUbJns729AqfNSb/N/0hyQZx
 V+O7AhOVFNl12M1TbnwUuzsUHHEHIa7C494OJcmEo7KKHt6IZy8Ja6O0kZHykcrMoigf
 UggfLYd6RPP8wP7BhU72danniTWmaGehaFtGZKr//yF0yDpOYLBKgmR0rP3CR0JuZIas
 WlU5wkSpIZ2ErmMaC9yZnWL6dGjJkdUWUtBl+29iqPz9UtUvmSVKWxU3RqvXfqLa8+TV
 c5p+SzU8xmmcozDLyNHxacMgHv4HP+gSXkVOJtcGWFplPuI0aAeho6RlgW4U3Bvq7101
 apVg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/PuwDOspHA="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
 with ESMTPSA id U06217w1EJOlGBd
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256
 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Fri, 14 Feb 2020 20:24:47 +0100 (CET)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH v2 01/12] drm: ingenic-drm: add MODULE_DEVICE_TABLE
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <1581707177.3.6@crapouillou.net>
Date: Fri, 14 Feb 2020 20:24:45 +0100
Message-Id: <B5B39A33-B8C4-4503-91CB-BFB344558B5D@goldelico.com>
References: <cover.1581696624.git.hns@goldelico.com>
 <1b5475c88032b3851c6d33443e688b432af42a9f.1581696624.git.hns@goldelico.com>
 <1581707177.3.6@crapouillou.net>
To: Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3124)
X-Mailman-Approved-At: Mon, 17 Feb 2020 08:20:47 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Paul Boddie <paul@boddie.org.uk>, Kees Cook <keescook@chromium.org>,
 Paul Burton <paulburton@kernel.org>, David Airlie <airlied@linux.ie>,
 kernel@pyra-handheld.com, linux-mips@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org,
 Andi Kleen <ak@linux.intel.com>, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 letux-kernel@openphoenux.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


> Am 14.02.2020 um 20:06 schrieb Paul Cercueil <paul@crapouillou.net>:
> =

> Hi Nikolaus,
> =

> Please rebase this patch on top of drm-misc-next and send it apart - it s=
hould go through the DRM tree.
> =

> =

> Le ven., f=E9vr. 14, 2020 at 17:10, H. Nikolaus Schaller <hns@goldelico.c=
om> a =E9crit :
>> Add MODULE_DEVICE_TABLE so that the driver can load by
>> matching the device tree if compiled as module.
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

> Also please remove the blank line above MODULE_DEVICE_TABLE.
> =

> Cheers,
> -Paul

Ok.

BR and thanks,
Nikolaus

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
