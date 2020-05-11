Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB221CE25B
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 20:13:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF1DB6E528;
	Mon, 11 May 2020 18:13:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2E086E528;
 Mon, 11 May 2020 18:13:23 +0000 (UTC)
IronPort-SDR: qq3FPxlVdeowzkGj9FoZGpn/0JeXyPqRcFrNfQYq9Ml5qbS5rlUdEclnEnac5Lzqf9n5i/3s9L
 Gwp24GIOD7Qw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2020 11:13:23 -0700
IronPort-SDR: 4yn5bQ6SzOqq6GhdNt4t87npsuluYQWvNQB8Ku44Q6axiNqEfWtTVx9UXsJapXpIHTxZyo2p5R
 cEOwBqNcJsRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,380,1583222400"; d="scan'208";a="265240180"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by orsmga006.jf.intel.com with ESMTP; 11 May 2020 11:13:23 -0700
Received: from FMSMSX110.amr.corp.intel.com (10.18.116.10) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 11 May 2020 11:13:22 -0700
Received: from fmsmsx108.amr.corp.intel.com ([169.254.9.60]) by
 FMSMSX110.amr.corp.intel.com ([169.254.14.169]) with mapi id 14.03.0439.000;
 Mon, 11 May 2020 11:13:22 -0700
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>
Subject: RE: [Intel-gfx] [PATCH 2/3] dma-fence: use default wait function
 for mock fences
Thread-Topic: [Intel-gfx] [PATCH 2/3] dma-fence: use default wait function
 for mock fences
Thread-Index: AQHWJ3Q9b7FvqdjeFkWZgt98eLHlv6ijMJew
Date: Mon, 11 May 2020 18:13:21 +0000
Message-ID: <14063C7AD467DE4B82DEDB5C278E8663010E20F842@FMSMSX108.amr.corp.intel.com>
References: <20200511091142.208787-1-daniel.vetter@ffwll.ch>
 <20200511091142.208787-2-daniel.vetter@ffwll.ch>
In-Reply-To: <20200511091142.208787-2-daniel.vetter@ffwll.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.1.200.107]
MIME-Version: 1.0
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>, DRI
 Development <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>, "Vetter, 
 Daniel" <daniel.vetter@intel.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>-----Original Message-----
>From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of
>Daniel Vetter
>Sent: Monday, May 11, 2020 5:12 AM
>To: LKML <linux-kernel@vger.kernel.org>
>Cc: Daniel Vetter <daniel.vetter@ffwll.ch>; Intel Graphics Development
><intel-gfx@lists.freedesktop.org>; DRI Development <dri-
>devel@lists.freedesktop.org>; linaro-mm-sig@lists.linaro.org; Vetter, Daniel
><daniel.vetter@intel.com>; Sumit Semwal <sumit.semwal@linaro.org>; linux-
>media@vger.kernel.org
>Subject: [Intel-gfx] [PATCH 2/3] dma-fence: use default wait function for
>mock fences
>
>No need to micro-optmize when we're waiting in a mocked object ...

Makes sense to me.

Acked-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

M

>Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>Cc: Sumit Semwal <sumit.semwal@linaro.org>
>Cc: linux-media@vger.kernel.org
>Cc: linaro-mm-sig@lists.linaro.org
>---
> drivers/dma-buf/st-dma-fence.c | 41 ----------------------------------
> 1 file changed, 41 deletions(-)
>
>diff --git a/drivers/dma-buf/st-dma-fence.c b/drivers/dma-buf/st-dma-
>fence.c
>index e593064341c8..8166d2984702 100644
>--- a/drivers/dma-buf/st-dma-fence.c
>+++ b/drivers/dma-buf/st-dma-fence.c
>@@ -33,50 +33,9 @@ static void mock_fence_release(struct dma_fence *f)
> 	kmem_cache_free(slab_fences, to_mock_fence(f));
> }
>
>-struct wait_cb {
>-	struct dma_fence_cb cb;
>-	struct task_struct *task;
>-};
>-
>-static void mock_wakeup(struct dma_fence *f, struct dma_fence_cb *cb)
>-{
>-	wake_up_process(container_of(cb, struct wait_cb, cb)->task);
>-}
>-
>-static long mock_wait(struct dma_fence *f, bool intr, long timeout)
>-{
>-	const int state = intr ? TASK_INTERRUPTIBLE :
>TASK_UNINTERRUPTIBLE;
>-	struct wait_cb cb = { .task = current };
>-
>-	if (dma_fence_add_callback(f, &cb.cb, mock_wakeup))
>-		return timeout;
>-
>-	while (timeout) {
>-		set_current_state(state);
>-
>-		if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &f->flags))
>-			break;
>-
>-		if (signal_pending_state(state, current))
>-			break;
>-
>-		timeout = schedule_timeout(timeout);
>-	}
>-	__set_current_state(TASK_RUNNING);
>-
>-	if (!dma_fence_remove_callback(f, &cb.cb))
>-		return timeout;
>-
>-	if (signal_pending_state(state, current))
>-		return -ERESTARTSYS;
>-
>-	return -ETIME;
>-}
>-
> static const struct dma_fence_ops mock_ops = {
> 	.get_driver_name = mock_name,
> 	.get_timeline_name = mock_name,
>-	.wait = mock_wait,
> 	.release = mock_fence_release,
> };
>
>--
>2.26.2
>
>_______________________________________________
>Intel-gfx mailing list
>Intel-gfx@lists.freedesktop.org
>https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
