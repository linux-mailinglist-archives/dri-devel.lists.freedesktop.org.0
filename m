Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D59D3B5CE1
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 13:01:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1460B6E424;
	Mon, 28 Jun 2021 11:01:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8C206E424;
 Mon, 28 Jun 2021 11:01:04 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10028"; a="206105459"
X-IronPort-AV: E=Sophos;i="5.83,305,1616482800"; d="scan'208";a="206105459"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2021 04:01:04 -0700
X-IronPort-AV: E=Sophos;i="5.83,305,1616482800"; d="scan'208";a="454465495"
Received: from danielmi-mobl2.ger.corp.intel.com (HELO [10.249.254.242])
 ([10.249.254.242])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2021 04:01:02 -0700
Subject: Re: [PATCH v3] drm/i915: Reinstate the mmap ioctl for some platforms
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20210628092106.55270-1-thomas.hellstrom@linux.intel.com>
 <15bf15c2-3a0c-00b2-e1bc-7b329964e60b@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <f9cd5da7-ffa5-a9ee-c0b9-d826b0c81cc4@linux.intel.com>
Date: Mon, 28 Jun 2021 13:01:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <15bf15c2-3a0c-00b2-e1bc-7b329964e60b@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/28/21 12:59 PM, Matthew Auld wrote:
> On 28/06/2021 10:21, Thomas Hellström wrote:
>> Reinstate the mmap ioctl for all current integrated platforms.
>> The intention was really to have it disabled for discrete graphics
>> where we enforce a single mmap mode.
>>
>> This fixes media on rkl/adl.
>>
>> v2:
>> - Added a R-B.
>> - Fixed up the code comment a bit.
>> v3:
>> - Added an A-B.
>> - Point out in the commit message that there was an issue with media on
>>    rkl/adl.
>>
>> Fixes: 35cbd91eb541 ("drm/i915: Disable mmap ioctl for gen12+")
>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>
> I already pushed v2 of this last week with the following amended:
>
> "This was reported to break ADL-P with the media stack, which was not 
> the intention. Although longer term we do still plan to sunset this 
> ioctl even for integrated, in favour of using mmap_offset instead."
>
Ah, OK.

Thanks.

Thomas


