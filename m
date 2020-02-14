Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD571160CFC
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2020 09:22:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B9476E8A8;
	Mon, 17 Feb 2020 08:20:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5302::6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3F536E863
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 19:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1581708668;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=CVamlJG5fFjEwwaf0KaFiIJGPYXsc97AfdP/JIkpP98=;
 b=EReKxRPau45EdLMLC/wEXJ1rmzzUz/3PhwCj6jkgGp2w6Ku0RU2mkUNw2nEXPtfIfa
 WhxOa3RcRlLv4WgsQZQxXH1CB3n7HjVDE2oMZ2Q1bXFbMkG8e/ZNQMzzooxiZOjf/yx6
 rHBbLFBybaynnzlizVfYIbQpkV/alqkrvTQFlInhCDvHoAfnNHNaAZiqXyk85F2/yAD0
 rbDEyBIwUPZkZh0Nc5eODdMV2KqwG862JNQCRTLJELjk31LOJfGuHTfELWKEbjDewZHW
 m0duHzAKB0JyG14G1AAhXUBUzvoTWjUq62nL3iZlKHfIiG+HZ6JKCN+9NK7/6RP0Eh3Y
 mQ+w==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/PuwDOspHA="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
 with ESMTPSA id U06217w1EJV0GDZ
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256
 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Fri, 14 Feb 2020 20:31:00 +0100 (CET)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH v2 03/12] MIPS: CI20: defconfig: configure for supporting
 modules
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <1581707415.3.7@crapouillou.net>
Date: Fri, 14 Feb 2020 20:30:59 +0100
Message-Id: <AD9439FF-9DEF-4B9A-8A01-F11B626708C1@goldelico.com>
References: <cover.1581696624.git.hns@goldelico.com>
 <db4db9e0b024aa3051a6f1f7be07323418d1d453.1581696624.git.hns@goldelico.com>
 <1581707415.3.7@crapouillou.net>
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

Hi Paul,

> Am 14.02.2020 um 20:10 schrieb Paul Cercueil <paul@crapouillou.net>:
> =

> Hi Nikolaus,
> =

> Patches 03-12 only touch the same two files - ci20.dts and ci20_defconfig.
> =

> Unless someone strongly disagrees, I'd suggest to squash all patches that=
 touch each file together (except the ones with a Fixes tag), I don't think=
 we really need that much granularity here.

It comes more from having developed these things quite independently and on=
ly collected for submission...

One patch I don't know how to handle: "MIPS: DTS: CI20: add DT node for IR =
sensor".
It is from 2015 and has a different author (some Alex Smith but the mail ad=
dress seems to be broken).
This information and attribution will be lost if we squash them.

But I can do for V3 and will also fix the fixes tags by adding cc: stable :)

BR and thanks,
Nikolaus


> =

> -Paul
> =

> =

> Le ven., f=E9vr. 14, 2020 at 17:10, H. Nikolaus Schaller <hns@goldelico.c=
om> a =E9crit :
>> Not all drivers need to be compiled into the kernel.
>> Support building and loading of kernel modules.
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>> ---
>> arch/mips/configs/ci20_defconfig | 1 +
>> 1 file changed, 1 insertion(+)
>> diff --git a/arch/mips/configs/ci20_defconfig b/arch/mips/configs/ci20_d=
efconfig
>> index be41df2a81fb..e0d3c9d4c2ae 100644
>> --- a/arch/mips/configs/ci20_defconfig
>> +++ b/arch/mips/configs/ci20_defconfig
>> @@ -1,4 +1,5 @@
>> # CONFIG_LOCALVERSION_AUTO is not set
>> +CONFIG_MODULES=3Dy
>> CONFIG_KERNEL_XZ=3Dy
>> CONFIG_SYSVIPC=3Dy
>> CONFIG_POSIX_MQUEUE=3Dy
>> --
>> 2.23.0
> =

> =


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
