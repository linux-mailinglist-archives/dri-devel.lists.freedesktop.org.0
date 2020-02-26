Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 220291706AB
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 18:52:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C384C6E219;
	Wed, 26 Feb 2020 17:52:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 985036E219
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 17:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582739565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=opKYEzTmrhgv0fqiV+/SN67+BhHwBWcdJidevtuJOik=;
 b=NdQTw6E0X/7mBL4thG31n49J4BrcIuVvx9EopXU3ulA0oxVODVysz+YChzGZeM3Vuf4B+9
 1Vkj2y0G57S0VNOaQmr556jf75BKP2Olc/Buq8/N/XRh4mAToSJDymRjmZ3KY9zDUX0k8P
 j32ZWlByzbFrlTmN8Etd6tLxne3Okxk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-4BfIq_5jPFiOYVliTAeMIQ-1; Wed, 26 Feb 2020 12:52:37 -0500
X-MC-Unique: 4BfIq_5jPFiOYVliTAeMIQ-1
Received: by mail-wm1-f69.google.com with SMTP id y18so541882wmi.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 09:52:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=opKYEzTmrhgv0fqiV+/SN67+BhHwBWcdJidevtuJOik=;
 b=G3QIzKcnvL0EV2ZoRm3JpuAgSpLMVizmJji2feXzZe2NKYNc6ZVVy/LNvseEw8mfRm
 hmPNMzsC6h+xg2BQnHrUjvGDvolvk4mVNFDUAdKEy0r2ZrKbSNkY9HbJH7k/8OINN0wZ
 5Sgp8zsaqmCrPbz0POJYF6sHDPjPS/0T+X8+oAIY2s3dgpE6XiBB0UnrlBZ9KI7zskJ9
 OXRFVF3xgtzIyWTx3hOnblmwxDV0hnOzVzM1oVnVcVEkyf5AqyBYEZYQByYF0Ui1LHIJ
 NQa4sGZVqjEinFvyQXa4AEQsda45oDg9vIG9KtjqIHEe/GtzMKkmk9g7t3zfDges2bqB
 YVWA==
X-Gm-Message-State: APjAAAV0z7UQ0wkuDq8+Hq0q42fp9puMfC9/XdRKjQoNoN5B//2XI8OU
 efqrfYDdUsQC+m5YzkQX4eKCQQpjRFQDznUCr6T/u/yChjLKySGyOrGzT+oScbUpi+pCA80hFAt
 Q04yjTGzWKwJYK3afMBKrapIaxrFM
X-Received: by 2002:a5d:5303:: with SMTP id e3mr6641779wrv.274.1582739555978; 
 Wed, 26 Feb 2020 09:52:35 -0800 (PST)
X-Google-Smtp-Source: APXvYqx6aQnzqQT7Mf+Jdf99cfnakrt3ZpzVmn3BZgHyjq4hd1k2l9gAX6rcdbxJGMEyf8kZLHOBaA==
X-Received: by 2002:a5d:5303:: with SMTP id e3mr6641755wrv.274.1582739555706; 
 Wed, 26 Feb 2020 09:52:35 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-fc7e-fd47-85c1-1ab3.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:fc7e:fd47:85c1:1ab3])
 by smtp.gmail.com with ESMTPSA id w1sm4187128wro.72.2020.02.26.09.52.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2020 09:52:35 -0800 (PST)
Subject: Re: 5.6 DP-MST regression: 1 of 2 monitors on TB3 (DP-MST) dock no
 longer light up
To: Alex Deucher <alexdeucher@gmail.com>,
 "Lipski, Mikita" <mikita.lipski@amd.com>
References: <99213368-5025-8435-502b-3d23b875ca60@redhat.com>
 <CADnq5_OUt5XaJ_Nf23F2zsKeuPgoka8p2S6ny-H2WK==Ncg7vA@mail.gmail.com>
 <b0181c20-017b-7e3f-13c0-3ea5b98cadaa@redhat.com>
 <CADnq5_MjaOD+QrupjQwjdu-MgVZm1sg1x9=4uxdv92u1xuSdvQ@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <77b812d5-5b87-49b7-87dc-16d50a5666df@redhat.com>
Date: Wed, 26 Feb 2020 18:52:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CADnq5_MjaOD+QrupjQwjdu-MgVZm1sg1x9=4uxdv92u1xuSdvQ@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2/26/20 5:05 PM, Alex Deucher wrote:
> On Wed, Feb 26, 2020 at 10:43 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi,
>>
>> On 2/26/20 4:29 PM, Alex Deucher wrote:
>>> On Wed, Feb 26, 2020 at 10:16 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>>>
>>>> Hi Lyude and everyone else,
>>>>
>>>> Lyude I'm mailing you about this because you have done a lot of
>>>> work on DP MST, but if this rings a bell to anyone else feel
>>>> free to weigh in on this.
>>>
>>> Might be a duplicate of:
>>> https://gitlab.freedesktop.org/drm/amd/issues/1052
>>
>> Looks like you are right, reverting the commit which the bisect
>> from that issue points to:
>>
>> cd82d82cbc04 ("drm/dp_mst: Add branch bandwidth validation to MST atomic check")
>>
>> Fixes the issue for me. I will add a comment to the issue.
>>
>> Note I'm using integrated Intel gfx, so that means that this issue
>> definitely is not amdgpu specific.
>>
> 
> I'm not too familiar with the mst code, but I wonder if we were
> exceeding the bandwidth limits in some setups and it just happened to
> work, but now that we enforcing them, they don't which is correct, but
> a regression from some users' perspective?

I seriously doubt that is the case according to:
https://support.lenovo.com/nl/en/solutions/pd029622

The gen 2 tb3 dock can handle 2 external
displays at 3840*2160@60Hz together with the internal
panel being on and both my external displays run at
1920x1080@60 so I'm consuming less then half of the
maximum bandwidth.

There definitely is a bug somewhere in the
cd82d82cbc04 ("drm/dp_mst: Add branch bandwidth validation to MST atomic check")
commit (or somewhere else and triggered by that commit).

Regards,

Hans







> 
> Alex
> 
> 
>> Regards,
>>
>> Hans
>>
>>
>>
>>
>>>> I'm currently using a Lenovo X1 7th gen + a Lenovo TB3 gen 2 dock
>>>> as my daily rider for testing purposes. When 5.6-rc1 came out I
>>>> noticed that only 1 of the 2 1920x1080@60 monitors on the dock
>>>> lights up.
>>>>
>>>> There are no kernel errors in the logs, but mutter/gnome-shell says:
>>>>
>>>> gnome-shell[1316]: Failed to post KMS update: Page flip of 93 failed
>>>>
>>>> With 93 being the crtc-id of the crtc used for the monitor which is
>>>> displaying black. Since then I've waited for 5.6-rc3 hoping that a
>>>> fix was already queued up, but 5.6-rc3 still has this problem.
>>>>
>>>> gnome-shell does behave as if all monitors are connected, so the
>>>> monitor is seen, but we are failing to actually send any frames
>>>> to it.
>>>>
>>>> I've put a log collected with drm.debug=0x104 here:
>>>> https://fedorapeople.org/~jwrdegoede/drm-debug.log
>>>>
>>>> This message stands out as pointing to the likely cause of this problem:
>>>>
>>>> [    3.309061] [drm:intel_dump_pipe_config [i915]] MST master transcoder: <invalid>
>>>>
>>>> Regards,
>>>>
>>>> Hans
>>>>
>>>> _______________________________________________
>>>> dri-devel mailing list
>>>> dri-devel@lists.freedesktop.org
>>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>>
>>
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
