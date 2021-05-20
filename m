Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAB1389FE7
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 10:35:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C21446F38A;
	Thu, 20 May 2021 08:35:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EA796F38A;
 Thu, 20 May 2021 08:35:19 +0000 (UTC)
IronPort-SDR: U/9pXn3LKbQy0FOPsiwPeFHIHluaTsC6UTUYMSP9wOCjlnlYbF/6bfcwC0pdFXjQBw6K+Gd5xy
 I1zg7G4QJjLg==
X-IronPort-AV: E=McAfee;i="6200,9189,9989"; a="181455044"
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="181455044"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2021 01:35:18 -0700
IronPort-SDR: aNBuLqGFfqSYN9sVZy7S8HzVxBasXvfZ48MkwbejhOkGcfdZtONuiT6xc3vMH4To8/aoZf+FQo
 OnnUJyzscVcg==
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="543376897"
Received: from fgrogers-mobl.ger.corp.intel.com (HELO [10.213.241.97])
 ([10.213.241.97])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2021 01:35:15 -0700
Subject: Re: [Intel-gfx] [PATCH 0/7] Per client engine busyness
To: Daniel Vetter <daniel@ffwll.ch>
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
 <c22608a4-b84c-a3a4-0df1-448312b1292e@linux.intel.com>
 <CAKMK7uF0fHBoYfiTS+-80RtUeuKFUcYDBpGHtNY6Ma+aJmmkxA@mail.gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <b1d508ee-6809-f5dc-6539-70cb89ef5e3b@linux.intel.com>
Date: Thu, 20 May 2021 09:35:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAKMK7uF0fHBoYfiTS+-80RtUeuKFUcYDBpGHtNY6Ma+aJmmkxA@mail.gmail.com>
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
 Intel Graphics Development <Intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>,
 "aritger@nvidia.com" <aritger@nvidia.com>, "Nieto,
 David M" <David.Nieto@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 19/05/2021 19:23, Daniel Vetter wrote:
> On Wed, May 19, 2021 at 6:16 PM Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
>>
>>
>> On 18/05/2021 10:40, Tvrtko Ursulin wrote:
>>>
>>> On 18/05/2021 10:16, Daniel Stone wrote:
>>>> Hi,
>>>>
>>>> On Tue, 18 May 2021 at 10:09, Tvrtko Ursulin
>>>> <tvrtko.ursulin@linux.intel.com> wrote:
>>>>> I was just wondering if stat(2) and a chrdev major check would be a
>>>>> solid criteria to more efficiently (compared to parsing the text
>>>>> content) detect drm files while walking procfs.
>>>>
>>>> Maybe I'm missing something, but is the per-PID walk actually a
>>>> measurable performance issue rather than just a bit unpleasant?
>>>
>>> Per pid and per each open fd.
>>>
>>> As said in the other thread what bothers me a bit in this scheme is that
>>> the cost of obtaining GPU usage scales based on non-GPU criteria.
>>>
>>> For use case of a top-like tool which shows all processes this is a
>>> smaller additional cost, but then for a gpu-top like tool it is somewhat
>>> higher.
>>
>> To further expand, not only cost would scale per pid multiplies per open
>> fd, but to detect which of the fds are DRM I see these three options:
>>
>> 1) Open and parse fdinfo.
>> 2) Name based matching ie /dev/dri/.. something.
>> 3) Stat the symlink target and check for DRM major.
> 
> stat with symlink following should be plenty fast.

Maybe. I don't think my point about keeping the dentry cache needlessly 
hot is getting through at all. On my lightly loaded desktop:

  $ sudo lsof | wc -l
  599551

  $ sudo lsof | grep "/dev/dri/" | wc -l
  1965

It's going to look up ~600k pointless dentries in every iteration. Just 
to find a handful of DRM ones. Hard to say if that is better or worse 
than just parsing fdinfo text for all files. Will see.

>> All sound quite sub-optimal to me.
>>
>> Name based matching is probably the least evil on system resource usage
>> (Keeping the dentry cache too hot? Too many syscalls?), even though
>> fundamentally I don't it is the right approach.
>>
>> What happens with dup(2) is another question.
> 
> We need benchmark numbers showing that on anything remotely realistic
> it's an actual problem. Until we've demonstrated it's a real problem
> we don't need to solve it.

Point about dup(2) is whether it is possible to distinguish the 
duplicated fds in fdinfo. If a DRM client dupes, and we found two 
fdinfos each saying client is using 20% GPU, we don't want to add it up 
to 40%.

> E.g. top with any sorting enabled also parses way more than it
> displays on every update. It seems to be doing Just Fine (tm).

Ha, perceptions differ. I see it using 4-5% while building the kernel on 
a Xeon server which I find quite a lot. :)

>> Does anyone have any feedback on the /proc/<pid>/gpu idea at all?
> 
> When we know we have a problem to solve we can take a look at solutions.

Yes I don't think the problem would be to add a better solution later, 
so happy to try the fdinfo first. I am simply pointing out a fundamental 
design inefficiency. Even if machines are getting faster and faster I 
don't think that should be an excuse to waste more and more under the 
hood, when a more efficient solution can be designed from the start.

Regards,

Tvrtko
