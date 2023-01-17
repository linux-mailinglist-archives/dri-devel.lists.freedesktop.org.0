Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0F566D3C0
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 02:06:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92C0D10E175;
	Tue, 17 Jan 2023 01:06:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4521210E175;
 Tue, 17 Jan 2023 01:06:10 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id x40so10875254lfu.12;
 Mon, 16 Jan 2023 17:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QG8UDQ2WrMQgZescVvBrW8cuKeOj0CmtJzCcHxbv3ao=;
 b=iNfhUD+RCn177AAdUkdqf0ciYYeqbq0MoXU+KqrOJkNNYw8eJt+AuBMkH2DenNs+Oh
 5A6Z80BpW0xdmpSjXVww5dqAcB8x/UoZx5LbttwQTve0YMRya1KTU/b7uca9po89b88d
 muYEAJWY5cByWnzeiBZn2bZazXUii6dOGr14vbZ8448MN4FXBNkB5ua2Na57Pynl7vM6
 Oss05vXlEbJ9KhPVdnGK6ZIACqTuIcjQUY0IiFguMa/4ckV0g0XCbjJalqc7U5FvJczT
 fIV74udFIavRSQm6Es49x0WE9ej+2VntNR/+Qb45Ab1Si8RfhCYQC2fBLhUV3O6RVEn9
 WBSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QG8UDQ2WrMQgZescVvBrW8cuKeOj0CmtJzCcHxbv3ao=;
 b=PoT2d4HLmMk6Wy+cnwayFhI4QieurwfVCpTQfS4gfNPsD+iLLFRLnWZuW1NgpjbW6K
 g18sCmqPnjNLN+xDcYxdeWpdt9k/N+1dlrtREHOsxVRiRTGY8yfXXei8JSV0w5GoSk7J
 QrNXM6jUaWtvrNEr2uAtP2tCe63xTaYQaNbMYE4QbcWQNrRp1YFOsIP4tY+vRWcw2OOQ
 WNmvWI3CQGmJGCceWc2PCmy1eOQHVg0gJ82CtFphtvsVIdzAsGNgYAdkj70T7hBaJGto
 HTb46eRdgGIYRVH0fv0+0WSPaekJlyEOWG3IbH97UshNzGi5iQlPVcTygs/KAF1NsHwa
 od+g==
X-Gm-Message-State: AFqh2ko/Wj5bO2+hEhViodyCOy2gcRHMimxX1j9rr+xLep5NIGprLcG/
 K8CpGyP9cesavKzTKWhLJLE=
X-Google-Smtp-Source: AMrXdXtMdnaqnw/LDdL4Wg2CVRHLhK0QBUtZwELle8NevBh4H1AgD3YFUTrUE0glWoJC/IawKlw+rw==
X-Received: by 2002:a05:6512:3e1b:b0:4cc:5610:c1f7 with SMTP id
 i27-20020a0565123e1b00b004cc5610c1f7mr340631lfv.30.1673917568418; 
 Mon, 16 Jan 2023 17:06:08 -0800 (PST)
Received: from [192.168.2.145] (109-252-117-89.nat.spd-mgts.ru.
 [109.252.117.89]) by smtp.googlemail.com with ESMTPSA id
 v9-20020a056512048900b004cb43eb09dfsm5242005lfq.123.2023.01.16.17.06.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 17:06:07 -0800 (PST)
Message-ID: <9eb1a440-159f-1eb4-d4a7-93cc6beb1682@gmail.com>
Date: Tue, 17 Jan 2023 04:06:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/6] drm/amdgpu: Generalize KFD dmabuf import
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Felix Kuehling <felix.kuehling@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Chen, Xiaogang" <xiaogang.chen@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Clark <robdclark@gmail.com>
References: <20230112013157.750568-1-Felix.Kuehling@amd.com>
 <20230112013157.750568-2-Felix.Kuehling@amd.com>
 <cab37a40-9737-1b77-3a3f-87965d4c70b2@amd.com>
 <9b5b20e0-e04b-f7f6-9459-42d5a4bb44c7@amd.com>
 <1437874c-4b4b-191f-4486-de6ac69e99cc@amd.com>
 <19873c87-5d01-30dd-84d2-ced61b236fa0@amd.com>
 <27d2a3eb-541f-fd5b-6a92-77e49c74d1b4@gmail.com>
 <e55cc02a-3180-20b9-8255-f95f5910e7fe@amd.com>
 <bac027e4-0e91-8341-3baa-74520c60c808@amd.com>
 <b5101ba0-aa12-b3f1-10c0-368dc50ae4ac@amd.com>
 <8e121589-9e53-9237-6fa3-2a78ecc2dd8a@gmail.com>
Content-Language: en-US
From: Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <8e121589-9e53-9237-6fa3-2a78ecc2dd8a@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

16.01.2023 18:11, Christian König пишет:
> 
>>>>>
>>>>>> mmapping the memory with that new offset should still work. The
>>>>>> imported BO is created with ttm_bo_type_sg, and AFAICT ttm_bo_vm.c
>>>>>> supports mapping of SG BOs.
>>>>>
>>>>> Actually it shouldn't. This can go boom really easily.
>>>>
>>>> OK. I don't think we're doing this, but after Xiaogang raised the
>>>> question I went looking through the code whether it's theoretically
>>>> possible. I didn't find anything in the code that says that mmapping
>>>> imported dmabufs would be prohibited or even dangerous. On the
>>>> contrary, I found that ttm_bo_vm explicitly supports mmapping SG BOs.
>>>>
>>>>
>>>>>
>>>>> When you have imported a BO the only correct way of to mmap() it is
>>>>> to do so on the original exporter.
>>>>
>>>> That seems sensible, and this is what we do today. That said, if
>>>> mmapping an imported BO is dangerous, I'm missing a mechanism to
>>>> protect against this. It could be as simple as setting
>>>> AMDGPU_GEM_CREATE_NO_CPU_ACCESS in amdgpu_dma_buf_create_obj.
>>>
>>> At least for the GEM mmap() handler this is double checked very early
>>> by looking at obj->import_attach and then either rejecting it or
>>> redirecting the request to the DMA-buf file instead.
>>
>> Can you point me at where this check is? I see a check for
>> obj->import_attach in drm_gem_dumb_map_offset. But I can't see how
>> this function is called in amdgpu. I don't think it is used at all.
> 
> Uff, good question! @Thomas and @Dmitry: I clearly remember that one of
> you guys was involved in the DRM/GEM mmap cleanup and DMA-buf with
> workarounds for the KFD and DMA-buf.
> 
> What was the final solution to this? I can't find it of hand any more.

I was looking at it. The AMDGPU indeed allows to map imported GEMs, but
then touching the mapped area by CPU results in a bus fault. You,
Christian, suggested that this an AMDGPU bug that should be fixed by
prohibiting the mapping in the first place and I was going to fix it,
but then the plan changed from prohibiting the mapping into fixing it.

The first proposal was to make DRM core to handle the dma-buf mappings
for all drivers universally [1]. Then we decided that will be better to
prohibit mapping of imported GEMs [2]. In the end, Rob Clark argued that
better to implement the [1], otherwise current userspace (Android) will
be broken if mapping will be prohibited.

The last question was about the cache syncing of imported dma-bufs, how
to ensure that drivers will do the cache maintenance/syncing properly.
Rob suggested that it should be a problem for drivers and not for DRM core.

I was going to re-send the [1], but other things were getting priority.
It's good that you reminded me about it :) I may re-send it sometime
soon if there are no new objections.

[1] https://patchwork.freedesktop.org/patch/487481/

[2]
https://lore.kernel.org/all/20220701090240.1896131-1-dmitry.osipenko@collabora.com/

