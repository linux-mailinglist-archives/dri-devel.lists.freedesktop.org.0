Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C05DCABA342
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 20:56:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9334A10EB78;
	Fri, 16 May 2025 18:56:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=robert.mader@collabora.com header.b="AXqN0Xs2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 913 seconds by postgrey-1.36 at gabe;
 Fri, 16 May 2025 18:56:54 UTC
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4511E10EB78
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 18:56:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1747420889; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=JY1f5GE4QP+FuXgsDkw1w3o3zeKrgxp6t2xKYX2XKLigLeczD0av/dcVMdGf6e4+8Eoup0UknPj81mugg0bNhAL9e5yyKTi+d90pGBkHcjIwWMVH4rRsf+a0k3/GEFUZfl+xENxPZhvHZAn9qy65oY1tz7e3lOgJpxDL/EpDF/8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1747420889;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=cqPNsZUjm1ZC2/Fwq/KF81g0JmHJsZHmNPAM/GCiQuo=; 
 b=H8EDDJRFY/wXkCJYIxsvoSG9RtKdhKCUF79v7ZtJcVNMIE1WeJdhzWFGkCNpK8ZfqWwMm6gAJUVeQ5jvX3F1x3WhP6GJWkEZ7U/PTz3NKrjZOGSEQ+pO6rAc6w2FQJ29qqvgalJfwSjSTx5+o9uvJCrpOMHOJBMzIuuZuIdXF+w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=robert.mader@collabora.com;
 dmarc=pass header.from=<robert.mader@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747420889; 
 s=zohomail; d=collabora.com; i=robert.mader@collabora.com;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=cqPNsZUjm1ZC2/Fwq/KF81g0JmHJsZHmNPAM/GCiQuo=;
 b=AXqN0Xs2Nd3sLj55EbPtGVkro/5jdUWPtkom3bUE+7vRmZc5R/cQi9bSny2lP+Wd
 Z6l4Zh5ki0ViRRkuuMMrdikMGCIrFFHT9r7XLjuBmOoF8mydPphW7LTSPNTzx58BuTc
 CjZAFhReeV1A74STSwGtAwNbct4Ip1be+T1k2ClI=
Received: by mx.zohomail.com with SMTPS id 1747420886588742.9615996949072;
 Fri, 16 May 2025 11:41:26 -0700 (PDT)
Message-ID: <77819ace-c9af-42bf-ba0f-a0c01089c24d@collabora.com>
Date: Fri, 16 May 2025 20:41:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm: drm_fourcc: add 10/12/16bit software decoder
 YCbCr formats
To: Dave Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Daniel Stone <daniel@fooishbar.org>
References: <20250509133535.60330-1-robert.mader@collabora.com>
 <CAPj87rONHCNJQ_aaWtA32uLZO1hxGMdb0cty8E-GvnyxpsoarA@mail.gmail.com>
Content-Language: en-US, de-DE, en-GB
From: Robert Mader <robert.mader@collabora.com>
In-Reply-To: <CAPj87rONHCNJQ_aaWtA32uLZO1hxGMdb0cty8E-GvnyxpsoarA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Dave,

sorry for the noise, I just wanted to quickly ask if with Daniels R-b 
below this patch is good to go into 6.16 once the window opens? Still 
new to the process here, therefore want to double-check :)

Thanks and best regards,

Robert Mader

On 12.05.25 16:26, Daniel Stone wrote:
> Hi Rob,
>
> On Fri, 9 May 2025 at 14:36, Robert Mader <robert.mader@collabora.com> wrote:
>> This adds FOURCCs for 3-plane 10/12/16bit YCbCr formats used by software
>> decoders like ffmpeg, dav1d and libvpx. The intended use-case is buffer
>> sharing between decoders and GPUs by allocating buffers with e.g. udmabuf
>> or dma-heaps, avoiding unnecessary copies and format conversions in
>> various scenarios.
>>
>> Unlike formats typically used by hardware decoders the 10/12bit formats
>> use a LSB alignment. In order to allow fast implementations in GL
>> and Vulkan the padding must contain only zeros, so the float
>> representation can be calculated by multiplying with 2^6=64 or 2^4=16
>> respectively.
>>
>> MRs or branches for Mesa, Vulkan, Gstreamer, Weston and Mutter can be found at:
>>   - https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/34303
>>   - https://github.com/rmader/Vulkan-Docs/commits/ycbcr-16bit-lsb-formats/
>>   - https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8540
>>   - https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/1753
>>   - https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/4348
>>
>> The naming scheme follows the 'P' and 'Q' formats. The 'S' stands for
>> 'software' and was selected in order to make remembering easy.
>>
>> The 'Sx16' formats could as well be 'Qx16'. We stick with 'S' as 16bit software
>> decoders are likely much more common than hardware ones for the foreseeable
>> future. Note that these formats already have Vulkan equivalents:
>>   - VK_FORMAT_G16_B16_R16_3PLANE_420_UNORM
>>   - VK_FORMAT_G16_B16_R16_3PLANE_422_UNORM
>>   - VK_FORMAT_G16_B16_R16_3PLANE_444_UNORM
> Thanks a lot for these - series is:
> Reviewed-by: Daniel Stone <daniels@collabora.com>
>
> Cheers,
> Daniel
