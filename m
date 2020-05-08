Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFC91CBA5F
	for <lists+dri-devel@lfdr.de>; Sat,  9 May 2020 00:03:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A3466E29D;
	Fri,  8 May 2020 22:03:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89AFD6E29D
 for <dri-devel@lists.freedesktop.org>; Fri,  8 May 2020 22:03:01 +0000 (UTC)
Received: from localhost.localdomain ([149.172.19.189]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MCsgS-1jOPdr2RNo-008sQA; Sat, 09 May 2020 00:02:03 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Thomas Hellstrom <thellstrom@vmware.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH] drm: vmwgfx: include linux/highmem.h
Date: Sat,  9 May 2020 00:01:31 +0200
Message-Id: <20200508220150.649044-1-arnd@arndb.de>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:TAKq1R05pzqZudtB3/eJjJKa8Xbr2qqNSVjJes2lRdzfJo28ior
 jpG2oBKBCIM9I0meRg4Do/dfII5ARO/ZpAAObB5iNU3iCCuxDZGC9ur9gy/e8/N5KH40xtl
 zubxBxUZ2TAxp6I2EEFhblKzvIbDSX2HvY1w7/WTEtxBhmU5S1+U1tGYNScR9bWvVvA9Lwt
 SUVJX3OpN5y1qagavtf6A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:pQ7ZCJSaxLY=:CvneInVbDCF7wVcYheL91B
 bulOWg0njJ2uR9LvROcwWe/vwyNzxp5K6WfdXMFHBwEkfhTNw0bVcxvD8IrSFpD0KC8TviK3o
 2mf/G8Dp7vGxGjScYm3LYde4pML/2dOUn9jiACrP7euRObZ2ijeOmEhl7jDEy27owpQao6o2f
 /SO03TB54PKwjk02/NXDsKOt4s7Vlel69d5geccRqk/dbPKsFx8eNeNQ70KZvuXUCYo+4gVNq
 AyrJYxx33AFDDBvjdTHUp8WSM6BvmQY8xW8tmCKPFZ/OY3h4XDKYApKCqQcok9vc/Qo/vaGhs
 Cy4G1g/dwFG7OyX+Lzq0K7xNNA1ZNy7YHIwqeqk0Kux4fHCq1lYpEGJqCsjRZ8zv5LJpjF4S2
 7p3LKoai6c/b8gZZJsch7W0e69UvHCI8bPdzFlRuGC7rm0ykWB4NZuqLTBuIC/HlzC9Z+kAId
 aBhvtAWagKCUIX31Q2v8+S47zcy1i2Z7zC+nzpqp3TUXriMCajRt6Kg+rQkJdIQhxFj4HX+jd
 rcSxAvUskYewdmUfBkJAQ2hiaX28j3DARTaEFxcJRbZdL2FCMy19Ug0uF0zjogz2OxmG2Uqkr
 4diBlDY9L7RHRrP3Hfb1MvdUSmkkFobkFN3S/ePNCydC65ZSo35zuFVrC7nvJguXY4+X0LBBM
 0Kr81poPPMNRnAsqTGRyZTs6vUqrzVL99DXoxms9mSGpDdIlNAzAvd3gqYwC/y7Ucy7HAA+YU
 3LyKV0Rosfc327PpqLHUs9jXHfSB+As31A6g12Nkokh9AIYp17vU1b8xjoLwZtQf1wF1C7YSD
 0MBAFq4u699ZjeZp0+NmUAQBJjY3JBFW0XlU185Wm7IMJzeY7w=
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Huang Rui <ray.huang@amd.com>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Ira Weiny <ira.weiny@intel.com>, Dan Williams <dan.j.williams@intel.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Helge Deller <deller@gmx.de>,
 Christoph Hellwig <hch@lst.de>, Ingo Molnar <mingo@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
 Al Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to call kmap_atomic() etc, we need to include linux/highmem.h:

drivers/gpu/drm/vmwgfx/vmwgfx_blit.c: In function 'vmw_bo_cpu_blit_line':
drivers/gpu/drm/vmwgfx/vmwgfx_blit.c:377:4: error: implicit declaration of function 'kunmap_atomic'; did you mean 'in_atomic'? [-Werror=implicit-function-declaration]
  377 |    kunmap_atomic(d->src_addr);
      |    ^~~~~~~~~~~~~
      |    in_atomic
drivers/gpu/drm/vmwgfx/vmwgfx_blit.c:391:5: error: implicit declaration of function 'kmap_atomic_prot' [-Werror=implicit-function-declaration]
  391 |     kmap_atomic_prot(d->dst_pages[dst_page],
      |     ^~~~~~~~~~~~~~~~
drivers/gpu/drm/vmwgfx/vmwgfx_blit.c:390:16: warning: assignment to 'u8 *' {aka 'unsigned char *'} from 'int' makes pointer from integer without a cast [-Wint-conversion]
  390 |    d->dst_addr =
      |                ^
drivers/gpu/drm/vmwgfx/vmwgfx_blit.c:403:16: warning: assignment to 'u8 *' {aka 'unsigned char *'} from 'int' makes pointer from integer without a cast [-Wint-conversion]
  403 |    d->src_addr =
      |                ^

Fixes: 46385a895322 ("drm: remove drm specific kmap_atomic code")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_blit.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c b/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
index 94d456a1d1a9..1629427d5734 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
@@ -27,6 +27,7 @@
  **************************************************************************/
 
 #include "vmwgfx_drv.h"
+#include <linux/highmem.h>
 
 /*
  * Template that implements find_first_diff() for a generic
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
