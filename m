Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE20CA8D24
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 19:39:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FC3010E270;
	Fri,  5 Dec 2025 18:39:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.b="JwvogYK6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 425 seconds by postgrey-1.36 at gabe;
 Fri, 05 Dec 2025 18:39:03 UTC
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB2EE10E270
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 18:39:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 569307791B42;
 Fri,  5 Dec 2025 12:31:58 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id FuLlrNfkxzxm; Fri,  5 Dec 2025 12:31:57 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 78C497791B6C;
 Fri,  5 Dec 2025 12:31:57 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 78C497791B6C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
 t=1764959517; bh=+yG2pBdsmftlBRZtouxZNKWge8vm09+Hvq7tKPaHiMw=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=JwvogYK6H+r0GovXmRGxLeNDTSXEQAYDPj1ddxEGZeyq5KaicKiYfMPr5SdIHn0Hm
 7XGaMIDkBfSG2Jy2AA04+/nBqPeEUi2clr5kdkKD9u3IAjkXzDdnPxEEmZZOfT18It
 5rUdZQkgSkIJjvDqDk5h4df+5k0zxbBK3FgCVgvY=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id KgiLdOP7jgLA; Fri,  5 Dec 2025 12:31:57 -0600 (CST)
Received: from vali.starlink.edu (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 461177791B42;
 Fri,  5 Dec 2025 12:31:57 -0600 (CST)
Date: Fri, 5 Dec 2025 12:31:57 -0600 (CST)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: =?utf-8?B?UmVuw6k=?= Rebe <rene@exactco.de>
Cc: tzimmermann@suse.de, dri-devel <dri-devel@lists.freedesktop.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Dave Airlie <airlied@redhat.com>, 
 Timothy Pearson <tpearson@raptorengineering.com>
Message-ID: <758090394.145092.1764959517083.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <20251205.161459.1654100040521559754.rene@exactco.de>
References: <20251202.170626.2134482663677806825.rene@exactco.de>
 <e0f4a33f-9d36-4b7b-a1f8-1acc7434969c@suse.de>
 <20251205.161459.1654100040521559754.rene@exactco.de>
Subject: Re: [PATCH] drm/ast: Fix big-endian support
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC142 (Linux)/8.5.0_GA_3042)
Thread-Topic: drm/ast: Fix big-endian support
Thread-Index: yoRyX80Wmuj8hALML3doGI7B0v1lNQ==
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



----- Original Message -----
> From: "Ren=C3=A9 Rebe" <rene@exactco.de>
> To: tzimmermann@suse.de
> Cc: "dri-devel" <dri-devel@lists.freedesktop.org>, "linux-kernel" <linux-=
kernel@vger.kernel.org>, "Dave Airlie"
> <airlied@redhat.com>, "Timothy Pearson" <tpearson@raptorengineering.com>
> Sent: Friday, December 5, 2025 9:14:59 AM
> Subject: Re: [PATCH] drm/ast: Fix big-endian support

> Hello Thomas,
>=20
> On Wed, 3 Dec 2025 10:40:17 +0100, Thomas Zimmermann <tzimmermann@suse.de=
>
> wrote:
>=20
>> [2]
>> https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next-2025=
-12-01-1/drivers/gpu/drm/ast/ast_mode.c?ref_type=3Dtags#L559
>> [3]
>> https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next-2025=
-12-01-1/drivers/gpu/drm/ast/ast_cursor.c?ref_type=3Dtags#L209
>>=20
>> > +=09case DRM_FORMAT_RGB565:
>> > + ast_set_index_reg_mask(ast, AST_IO_VGACRI, AST_IO_VGACRA2, 0x3f,
>> > 0x40);
>> > +=09=09break;
>> > +=09case DRM_FORMAT_XRGB8888
>=20
> While working on it I discovered that the Big-Endian byte-swapping
> bits do apparently not just-work on a newer AST2400 in our Power 8
> while my initial patch did work as tested with an AST2200 in the Sun
> T4-1 :-/
>=20
> Maybe that is what Timothy meant with "This is due to a ppc64 hardware
> quirk, which when combined with a hardware design fault in the AST2500
> VGA controller results in a need to use software-based red-blue
> channel swapping." [1]
>=20
> Is there a way to simply specify the frame-buffer as BGRX8888? In a
> quick test the drm layer complaint about "not supported" and "no
> compatible format found"?

I've been all around that loop.  You can't do that -- the fb code has no id=
ea how to drive such a framebuffer, and elsewhere in the kernel it's made c=
lear that the GPU driver *must* provide a RGBX8888 linear framebuffer if th=
e Linux fb code is going to be able to display a console.

Does the Sun T4 CPU perform automatic byte swapping on PCI[e] data transact=
ions?  That might be the difference; POWER performs the byte swapping, and =
since the ASpeed device is broken in BE mode we can't swap back by setting =
the BE register bit in the AST GPU hardware.

Fun fact -- it'll sorta work on the framebuffer side, but we lose the entir=
e control BAR in the process.  ASpeed seems OK with this, they just say som=
ething along the lines of "oh, BE is not supported despite our documentatio=
n" :facepalm:
