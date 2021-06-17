Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9C73ABCA7
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 21:26:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD60D6E9A7;
	Thu, 17 Jun 2021 19:26:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C77F6E9A7
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 19:26:10 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id r9so7982303wrz.10
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 12:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=uOCbhZ/ibkRBObHTOgKs1UFBQ9qhD4uIcfjgRg2K5Rs=;
 b=IH1EtHRcSfinmclrpIc4Ng6Z7QMgqeen5j6b9qDw9LlX3wUMNyz7FR5R2CPO52LkTf
 QD+gv9wIv5pC6wI/j5ngc570YTPSoQC2HVxc+/PgCaUlG19XD4VHTKEeFdM63kxC4KXb
 RWLz1Vo9kZ1DZtt0ovCaSIdBs4XA0bFdD5FjA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=uOCbhZ/ibkRBObHTOgKs1UFBQ9qhD4uIcfjgRg2K5Rs=;
 b=BgrmACDJQqdJU1b1jz5BkkTCqa/6tGyOAmWb7q6uCITcrAhwNUSBs+5hykS0hU+FNl
 KuOoM6ekZKPXU2aCoEV5oaQC1MrGzNmBgKz/fSP6HQ/WEtASIBeGS9+hgK3YuFMnVt0L
 IzQiwC2w8KQZNc1/PMOup7Z2Bu0P4Bb5/tUaHEfal/ulKsl85MT8dpyAUNqDnOK1hpJK
 PbOvFOIrXrdrzlhrkYGpUXe+JfpUkqfmZVeyuNFSP4i9/kYKVDBTSd19/A9cU28HVUSD
 ckmfxuNmW+E0pvl6tSedodnE106NeEqU0v3l//z834RDw3HFvklm8OIz9xaoeKSSN/sj
 Pc8w==
X-Gm-Message-State: AOAM532iu705xg4lCOLnDPQ5bgV+ETMUkF1wafsFIRmk5fDYHkuL1XCK
 4io69GnsTMBFBYd3HXnC87RsdQ==
X-Google-Smtp-Source: ABdhPJyFfhTApY3wh24dH1FBegs1U/7U9Tg5s0DawhN6NGiIRg2uLHMj8Cb4gBd6mBJpG1xllNPadg==
X-Received: by 2002:adf:e80c:: with SMTP id o12mr4048275wrm.425.1623957969045; 
 Thu, 17 Jun 2021 12:26:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id r6sm6181038wrz.91.2021.06.17.12.26.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 12:26:08 -0700 (PDT)
Date: Thu, 17 Jun 2021 21:26:06 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 1/7] dma-buf: add some more kerneldoc to
 dma_resv_add_shared_fence
Message-ID: <YMuhzpyiNMSz3Nx+@phenom.ffwll.local>
References: <20210616082655.111001-1-christian.koenig@amd.com>
 <20210616082655.111001-2-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210616082655.111001-2-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 16, 2021 at 10:26:49AM +0200, Christian König wrote:
> Explicitly document that code can't assume that shared fences
> signal after the exclusive fence.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/dma-resv.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index f26c71747d43..4ab02b6c387a 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -235,7 +235,10 @@ EXPORT_SYMBOL(dma_resv_reset_shared_max);
>   * @fence: the shared fence to add
>   *
>   * Add a fence to a shared slot, obj->lock must be held, and
> - * dma_resv_reserve_shared() has been called.
> + * dma_resv_reserve_shared() has been called. The shared fences can signal in
> + * any order and there is especially no guarantee that shared fences signal
> + * after the exclusive one. Code relying on any signaling order is broken and
> + * needs to be fixed.

So I agree this are reasonable semantics, but you need to audit drivers
first. Because currently that's not how at least a bunch of them work.
There's way more drivers than the handful you've looked at.

Imo gold standard here is what I've tried doing for the "how do we set
fences" side, which is going through all of them. The trouble is that this
is a bit nastier, because a) drivers play much more tricks here and b)
understand each driver's scheduling logic is more work than how they set
fences for a request/cs.

Unfortunately I haven't gotten around to doing that yet, because it means
a few days of uninterrupted time crawling through way too much code. I
haven't even found time to respin my old series to make the fence setting
more consistent (since I find a few more issues there than just the amdgpu
one that sparked it all).
-Daniel

>   */
>  void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence)
>  {
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
