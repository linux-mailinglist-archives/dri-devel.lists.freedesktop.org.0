Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2113B0D5B
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 21:01:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FCBA6E874;
	Tue, 22 Jun 2021 19:01:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F5F26E072
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 19:01:43 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 51921ad5-d38c-11eb-960d-0050568c148b;
 Tue, 22 Jun 2021 19:01:58 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 5EA9B194B05;
 Tue, 22 Jun 2021 21:01:45 +0200 (CEST)
Date: Tue, 22 Jun 2021 21:01:37 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 02/15] dma-buf: Switch to inline kerneldoc
Message-ID: <YNIzkSg5kwp9gdCR@ravnborg.org>
References: <20210622165511.3169559-1-daniel.vetter@ffwll.ch>
 <20210622165511.3169559-3-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210622165511.3169559-3-daniel.vetter@ffwll.ch>
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
Cc: Deepak R Varma <mh12gx2825@gmail.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Kevin Wang <kevin1.wang@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 linaro-mm-sig@lists.linaro.org, Nirmoy Das <nirmoy.das@amd.com>,
 Chen Li <chenli@uniontech.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel.

On Tue, Jun 22, 2021 at 06:54:58PM +0200, Daniel Vetter wrote:
> Also review & update everything while we're at it.
> 
> This is prep work to smash a ton of stuff into the kerneldoc for
> @resv.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Nirmoy Das <nirmoy.das@amd.com>
> Cc: Deepak R Varma <mh12gx2825@gmail.com>
> Cc: Chen Li <chenli@uniontech.com>
> Cc: Kevin Wang <kevin1.wang@amd.com>
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> ---
>  include/linux/dma-buf.h | 107 +++++++++++++++++++++++++++++++---------
>  1 file changed, 83 insertions(+), 24 deletions(-)
> 
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index 92eec38a03aa..6d18b9e448b9 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -289,28 +289,6 @@ struct dma_buf_ops {
>  
>  /**
>   * struct dma_buf - shared buffer object
> - * @size: size of the buffer; invariant over the lifetime of the buffer.
> - * @file: file pointer used for sharing buffers across, and for refcounting.
> - * @attachments: list of dma_buf_attachment that denotes all devices attached,
> - *               protected by dma_resv lock.
> - * @ops: dma_buf_ops associated with this buffer object.
> - * @lock: used internally to serialize list manipulation, attach/detach and
> - *        vmap/unmap
> - * @vmapping_counter: used internally to refcnt the vmaps
> - * @vmap_ptr: the current vmap ptr if vmapping_counter > 0
> - * @exp_name: name of the exporter; useful for debugging.
> - * @name: userspace-provided name; useful for accounting and debugging,
> - *        protected by @resv.
> - * @name_lock: spinlock to protect name access
> - * @owner: pointer to exporter module; used for refcounting when exporter is a
> - *         kernel module.
> - * @list_node: node for dma_buf accounting and debugging.
> - * @priv: exporter specific private data for this buffer object.
> - * @resv: reservation object linked to this dma-buf
> - * @poll: for userspace poll support
> - * @cb_excl: for userspace poll support
> - * @cb_shared: for userspace poll support
> - * @sysfs_entry: for exposing information about this buffer in sysfs.

This sentence
>   * The attachment_uid member of @sysfs_entry is protected by dma_resv lock
>   * and is incremented on each attach.
belongs to the paragraph describing sysfs_entry and should be moved too.
Or maybe reworded and then document all fields in dma_buf_sysfs_entry?

With this fixed:
Acked-by: Sam Ravnborg <sam@ravnborg.org>
