Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9492638E486
	for <lists+dri-devel@lfdr.de>; Mon, 24 May 2021 12:48:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9F9E6E19B;
	Mon, 24 May 2021 10:48:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5929B6E190;
 Mon, 24 May 2021 10:48:05 +0000 (UTC)
IronPort-SDR: kB8vCDuLWipRcZwnT/2jZXG9OR/WUOkTJEgSAnUAyoUxNCeoAOwqs4bM7FJg3soFRI0ad4whtS
 k/rjRrFG6EIw==
X-IronPort-AV: E=McAfee;i="6200,9189,9993"; a="181544376"
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; d="scan'208";a="181544376"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 03:48:04 -0700
IronPort-SDR: QuEnAfZ5/WIeo3m+UEXFblrExKUADwlP9aJSrqDHvReibVvmxIJCm/OBqO5uyGflOOKgDPu+dc
 Y6pL8dPMhDpg==
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; d="scan'208";a="413543179"
Received: from gtenuto-mobl1.ger.corp.intel.com (HELO [10.213.210.116])
 ([10.213.210.116])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 03:48:02 -0700
Subject: Re: [Intel-gfx] [PATCH 0/7] Per client engine busyness
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
References: <c6c61179-5b4b-4e0b-6e57-ec4839ca3268@linux.intel.com>
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
 <b1d508ee-6809-f5dc-6539-70cb89ef5e3b@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <74dd3086-13c5-2fb0-bb66-eec1a061e693@linux.intel.com>
Date: Mon, 24 May 2021 11:48:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <b1d508ee-6809-f5dc-6539-70cb89ef5e3b@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: "jhubbard@nvidia.com" <jhubbard@nvidia.com>,
 Intel Graphics Development <Intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>,
 "aritger@nvidia.com" <aritger@nvidia.com>, "Nieto,
 David M" <David.Nieto@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 20/05/2021 09:35, Tvrtko Ursulin wrote:
> On 19/05/2021 19:23, Daniel Vetter wrote:
>> On Wed, May 19, 2021 at 6:16 PM Tvrtko Ursulin
>> <tvrtko.ursulin@linux.intel.com> wrote:
>>>
>>>
>>> On 18/05/2021 10:40, Tvrtko Ursulin wrote:
>>>>
>>>> On 18/05/2021 10:16, Daniel Stone wrote:
>>>>> Hi,
>>>>>
>>>>> On Tue, 18 May 2021 at 10:09, Tvrtko Ursulin
>>>>> <tvrtko.ursulin@linux.intel.com> wrote:
>>>>>> I was just wondering if stat(2) and a chrdev major check would be a
>>>>>> solid criteria to more efficiently (compared to parsing the text
>>>>>> content) detect drm files while walking procfs.
>>>>>
>>>>> Maybe I'm missing something, but is the per-PID walk actually a
>>>>> measurable performance issue rather than just a bit unpleasant?
>>>>
>>>> Per pid and per each open fd.
>>>>
>>>> As said in the other thread what bothers me a bit in this scheme is 
>>>> that
>>>> the cost of obtaining GPU usage scales based on non-GPU criteria.
>>>>
>>>> For use case of a top-like tool which shows all processes this is a
>>>> smaller additional cost, but then for a gpu-top like tool it is 
>>>> somewhat
>>>> higher.
>>>
>>> To further expand, not only cost would scale per pid multiplies per open
>>> fd, but to detect which of the fds are DRM I see these three options:
>>>
>>> 1) Open and parse fdinfo.
>>> 2) Name based matching ie /dev/dri/.. something.
>>> 3) Stat the symlink target and check for DRM major.
>>
>> stat with symlink following should be plenty fast.
> 
> Maybe. I don't think my point about keeping the dentry cache needlessly 
> hot is getting through at all. On my lightly loaded desktop:
> 
>   $ sudo lsof | wc -l
>   599551
> 
>   $ sudo lsof | grep "/dev/dri/" | wc -l
>   1965
> 
> It's going to look up ~600k pointless dentries in every iteration. Just 
> to find a handful of DRM ones. Hard to say if that is better or worse 
> than just parsing fdinfo text for all files. Will see.

CPU usage looks passable under a production kernel (non-debug). Once a 
second refresh period, on a not really that loaded system (115 running 
processes, 3096 open file descriptors as reported by lsof, none of which 
are DRM), results in a system call heavy load:

real    0m55.348s
user    0m0.100s
sys     0m0.319s

Once per second loop is essentially along the lines of:

   for each pid in /proc/<pid>:
     for each fd in /proc/<pid>/fdinfo:
       if fstatat(fd) is drm major:
         read fdinfo text in one sweep and parse it

I'll post the quick intel_gpu_top patch for reference but string parsing 
in C leaves a few things to be desired there.

Regards,

Tvrtko
