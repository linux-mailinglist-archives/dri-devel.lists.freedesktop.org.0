Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A5270F5E1
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 14:05:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E821F10E661;
	Wed, 24 May 2023 12:05:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0584A10E661;
 Wed, 24 May 2023 12:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684929942; x=1716465942;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=HMoZlauzOELNTnKH5BYcY9y4Xzr7qtTJgQxN9y/fMJQ=;
 b=RwIU3QLmDBcNezdRF/HbFxWNDcTIVxli+DWbzXoG4M05tCZb1OrX+aHM
 H6fMvH49E889zZHKyl+fV1rKMl44XEFOejzo37Qv1kxMwgsesZqYT63lr
 DnA/ViVcitngigOhF0gqNSiaDneyd0bIQa25WN0nYpna0xm/OWYaU3nBR
 MKCnwn1P1w/LE2WQ5MHTvBWVEOwKqoHTS4vA7UWUl9IT9dceKQMzdglVT
 bcHqRF5RUMO+xmzVK83uLNDitRZOefAJgtFwXaGoztHe2KyHJooFfzWmA
 7BbMZdhfuHmDPq36EOEedh1Il+aZFYEADSsOrV9TPdZbRqctvRgANpx8C Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="333165631"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; d="scan'208";a="333165631"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 05:05:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="774222507"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; d="scan'208";a="774222507"
Received: from bmhacket-mobl.ger.corp.intel.com (HELO [10.213.218.245])
 ([10.213.218.245])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 05:05:39 -0700
Message-ID: <7159edd0-2c43-d41f-e067-0e220e1a395e@linux.intel.com>
Date: Wed, 24 May 2023 13:05:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Intel-gfx] [PATCH v10 0/2] drm/i915: Allow user to set cache at
 BO creation
Content-Language: en-US
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>, fei.yang@intel.com
References: <20230519051103.3404990-1-fei.yang@intel.com>
 <ZGx7Quf+ArHnXOR0@ashyti-mobl2.lan>
 <37a0e8fc-efbc-973f-f163-235b9482f21c@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <37a0e8fc-efbc-973f-f163-235b9482f21c@linux.intel.com>
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
Cc: Jordan Justen <jordan.l.justen@intel.com>, intel-gfx@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, dri-devel@lists.freedesktop.org,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 24/05/2023 12:56, Tvrtko Ursulin wrote:
> 
> On 23/05/2023 09:37, Andi Shyti wrote:
>> Hi Fei,
>>
>> finally... pushed in drm-intel-gt-next! :)
> 
> I had to revert this (uapi commit only) by force pushing, luckily it was 
> the top commit.
> 
> 1)
> IGT is not merged yet.
> 
> 2)
> The tools/include/uapi/drm/i915_drm.h part of the patch was not removed.
> 
> Please fix both issues before re-sending and re-merging.

3)
Please remove the BSpec 45101 reference too and replace it with a link 
to PRMs. I understand updated docs will land there soon which will 
include the necessary info.

Regards,

Tvrtko
