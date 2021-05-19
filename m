Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0671C389376
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 18:16:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9833C6EE12;
	Wed, 19 May 2021 16:16:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD8596EE0F;
 Wed, 19 May 2021 16:16:13 +0000 (UTC)
IronPort-SDR: D2VT0kvJyrZ58R1WX+Yz7w5bHuO8Xa+UB0XTxYM6ZgXp1pN+4KybWYowTYsoDXdSATJCq7JGEJ
 nLFc+Krvt8LQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9989"; a="201063318"
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="201063318"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2021 09:16:07 -0700
IronPort-SDR: QJO5a5py9Yij6FH11k4P+DQndNdJBbOrgAAprs2MeXjWyX+1bSML/jOYEnMsoSSf/ABysqF1mY
 +wMZLjUnUNDw==
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="544620966"
Received: from leiderma-mobl1.ger.corp.intel.com (HELO [10.213.194.66])
 ([10.213.194.66])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2021 09:16:05 -0700
Subject: Re: [PATCH 0/7] Per client engine busyness
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Daniel Stone <daniel@fooishbar.org>
References: <c6c61179-5b4b-4e0b-6e57-ec4839ca3268@linux.intel.com>
 <b2203d34-2de3-7c58-de2f-bf6fafc3f67c@amd.com>
 <6cf2f14a-6a16-5ea3-d307-004faad4cc79@linux.intel.com>
 <a2b03603-eb3e-7bef-a799-c15cfb1a8e0b@amd.com>
 <YKJ+F4KqEiQQYkRz@phenom.ffwll.local>
 <BYAPR12MB2840C633CF05C1F29263F5BCF42D9@BYAPR12MB2840.namprd12.prod.outlook.com>
 <c85fc53f-d25b-464c-d411-eed4a509a009@linux.intel.com>
 <BYAPR12MB28409E25DEFD3DD620E596ABF42D9@BYAPR12MB2840.namprd12.prod.outlook.com>
 <BYAPR12MB284090FAC1C6E149F0A1A0ECF42D9@BYAPR12MB2840.namprd12.prod.outlook.com>
 <mysJHURIfWxBRBabIlnunj7LZNkkRQ-Knu_o6v7GZI4xCwGMZXn0rvjscl-aTT_d-ttlAQgJOG3gP95DBd_dxCPQNfguTSdrltxPrKt2FGs=@emersion.fr>
 <7f8fc38a-cd25-aa1f-fa2d-5d3334edb3d2@linux.intel.com>
 <CAPj87rOL7SEVXoH1rWH9ypj7idRmVPLXzmEsdVqFdVjsMh5PbA@mail.gmail.com>
 <71428a10-4b2f-dbbf-7678-7487f9eda6a5@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <c22608a4-b84c-a3a4-0df1-448312b1292e@linux.intel.com>
Date: Wed, 19 May 2021 17:16:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <71428a10-4b2f-dbbf-7678-7487f9eda6a5@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: "jhubbard@nvidia.com" <jhubbard@nvidia.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Intel Graphics Development <Intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>,
 "aritger@nvidia.com" <aritger@nvidia.com>, "Nieto,
 David M" <David.Nieto@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 18/05/2021 10:40, Tvrtko Ursulin wrote:
> 
> On 18/05/2021 10:16, Daniel Stone wrote:
>> Hi,
>>
>> On Tue, 18 May 2021 at 10:09, Tvrtko Ursulin
>> <tvrtko.ursulin@linux.intel.com> wrote:
>>> I was just wondering if stat(2) and a chrdev major check would be a
>>> solid criteria to more efficiently (compared to parsing the text
>>> content) detect drm files while walking procfs.
>>
>> Maybe I'm missing something, but is the per-PID walk actually a
>> measurable performance issue rather than just a bit unpleasant?
> 
> Per pid and per each open fd.
> 
> As said in the other thread what bothers me a bit in this scheme is that 
> the cost of obtaining GPU usage scales based on non-GPU criteria.
> 
> For use case of a top-like tool which shows all processes this is a 
> smaller additional cost, but then for a gpu-top like tool it is somewhat 
> higher.

To further expand, not only cost would scale per pid multiplies per open 
fd, but to detect which of the fds are DRM I see these three options:

1) Open and parse fdinfo.
2) Name based matching ie /dev/dri/.. something.
3) Stat the symlink target and check for DRM major.

All sound quite sub-optimal to me.

Name based matching is probably the least evil on system resource usage 
(Keeping the dentry cache too hot? Too many syscalls?), even though 
fundamentally I don't it is the right approach.

What happens with dup(2) is another question.

Does anyone have any feedback on the /proc/<pid>/gpu idea at all?

Regards,

Tvrtko
