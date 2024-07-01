Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C66B191DBF9
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 12:02:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 647E510E386;
	Mon,  1 Jul 2024 10:02:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.b="NJEPlp1b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AB7B10E386;
 Mon,  1 Jul 2024 10:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 In-Reply-To:References; bh=DJ9+LxV54Ieb6gRSrHFlDXvJdhuQToWOdrkYwkWiAjg=;
 t=1719828148; x=1720260148; b=NJEPlp1bgSpwFLmL3mQgQfDd97fBrEfw50f6mRmbWX61bJS
 IgA3wiG+YetE8BX3ISRDr3JJMt4+/EfRi1gDVszKaV7VfsGtQsFYAjktDdWPSvurMmp79eRHivgij
 mP7TO11zuSle45+sQkx9cGcGx3rE4n4DuJngkJV4wBoP8/5R+bKhMY/WmbLvVi7SsLjhb9tYXuDJX
 07EIgO0Fa9GZW8qa3xKsXdXkH8LzmZW5Lz2xpzXXhzEkcXeKUXTvTwFe0K9WB2XLIMZAuV1Y1taQS
 G4RPZJ01iAq7/oGfV2TY47CAcVm4SK7BGxwcNf+A8sqV+SPuM5CGYNwTz6nflrKQ==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1sODrZ-0007Nt-U6; Mon, 01 Jul 2024 12:02:22 +0200
Message-ID: <e0d95288-17b4-4286-8084-95f496603ada@leemhuis.info>
Date: Mon, 1 Jul 2024 12:02:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] QXL display malfunction
To: "Kaplan, David" <David.Kaplan@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Linux regressions mailing list <regressions@lists.linux.dev>
Cc: "Petkov, Borislav" <Borislav.Petkov@amd.com>,
 "zack.rusin@broadcom.com" <zack.rusin@broadcom.com>,
 "dmitry.osipenko@collabora.com" <dmitry.osipenko@collabora.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 Dave Airlie <airlied@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 "spice-devel@lists.freedesktop.org" <spice-devel@lists.freedesktop.org>,
 "virtualization@lists.linux.dev" <virtualization@lists.linux.dev>
References: <DS7PR12MB576622398096CB650FF6AF4294FF2@DS7PR12MB5766.namprd12.prod.outlook.com>
 <DS7PR12MB57665F9F4BDF0598D7CC53DD94FF2@DS7PR12MB5766.namprd12.prod.outlook.com>
 <67b279c7-1b65-46be-baa2-06794b47b9d1@leemhuis.info>
 <ab0fb17d-0f96-4ee6-8b21-65d02bb02655@suse.de>
 <DS7PR12MB57662053B081FBD62213016B94C22@DS7PR12MB5766.namprd12.prod.outlook.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <DS7PR12MB57662053B081FBD62213016B94C22@DS7PR12MB5766.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1719828148;
 0dcaec6d; 
X-HE-SMSGID: 1sODrZ-0007Nt-U6
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Thorsten here, the Linux kernel's regression tracker. Top-posting
for once, to make this easily accessible to everyone.

Thomas, was there some progress wrt to fixing below regression? I might
have missed something, but from here it looks like this fall through the
cracks.

Makes me wonder if we should temporarily revert this for now to fix this
for rc7 and ensure things get at least one week of testing before the final.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

#regzbot poke

On 14.06.24 15:45, Kaplan, David wrote:
> [AMD Official Use Only - AMD Internal Distribution Only]
> 
>> -----Original Message-----
>> From: Thomas Zimmermann <tzimmermann@suse.de>
>> Sent: Wednesday, June 12, 2024 9:26 AM
>> To: Linux regressions mailing list <regressions@lists.linux.dev>
>> Cc: Petkov, Borislav <Borislav.Petkov@amd.com>;
>> zack.rusin@broadcom.com; dmitry.osipenko@collabora.com; Kaplan, David
>> <David.Kaplan@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>;
>> Dave Airlie <airlied@redhat.com>; Maarten Lankhorst
>> <maarten.lankhorst@linux.intel.com>; Maxime Ripard
>> <mripard@kernel.org>; LKML <linux-kernel@vger.kernel.org>; ML dri-devel
>> <dri-devel@lists.freedesktop.org>; spice-devel@lists.freedesktop.org;
>> virtualization@lists.linux.dev
>> Subject: Re: [REGRESSION] QXL display malfunction
>>
>> Caution: This message originated from an External Source. Use proper
>> caution when opening attachments, clicking links, or responding.
>>
>>
>> Hi
>>
>> Am 12.06.24 um 14:41 schrieb Linux regression tracking (Thorsten Leemhuis):
>>> [CCing a few more people and lists that get_maintainers pointed out
>>> for qxl]
>>>
>>> Hi, Thorsten here, the Linux kernel's regression tracker. Top-posting
>>> for once, to make this easily accessible to everyone.
>>>
>>> Thomas, from here it looks like this report that apparently is caused
>>> by a change of yours that went into 6.10-rc1 (b33651a5c98dbd
>>> ("drm/qxl: Do not pin buffer objects for vmap")) fell through the
>>> cracks. Or was progress made to resolve this and I just missed this?
>>>
>>> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker'
>>> hat)
>>> --
>>> Everything you wanna know about Linux kernel regression tracking:
>>> https://linux-regtracking.leemhuis.info/about/#tldr
>>> If I did something stupid, please tell me, as explained on that page.
>>>
>>> #regzbot poke
>>>
>>>
>>> On 03.06.24 04:29, Kaplan, David wrote:
>>>>> -----Original Message-----
>>>>> From: Kaplan, David
>>>>> Sent: Sunday, June 2, 2024 9:25 PM
>>>>> To: tzimmermann@suse.de; dmitry.osipenko@collabora.com; Koenig,
>>>>> Christian <Christian.Koenig@amd.com>; zach.rusin@broadcom.com
>>>>> Cc: Petkov, Borislav <Borislav.Petkov@amd.com>;
>>>>> regressions@list.linux.dev
>>>>> Subject: [REGRESSION] QXL display malfunction
>>>>>
>>>>> Hi,
>>>>>
>>>>> I am running an Ubuntu 19.10 VM with a tip kernel using QXL video
>>>>> and I've observed the VM graphics often malfunction after boot,
>>>>> sometimes failing to load the Ubuntu desktop or even immediately
>> shutting the guest down.
>>>>> When it does load, the guest dmesg log often contains errors like
>>>>>
>>>>> [    4.303586] [drm:drm_atomic_helper_commit_planes] *ERROR* head
>> 1
>>>>> wrong: 65376256x16777216+0+0
>>>>> [    4.586883] [drm:drm_atomic_helper_commit_planes] *ERROR* head
>> 1
>>>>> wrong: 65376256x16777216+0+0
>>>>> [    4.904036] [drm:drm_atomic_helper_commit_planes] *ERROR* head
>> 1
>>>>> wrong: 65335296x16777216+0+0
>>
>> I don't see how these messages are related. Did they already appear before
>> the broken commit was there?
> 
> No, I did not observe them prior to the broken commit.
> 
>>
>>>>> [    5.374347] [drm:qxl_release_from_id_locked] *ERROR* failed to find
>> id in
>>>>> release_idr
>>
>> Is there only one such message in the log? Or multiple/frequent ones.
> 
> I would usually only see one.
> 
>>
>> Could you provide a stack trace of what happens before?
> 
> Here's the top of a backtrace when the error occurs:
> #0  qxl_release_from_id_locked (qdev=qdev@entry=0xffff88810126e000, id=id@entry=262151)
>     at drivers/gpu/drm/qxl/qxl_release.c:373
> #1  0xffffffff819f5b6a in qxl_garbage_collect (qdev=0xffff88810126e000)
>     at drivers/gpu/drm/qxl/qxl_cmd.c:222
> #2  0xffffffff810e3aa8 in process_one_work (worker=worker@entry=0xffff888101680300,
>     work=0xffff88810126f340) at kernel/workqueue.c:3231
> #3  0xffffffff810e6281 in process_scheduled_works (worker=<optimized out>)
>     at kernel/workqueue.c:3312
> #4  worker_thread (__worker=0xffff888101680300) at kernel/workqueue.c:3393
> 
>>
>> We sometimes draw into the buffer object from the CPU. For accessing the
>> buffer object's pages from the CPU, only a vmap operation should be
>> necessary. It appears as if qxl also requires a pin. My guess is that the pin
>> inserts the buffer-object's host-side pages and the code around
>> qxl_release_from_id_locked() appears to be garbage-collecting them.
>> Hence without the pin, the GC complains about inconsistent state.
>>>>>
>>>>> I bisected the issue down to "drm/qxl: Do not pin buffer objects for
>> vmap"
>>>>> (b33651a5c98dbd5a919219d8c129d0674ef74299).
>>
>> Thanks for bisecting. Does it work if you revert that commit?
> 
> Yes
> 
> Thanks --David Kaplan
