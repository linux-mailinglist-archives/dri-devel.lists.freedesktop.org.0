Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 781E270E654
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 22:16:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8531910E4CA;
	Tue, 23 May 2023 20:15:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 371B910E134
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 20:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1684872952; i=markus.elfring@web.de;
 bh=dP9NEE68fMXgefx6pKhxB5p1osjqrBzoDEtHTj9tjIM=;
 h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
 b=vbPgmz1TSd9Ppy38ipV9/vV8ausVuRaFJZcWvu+HDrlXqSVwsoP9ZoVOAZ3PEtwJQ
 /xTTE4L2jYzDIiLa28gtMpyPjU0jPMTrpkm4pDZqyqH9bqV/5mITT230JqQgsXJ4s8
 ljTw3G32xl3zGt7pwSD1mVkmqcUcb705nvCBbOlTQHVgffC2DifICowlzGBUtUGA7o
 wgMdnk60z04CeII2Wi/SSciRvBOvJ9yrtnHl1mwsbdZsyY8rDSnubsUrkRMQwcOqXr
 nWqRd/yuFTA2+geJxw+0JqrQYw/TvvknWkPp3zZ6nC2ECjmuGGqp/vxCTHX7AtsUDV
 G9RXFeiXUn8xA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.89.83]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M2gkl-1pyW192EzX-004AVb; Tue, 23
 May 2023 22:15:52 +0200
Message-ID: <341b4af7-5c6c-cbd2-6fe3-c0e4e58f3c7d@web.de>
Date: Tue, 23 May 2023 22:15:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: [PATCH 1/2] fbdev: Move two variable assignments in
 fb_alloc_cmap_gfp()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
To: kernel-janitors@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Helge Deller <deller@gmx.de>
References: <8f0bcb48-7677-340d-282e-27f6fe063c6b@web.de>
In-Reply-To: <8f0bcb48-7677-340d-282e-27f6fe063c6b@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:N6s5Lw4mbVcOlOXvuMubk1Fi2yEuD367sj0sv7jeo2DHKQeiS6N
 GwTP6/D4PSqEMuTa7Jp6IXSRDBe7BVYrPSjPjW5O800IFBshyaalrn278LxpHmIzh7EQsl7
 U3nJDC8Es8uMlv+Nf6Y4gpzdKFRfryyHi/MGe5Rd2iQpkx+sdLAVb6SjV7ds+IvBKAJmNMx
 VnRt8wG1Mvb7QX8GZRCUQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:DICDXp1wkjk=;D9PKtH4ZgPG5jBhG8KVdz7M4qDs
 sD3I8DjPsh69bi198lXTMgdX6E9affEuhiN78qQm55sv6h6Ewh9J9xNPG97doY08obyUmCy6B
 sY8KGvhQbbYiZPNBpbbCQcydtMpzuCG2DQyQMbldyb8QX8zaiFHwoAylJFmaFJf1TB0wqNxq8
 ahSCBDxOIaBEWXcr4rI8qj9ZvdYAXs8CfKsIKBC/4C0D5SWgbkD74z9Bn5VNS+FawT7GgOcBR
 Mp4vubS4OozoabRIi0jHLoXn63GujQdUL/R/SFlB5zJhdCuOwub76qJ40UnyfqbbxGICy6+oo
 y0v3ILie8tUySBleBn7mC6ZNbXLyJfP6h3mYp3//LaUCwv+omKaxpzfXduzc9AYrU9EYDJVVX
 /l2Jg1sD5uJFbPDBsi432O7B9a5Bqf2aR2UwmZT/JkXLt3ETraWnkEAYQ8z3KObjoBWA+J2RV
 JsIwct3xSAa82R64WgK17RTuqtWz+ioKcNQcbydvkEX4gPrDA112tVFFIleCHbRcRcA1W7uPs
 64tY0MR4bRU7i6Sl7y2AScRe/7vBioQAaInX0fejGgnC+idPvGMTOhjvGPKTuNd4lSJdeA7KH
 38h7AgTSafNOVh4MmgAXbMoS2M5Mc+jji/CGOLUaKwlbKtGxQ0nCA8+SbubvTAAP40z3GD8Bm
 owri5rkHuWHL7E1FzV0bweeAID+Cncmas2Zji9G1u4If3Kcezem4nmC66FxeSVkPjRokZctzZ
 5Hsol9qOcsyNcXDGmyn/ShYJPyAE8c2xqtOXXjmCBqnGoZr3ONkDLfkN+XRMrJXxPyJ6nb0cy
 nOk+9eDcXcu0qgdMPBrIqvxP98fDE1ULll97CI4og1Fh5JpDi4eyej4OsjGRxL1sZ6RzHVLTU
 S0rN2pEyToSoGxFrwN8il8vF7RTck6h+Q6kSgZKA0OWs+S42mEd1DX1PAhs/d68+nd7+SM4ej
 J5akBA==
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
Cc: LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 23 May 2023 21:30:29 +0200

Move the assignment for the local variables =E2=80=9Csize=E2=80=9D and =E2=
=80=9Cflags=E2=80=9D
because the computed values were only used in a single if branch.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/video/fbdev/core/fbcmap.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcmap.c b/drivers/video/fbdev/core/=
fbcmap.c
index ff09e57f3c38..5c1075ed28ab 100644
=2D-- a/drivers/video/fbdev/core/fbcmap.c
+++ b/drivers/video/fbdev/core/fbcmap.c
@@ -91,16 +91,17 @@ static const struct fb_cmap default_16_colors =3D {

 int fb_alloc_cmap_gfp(struct fb_cmap *cmap, int len, int transp, gfp_t fl=
ags)
 {
-	int size =3D len * sizeof(u16);
 	int ret =3D -ENOMEM;

-	flags |=3D __GFP_NOWARN;
-
 	if (cmap->len !=3D len) {
+		int size;
+
 		fb_dealloc_cmap(cmap);
 		if (!len)
 			return 0;

+		size =3D len * sizeof(u16);
+		flags |=3D __GFP_NOWARN;
 		cmap->red =3D kzalloc(size, flags);
 		if (!cmap->red)
 			goto fail;
=2D-
2.40.1

