Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E053FB218
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 09:54:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E759D89C46;
	Mon, 30 Aug 2021 07:54:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C63CB89C46;
 Mon, 30 Aug 2021 07:53:59 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10091"; a="303805437"
X-IronPort-AV: E=Sophos;i="5.84,362,1620716400"; d="scan'208";a="303805437"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2021 00:53:58 -0700
X-IronPort-AV: E=Sophos;i="5.84,362,1620716400"; d="scan'208";a="509474316"
Received: from ahashmi-mobl.ger.corp.intel.com (HELO [10.249.254.89])
 ([10.249.254.89])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2021 00:53:56 -0700
Subject: Re: [Intel-gfx] [PATCH v10 03/11] drm/ttm: Add a generic TTM memcpy
 move for page-based iomem
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Dave Airlie <airlied@gmail.com>, Ben Skeggs <skeggsb@gmail.com>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <20210602083818.241793-1-thomas.hellstrom@linux.intel.com>
 <20210602083818.241793-4-thomas.hellstrom@linux.intel.com>
 <CAPM=9twjYTME6CPuNmn3S7A_ACUNhMOAY1QcpoOqAZ5RHM6JzA@mail.gmail.com>
 <1c8ee7b0-97ef-0c04-8e92-ec6bdc56bd40@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <b87231ff-ced5-a9ca-af22-d6e84e9f7263@linux.intel.com>
Date: Mon, 30 Aug 2021 09:53:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1c8ee7b0-97ef-0c04-8e92-ec6bdc56bd40@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi!

On 8/30/21 8:16 AM, Christian König wrote:
> Am 30.08.21 um 03:54 schrieb Dave Airlie:
>> I've just been talking with Ben about nouveau having some issues since
>> this path,
>>
>> ttm_resource can be subclassed by drivers, and the code below that
>> copies ttm_resources around pretty much seems to destroy that.
>>
>>
>>> +       struct ttm_resource *src_mem = &bo->mem;
>>> +       struct ttm_resource_manager *src_man =
>>> +               ttm_manager_type(bdev, src_mem->mem_type);
>>> +       struct ttm_resource src_copy = *src_mem;
>> This here ^^
>
> Mhm, that's most likely a rebase/merge conflict between my change to 
> subclass ttm_resource which came in through the drm-misc-next tree and 
> Thomas change here.
>
> Thomas can you take a look?
>
> Thanks,
> Christian.
>
Posted a patch.

Ben, it would be great if you could help give it a try to verify that it 
works. I'll give it a try on vmwgfx later today if I can get it running. 
Looks like VMware mesa is broken on Fedora..

/Thomas


