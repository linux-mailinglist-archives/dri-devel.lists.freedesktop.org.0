Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E5270F6EF
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 14:52:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2BF910E090;
	Wed, 24 May 2023 12:52:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EAA610E090;
 Wed, 24 May 2023 12:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684932749; x=1716468749;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=GkhxPaRCO2y8dRbGWQsSzhu84PVdNgaiuWiLhwdGYl4=;
 b=CUmkJufpJ3LG+aOFYSKH0tEGF6Lk6qq+lw/C96hDH7drCyZlbkRkDSI6
 iowFreoZF/O3MTE59qUVFQzSModLj2ISXGnswJhxE4RE0ELd1CKJ6dctO
 mejumn4iAJ79moUzmrz3a1Hjef6ifO6rrk/nQpQlAdFv7HrmCkIkUpqEE
 sgPk9nwxDvdz0cUIYf7sUHl98mpGAWnB/UlrDJ+dSDhgEWskpeGcSrwBb
 ffiOcufb3piC9CLWfq8iDwwQIwvd0KH7DVBtwU2iIO7+GbF463x3vo1Sg
 AN0vTQZ+wereiqc2f0LaPnxgBhGoEVWYNnf7S4fpEzMV69bBSybiiHbwl g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="439908383"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; d="scan'208";a="439908383"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 05:52:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="848734014"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; d="scan'208";a="848734014"
Received: from bmhacket-mobl.ger.corp.intel.com (HELO [10.213.218.245])
 ([10.213.218.245])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 05:52:26 -0700
Message-ID: <b0ebd1f8-c3fe-36e7-a448-59dd9f218ce8@linux.intel.com>
Date: Wed, 24 May 2023 13:52:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Intel-gfx] [PATCH v10 0/2] drm/i915: Allow user to set cache at
 BO creation
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>
References: <20230519051103.3404990-1-fei.yang@intel.com>
 <ZGx7Quf+ArHnXOR0@ashyti-mobl2.lan>
 <37a0e8fc-efbc-973f-f163-235b9482f21c@linux.intel.com>
 <ZG4Az4fWMsxL5j7w@ashyti-mobl2.lan> <ZG4DaGBAPCcPcmNs@ashyti-mobl2.lan>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <ZG4DaGBAPCcPcmNs@ashyti-mobl2.lan>
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
Cc: fei.yang@intel.com, Jordan Justen <jordan.l.justen@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 24/05/2023 13:30, Andi Shyti wrote:
> Hi again,
> 
>>>> finally... pushed in drm-intel-gt-next! :)
>>>
>>> I had to revert this (uapi commit only) by force pushing, luckily it was the
>>> top commit.
>>
>> OK, sorry!
>>
>>> 1)
>>> IGT is not merged yet.
>>
>> if igt is merged without the kernel it would fail, though.
> 
> can we at least agree on having igt patches reviewed and merge
> them right after?

Yeah that okay, just make it _right_ after. :)

Regards,

Tvrtko
