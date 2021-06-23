Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE3C3B15BE
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 10:21:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EC906E84E;
	Wed, 23 Jun 2021 08:21:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29FEF6E84E
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 08:21:28 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id h23so1080962pjv.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 01:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/vpjqLnLja8zZg9F85wBmeicNZJ5E0kfTwub6S5I0nY=;
 b=qyjoMEneFPyQG6FmpAm+blLv6qUuFnSfiHq9cwsD6vkL+N14a/IYUIUTUqOY2t15qU
 orTFA+SzPPKYQEg/vg6aUJWkEx4TNqvO2RtgVWJyvQui+pZ/TnKX2y/OlFv2vaDUb+hu
 VkuvJASiJfLUZ1yJJ2NAquzoKz2lDAduMIwIg8GEvgocPlEJinWAs1aMnQ9o5SDiwVWA
 Tb+Cfp7SYSHZRtDLkBPMD1NQlBDQEHQ3ig7VsNPKaUOn3isd1x2Ziyr37iLaozV2eDeS
 lGHyBldZdyHiqvHwnT6yiHmAVW525lIsaTkLsMit19GQWxbdY/vVswfJvppCEZBlKmwE
 JnGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/vpjqLnLja8zZg9F85wBmeicNZJ5E0kfTwub6S5I0nY=;
 b=Bz4XiY4deeeEIW5rv7Onr0GRwkJKnfvbQ4SzZdzKiq3ZVW634te+IvNXjhwZ2condi
 a0GSPM9UzX05RjbA++FsJJkzofuo12s+Qa9kuA2+ZF7RfijI4mghKK7AjshzP6+HvaFi
 zCH3xdGktvRtE4AexSmwisWrPoF/9zJsWDpWdmd+rlilq1KMkDkIyL+xioSyzM8p7MHZ
 371G0upV4vR3E8x9Z8iu4zOfkb8DOLcKkfo8N7zohPsdjUFs1h4t1uZJmyIeY8+MJ7Sx
 XvS1mVChPe/wJJvS6R1Ook9ZkIKg8pByqHaozDgU4qNNoHk+950g6p15swkL66Nq8opj
 2mSQ==
X-Gm-Message-State: AOAM531QbZKTen4EgH6xc3Z2/Ss+q8zmNXrSqDa8pM4pLkONmR6d4Och
 jhbVX3mj7BMlHi5B1yPAdiE2mg==
X-Google-Smtp-Source: ABdhPJyYaZ9+qPtqUGE0ix2e6z0tzu895F8iK8HYriQ9ex3rYbT2jDNvHbujgnZHhKfsy+6HIyxy5A==
X-Received: by 2002:a17:90a:4ec8:: with SMTP id
 v8mr8506910pjl.178.1624436487667; 
 Wed, 23 Jun 2021 01:21:27 -0700 (PDT)
Received: from ?IPv6:240b:10:c9a0:ca00:1102:c007:eee:4478?
 ([240b:10:c9a0:ca00:1102:c007:eee:4478])
 by smtp.gmail.com with ESMTPSA id d13sm1552726pfn.136.2021.06.23.01.21.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jun 2021 01:21:26 -0700 (PDT)
Subject: Re: [PATH 0/4] [RFC] Support virtual DRM
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Pekka Paalanen <ppaalanen@gmail.com>
References: <20210621062742.26073-1-etom@igel.co.jp>
 <9853d0a9-6053-db64-9c79-40b7e0689eec@suse.de>
 <85593f2f-5aa9-6023-ecba-c5275a468b71@igel.co.jp>
 <20210622105757.2b9dec32@eldfell>
 <01a20860-8fe2-2762-5678-d9a75f70e20a@daenzer.net>
From: Esaki Tomohito <etom@igel.co.jp>
Message-ID: <0fd18324-f396-ba76-1c8b-d048e5b72dca@igel.co.jp>
Date: Wed, 23 Jun 2021 17:21:24 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <01a20860-8fe2-2762-5678-d9a75f70e20a@daenzer.net>
Content-Type: text/plain; charset=utf-8
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
Cc: devicetree@vger.kernel.org, Takanari Hayama <taki@igel.co.jp>,
 linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Damian Hobson-Garcia <dhobsong@igel.co.jp>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2021/06/23 17:04, Michel Dänzer wrote:
> On 2021-06-22 9:57 a.m., Pekka Paalanen wrote:
>> On Tue, 22 Jun 2021 13:02:59 +0900
>> Esaki Tomohito <etom@igel.co.jp> wrote:
>>
>>> Hi, Thomas
>>> Thank you for reply.
>>>
>>> On 2021/06/21 16:10, Thomas Zimmermann wrote:
>>>> Hi
>>>>
>>>> Am 21.06.21 um 08:27 schrieb Tomohito Esaki:  
>>>>> Virtual DRM splits the overlay planes of a display controller into
>>>>> multiple
>>>>> virtual devices to allow each plane to be accessed by each process.
>>>>>
>>>>> This makes it possible to overlay images output from multiple
>>>>> processes on a
>>>>> display. For example, one process displays the camera image without
>>>>> compositor
>>>>> while another process overlays the UI.  
>>>>
>>>> I briefly looked over your patches. I didn't understand how this is
>>>> different to the functionality of a compositor? Shouldn't this be solved
>>>> in userspace?  
>>>
>>> I think when latency is important (e.g., AR, VR, for displaying camera
>>> images in IVI systems), there may be use cases where the compositor
>>> cannot be used.
>>
>> Hi,
>>
>>> Normally, when the image is passed through the compositor, it is
>>> displayed after 2 VSYNC at most, because the compositor combines the
>>> image with VSYNC synchronization.
>>
>> This is not a universal fact. You can write a Wayland compositor that
>> consistently reaches app-to-screen latency of less than one monitor
>> refresh cycle, while also using KMS planes.
>>
>> I believe Weston succeeds in this already if you write the Wayland
>> application accordingly.
> 
> For a specific example, https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1620 allows app-to-screen latency as low as ~6 ms (including a fixed 2 ms buffer to avoid skipped frames). mutter doesn't use KMS planes yet, but if anything I'd expect that to help rather than hurt for latency (if the compositor doesn't need to draw anything).

Thank you for providing specific examples.

Best regards
Esaki
