Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3A29EC52A
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 07:58:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF36C10E797;
	Wed, 11 Dec 2024 06:58:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ariccio.me header.i=@ariccio.me header.b="S9rRYHQf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4321.protonmail.ch (mail-4321.protonmail.ch [185.70.43.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77C1F10E3DA
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 14:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ariccio.me;
 s=protonmail2; t=1733840335; x=1734099535;
 bh=3i+zRGoIAHKVd1ck+sBGI2cSTSVfLNulHCLRTB2UM2Q=;
 h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
 List-Unsubscribe:List-Unsubscribe-Post;
 b=S9rRYHQfXfj/PIluj2/xZdYstKBPvz3w0HeYZrsoNQ9RBF6YoEg/U8PagBXHmKeg2
 HjWVsRJA/sZEh+jUCzuWD6oA5JL9yscBL0MvN/yzf0E5vO3+P3gzd8Qk8/9uENTqVw
 FVDmNEn607DIbOjBGKjooQ1+HZjFHOgwJOl6yfNrRl/u8K5sKzQ0XgJofFOiAVaG3S
 D9SrZ4DZAMseQTjDAd9isaJz4ix4vet27w1XZTzbjcgRuvuUjybyCYeUAuNHPP7AhS
 Gs2eYthrr+N3uXnR6IJWM6w9EZyFPhQq7LEzgrTMIq8nzSauLUSxW8WtO6p1R8e3du
 zuXzfiuL+uOhg==
Date: Tue, 10 Dec 2024 14:18:48 +0000
To: gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
From: Antonio Riccio <linux@ariccio.me>
Subject: [PATCH] staging: fbtft: Remove unnecessary parentheses
Message-ID: <Z1hNxNkVSt11ncXs@stream-circuit>
Feedback-ID: 117734652:user:proton
X-Pm-Message-ID: 81922902d7a06e1f45d4210d9402e12cd586accb
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 11 Dec 2024 06:58:14 +0000
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

Adhere to Linux kernel coding style.

Reported by checkpatch:

CHECK: Unnecessary parentheses around 'devcode !=3D 0x0000'
CHECK: Unnecessary parentheses around 'devcode !=3D 0x9320'

Signed-off-by: Antonio Riccio <linux@ariccio.me>
---
 drivers/staging/fbtft/fb_ili9320.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/fbtft/fb_ili9320.c b/drivers/staging/fbtft/fb_=
ili9320.c
index 050fc2367c12..9f97cfa34b81 100644
--- a/drivers/staging/fbtft/fb_ili9320.c
+++ b/drivers/staging/fbtft/fb_ili9320.c
@@ -35,7 +35,7 @@ static int init_display(struct fbtft_par *par)
 =09par->fbtftops.reset(par);
=20
 =09devcode =3D read_devicecode(par);
-=09if ((devcode !=3D 0x0000) && (devcode !=3D 0x9320))
+=09if (devcode !=3D 0x0000 && devcode !=3D 0x9320)
 =09=09dev_warn(par->info->device,
 =09=09=09 "Unrecognized Device code: 0x%04X (expected 0x9320)\n",
 =09=09=09devcode);
--=20
2.43.0


