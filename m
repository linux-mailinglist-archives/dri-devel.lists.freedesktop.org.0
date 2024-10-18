Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9241A9A445B
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 19:12:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB78E10E37D;
	Fri, 18 Oct 2024 17:12:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="NzJ8842E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D510210E37D
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 17:12:42 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4XVWVH20Dwz9sq0;
 Fri, 18 Oct 2024 19:12:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1729271559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9jne115Clr4yfy/072w45r4CRfflvhl9tB4L5pOQo5A=;
 b=NzJ8842EQAffS5iXshNM4azIeQSykvk1ylNgDdDlxwbu7r5qCa+Fjdc6ZIZPmVSjFh6pBD
 LIclpL4usUpomV5DlLA4jAlv1OUGgSliU4o8jorz5vD+xzM4EMxZdUGxlFgy0P5ApCCvr0
 f67inWHk5jOtWFA1/dM9JAhK4vbn0/a0vheiuIcKghBvWy0phirqc552wvys2PhIzAmvAT
 0VATSqSkKpCd3hvwHUJ2dxI9WR73j3sgNOMDbXvD5gbt40JBtCreKYrQYrwkxhE5pRDEaw
 DWsreP1j0dmZVpF2yGDBN9lGv/PSz2vz1YOR0rBpsqbd1d2/+tKpd915AGen/w==
Message-ID: <478dfd0d-e280-43f6-8b9e-19b58efd0349@mailbox.org>
Date: Fri, 18 Oct 2024 19:12:36 +0200
MIME-Version: 1.0
Subject: Re: [RFC PATCH] drm/prime: introduce DRM_PRIME_FD_TO_HANDLE_NO_MOVE
To: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Victoria Brekenfeld <victoria@system76.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 Austin Shafer <ashafer@nvidia.com>
References: <20241013133431.1356874-1-contact@emersion.fr>
 <a55560b2-288f-48a5-ba79-8074e61f13fc@mailbox.org>
 <25vi9vBXOv96OiTmn95BrTK8uiAOG8FKCm-21ityj0t6SvTT0iiHqr42Xk-chIYeWOE-Pfne5ae9oadGN1QBXB1Z5vaaHcxmhdD588Rtpww=@emersion.fr>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: de-CH-frami, en-CA
In-Reply-To: <25vi9vBXOv96OiTmn95BrTK8uiAOG8FKCm-21ityj0t6SvTT0iiHqr42Xk-chIYeWOE-Pfne5ae9oadGN1QBXB1Z5vaaHcxmhdD588Rtpww=@emersion.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: qgb5s7pg11o4wcm1wwef4oq1grugnm7w
X-MBO-RS-ID: 0ccb98631e00c2738a4
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

On 2024-10-15 13:01, Simon Ser wrote:
> On Tuesday, October 15th, 2024 at 12:47, Michel Dänzer <michel.daenzer@mailbox.org> wrote:
> 
>> On 2024-10-13 15:34, Simon Ser wrote:
>>
>>> This is a flag to opt-out of the automagic buffer migration to
>>> system memory when importing a DMA-BUF.
>>>
>>> In multi-GPU scenarii, a Wayland client might allocate on any
>>> device. The Wayland compositor receiving the DMA-BUF has no clue
>>> where the buffer has been allocated from. The compositor will
>>> typically try to import the buffer into its "primary" device,
>>> although it would be capable of importing into any DRM device.
>>>
>>> This causes issues in case buffer imports implicitly result in
>>> the buffer being moved to system memory. For instance, on a
>>> system with an Intel iGPU and an AMD dGPU, a client rendering
>>> with the dGPU and whose window is displayed on a screen
>>> connected to the dGPU would ideally not need any roundtrip
>>> to the iGPU. However, any attempt at figuring out where the
>>> DMA-BUF could be accessed from will move the buffer into system
>>> memory, degrading performance for the rest of the lifetime of the
>>> buffer.
>>>
>>> Describing on which device the buffer has been allocated on is
>>> not enough: on some setups the buffer may have been allocated on
>>> one device but may still be directly accessible without any move
>>> on another device. For instance, on a split render/display system,
>>> a buffer allocated on the display device can be directly rendered
>>> to from the render device.
>>>
>>> With this new flag, a compositor can try to import on all DRM
>>> devices without any side effects. If it finds a device which can
>>> access the buffer without a move, it can use that device to render
>>> the buffer. If it doesn't, it can fallback to the previous
>>> behavior: try to import without the flag to the "primary" device,
>>> knowing this could result in a move to system memory.
>>
>> One problem with this approach is that even if a buffer is originally created in / intended for local VRAM of a dGPU, it may get temporarily migrated to system RAM for other reasons, e.g. to make room for other buffers in VRAM. While it resides in system RAM, importing into another device with DRM_PRIME_FD_TO_HANDLE_NO_MOVE will work, but will result in pinning the buffer to system RAM, even though this isn't optimal for the intended buffer usage.
> 
> Indeed. Do you think we could have a flag which also prevents pinning?
> 
> Sounds like that would involve implementing dynamic DMA-BUF importers in
> GEM? (Some drivers like xe already implement that.)

As discussed on IRC, that won't always help for the case I described. The exporting GPU will want to migrate the BO to its VRAM for drawing to it, the importing device might only be able to access it in system RAM though. The result would be migration ping-pong of the BO between VRAM and system RAM.


Taking a step back, I suspect something like "importing device can access while exporting device has optimal access" might be more useful than "can import without moving". Though that would still leave unknown if the importing device's access is optimal or not.


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
