Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A8837A871
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 16:06:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CE9D6E461;
	Tue, 11 May 2021 14:06:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98C406EA47;
 Tue, 11 May 2021 14:06:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 740BA3F91F;
 Tue, 11 May 2021 16:06:26 +0200 (CEST)
Authentication-Results: pio-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="eWXuaS+X";
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n-93ihpsMnC1; Tue, 11 May 2021 16:06:21 +0200 (CEST)
Received: by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id BCF803F6B9;
 Tue, 11 May 2021 16:06:20 +0200 (CEST)
Received: from [192.168.0.209] (unknown [192.55.54.44])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 8503E360132;
 Tue, 11 May 2021 16:06:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1620741980; bh=7QkXcRCSZzcRG1O42g9xEHuy937rbA7zv1HOyuS7KVY=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=eWXuaS+XSGb3KMM6l0CuFaLQwZZky0LyAxBbG2LbL74yYDtw2PvkdRgLXP6bsMDb5
 lj+5CHQX2R6d4jbZS0ZaNLwlhf4D5gndl/H6/hsmze4CTMBkDhNXN5CB+G0KfwlWz/
 C/87IMO2lqO1Eu3BHjj7dgoTs2kOVq2ZYQU67SVw=
Subject: Re: [PATCH 6/7] drm/i915/ttm, drm/ttm: Introduce a TTM i915 gem
 object backend
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210511132525.377190-1-thomas.hellstrom@linux.intel.com>
 <20210511132525.377190-7-thomas.hellstrom@linux.intel.com>
 <8ac6bc5c-17c0-2ffd-7f8c-823ab3c8a858@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <88ea8e22-3314-60a4-8f4b-0b37de444b1d@shipmail.org>
Date: Tue, 11 May 2021 16:06:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <8ac6bc5c-17c0-2ffd-7f8c-823ab3c8a858@amd.com>
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


On 5/11/21 3:58 PM, Christian König wrote:
> Am 11.05.21 um 15:25 schrieb Thomas Hellström:
>> Most logical place to introduce TTM buffer objects is as an i915
>> gem object backend. We need to add some ops to account for added
>> functionality like delayed delete and LRU list manipulation.
>>
>> Initially we support only LMEM and SYSTEM memory, but SYSTEM
>> (which in this case means evicted LMEM objects) is not
>> visible to i915 GEM yet. The plan is to move the i915 gem system region
>> over to the TTM system memory type in upcoming patches.
>>
>> We set up GPU bindings directly both from LMEM and from the system 
>> region,
>> as there is no need to use the legacy TTM_TT memory type. We reserve
>> that for future porting of GGTT bindings to TTM.
>>
>> There are some changes to TTM to allow for purging system memory buffer
>> objects and to refuse swapping of some objects: Unfortunately i915 gem
>> still relies heavily on short-term object pinning, and we've chosen to
>> keep short-term-pinned buffer objects on the TTM LRU lists for now,
>> meaning that we need some sort of mechanism to tell TTM they are not
>> swappable. A longer term goal is to get rid of the short-term pinning.
>
> Well just use the eviction_valuable interface for this.

Yes, we do that for vram/lmem eviction, but we have nothing similar for 
system swapping. Do I understand you correctly that you want me to add a 
call to eviction_valuable() also for that instead of swap_possible()?


>
> In general please make separate patches for the TTM changes and for 
> the i915 changes using them for easier review.

I'll respin with a split. Do you want me to do the same also for the 
other two patches that minmally touch TTM?

Thanks,

Thomas


