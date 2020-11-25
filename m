Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A14792C3CD1
	for <lists+dri-devel@lfdr.de>; Wed, 25 Nov 2020 10:48:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B34AE6E89F;
	Wed, 25 Nov 2020 09:48:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 080916E89F
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Nov 2020 09:48:13 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id e7so1233735wrv.6
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Nov 2020 01:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=7+DHlYNLElWQDos2fcM4EUTiTuw+aVcP8LZgNF0ilY8=;
 b=fw5wGyjNrOwETm9xnFkD8r9KTA6Kc+ePbkE3zwOFph4aR+OHEcihzfPo3auPW2jukD
 AKKWTd78k1DUak6nqzxdeQOQvLeaeL5DaTH764+MAQ+MH4RKHVOTfJJLAB4lRQMi95Df
 DQJk5/Nl6TplHZAB27zZXHeHgSjDec7Y0J6NQRMDHYCImmJac+01qFCpFLdujTdo4nzV
 BY6u2Q09i+uLwjqRCCfWT10GyzyxvlHHJz+IOnFUiU4O78PG/xhGHZn6uBUDVtB+cI2c
 vQMSMfEuIcdWe7R1HwQIODj63t61BRHHyGvQjD9urFrnYKGSjr8xvFuex4HKbTz4Ca61
 Y/JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7+DHlYNLElWQDos2fcM4EUTiTuw+aVcP8LZgNF0ilY8=;
 b=p62jYE9ISeYL5v0ouE8fHaj8NWMIIXQpricvsPyN5SwvRkgCpOQVGc4YEMy6oK6p9k
 nSW+xU9zTUhix68l4UA6aswAxZn52RBfNfOoNcanFMOmi5qpvcWyw3L3Q6fI4j0e/52G
 UOnp+Qoc0tO6W4Gxc+nUAMfoL8bn7vRAPqB062AklrMAQ6hYFSDMmlA3dRx/8FikeqkQ
 a+bpMQFFJKIvZDKcwpX8mamoBOmLIqAAcMFc3GLrekH/E1mKCfGMNrAnDoA3h+VZST7j
 Xs4uXa8a2quGtuIG1SrspKFI0L+f+25g89Cxv2Cm+BekJe3XM0qFeeI0vOBMAYcD+5Nb
 hsMA==
X-Gm-Message-State: AOAM531TKQ+DRpK+1hwRuOenExhkN6QCZIxs9jlOVl5pUKOCj70/o8No
 FnVMOKQMEAWD4QQSDrJ3QpU=
X-Google-Smtp-Source: ABdhPJyNUDNFxSVpgZM8g9tAWlW/ZVKP6GopJQ8pJAf6xlCtqzgRhEb4BVaFKdwh6uKlD1YbEFZsTQ==
X-Received: by 2002:adf:f9c4:: with SMTP id w4mr3154946wrr.64.1606297691737;
 Wed, 25 Nov 2020 01:48:11 -0800 (PST)
Received: from gmail.com (lns-bzn-36-82-251-42-13.adsl.proxad.net.
 [82.251.42.13])
 by smtp.gmail.com with ESMTPSA id 3sm3415856wmi.24.2020.11.25.01.48.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2020 01:48:11 -0800 (PST)
Date: Wed, 25 Nov 2020 10:48:09 +0100
From: Anthoine Bourgeois <anthoine.bourgeois@gmail.com>
To: Gurchetan Singh <gurchetansingh@chromium.org>
Subject: Re: [PATCH 2/3] drm/virtio: rework virtio_fence_signaled
Message-ID: <20201125094809.GD12906@gmail.com>
References: <20201124021902.407-1-gurchetansingh@chromium.org>
 <20201124021902.407-2-gurchetansingh@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201124021902.407-2-gurchetansingh@chromium.org>
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
Cc: kraxel@redhat.com, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 23, 2020 at 06:19:01PM -0800, Gurchetan Singh wrote:
>virtio_gpu_fence_event_process sets the last_fence_id and
>subsequently calls dma_fence_signal_locked(..).
>
>dma_fence_signal_locked(..) sets DMA_FENCE_FLAG_SIGNALED_BIT,
>which is actually checked before &dma_fence_ops.(*signaled) is
>called.
>
>The check for last_fence_id is therefore a bit redundant, and
>it will not be sufficient to check the last_fence_id for multiple
>synchronization timelines.  Remove it.
>
>Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
Reviewed-by: Anthoine Bourgeois <anthoine.bourgeois@gmail.com>
>---
> drivers/gpu/drm/virtio/virtgpu_fence.c | 12 ++++--------
> 1 file changed, 4 insertions(+), 8 deletions(-)
>
>diff --git a/drivers/gpu/drm/virtio/virtgpu_fence.c b/drivers/gpu/drm/virtio/virtgpu_fence.c
>index 586034c90587..b35fcd1d02d7 100644
>--- a/drivers/gpu/drm/virtio/virtgpu_fence.c
>+++ b/drivers/gpu/drm/virtio/virtgpu_fence.c
>@@ -42,14 +42,10 @@ static const char *virtio_gpu_get_timeline_name(struct dma_fence *f)
>
> static bool virtio_gpu_fence_signaled(struct dma_fence *f)
> {
>-	struct virtio_gpu_fence *fence = to_virtio_gpu_fence(f);
>-
>-	if (WARN_ON_ONCE(fence->f.seqno == 0))
>-		/* leaked fence outside driver before completing
>-		 * initialization with virtio_gpu_fence_emit */
>-		return false;
>-	if (atomic64_read(&fence->drv->last_fence_id) >= fence->f.seqno)
>-		return true;
>+	/* leaked fence outside driver before completing
>+	 * initialization with virtio_gpu_fence_emit.
>+	 */
>+	WARN_ON_ONCE(f->seqno == 0);
> 	return false;
> }
>
>-- 
>2.29.2.454.gaff20da3a2-goog
>
>_______________________________________________
>dri-devel mailing list
>dri-devel@lists.freedesktop.org
>https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
