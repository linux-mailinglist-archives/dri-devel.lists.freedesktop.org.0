Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C85D81CE267
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 20:17:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E9EA6E167;
	Mon, 11 May 2020 18:17:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFB6E6E167;
 Mon, 11 May 2020 18:17:34 +0000 (UTC)
IronPort-SDR: p5tgR9nC+hq4g3Tjvqy9nej+yCrL0hez+QK5ZM8Rv/82D4WTz+m4kL+ccpXwNMjaYxEYuXdvWm
 UHhWzf6zRKYA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2020 11:17:34 -0700
IronPort-SDR: Y1DsXc4/UPTn8R3+5co8epPfgEtRYbtqfhLJy4DfqHLdQVkZtaZtEw2ypysEvY0wmqywkDhrIJ
 wyPNuQWdaOlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,380,1583222400"; d="scan'208";a="286361037"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by fmsmga004.fm.intel.com with ESMTP; 11 May 2020 11:17:34 -0700
Received: from fmsmsx154.amr.corp.intel.com (10.18.116.70) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 11 May 2020 11:17:34 -0700
Received: from fmsmsx108.amr.corp.intel.com ([169.254.9.60]) by
 FMSMSX154.amr.corp.intel.com ([169.254.6.202]) with mapi id 14.03.0439.000;
 Mon, 11 May 2020 11:17:33 -0700
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>, Daniel Vetter
 <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>
Subject: RE: [Intel-gfx] [PATCH 2/3] dma-fence: use default wait function
 for mock fences
Thread-Topic: [Intel-gfx] [PATCH 2/3] dma-fence: use default wait function
 for mock fences
Thread-Index: AQHWJ3Q9b7FvqdjeFkWZgt98eLHlv6ijMJewgAABOlA=
Date: Mon, 11 May 2020 18:17:33 +0000
Message-ID: <14063C7AD467DE4B82DEDB5C278E8663010E20F87B@FMSMSX108.amr.corp.intel.com>
References: <20200511091142.208787-1-daniel.vetter@ffwll.ch>
 <20200511091142.208787-2-daniel.vetter@ffwll.ch>
 <14063C7AD467DE4B82DEDB5C278E8663010E20F842@FMSMSX108.amr.corp.intel.com>
In-Reply-To: <14063C7AD467DE4B82DEDB5C278E8663010E20F842@FMSMSX108.amr.corp.intel.com>
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
Cc: "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>, "Vetter,
 Daniel" <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>, DRI
 Development <dri-devel@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>-----Original Message-----
>From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
>Ruhl, Michael J
>Sent: Monday, May 11, 2020 2:13 PM
>To: Daniel Vetter <daniel.vetter@ffwll.ch>; LKML <linux-
>kernel@vger.kernel.org>
>Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>; DRI
>Development <dri-devel@lists.freedesktop.org>; linaro-mm-
>sig@lists.linaro.org; Vetter, Daniel <daniel.vetter@intel.com>; linux-
>media@vger.kernel.org
>Subject: RE: [Intel-gfx] [PATCH 2/3] dma-fence: use default wait function for
>mock fences
>
>>-----Original Message-----
>>From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of
>>Daniel Vetter
>>Sent: Monday, May 11, 2020 5:12 AM
>>To: LKML <linux-kernel@vger.kernel.org>
>>Cc: Daniel Vetter <daniel.vetter@ffwll.ch>; Intel Graphics Development
>><intel-gfx@lists.freedesktop.org>; DRI Development <dri-
>>devel@lists.freedesktop.org>; linaro-mm-sig@lists.linaro.org; Vetter, Daniel
>><daniel.vetter@intel.com>; Sumit Semwal <sumit.semwal@linaro.org>;
>linux-
>>media@vger.kernel.org
>>Subject: [Intel-gfx] [PATCH 2/3] dma-fence: use default wait function for
>>mock fences
>>
>>No need to micro-optmize when we're waiting in a mocked object ...
>
>Makes sense to me.

/sigh.

Reading Chris comment, I am no longer sure it make sense... 

Un-ack?

m

>Acked-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
>
>M
>
>>Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>>Cc: Sumit Semwal <sumit.semwal@linaro.org>
>>Cc: linux-media@vger.kernel.org
>>Cc: linaro-mm-sig@lists.linaro.org
>>---
>> drivers/dma-buf/st-dma-fence.c | 41 ----------------------------------
>> 1 file changed, 41 deletions(-)
>>
>>diff --git a/drivers/dma-buf/st-dma-fence.c b/drivers/dma-buf/st-dma-
>>fence.c
>>index e593064341c8..8166d2984702 100644
>>--- a/drivers/dma-buf/st-dma-fence.c
>>+++ b/drivers/dma-buf/st-dma-fence.c
>>@@ -33,50 +33,9 @@ static void mock_fence_release(struct dma_fence *f)
>> 	kmem_cache_free(slab_fences, to_mock_fence(f));
>> }
>>
>>-struct wait_cb {
>>-	struct dma_fence_cb cb;
>>-	struct task_struct *task;
>>-};
>>-
>>-static void mock_wakeup(struct dma_fence *f, struct dma_fence_cb *cb)
>>-{
>>-	wake_up_process(container_of(cb, struct wait_cb, cb)->task);
>>-}
>>-
>>-static long mock_wait(struct dma_fence *f, bool intr, long timeout)
>>-{
>>-	const int state = intr ? TASK_INTERRUPTIBLE :
>>TASK_UNINTERRUPTIBLE;
>>-	struct wait_cb cb = { .task = current };
>>-
>>-	if (dma_fence_add_callback(f, &cb.cb, mock_wakeup))
>>-		return timeout;
>>-
>>-	while (timeout) {
>>-		set_current_state(state);
>>-
>>-		if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &f->flags))
>>-			break;
>>-
>>-		if (signal_pending_state(state, current))
>>-			break;
>>-
>>-		timeout = schedule_timeout(timeout);
>>-	}
>>-	__set_current_state(TASK_RUNNING);
>>-
>>-	if (!dma_fence_remove_callback(f, &cb.cb))
>>-		return timeout;
>>-
>>-	if (signal_pending_state(state, current))
>>-		return -ERESTARTSYS;
>>-
>>-	return -ETIME;
>>-}
>>-
>> static const struct dma_fence_ops mock_ops = {
>> 	.get_driver_name = mock_name,
>> 	.get_timeline_name = mock_name,
>>-	.wait = mock_wait,
>> 	.release = mock_fence_release,
>> };
>>
>>--
>>2.26.2
>>
>>_______________________________________________
>>Intel-gfx mailing list
>>Intel-gfx@lists.freedesktop.org
>>https://lists.freedesktop.org/mailman/listinfo/intel-gfx
>_______________________________________________
>dri-devel mailing list
>dri-devel@lists.freedesktop.org
>https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
