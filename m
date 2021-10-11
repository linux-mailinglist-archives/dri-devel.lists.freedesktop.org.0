Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D71D042919C
	for <lists+dri-devel@lfdr.de>; Mon, 11 Oct 2021 16:20:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5131F6E497;
	Mon, 11 Oct 2021 14:20:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B3166E497
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Oct 2021 14:20:01 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id o20so56622194wro.3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Oct 2021 07:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=D3LkZKPGeQ2pZrpRYtNRIEe9Jgb4epZYngCUbB/eenk=;
 b=XDkzUYGC+VdMtn0l81biIPvd0vnxhEKw5EOLFe/VGd6rjnZ1xdBlLRVma9z8q5mPNY
 1zwKeYKu1a/tZ4gSbQ9a8P5gMbdo9NDD5kM/6uH+eCETNkMbhwtSsRMCqHbt05eu1eKG
 eqmwRCikFjunqecF61hX4bbvU8EWQ2bVtk0tLaRuTCFhPSYRzHJC602fA3TRX9t9aZN6
 g8I4ookqv+b19B3a0dk6anOEzcHG+HSlDElO8PcS7wcrqQn4JD5uhkgHmWrlzHtzRzVc
 G/hs8njJ5C+CSvnv0YPVm70CPN91bBwU00CrxI6nbK070Pw9CJ7XfnVlO604rRth+62v
 6+PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=D3LkZKPGeQ2pZrpRYtNRIEe9Jgb4epZYngCUbB/eenk=;
 b=3GVOwtXjdouqxr7FpGG7HCCp0pjnPlZQ62RcR9d3tznqmdwjHBvs4K7lMVXmthZbPp
 smNCeh24xXm2hsfFuZJYLgWQJQ9PcdBdGTgrVvkabW3uk1WuF2MvVxZYGToZmcCTKLYG
 HVfHdr1h/pnbAh9SYkE0bWHay5tV1HhObzZpM3CBQmpZ02p0vl/4rITQGFbK8YSc2tM0
 MqMjiSotlFakzEh8flGRl6m7w9CAcgN0mLtTIAUFk16o0Gprz8mN1YY8zrf3WJ2EGDNq
 RoQeAvjimzaBi3BuIp+/gl5bu1cMTg/twk/xXhSSCnIAGjtZWtxb2xc9tCRWBjQEYFTa
 SArQ==
X-Gm-Message-State: AOAM533jp5ieokq15jZkAGwQuHf4lq3WKrWqPuK2pBAIZaSJshnwYw6U
 g9wLPH+z4QycyXV9jgSs4xs=
X-Google-Smtp-Source: ABdhPJyVnXPMJbk8NUC3rEmuj0k2+RTMr+cWuHzSr9POtzezKjn5s0NktLq5O6m4SY6Ud/HqG9dhfw==
X-Received: by 2002:a5d:6d81:: with SMTP id l1mr11702541wrs.198.1633961999722; 
 Mon, 11 Oct 2021 07:19:59 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:fefa:f968:b0f6:6172?
 ([2a02:908:1252:fb60:fefa:f968:b0f6:6172])
 by smtp.gmail.com with ESMTPSA id c17sm7860333wrq.4.2021.10.11.07.19.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Oct 2021 07:19:59 -0700 (PDT)
Subject: Re: Fw: [Intel-gfx] [PATCH 1/5] dri: cleanup debugfs error handling
To: Greg KH <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Cc: "Das, Nirmoy" <Nirmoy.Das@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Jani Nikula <jani.nikula@linux.intel.com>
References: <20211008091704.27094-1-nirmoy.das@amd.com>
 <87a6jjyhuo.fsf@intel.com> <YWAmZdRwnAt6wh9B@kroah.com>
 <02fc9da3-ebac-2df1-3a54-d764b273f91b@amd.com>
 <DM4PR12MB51368C12F6338C6F245D54B28BB29@DM4PR12MB5136.namprd12.prod.outlook.com>
 <c4f1464d-19b6-04a3-e2d8-a153bfbb050a@amd.com> <YWBfvILqkBQ8VSYc@kroah.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <936fed94-e56b-e4a6-6d1d-9830e8907d6c@gmail.com>
Date: Mon, 11 Oct 2021 16:19:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YWBfvILqkBQ8VSYc@kroah.com>
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

Am 08.10.21 um 17:11 schrieb Greg KH:
> On Fri, Oct 08, 2021 at 04:22:06PM +0200, Christian König wrote:
>> Hi guys,
>>
>> thanks Nirmoy for forwarding this, there is seriously something wrong with
>> the AMD mail servers.
>>
>>> On 10/8/2021 1:07 PM, Greg KH wrote:
>>>> On Fri, Oct 08, 2021 at 12:40:47PM +0300, Jani Nikula wrote:
>>>>> On Fri, 08 Oct 2021, Nirmoy Das <nirmoy.das@amd.com> wrote:
>>>>>> Debugfs API returns encoded error instead of NULL.
>>>>>> This patch cleanups drm debugfs error handling to
>>>>>> properly set dri and its minor's root dentry to NULL.
>>>>>>
>>>>>> Also do not error out if dri/minor debugfs directory
>>>>>> creation fails as a debugfs error is not a fatal error.
>>>>> Cc: Greg
>>>>>
>>>>> I thought this is the opposite of what Greg's been telling everyone to
>>>>> do with debugfs.
>>>> Yes, that is not good.
>>>>
>>>> You should never care about the result of a debugfs_create* call.  Just
>>>> take the result, and if it is a directory, save it off to use it for
>>>> creating a file, no need to check anything.
>> While I totally agree to the intention behind that I'm pretty sure there are
>> some consequences which are a rather bad idea.
>>
>> First of all the debugfs functions return a normal struct dentry pointer and
>> keeping that around unchecked means that we now have pointers in structure
>> members which can suddenly be an ERR_PTR() without any documentation that
>> they are not real pointers.
>>
>> What we could do instead is something like returning a typedef or a
>> structure with the dentry pointer embedded and then document that those are
>> special, can be ERR_PTR() and should never be touched except for the debugfs
>> functions itself.
> I agree, and am slowly working toward that, but am not there yet.  If
> you look, I have removed the return values for almost all
> debugfs_create_* calls, only a few remain.
>
> For now, just treat it like a "void" pointer that you have no context
> for and all will be fine.

Ok in that case we should just document on the saved dentry that this 
pointer is not necessary valid.

Nirmoy, can you take care of that?

>> The other issue is that adding the same file twice is unfortunately a rather
>> common coding error which we don't catch or complain about any more if we
>> don't look at the return value at all.
> How can you add the same debugfs file twice?  You have different
> directories.

We had multiple occasions triggering that:

1. Code accidentally initializing a component twice.

Except for the debugfs entry and a bit memory leak we had no negative 
effect otherwise and wouldn't had detected that without the error 
message from debugfs.

2. Driver not cleaning up properly on hotplug. E.g. old subdirectory not 
properly removed and re-plug.

3. Driver trying to use the same debugfs file for different devices.

> And really, who cares, it's debugging code!  :)

Well especially cause 3 once took me a day to figure out that I'm 
looking at the wrong hardware state because the driver was handling two 
devices, but only one showed up under debugfs.

>>>> And then throw it away, later, when you want to remove the directory,
>>>> look it up with a call to debugfs_lookup() and pass that to
>>>> debugfs_remove() (which does so recursively).
>>>>
>>>> There should never be a need to save, or check, the result of any
>>>> debugfs call.  If so, odds are it is being used incorrectly.
>> Yeah, exactly that's the problem I see here.
>>
>> We save the return value because the DRM subsystem is creating a debugfs
>> directory for the drivers to use.
> That's fine for now, not a big deal.  And even if there is an error,
> again, you can always feed that error back into the debugfs subsystem on
> another call and it will handle it correctly.

Problem is it isn't, we have a crash because the member isn't a pointer 
but an ERR_PTR instead.

And adding IS_ERR checks all around is even worse than adding NULL checks.

Regards,
Christian.

>
> thanks,
>
> greg k-h

