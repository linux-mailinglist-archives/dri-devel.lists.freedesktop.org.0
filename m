Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2E5826985
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 09:29:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 467F910E19B;
	Mon,  8 Jan 2024 08:29:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB3D210E19B
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 08:29:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 45B0FB80C76;
 Mon,  8 Jan 2024 08:29:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A28AFC433C7;
 Mon,  8 Jan 2024 08:29:45 +0000 (UTC)
Message-ID: <545138cc-2cc1-4da0-9b26-7ebe4241c8df@xs4all.nl>
Date: Mon, 8 Jan 2024 09:29:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3,04/21] v4l: add documentation for secure memory flag
To: Jeffrey Kardatzke <jkardatzke@google.com>
References: <20231206081538.17056-1-yunfei.dong@mediatek.com>
 <20231206081538.17056-5-yunfei.dong@mediatek.com>
 <ce2110bf-a16a-45ae-979b-7e41be2896cd@xs4all.nl>
 <CA+ddPcM6nz0ufF5NXUq7E_vF6HnFKrEEag5iUDAknT6=hWTCNQ@mail.gmail.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <CA+ddPcM6nz0ufF5NXUq7E_vF6HnFKrEEag5iUDAknT6=hWTCNQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Steve Cho <stevecho@chromium.org>, Yunfei Dong <yunfei.dong@mediatek.com>,
 dri-devel@lists.freedesktop.org, John Stultz <jstultz@google.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>, devicetree@vger.kernel.org,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 linaro-mm-sig@lists.linaro.org, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "T . J . Mercier" <tjmercier@google.com>, Yong Wu <yong.wu@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel@vger.kernel.org,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Nathan Hebert <nhebert@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/01/2024 21:05, Jeffrey Kardatzke wrote:
> On Mon, Dec 11, 2023 at 3:05 AM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>
>> On 06/12/2023 09:15, Yunfei Dong wrote:
>>> From: Jeffrey Kardatzke <jkardatzke@google.com>
>>>
>>> Adds documentation for V4L2_MEMORY_FLAG_SECURE.
>>>
>>> Signed-off-by: Jeffrey Kardatzke <jkardatzke@google.com>
>>> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
>>> ---
>>>  Documentation/userspace-api/media/v4l/buffer.rst | 8 +++++++-
>>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/userspace-api/media/v4l/buffer.rst b/Documentation/userspace-api/media/v4l/buffer.rst
>>> index 52bbee81c080..a5a7d1c72d53 100644
>>> --- a/Documentation/userspace-api/media/v4l/buffer.rst
>>> +++ b/Documentation/userspace-api/media/v4l/buffer.rst
>>> @@ -696,7 +696,7 @@ enum v4l2_memory
>>>
>>>  .. _memory-flags:
>>>
>>> -Memory Consistency Flags
>>> +Memory Flags
>>>  ------------------------
>>>
>>>  .. raw:: latex
>>> @@ -728,6 +728,12 @@ Memory Consistency Flags
>>>       only if the buffer is used for :ref:`memory mapping <mmap>` I/O and the
>>>       queue reports the :ref:`V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS
>>>       <V4L2-BUF-CAP-SUPPORTS-MMAP-CACHE-HINTS>` capability.
>>> +    * .. _`V4L2-MEMORY-FLAG-SECURE`:
>>> +
>>> +      - ``V4L2_MEMORY_FLAG_SECURE``
>>> +      - 0x00000002
>>> +      - DMA bufs passed into the queue will be validated to ensure they were
>>> +     allocated from a secure dma-heap.
>>
>> Hmm, that needs a bit more work. How about:
>>
>> - The queued buffers are expected to be in secure memory. If not, an error will be
>>   returned. This flag can only be used with ``V4L2_MEMORY_DMABUF``. Typically
>>   secure buffers are allocated using a secure dma-heap. This flag can only be
>>   specified if the ``V4L2_BUF_CAP_SUPPORTS_SECURE_MEM`` is set.
>>
> 
> Thanks Hans. Yunfei, can you integrate this change into the patch please?
> 
>> In addition, the title of this table is currently "Memory Consistency Flags": that
>> should be renamed to "Memory Flags".
> 
> Hans, the patch is already renaming the table as you suggested. :)
> (unless there's some other spot I'm missing)

Sorry for the noise, I missed that change.

Regards,

	Hans

>>
>> Regards,
>>
>>         Hans
>>
>>>
>>>  .. raw:: latex
>>>
>>

