Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EED47E1E7D
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 11:37:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 881B410E2BE;
	Mon,  6 Nov 2023 10:37:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6BFD10E2BE;
 Mon,  6 Nov 2023 10:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699267061; x=1730803061;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=0tfa04gZc/SX4ql4d+BE5U2d1+77F0r/oItHzWq3hBc=;
 b=eQx7ZwoJxxA8SrxFFqKih4I5hIggrp/OGme6QpzooGXXvi9fyyx9b7IW
 D0GDqStUOSuo9uYy5WcMsiVZKIYAqPFG+lWn9dZqUxI5+RsR5/qtAk+jJ
 Q/Jk1leE9B3neWosqPAcup4yfiG5UDXvsyPNN8aSbHSw/UVuyBdeXHJsm
 bBZcRMaSsFO1YToQwMuuiNU5wfEwIQZv4DOK5h9IT4/D8UJz2Fm4y5iup
 +es4rwIf8tOgG8W/a4Y1Z0I5vrfGcYR9jhW2AwvU8PrmMZP74QuU8Ke1a
 TZYKhCBQoY9BZGPaXBmX9oXa+3iNKaIqP+B1zqpUBU1cIt+9vEehb4fW7 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="2237892"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="2237892"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 02:37:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="879393697"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="879393697"
Received: from lapeders-mobl1.ger.corp.intel.com (HELO [10.249.254.193])
 ([10.249.254.193])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 02:37:37 -0800
Message-ID: <bd34dffe-86ba-bf1a-b12f-33611da0a7ca@linux.intel.com>
Date: Mon, 6 Nov 2023 11:37:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PULL] drm-misc-next
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>
References: <CAGWvnynOWoKT1EWkL8ELfRVxSUjm-hBQnnjb-w2Gq-tmOFm0Hg@mail.gmail.com>
 <1807db8f-2ba6-0838-1d4c-39ff4cb7a34d@linux.intel.com>
 <uqzfduftpqlq35pdndovsqtmksjpxr5ei2utz45lwjhnsgchxh@grbzyctiig7w>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <uqzfduftpqlq35pdndovsqtmksjpxr5ei2utz45lwjhnsgchxh@grbzyctiig7w>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Edelsohn <dje.gcc@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 11/6/23 11:20, Maxime Ripard wrote:
> On Mon, Nov 06, 2023 at 11:01:51AM +0100, Thomas Hellström wrote:
>> Hi, David.
>>
>> On 11/3/23 17:37, David Edelsohn wrote:
>>> Dual-license drm_gpuvm to GPL-2.0 OR MIT.
>>> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
>>> index 02ce6baacdad..08c088319652 100644 ---
>>> a/drivers/gpu/drm/drm_gpuvm.c <https://cgit.freedesktop.org/drm/drm-misc/tree/drivers/gpu/drm/drm_gpuvm.c?id=6f2eeef4a0aa9791bbba9d353641a6e067bb86c1>
>>> +++ b/drivers/gpu/drm/drm_gpuvm.c <https://cgit.freedesktop.org/drm/drm-misc/tree/drivers/gpu/drm/drm_gpuvm.c?id=f7749a549b4f4db0c02e6b3d3800ea400dd76c12>
>>> @@ -1,4 +1,4 @@
>>> -// SPDX-License-Identifier: GPL-2.0-only
>>> +// SPDX-License-Identifier: GPL-2.0 OR MIT
>>> /*
>>> * Copyright (c) 2022 Red Hat.
>>> *
>>> The above SPDX License Identifier change is incorrect and no longer
>>> valid. The change misunderstood the syntax of SPDX license identifiers
>>> and boolean operations. GPL-2.0-only is the name of the license and means
>>> GPL 2.0 only, as opposed to GPL 2.0 or later. The "only" does not
>>> refer to restrictions on other licenses in the identifier and should not
>>> have been
>>> removed. The hyphens designated that the name was a single unit.
>>> The SPDX License Identifier boolean operators, such as OR, are a
>>> separate layer
>>> of syntax.
>>> The SPDX License Identifier should be
>>> GPL-2.0-only OR MIT
>>> Thanks, David
>> The author has acked the change / relicensing, which is also described in
>> the commit title so could you please elaborate why you think it is not
>> valid?
> I think their point isn't so much about the license itself but rather
> the SPDX syntax to express it.
>
> Maxime

Hm. There are a pretty large number of these in drm with the same syntax:

SPDX-License-Identifier: GPL-2.0 OR MIT

So I read it as whe shouldn't have change "Licence A" to "Licence B OR C" but instead should have changed it to "Licence A OR C", hence the *change* (rather than the syntax) would no longer be valid.

Perhaps I have had too little coffee this morning.

I'd appreciate if David could clarify.

Thanks,
Thomas







