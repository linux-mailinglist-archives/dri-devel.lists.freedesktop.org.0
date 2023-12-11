Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1257080C79C
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 12:05:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC97410E0DD;
	Mon, 11 Dec 2023 11:05:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CDD910E0DD
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 11:05:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id A53EFB80DCB;
 Mon, 11 Dec 2023 11:05:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1A52C433C8;
 Mon, 11 Dec 2023 11:05:28 +0000 (UTC)
Message-ID: <ce2110bf-a16a-45ae-979b-7e41be2896cd@xs4all.nl>
Date: Mon, 11 Dec 2023 12:05:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3,04/21] v4l: add documentation for secure memory flag
Content-Language: en-US, nl
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 Jeffrey Kardatzke <jkardatzke@google.com>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>
References: <20231206081538.17056-1-yunfei.dong@mediatek.com>
 <20231206081538.17056-5-yunfei.dong@mediatek.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20231206081538.17056-5-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Steve Cho <stevecho@chromium.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Chen-Yu Tsai <wenst@chromium.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Matthias Brugger <matthias.bgg@gmail.com>, John Stultz <jstultz@google.com>,
 linux-arm-kernel@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>, linux-mediatek@lists.infradead.org,
 "T . J . Mercier" <tjmercier@google.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Yong Wu <yong.wu@mediatek.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/12/2023 09:15, Yunfei Dong wrote:
> From: Jeffrey Kardatzke <jkardatzke@google.com>
> 
> Adds documentation for V4L2_MEMORY_FLAG_SECURE.
> 
> Signed-off-by: Jeffrey Kardatzke <jkardatzke@google.com>
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>  Documentation/userspace-api/media/v4l/buffer.rst | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/buffer.rst b/Documentation/userspace-api/media/v4l/buffer.rst
> index 52bbee81c080..a5a7d1c72d53 100644
> --- a/Documentation/userspace-api/media/v4l/buffer.rst
> +++ b/Documentation/userspace-api/media/v4l/buffer.rst
> @@ -696,7 +696,7 @@ enum v4l2_memory
>  
>  .. _memory-flags:
>  
> -Memory Consistency Flags
> +Memory Flags
>  ------------------------
>  
>  .. raw:: latex
> @@ -728,6 +728,12 @@ Memory Consistency Flags
>  	only if the buffer is used for :ref:`memory mapping <mmap>` I/O and the
>  	queue reports the :ref:`V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS
>  	<V4L2-BUF-CAP-SUPPORTS-MMAP-CACHE-HINTS>` capability.
> +    * .. _`V4L2-MEMORY-FLAG-SECURE`:
> +
> +      - ``V4L2_MEMORY_FLAG_SECURE``
> +      - 0x00000002
> +      - DMA bufs passed into the queue will be validated to ensure they were
> +	allocated from a secure dma-heap.

Hmm, that needs a bit more work. How about:

- The queued buffers are expected to be in secure memory. If not, an error will be
  returned. This flag can only be used with ``V4L2_MEMORY_DMABUF``. Typically
  secure buffers are allocated using a secure dma-heap. This flag can only be
  specified if the ``V4L2_BUF_CAP_SUPPORTS_SECURE_MEM`` is set.

In addition, the title of this table is currently "Memory Consistency Flags": that
should be renamed to "Memory Flags".

Regards,

	Hans

>  
>  .. raw:: latex
>  

