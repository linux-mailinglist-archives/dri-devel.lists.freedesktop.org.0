Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7D546D45C
	for <lists+dri-devel@lfdr.de>; Wed,  8 Dec 2021 14:22:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD56A73240;
	Wed,  8 Dec 2021 13:22:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C2A373240;
 Wed,  8 Dec 2021 13:22:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 162D53F3A3;
 Wed,  8 Dec 2021 14:22:40 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -3.11
X-Spam-Level: 
X-Spam-Status: No, score=-3.11 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.011,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Authentication-Results: ste-pvt-msa1.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ilFe7hA0g4q1; Wed,  8 Dec 2021 14:22:38 +0100 (CET)
Received: by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 872753F5E5;
 Wed,  8 Dec 2021 14:22:37 +0100 (CET)
Received: from [192.168.0.209] (h-155-4-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id D35DA362AD5;
 Wed,  8 Dec 2021 14:22:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1638969757; bh=83ZAAgaH88A6QEj8o5cZrMVgCb+3qUoCfPtt50QXJfc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Q1/j119rFJ0fLPzOIYGbIEkQR2VQXFvX5Zi1vwrphwaGeesmCuAbGxh30f8WwhwPo
 sWK+15s1KuscYhFvmcAj8snjjutqGC7yM+C+t5T9EB+aEKIP7FzUjxvXXs2hwscSsm
 plQg80EtxyKVtlPf2hBIbUOOzH6kW3pvKI2GJq/g=
Message-ID: <c65ed40f-b65b-7cd2-ffc3-03bbfc9b538b@shipmail.org>
Date: Wed, 8 Dec 2021 14:22:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [Intel-gfx] [PATCH 1/4] drm/i915: Add has_64k_pages flag
Content-Language: en-US
To: Matthew Auld <matthew.william.auld@gmail.com>
References: <20211207165156.31244-1-ramalingam.c@intel.com>
 <20211207165156.31244-2-ramalingam.c@intel.com>
 <801b9d8b-1b5c-ce2f-dc05-e804cafc3683@shipmail.org>
 <CAM0jSHMdk7R0e6uU7PU6Xn3Z_kX8X8O86_+DNxEz5FuB9acMew@mail.gmail.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
In-Reply-To: <CAM0jSHMdk7R0e6uU7PU6Xn3Z_kX8X8O86_+DNxEz5FuB9acMew@mail.gmail.com>
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
Cc: Andi <andi.shyti@intel.com>, intel-gfx <intel-gfx@lists.freedesktop.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Chris_intel_ID <chris.p.wilson@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 12/8/21 13:59, Matthew Auld wrote:
> On Wed, 8 Dec 2021 at 12:43, Thomas Hellström (Intel)
> <thomas_os@shipmail.org> wrote:
>> Hi,
>>
>> On 12/7/21 17:51, Ramalingam C wrote:
>>> From: Stuart Summers <stuart.summers@intel.com>
>>>
>>> Add a new platform flag, has_64k_pages, for platforms supporting
>>> base page sizes of 64k.
>>>
>>> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
>>> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
>>> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>> ---
>>>    drivers/gpu/drm/i915/i915_drv.h          | 2 ++
>>>    drivers/gpu/drm/i915/i915_pci.c          | 2 ++
>>>    drivers/gpu/drm/i915/intel_device_info.h | 1 +
>>>    3 files changed, 5 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
>>> index 85bb8d3107f0..6132163e1cb3 100644
>>> --- a/drivers/gpu/drm/i915/i915_drv.h
>>> +++ b/drivers/gpu/drm/i915/i915_drv.h
>>> @@ -1528,6 +1528,8 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
>>>    #define HAS_MSLICES(dev_priv) \
>>>        (INTEL_INFO(dev_priv)->has_mslices)
>>>
>>> +#define HAS_64K_PAGES(dev_priv) (INTEL_INFO(dev_priv)->has_64k_pages)
>>> +
>> Could we please have some documentation of the exact meaning of this flag.
>> Like, smallest page size of LMEM is 64K. Hardware supports 64k pages etc?
> Something like: "Set if the device requires 64K GTT page sizes or
> larger for device local memory access. Also implies that we require or
> at least support the compact PT layout for the ppGTT when using 64K
> GTT pages."

Sounds great.

Thanks,

Thomas


