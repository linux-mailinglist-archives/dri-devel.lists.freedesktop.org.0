Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6B526FA2F
	for <lists+dri-devel@lfdr.de>; Fri, 18 Sep 2020 12:14:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6285B6ECB7;
	Fri, 18 Sep 2020 10:14:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 312 seconds by postgrey-1.36 at gabe;
 Fri, 18 Sep 2020 10:14:00 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E163A6ECB7
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 10:14:00 +0000 (UTC)
Received: from threadripper.lan ([149.172.98.151]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MNbtD-1k98Bu3muZ-00P8yi; Fri, 18 Sep 2020 12:08:34 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH 0/3] fbdev: stop using compat_alloc_user_space
Date: Fri, 18 Sep 2020 12:08:10 +0200
Message-Id: <20200918100812.1447443-1-arnd@arndb.de>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:HqcSX/i6GHoFmyY01bRB6CKtbn8MaB27UT0Ol1JC5D61FuBVEpu
 UPtbHHIjZAKhvhQIb6QZpWTk7Cvz8P5eKYlnmDMJqr7FJvy1X67irWQrLyhQzU6E69ytquW
 ZfAToXAayZQo4NyFOk8sxVZoPPCvYtC28GytZbVhFJdZO9GwqVdM8lxXViaenpLZT7/zWSE
 0tFo8ku0w0LaTGLKnXUzQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZTOfjxmbW44=:7xKPROFVHvDGjNtGzWHNQx
 Kbdhd3m8SRu/kjQBijH3F72mPu9pxQTIlrx5Tusa7N69Jx0ZHs182UKijT5vFYVuDzgw5v+WQ
 HbPASGmBY/j0z8BM4ciPPZnnMK0Qrk85SnLDf5qXQU+MetLn3c5yVTZkBOsFcFdUqkExWmL3Y
 bg8me4YzQOdZQ5tTv8D8xqt5CZpEziZSmX5e1A4HSox2VuU3BDtQH8e8FH2AIJBECl3mjduKc
 vp7TDycVBgSimqTnI1FP2UL6rZmcV2L1UTCW4XLthY+cQHLLjMkFbCNjUwjzILo+laUdwOFhL
 Wod8OE/e0jd5gPtiD3cTNExK9e2ijGL4MoCQvvcXb3xvdBiY2Bosew+Vli8xZzlplvXbWjaSl
 SAUFboJzjRLZbPoC7p8T+Fgaa+QPucYvbj9Pm9iWScdGGK0AUunh41h5CifpkdAWUdwEcN/MX
 InBOnURqDLGKYuNUnfXDSNQ+6sUoALYhpl0JwZdSogsKeDUVAuTpc/NCf4v+TQPR+olJnuVJ0
 4ARnPaf9y2X6OT9o9kHqaBErw+iw36Pcd0EEA0UGRv6bHPQzMGXQwLAE+gotRCEGQWS63k1i2
 hc9Ft/rEzRzOI2zW86sStSeV4JHdf60aPHHI4WiSThwRevzuMJn++TOquA1xrfTbxPZMPHkYI
 obBVkxvdNRqMl/kp9SYtIgWhVRyAa/nqbabq+glY3eFXmpRa5ASXZg5WgF2BtSzXW4dAXU9Gc
 ZCG2oOcPqs2lPv5d36WPZuwSDaeFa/bXcfvhf03y5/XZIuqAHw5rTkgwEVgLRrrOkSSFTu/wn
 tfIAw0ns7AqtvLo6TElduRyBobsRksY6P10troh/Ypw60mayUG84Fc1f5kEWhEfPclCqM0g
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
Cc: "David S . Miller" <davem@davemloft.net>, Arnd Bergmann <arnd@arndb.de>,
 hch@lst.de, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The fbdev code uses compat_alloc_user_space in a few of its
compat_ioctl handlers, which tends to be a bit more complicated
and error-prone than calling the underlying handlers directly,
so I would like to remove it completely.

This modifies two such functions in fbdev, and removes another
one that is completely unused.

    Arnd

Arnd Bergmann (3):
  fbdev: simplify fb_getput_cmap()
  fbdev: sbuslib: remove unused FBIOSCURSOR32 helper
  fbdev: sbuslib: remove compat_alloc_user_space usage

 drivers/video/fbdev/core/fbmem.c |  44 +++++------
 drivers/video/fbdev/sbuslib.c    | 124 ++++++++++++++++++-------------
 2 files changed, 90 insertions(+), 78 deletions(-)

-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
