Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B97FB992AE5
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 13:59:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32FE810E074;
	Mon,  7 Oct 2024 11:59:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="Al5dDLjq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56F8210E371
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 11:59:40 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20241007115938euoutp01e27b3768aa1ca734aea549582c8e24a4~8KdsZVRSC0815308153euoutp01Q
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 11:59:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20241007115938euoutp01e27b3768aa1ca734aea549582c8e24a4~8KdsZVRSC0815308153euoutp01Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1728302378;
 bh=2nEzV/9f9vECwihtlTslc8KbVKH6tVjfOzw+6LN5A5M=;
 h=Date:Subject:To:From:In-Reply-To:References:From;
 b=Al5dDLjqj+UjAu9bpGZKRJ8nuCkw3AWbUj1mxsSCA8PFQjxR90fgxE7rlFvU0R/v6
 ghlQRQKgeO02helzaaLvXgUwPuZYjeFK5etpQl92gCGcTmnZqYDNIpzA2HM8NrsGCz
 ukDikeoZ6UXOuMmsC2PU4wc1OwD5FJpJhOIGjYVk=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20241007115937eucas1p2bf81db0287940ac197a90652a05442da~8KdsQOjly0470104701eucas1p2d;
 Mon,  7 Oct 2024 11:59:37 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 7E.7F.09624.92DC3076; Mon,  7
 Oct 2024 12:59:37 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20241007115937eucas1p1230341a23b39c7b935812cc62825f2f7~8Kdr3TJeT2244222442eucas1p1H;
 Mon,  7 Oct 2024 11:59:37 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20241007115937eusmtrp2875010845fb96db30d8f40c648f619f7~8Kdr2usfA2609526095eusmtrp2s;
 Mon,  7 Oct 2024 11:59:37 +0000 (GMT)
X-AuditID: cbfec7f2-c11ff70000002598-24-6703cd29635a
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 8B.D4.14621.92DC3076; Mon,  7
 Oct 2024 12:59:37 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20241007115936eusmtip23cff28f50580afbdea4c4cb27f495093~8KdrF6TEe3240732407eusmtip2v;
 Mon,  7 Oct 2024 11:59:36 +0000 (GMT)
Message-ID: <37051126-3921-4afe-a936-5f828bff5752@samsung.com>
Date: Mon, 7 Oct 2024 13:59:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2,20/31] drm/vc4: Introduce generation number enum
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, Maxime Ripard
 <mripard@kernel.org>, Raspberry Pi Kernel Maintenance
 <kernel-list@raspberrypi.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20240621152055.4180873-21-dave.stevenson@raspberrypi.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDKsWRmVeSWpSXmKPExsWy7djP87qaZ5nTDY7e1bE4cX0Rk8X/bROZ
 Ld7OXcxiceXrezaL9zMnMFss/LiVxaKtcxmrxZY3E1kdODz2flvA4rFz1l12j02rOtk85p0M
 9LjffZzJo/XoLxaPzaerA9ijuGxSUnMyy1KL9O0SuDJ2Pf7AVjBHsGLShjcsDYxT+LoYOTkk
 BEwkPqyfztjFyMUhJLCCUeLfvW9MEM4XRomre+9CZT4zSlw5upgJpmXW100sEInlQC1vb4El
 hAQ+Mkoc2KgKYvMK2EmcWXaYGcRmEVCROLPkPiNEXFDi5MwnLCC2qIC8xP1bM9hBbGEBR4m5
 fYfAhooIPGGS+PP3LlgRs4C4xK0n88EWsAkYSnS97WIDsTkF3CWu33jMBFEjL9G8dTYzxHUP
 OCQePjODsF0kmk42sULYwhKvjm9hh7BlJP7vnA/2p4RAO6PEgt/3oZwJjBINz28xQlRZS9w5
 9wtoGwfQBk2J9bv0IcKOEstPv2IECUsI8EnceCsIcQOfxKRt05khwrwSHW1CENVqErOOr4Nb
 e/DCJagzPSQ6zi9hncCoOAspWGYh+XgWks9mIdywgJFlFaN4amlxbnpqsWFearlecWJucWle
 ul5yfu4mRmCCOv3v+KcdjHNffdQ7xMjEwXiIUYKDWUmEN2INY7oQb0piZVVqUX58UWlOavEh
 RmkOFiVxXtUU+VQhgfTEktTs1NSC1CKYLBMHp1QDk9HBrqAy3oZ6SbNPRhUNYkGbWXRu1uuu
 nqDBYsD/ZJHoFX7R0kVCC9JVj+9s9V/i6bv6R0Iri4CMk6f/OkelmimmOmEpRgpFLbp7j3vE
 vfi627Zsx+/Wy4ezq4uu7L5zjZN1Vugnie1rV+gmSUjXtafPdL9SZCv138rp/tI5xamP9Zju
 23CY6q/YbKlhJZhw/O7P13EK/1O77bkb1C8ri9VMdaqdNfWF0feZhVc85r+csJJ9yflKvQ9i
 XgLRsTxiL14uMrviaXpuOdvmZ/KSbydvKK50M75/+a+xi5/9LYGv5mtqgm99zvSZEmV66PW1
 /RLSttJP5V9KTWMIPPnxu2ifz28p9g/HZ342l1VUYinOSDTUYi4qTgQAQs+FJb8DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEIsWRmVeSWpSXmKPExsVy+t/xe7qaZ5nTDW5eFLY4cX0Rk8X/bROZ
 Ld7OXcxiceXrezaL9zMnMFss/LiVxaKtcxmrxZY3E1kdODz2flvA4rFz1l12j02rOtk85p0M
 9LjffZzJo/XoLxaPzaerA9ij9GyK8ktLUhUy8otLbJWiDS2M9AwtLfSMTCz1DI3NY62MTJX0
 7WxSUnMyy1KL9O0S9DJ2Pf7AVjBHsGLShjcsDYxT+LoYOTkkBEwkZn3dxNLFyMUhJLCUUWL3
 6y0sEAkZiZPTGlghbGGJP9e62EBsIYH3QEWLBEFsXgE7iTPLDjOD2CwCKhJnltxnhIgLSpyc
 +QRsjqiAvMT9WzPYQWxhAUeJuX2HwJaJCDxhkmi+08oOMdRN4snPf2ANzALiEreezGcCsdkE
 DCW63kIs5hRwl7h+4zETRI2ZRNfWLkYIW16ieets5gmMgrOQ7J6FZNQsJC2zkLQsYGRZxSiS
 Wlqcm55bbKhXnJhbXJqXrpecn7uJERh524793LyDcd6rj3qHGJk4GA8xSnAwK4nwRqxhTBfi
 TUmsrEotyo8vKs1JLT7EaAoMgInMUqLJ+cDYzyuJNzQzMDU0MbM0MLU0M1YS53W7fD5NSCA9
 sSQ1OzW1ILUIpo+Jg1OqgckxQrZBQPjxbf5GxlARhyfWd76la4Zy53oZr7m59ZLhpQCXy5V6
 U1xPfPjY5JMZ+3rOLf09Kve5e1llLpp4rJrXFfdSdSWb7DHhTyG9r1fcOPLgyoS2i4uMVqzj
 Ea44ZF2ZIsa1RvvBkpuNKtfOLfrPI6Z9ehePQoTe59eMP9Ue2Rw58nq71uuKw9frqt7pF09Z
 JTm3t+fxe58PZ+/ypze1H9nu9DStj3n2onSz/HiJzG8u3Un1+a/s1L59avhzQFHoXLfwo0k7
 l/s9rzNL7u3Qefly1rcTySrV5rHhL8R/qnFIpM5fa5aZz2Tgnmj6oDPKvTTuy+Tu3/vuSeVc
 LPO9+pnrrmRN/03ewnofMSWW4oxEQy3mouJEABIWdvZFAwAA
X-CMS-MailID: 20241007115937eucas1p1230341a23b39c7b935812cc62825f2f7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20241007115937eucas1p1230341a23b39c7b935812cc62825f2f7
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20241007115937eucas1p1230341a23b39c7b935812cc62825f2f7
References: <20240621152055.4180873-21-dave.stevenson@raspberrypi.com>
 <CGME20241007115937eucas1p1230341a23b39c7b935812cc62825f2f7@eucas1p1.samsung.com>
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

Hi Dave,

On 21.06.2024 17:20, Dave Stevenson wrote:
> From: Maxime Ripard <mripard@kernel.org>
>
> With the introduction of the BCM2712 support, we will get yet another
> generation of display engine to support.
>
> The binary check of whether it's VC5 or not thus doesn't work anymore,
> especially since some parts of the driver will have changed with BCM2711,
> and some others with BCM2712.
>
> Let's introduce an enum to store the generation the driver is running
> on, which should provide more flexibility.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

This patch landed recently in linux-next as commit 24c5ed3ddf27 
("drm/vc4: Introduce generation number enum"). In my tests I found that 
it introduces the following warning on Raspberry Pi3B+ board:

================================================
WARNING: lock held when returning to user space!
6.11.0-rc5+ #15405 Tainted: G         C
------------------------------------------------
(udev-worker)/161 is leaving the kernel with locks still held!
1 lock held by (udev-worker)/161:
  #0: ffff80008338bff8 (drm_unplug_srcu){.?.?}-{0:0}, at: 
drm_dev_enter+0x0/0xdc


I suspect that the error path is somewhere broken and the conversion 
triggered that path.


A wild guess (noticed by grepping for 'drm_dev_enter') is that the 
following chunk is broken:

> diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
> index 933177cb8d66..7380a02a69a2 100644
> --- a/drivers/gpu/drm/vc4/vc4_hvs.c
> +++ b/drivers/gpu/drm/vc4/vc4_hvs.c
> @@ -224,7 +224,7 @@ static void vc4_hvs_lut_load(struct vc4_hvs *hvs,
>  	if (!drm_dev_enter(drm, &idx))
>  		return;
>  
> -	if (hvs->vc4->is_vc5)
> +	if (hvs->vc4->gen == VC4_GEN_4)
>  		return;
>  
>  	/* The LUT memory is laid out with each HVS channel in order,

as changing the above check to 'if (hvs->vc4->gen > VC4_GEN_4)' fixes this issue (tested also on top of linux-next). I think that one has to review the checks again as well as the error paths in the driver.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

