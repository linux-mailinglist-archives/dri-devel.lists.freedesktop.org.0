Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFFED3B1D6
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 17:44:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30A4810E2C2;
	Mon, 19 Jan 2026 16:44:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="G2Dgl8MZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A74310E4CC
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 16:44:23 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id
 d75a77b69052e-501c6665144so46900771cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 08:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1768841062; x=1769445862; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=7mLdSjko9gcpWp2LFuEj2HWiy0Q3Aa6qTfE9JkGPgsY=;
 b=G2Dgl8MZBAZs9CEZRXcDt4Y33OEHkw2ZzBP5BjvHiuSuQtB8YPPb63/EJANkEDJx7k
 Bt1raykG4k9lmMYCuY+jHI0ZTvsWwrlGPSaYJU3ib8IRAjsX6WU9VeXLsZ+d+XJd7ztR
 D6UKV1AFRSYeddCuTOY3PUinva/2NzP0pnpfTWswNvMEz/zenuleslOjxgJ3CQAIX+gE
 cOU3UZWx6mp7Mj1iJsP+BHL4afzlgmMo1HZ4YGjZdW9dRVMtQpFOtlvyDLUe8XDZpdLw
 moiCImdFbmwpApmOAzgw/xRVOoeOoCQ7Q4Prj+F4tRlktlw48tM3rzjNDm7Y+IKMbzXN
 ni3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768841062; x=1769445862;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7mLdSjko9gcpWp2LFuEj2HWiy0Q3Aa6qTfE9JkGPgsY=;
 b=LpSL7oUgqB+XFYd2iB8jNsa5k3fB9LYo+J6wE8YMBXBMg5pS6mscdIrryJMu4y/Ona
 ZOZBU2E1fabyMYcQrvAFO/oGbJ1Fmi2VLbCiSSEfqVfntzz5nVaZAYeXYVQDjM1+xG2D
 JFEvkLsJlEkLnAeCGvdmxaRSRrZMXxu1b6H9G0u0IgD2A1TzBkBKG8z1COLcWkykQkSf
 u+Tw0PtJaGhutb8KgCJGZjGgLklaewHqiISKd0I9ogMhFObJeTi279Vw2mTsZYyMnvKV
 rxF8EYj2+EdenCw2vHMtHV02DhHNwDi1eN1X5FyxYLC4GDQiWMwbcotT0937Wqs6DE88
 h5ow==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwLIUYL2T2BQMjaW0puguM5EXWidJXQQaeYAJPEblNZvMkf+AonQvqqs5g6F5jqpVqUISHdVchcMs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz7lkz4L8Ay/W44ZY+RNAXSOaHFxj5/R8T0jn2vA37FdZvdUPre
 mIEhMt7dkNwxXfKhTtjWCwTSffQAsQNOSgME5DSmdxXKNfaigEYNDZwlPmvyvu4Ywkk=
X-Gm-Gg: AY/fxX6Mmu5kHKUYtcCmULjXOgGEKNyDcUh6/Zg8bxfSCeAGtUoZzlQYQzNJxPYrp9A
 IrpqQ3Y++a8XCY31uhSmuwWfQN7GPfsRapbwXvlHntk4ysk7HDO1Ayhqtc8R8hBSfNtxkPfMVtC
 5nHYF8Ns8hBXhZfE6gynhhYSWoHnocIpvsTr9AdTuwMkz/wsepmFZ6+5Z8Z9cTivhIhMi65WRND
 MNMrRcp4MH2rjF8yta1iAQ4iaSz02KTD05/axHWg6kheb7IT1Bg9Rf3MtB6EgFjSjt2JvqoLbpD
 zntFC8UPiZx88boNEHUcQxPd2im7cRN+rXjp8F3tpkGvjc2ZMl1bbj+2ktiuS/YoeUr6CDeT/z4
 yGWE3Pkzn2Grecd0Wghdqp/N6Ad6+QlrYUiTHK07ZLDD0t8rOr6K19TcmtwmtvJLW11Eo+l02Ow
 Ia9X5H+2+AS5om2VT7p63tJE5pU8pq1kQyppT9U8n3n29a8bP6WH5NBH4kgwKmxfj6XtE=
X-Received: by 2002:ac8:7d16:0:b0:4ee:1b36:b5c2 with SMTP id
 d75a77b69052e-502a1f87eb4mr182498161cf.68.1768841062394; 
 Mon, 19 Jan 2026 08:44:22 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.112.119]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-502a1ed3155sm72779401cf.19.2026.01.19.08.44.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 08:44:21 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1vhsMX-00000005IKH-0ezs;
 Mon, 19 Jan 2026 12:44:21 -0400
Date: Mon, 19 Jan 2026 12:44:21 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Alex Williamson <alex@shazbot.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 virtualization@lists.linux.dev, intel-xe@lists.freedesktop.org,
 linux-rdma@vger.kernel.org, iommu@lists.linux.dev, kvm@vger.kernel.org
Subject: Re: [PATCH v2 2/4] dma-buf: Document revoke semantics
Message-ID: <20260119164421.GF961572@ziepe.ca>
References: <20260118-dmabuf-revoke-v2-0-a03bb27c0875@nvidia.com>
 <20260118-dmabuf-revoke-v2-2-a03bb27c0875@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260118-dmabuf-revoke-v2-2-a03bb27c0875@nvidia.com>
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

On Sun, Jan 18, 2026 at 02:08:46PM +0200, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> Document a DMA-buf revoke mechanism that allows an exporter to explicitly
> invalidate ("kill") a shared buffer after it has been handed out to
> importers. Once revoked, all further CPU and device access is blocked, and
> importers consistently observe failure.
> 
> This requires both importers and exporters to honor the revoke contract.
> 
> For importers, this means implementing .invalidate_mappings() and calling
> dma_buf_pin() after the DMA‑buf is attached to verify the exporter’s support
> for revocation.
> 
> For exporters, this means implementing the .pin() callback, which checks
> the DMA‑buf attachment for a valid revoke implementation.
> 
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  include/linux/dma-buf.h | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index 1b397635c793..e0bc0b7119f5 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -579,6 +579,25 @@ static inline bool dma_buf_is_dynamic(struct dma_buf *dmabuf)
>  	return !!dmabuf->ops->pin;
>  }
>  
> +/**
> + * dma_buf_attachment_is_revoke - check if a DMA-buf importer implements
> + * revoke semantics.
> + * @attach: the DMA-buf attachment to check
> + *
> + * Returns true if DMA-buf importer honors revoke semantics, which is
> + * negotiated with the exporter, by making sure that importer implements
> + * .invalidate_mappings() callback and calls to dma_buf_pin() after
> + * DMA-buf attach.
> + */

I think this clarification should also have comment to
dma_buf_move_notify(). Maybe like this:

@@ -1324,7 +1324,18 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_sgt_unmap_attachment_unlocked, "DMA_BUF");
  * @dmabuf:    [in]    buffer which is moving
  *
  * Informs all attachments that they need to destroy and recreate all their
- * mappings.
+ * mappings. If the attachment is dynamic then the dynamic importer is expected
+ * to invalidate any caches it has of the mapping result and perform a new
+ * mapping request before allowing HW to do any further DMA.
+ *
+ * If the attachment is pinned then this informs the pinned importer that
+ * the underlying mapping is no longer available. Pinned importers may take
+ * this is as a permanent revocation so exporters should not trigger it
+ * lightly.
+ *
+ * For legacy pinned importers that cannot support invalidation this is a NOP.
+ * Drivers can call dma_buf_attachment_is_revoke() to determine if the
+ * importer supports this.
  */

Also it would be nice to document what Christian pointed out regarding
fences after move_notify.

> +static inline bool
> +dma_buf_attachment_is_revoke(struct dma_buf_attachment *attach)
> +{
> +	return IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY) &&
> +	       dma_buf_is_dynamic(attach->dmabuf) &&
> +	       (attach->importer_ops &&
> +		attach->importer_ops->invalidate_mappings);
> +}

And I don't think we should use a NULL invalidate_mappings function
pointer to signal this.

It sounds like the direction is to require importers to support
move_notify, so we should not make it easy to just drop a NULL in the
ops struct to get out of the desired configuration.

I suggest defining a function
"dma_buf_unsupported_invalidate_mappings" and use
EXPORT_SYMBOL_FOR_MODULES so only RDMA can use it. Then check for that
along with NULL importer_ops to cover the two cases where it is not
allowed.

The only reason RDMA has to use dma_buf_dynamic_attach() is to set the
allow_p2p=true ..

Jason
