Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2591BDA10
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 12:48:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70A406EA24;
	Wed, 29 Apr 2020 10:48:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9863C6EA24
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 10:48:27 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200429104825euoutp0217f6e3a49e459f4fc35603a8b8fcc903~KRKfCIUf00340403404euoutp02R
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 10:48:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200429104825euoutp0217f6e3a49e459f4fc35603a8b8fcc903~KRKfCIUf00340403404euoutp02R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1588157305;
 bh=DCd5lHjcXeHNQGZUdwhEbvOFkJjRzYTDAVmnV49rff4=;
 h=From:Subject:To:Cc:Date:References:From;
 b=KRFCio1Z3MFUoLbO0qvLVMoEq7l6epRYyQsAit7lqNyh5Qc1wdg5azas08/KSQFsR
 G3BqulSaJAbBJWVnckwwborztAuyeuUtfVFwZ0wlgmgxI27ev31UvGQl5PiUNF3YFL
 S3+rexwH4W6cQIaz8pOr6zAjY5aG1XT5V07Dm2RU=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200429104825eucas1p2d343464550538b22ef93b62ebd388eb9~KRKerUPMm3150931509eucas1p2U;
 Wed, 29 Apr 2020 10:48:25 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id A8.7C.61286.97B59AE5; Wed, 29
 Apr 2020 11:48:25 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200429104825eucas1p16bf37b71a3ab3a768d1eff6c48eb61dd~KRKeXeTQM3054730547eucas1p1j;
 Wed, 29 Apr 2020 10:48:25 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200429104825eusmtrp1e7ac526c3c25966d91827a7a9649db2c~KRKeWyyVY0238502385eusmtrp19;
 Wed, 29 Apr 2020 10:48:25 +0000 (GMT)
X-AuditID: cbfec7f2-f0bff7000001ef66-82-5ea95b7981ed
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id E2.07.07950.87B59AE5; Wed, 29
 Apr 2020 11:48:25 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200429104824eusmtip1cb5327ca35f1f01f0f7bc869da3717db~KRKd1-81i0970609706eusmtip1R;
 Wed, 29 Apr 2020 10:48:24 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH v2] video: fbdev: controlfb: fix build for COMPILE_TEST=y &&
 PPC_PMAC=y && PPC32=n
To: Stephen Rothwell <sfr@canb.auug.org.au>, kbuild test robot <lkp@intel.com>
Message-ID: <fe520316-3863-e6c4-9581-5d709f49e906@samsung.com>
Date: Wed, 29 Apr 2020 12:48:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAKsWRmVeSWpSXmKPExsWy7djPc7qV0SvjDDbtl7RY+PAus8WVr+/Z
 LE70fWC1uLxrDpvFq+ZHbBYrfm5ltNi69yq7A7tH440bbB57vy1g8Vi85yWTx/3u40weS6Zd
 ZfP4vEkugC2KyyYlNSezLLVI3y6BK+PSy8OsBR08FW0tf9gbGKdxdTFyckgImEgs/rOVpYuR
 i0NIYAWjxMN315ggnC+MEk9eHmaGcD4zSlxZchrI4QBrmbPUDyK+nFFiTcN7qPa3jBInHjQx
 gcxlE7CSmNi+ihHEFhZIkTizYjqYLSIQILFk6jpGkAZmgdWMEoumbGAFSfAK2EkcW30BrJlF
 QFViz8u7YLaoQITEpweHoWoEJU7OfMICYjMLiEvcejKfCcKWl9j+dg4zxEPL2CWa1/hC2C4S
 q+8eZYWwhSVeHd/CDmHLSJye3AN2tYTAOkaJvx0vmCGc7YwSyyf/Y4Oospa4c+4XG8jPzAKa
 Eut36UOEHSU+bf3IDgkKPokbbwUhbuCTmLRtOjSEeCU62oQgqtUkNizbwAaztmvnSqgzPSTm
 fmpnncCoOAvJZ7OQfDYLyWezEG5YwMiyilE8tbQ4Nz212DAvtVyvODG3uDQvXS85P3cTIzAd
 nf53/NMOxq+Xkg4xCnAwKvHwbuBZESfEmlhWXJl7iFGCg1lJhPdRxrI4Id6UxMqq1KL8+KLS
 nNTiQ4zSHCxK4rzGi17GCgmkJ5akZqemFqQWwWSZODilGhjVL0+345JcahI+mffalgOGfdck
 GrVmz2XLO/DTaPV2qaiukujpfsVbTz74uJpz1Y47Zbanui1Ml/bfPsRRVXWp5fxrtS+Tpy6L
 iFRcdOW380GBrwmXb648El1uz3abzU4u1Cslxml5/bzdVoeWXu4R4ojj/Kf0JYb7ydwfFpYp
 mTq8HL8vfkhWYinOSDTUYi4qTgQAMHzmwUMDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBIsWRmVeSWpSXmKPExsVy+t/xu7qV0SvjDHZ0M1ksfHiX2eLK1/ds
 Fif6PrBaXN41h83iVfMjNosVP7cyWmzde5Xdgd2j8cYNNo+93xaweCze85LJ4373cSaPJdOu
 snl83iQXwBalZ1OUX1qSqpCRX1xiqxRtaGGkZ2hpoWdkYqlnaGwea2VkqqRvZ5OSmpNZllqk
 b5egl3Hp5WHWgg6eiraWP+wNjNO4uhg5OCQETCTmLPXrYuTiEBJYyijx4vESZoi4jMTx9WVd
 jJxAprDEn2tdbBA1rxklJrf8YgVJsAlYSUxsX8UIYgsLpEicWTGdEaRXRMBP4u+ZXJB6ZoHV
 jBJ72i8yg9TwCthJHFt9gQnEZhFQldjz8i6YLSoQIXF4xyxGiBpBiZMzn7CA2MwC6hJ/5l1i
 hrDFJW49mc8EYctLbH87h3kCo8AsJC2zkLTMQtIyC0nLAkaWVYwiqaXFuem5xUZ6xYm5xaV5
 6XrJ+bmbGIGxtO3Yzy07GLveBR9iFOBgVOLh3cCzIk6INbGsuDL3EKMEB7OSCO+jjGVxQrwp
 iZVVqUX58UWlOanFhxhNgR6ayCwlmpwPjPO8knhDU0NzC0tDc2NzYzMLJXHeDoGDMUIC6Ykl
 qdmpqQWpRTB9TBycUg2MVa6iF+/rvlGOvOk2W40nUHer5fXipga1tUoKxc4FHg+P81zYdsA4
 r9Q59qaYvtKsmJlPnsQYdpr9m/PltOrvreffzyhi/ce6vCD66OKsSK+4e22x05uTdM0P2C2/
 wRvyc2kt34XlVZ17fM5Maji5IOzd/vY3a+t5/wn6y7c5vBNW3B5za85UJZbijERDLeai4kQA
 cVmhHbsCAAA=
X-CMS-MailID: 20200429104825eucas1p16bf37b71a3ab3a768d1eff6c48eb61dd
X-Msg-Generator: CA
X-RootMTR: 20200429104825eucas1p16bf37b71a3ab3a768d1eff6c48eb61dd
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200429104825eucas1p16bf37b71a3ab3a768d1eff6c48eb61dd
References: <CGME20200429104825eucas1p16bf37b71a3ab3a768d1eff6c48eb61dd@eucas1p1.samsung.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, linux-fbdev@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


powerpc allyesconfig fails like this:

drivers/video/fbdev/controlfb.c: In function 'controlfb_mmap':
drivers/video/fbdev/controlfb.c:756:23: error: implicit declaration of function 'pgprot_cached_wthru'; did you mean 'pgprot_cached'? [-Werror=implicit-function-declaration]
  756 |   vma->vm_page_prot = pgprot_cached_wthru(vma->vm_page_prot);
      |                       ^~~~~~~~~~~~~~~~~~~
      |                       pgprot_cached
drivers/video/fbdev/controlfb.c:756:23: error: incompatible types when assigning to type 'pgprot_t' {aka 'struct <anonymous>'} from type 'int'

Fix it by adding missing PPC32 dependency.

Fixes: a07a63b0e24d ("video: fbdev: controlfb: add COMPILE_TEST support")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Reported-by: kbuild test robot <lkp@intel.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
---
v2: fix implicit btext_update_display() function declaration error

 drivers/video/fbdev/controlfb.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: b/drivers/video/fbdev/controlfb.c
===================================================================
--- a/drivers/video/fbdev/controlfb.c
+++ b/drivers/video/fbdev/controlfb.c
@@ -55,7 +55,7 @@
 #include "macmodes.h"
 #include "controlfb.h"
 
-#ifndef CONFIG_PPC_PMAC
+#if !defined(CONFIG_PPC_PMAC) || !defined(CONFIG_PPC32)
 #define invalid_vram_cache(addr)
 #undef in_8
 #undef out_8

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
