Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E51F3DCB44
	for <lists+dri-devel@lfdr.de>; Sun,  1 Aug 2021 12:52:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEC446E17D;
	Sun,  1 Aug 2021 10:52:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D20816E17D
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Aug 2021 10:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1627815135;
 bh=zriJif4PDamXIhagKotUos6QWdK0gLBU/clgbZRaTUw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Grt30lC0myWQWAeM9Lg6CfkGm+3a5Xjs0wiNekJpqxaVa/Ixzkc6NlDeYwsCZ1qVT
 Wv+shq3R7hdSWnN/3p0nT/RaG8dF6y/f/ylMP51yDrzssj8SzUkOvJIU7c/GRY1BCS
 2NubWvcDLYR1hpmKyAx2k6CZ1BPEjiVBB3HWEcuA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([79.150.72.99]) by mail.gmx.net
 (mrgmx005 [212.227.17.184]) with ESMTPSA (Nemesis) id
 1N1OXZ-1nBh8136j5-012q4q; Sun, 01 Aug 2021 12:52:14 +0200
From: Len Baker <len.baker@gmx.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Len Baker <len.baker@gmx.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Phil Reid <preid@electromag.com.au>,
 Geert Uytterhoeven <geert@linux-m68k.org>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] staging/fbtft: Remove unnecessary variable
 initialization
Date: Sun,  1 Aug 2021 10:51:54 +0200
Message-Id: <20210801085155.3170-3-len.baker@gmx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210801085155.3170-1-len.baker@gmx.com>
References: <20210801085155.3170-1-len.baker@gmx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:/xptYz7ulSbAWUTKB7CMKJC9Pk/kJi9DY1dnZr5A98wFkmzSDYL
 yQz3oqeypUnZQq0rRJIU5mrD0jvqedIzHM1mPd0I4EyOROkJAxun8gS3IQi1k412yry6dT5
 0O5yINMTRfTJM4Tcd/vVIjXLh/k+iPsbZ1HIujMDsn8Y9IigI64mzndr0SZMWrrESQ0XWN5
 9BIN3xtoxSuYSgRimQAAA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:PeRB4HPzt1E=:WBgeVB7cfLOMJ4PTm+pzpA
 qEQHK671Sv3v2u8/3GUBPiRt3e8T5ImnhTGI+q2tpwEX6HYdF4USo9yaM/TrSr76AaTRsT5Hq
 WWpeJa/M8eFjiCyJIX1anaGrUCpXwNSvmaGH0/pnJhxwxgu7NNC0vbRoDZE/9BL38/jiqoct6
 gS3O3i4xC6OGdoU4g/lxz1xc2wnlXrai0yuzsqiAUWs74YtZEGRJy08oYwXriruIj2F4ZOU93
 0RdqvXIu8MPaNPL4thONnI6ceh3z3HxChXFEgWmkEbR/LMVYs99vqcUyZhdepmpv8Ckva00T7
 ZEzIb/+VDFPYptjyZtu1qYm48WQ7YPyRNg8fszFBbF31KM2EBabbqlt5qixYFsAswkXHcVjM/
 6U5ZyLcrPHtc6w1FdAIOEhZM7mugdpOkIYNLUJLICZgBXXZimRv09dfbQGKbFzAgLZ/GIAOE4
 kDzdAeUK8J12K+szniSP3GneTojgRx4lZ22tldIdI18toBE7UlNpZbTPTsIY7em3cBlXEPyaM
 +B/jlFVoQLS7B3B/PnVCFXqVBLtA8g2cyQjqC5TCl5+m8arpIEHhbjUDU9mAk5R2wMt8BtApt
 lJY4lAeqjPHNFBY/cqIsnLbTzWgfbet2jCVYIs/pRfClhMnyfPGbTst02Yns2yAoWOLiZYWJh
 PR8Y8FALU90ha6hmiweVsutYPQVW2RHLRYvvYK8rSqAWQHMuADLphobdBmEbSbePk7RC4oeH3
 00aEYQcbWWODiFRW+XcCUyZh042g0DDmrmpc5YE6B26mUOF7obkXUn52KALvGp83JKdisaLhr
 cb6osQ78LzuoIEnLUi0QKAuUy15eIjZZjEUvhQLeCF7CAISs6vRSU0aVkC4/qG5PdNUA9FDGH
 xME5s/JejJQvwUUwMFi2MbJfcI3XsrsVWpccdND5stwAqKcR2F/9q+efpV7aHuA/wd/pccqf0
 hhC9hOxKKdQZXvq8Sy7397FLLcGmCLcPaB4cW18oYueG9bTctvPnHNUNeLZb8nl3qTt43TS32
 KExPM9Brb1QqzL0ndGbGcNZTweeNKTsKfMuC95MDim8tTjetdW+b0sxo5CeU6J41LKtGlOjlH
 vaQbVeNY1C3Il9oSA4u3RilfdNz5L7LeZeZ
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

Remove the initialization of the variable "i" since it is written a few
lines later.

Signed-off-by: Len Baker <len.baker@gmx.com>
=2D--
 drivers/staging/fbtft/fbtft-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fb=
tft-core.c
index e6286043bff7..ed896049118c 100644
=2D-- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -992,7 +992,7 @@ static int fbtft_init_display_from_property(struct fbt=
ft_par *par)
 int fbtft_init_display(struct fbtft_par *par)
 {
 	int buf[64];
-	int i =3D 0;
+	int i;
 	int j;

 	/* sanity check */
=2D-
2.25.1

