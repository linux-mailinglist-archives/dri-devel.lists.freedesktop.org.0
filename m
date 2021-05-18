Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFFF38753E
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 11:35:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36A046EB11;
	Tue, 18 May 2021 09:35:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD8766EB11;
 Tue, 18 May 2021 09:35:14 +0000 (UTC)
IronPort-SDR: rQsRkW33nW32PXMr/kAkVZjHgeekp53l2G1A6wR5yCt9RQn8BYZMaJiitez+R9/YFq0I69yhK7
 Lv8K2I+n9ipw==
X-IronPort-AV: E=McAfee;i="6200,9189,9987"; a="197582682"
X-IronPort-AV: E=Sophos;i="5.82,309,1613462400"; d="scan'208";a="197582682"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 02:35:14 -0700
IronPort-SDR: uKmRdx1/EI/UVVCwjRGlBhKhRAz1gQOlOekevTFjEdkqYCA3YpJMuVrpRyTRYHxrzdSS+npi+t
 7ifq4XAzq05A==
X-IronPort-AV: E=Sophos;i="5.82,309,1613462400"; d="scan'208";a="438583048"
Received: from alirazas-mobl.ger.corp.intel.com (HELO [10.213.211.104])
 ([10.213.211.104])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 02:35:12 -0700
Subject: Re: [PATCH 0/7] Per client engine busyness
To: "Nieto, David M" <David.Nieto@amd.com>, Daniel Vetter <daniel@ffwll.ch>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
References: <c6c61179-5b4b-4e0b-6e57-ec4839ca3268@linux.intel.com>
 <CADnq5_N03pz6GmptzhRnCRQH=qkd4eWuAbuUysHp-A9NZHQMHg@mail.gmail.com>
 <BYAPR12MB2840AA68BCAEBD9279C6184FF4509@BYAPR12MB2840.namprd12.prod.outlook.com>
 <39ccc2ef-05d1-d9f0-0639-ea86bef58b80@amd.com>
 <7d6d09fe-ec85-6aaf-9834-37a49ec7d6c5@linux.intel.com>
 <9144f63b-953d-2019-742d-6553e09f5b40@amd.com>
 <22e7d6ea-f2dd-26da-f264-b17aad25af95@linux.intel.com>
 <b2203d34-2de3-7c58-de2f-bf6fafc3f67c@amd.com>
 <6cf2f14a-6a16-5ea3-d307-004faad4cc79@linux.intel.com>
 <a2b03603-eb3e-7bef-a799-c15cfb1a8e0b@amd.com>
 <YKJ+F4KqEiQQYkRz@phenom.ffwll.local>
 <BYAPR12MB2840C633CF05C1F29263F5BCF42D9@BYAPR12MB2840.namprd12.prod.outlook.com>
 <c85fc53f-d25b-464c-d411-eed4a509a009@linux.intel.com>
 <BYAPR12MB28409E25DEFD3DD620E596ABF42D9@BYAPR12MB2840.namprd12.prod.outlook.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <c306eac1-d53f-a749-6aac-3f4f066031cb@linux.intel.com>
Date: Tue, 18 May 2021 10:35:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <BYAPR12MB28409E25DEFD3DD620E596ABF42D9@BYAPR12MB2840.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
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
Cc: Intel Graphics Development <Intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 17/05/2021 19:02, Nieto, David M wrote:
> [AMD Official Use Only]
> 
> 
> The format is simple:
> 
> <ringname><index>: <XXX.XX> %

Hm what time period does the percent relate to?

The i915 implementation uses accumulated nanoseconds active. That way 
who reads the file can calculate the percentage relative to the time 
period between two reads of the file.

> we also have entries for the memory mapped:
> mem <ttm pool> : <size> KiB

Okay so in general key values per line in text format. Colon as delimiter.

What common fields could be useful between different drivers and what 
common naming scheme, in order to enable as easy as possible creation of 
a generic top-like tool?

driver: <ko name>
pdev: <pci slot>
ring-<name>: N <unit>
...
mem-<name>: N <unit>
...

What else?
Is ring a good common name? We actually more use engine in i915 but I am 
not really bothered about it.

Aggregated GPU usage could be easily and generically done by userspace 
by adding all rings and normalizing.

> On my submission 
> https://lists.freedesktop.org/archives/amd-gfx/2021-May/063149.html 
> <https://lists.freedesktop.org/archives/amd-gfx/2021-May/063149.html> I 
> added a python script to print out the info. It has a CPU usage lower 
> that top, for example.
> 
> To be absolutely honest, I agree that there is an overhead, but It might 
> not be as much as you fear.

For me more the issue is that the extra number of operations grows with 
the number of open files on the system, which has no relation to the 
number of drm clients.

Extra so if the monitoring tool wants to show _only_ DRM processes. Then 
the cost scales with total number of processes time total number of 
files on the server.

This design inefficiency bothers me yes. This is somewhat alleviated by 
the proposal from Chris 
(https://patchwork.freedesktop.org/patch/419042/?series=86692&rev=1) 
although there are downsides there as well. Like needing to keep a map 
of pids to drm files in drivers.

Btw what do you do in that tool for same fd in a multi-threaded process
or so? Do you show duplicate entries or detect and ignore? I guess I did 
not figure out if you show by pid/tgid or by fd.

Regards,

Tvrtko

> ------------------------------------------------------------------------
> *From:* Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> *Sent:* Monday, May 17, 2021 9:00 AM
> *To:* Nieto, David M <David.Nieto@amd.com>; Daniel Vetter 
> <daniel@ffwll.ch>; Koenig, Christian <Christian.Koenig@amd.com>
> *Cc:* Alex Deucher <alexdeucher@gmail.com>; Intel Graphics Development 
> <Intel-gfx@lists.freedesktop.org>; Maling list - DRI developers 
> <dri-devel@lists.freedesktop.org>
> *Subject:* Re: [PATCH 0/7] Per client engine busyness
> 
> On 17/05/2021 15:39, Nieto, David M wrote:
>> [AMD Official Use Only]
>> 
>> 
>> Maybe we could try to standardize how the different submission ring 
>>   usage gets exposed in the fdinfo? We went the simple way of just 
>> adding name and index, but if someone has a suggestion on how else we 
>> could format them so there is commonality across vendors we could just 
>> amend those.
> 
> Could you paste an example of your format?
> 
> Standardized fdinfo sounds good to me in principle. But I would also
> like people to look at the procfs proposal from Chris,
>    - link to which I have pasted elsewhere in the thread.
> 
> Only potential issue with fdinfo I see at the moment is a bit of an
> extra cost in DRM client discovery (compared to my sysfs series and also
> procfs RFC from Chris). It would require reading all processes (well
> threads, then maybe aggregating threads into parent processes), all fd
> symlinks, and doing a stat on them to figure out which ones are DRM devices.
> 
> Btw is DRM_MAJOR 226 consider uapi? I don't see it in uapi headers.
> 
>> I’d really like to have the process managers tools display GPU usage 
>> regardless of what vendor is installed.
> 
> Definitely.
> 
> Regards,
> 
> Tvrtko
