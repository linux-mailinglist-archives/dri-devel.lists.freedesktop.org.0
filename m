Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D92D518488
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 14:45:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36A0810FBE9;
	Tue,  3 May 2022 12:45:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF7B710F9DC;
 Tue,  3 May 2022 12:44:59 +0000 (UTC)
Received: from [192.168.0.7] (ip5f5aed95.dynamic.kabel-deutschland.de
 [95.90.237.149])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id 81BF061EA1935;
 Tue,  3 May 2022 14:44:57 +0200 (CEST)
Message-ID: <5a530210-2c22-d8e6-02e0-f321ba5e0e60@molgen.mpg.de>
Date: Tue, 3 May 2022 14:44:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCHv4] drm/amdgpu: disable ASPM on Intel Alder Lake based
 systems
Content-Language: en-US
To: Daniel Stone <daniel@fooishbar.org>
References: <20220412215000.897344-1-richard.gong@amd.com>
 <d4ba3998-34aa-86d2-bde9-bc6ae9d8d08d@molgen.mpg.de>
 <CADnq5_MgvcGPWf2gYn_3qCr+Gq1P39tvv-W-o8NhivvMpMwUBA@mail.gmail.com>
 <91e916e3-d793-b814-6cbf-abee0667f5f8@molgen.mpg.de>
 <94fd858d-1792-9c05-b5c6-1b028427687d@amd.com>
 <efc1dfd1-2b54-aee5-1497-4b800a468141@molgen.mpg.de>
 <237da02b-0ed8-6b1c-3eaf-5574aab4f13f@amd.com>
 <294555b4-2d1b-270f-6682-3a17e9df133c@molgen.mpg.de>
 <5adfe067-dc00-6567-e218-c5c68670cf5b@amd.com>
 <543a9e76-ca90-984b-b155-a0647cdeacff@molgen.mpg.de>
 <CAPj87rOERk-kNa6n-UdjQsDKXP9zzm8=an=FHcM+33yebW6ECw@mail.gmail.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <CAPj87rOERk-kNa6n-UdjQsDKXP9zzm8=an=FHcM+33yebW6ECw@mail.gmail.com>
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
Cc: Dave Airlie <airlied@linux.ie>, Richard Gong <richard.gong@amd.com>,
 Xinhui Pan <xinhui.pan@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alexander Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dear Daniel,


Am 03.05.22 um 14:25 schrieb Daniel Stone:
> On Sun, 1 May 2022 at 08:08, Paul Menzel <pmenzel@molgen.mpg.de> wrote:
>> Am 26.04.22 um 15:53 schrieb Gong, Richard:
>>> I think so. We captured dmesg log.
>>
>> Then the (whole) system did *not* freeze, if you could still log in
>> (maybe over network) and execute `dmesg`. Please also paste the
>> amdgpu(?) error logs in the commit message.
>>
>>> As mentioned early we need support from Intel on how to get ASPM working
>>> for VI generation on Intel Alder Lake, but we don't know where things
>>> currently stand.
>>
>> Who is working on this, and knows?
> 
> This has gone beyond the point of a reasonable request. The amount of
> detail you're demanding is completely unnecessary.

If a quirk is introduced possibly leading to higher power consumption, 
especially on systems nobody has access to yet, then the detail, where 
the system hangs/freezes is not unreasonable at all.

In the Linux logs from the issue there are messages like

     [   58.101385] Freezing of tasks failed after 20.003 seconds (4 
tasks refusing to freeze, wq_busy=0):

     [   78.278403] Freezing of tasks failed after 20.008 seconds (4 
tasks refusing to freeze, wq_busy=0):

and it looks like several suspend/resume cycles were done.

I see a lot of commit messages over the whole Linux kernel, where this 
level of detail is provided (by default), and

The second question was not for the commit message, but just for 
documentation purpose when the problem is going to be fixed properly. 
And it looks like (at least publicly) analyzing the root cause is not 
happening, and once the quirk lands, nobody is going to feel the 
pressure to work on it, as everyone’s plates are full.


Kind regards,

Paul
