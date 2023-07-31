Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2461769C6A
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 18:27:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9065B10E2CF;
	Mon, 31 Jul 2023 16:27:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A6E810E2CE
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 16:26:59 +0000 (UTC)
Received: from [192.168.2.174] (109-252-150-127.dynamic.spd-mgts.ru
 [109.252.150.127])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 0168E6606FCD;
 Mon, 31 Jul 2023 17:26:56 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1690820818;
 bh=3epO/QMQFTjkV49Ea0BqvxuXzjBbmCJzO0QJfElbI6o=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=iVwVxs574lxQBIXji+t3KapEUuHgAWJm4noZ24H1GkeWlALhA/dhuYRnLHhXn85hr
 0GsO4CM2/e7uawL9mH+uonCaQakYjYgV5llG0sRHbZxoMo9QKnRBwjTAhpUsLGUBMM
 V93iptL7F/hQcD7Qr8g0C2rpPNHOwBsYohDpbpI7lbLaNSWI6ue9zZdEDL/loka3Vs
 YJUmjFY7Gv9dgbMbnc+/hvi8IXTgEopyP4t3i0wlv0tVX+utY+RTwBVMdtr6rfhdNm
 1oCshwmBR5EwYLxXuGAtJkkj4hprZqVgTq62aZJzv4V/KDDU37lIwWluGN8RiYfcd9
 0BZmNQPtT1XdA==
Message-ID: <ad63d777-b98a-6ca9-16b4-961014c6492f@collabora.com>
Date: Mon, 31 Jul 2023 19:26:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.1
Subject: Re: [PATCH v6 0/3] Add sync object UAPI support to VirtIO-GPU driver
Content-Language: en-US
To: Gurchetan Singh <gurchetansingh@chromium.org>
References: <20230416115237.798604-1-dmitry.osipenko@collabora.com>
 <141b928d-6165-f282-b8e6-f140cb09333d@collabora.com>
 <CAAfnVBnrUotph4TYJVu9Bohqv3m80t90V34TNhh-Tspxwsj-ZQ@mail.gmail.com>
 <CAF6AEGs4fuq4i8UJdO5hvgHTNhzFMKGZ87+w1oyvL0LAqWio6A@mail.gmail.com>
 <CAAfnVBkLhYVaSG3U_QUZwXLFv-XT=9F2v2pgrCDQQBgNZ3MSWA@mail.gmail.com>
 <a453d562-7e93-aef3-a533-171f572b6ee3@collabora.com>
 <CAAfnVBmwVTBNx4GC2hiYQ9Ya8ufP_D8N0-JOzT2iPV9BYZhD9w@mail.gmail.com>
 <CAF6AEGvWrUN9W9DKv45OT-MfYAS4D_bXa_Sb5ptgrMEf9WSSqA@mail.gmail.com>
 <4c18744d-b6cd-d517-5726-104017d0764b@collabora.com>
 <CAAfnVB=qOjM1EQUyxdczu9KOGjD0sieoTODohbHz4ZDN0mqojw@mail.gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <CAAfnVB=qOjM1EQUyxdczu9KOGjD0sieoTODohbHz4ZDN0mqojw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann <kraxel@redhat.com>,
 David Airlie <airlied@redhat.com>, kernel@collabora.com,
 Emil Velikov <emil.velikov@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/29/23 01:03, Gurchetan Singh wrote:
> On Wed, Jul 19, 2023 at 11:58 AM Dmitry Osipenko <
> dmitry.osipenko@collabora.com> wrote:
> 
>> 27.06.2023 20:16, Rob Clark пишет:
>> ...
>>>> Now these are just suggestions, and while I think they are good, you
>> can safely ignore them.
>>>>
>>>> But there's also the DRM requirements, which state "userspace side must
>> be fully reviewed and tested to the standards of that user-space
>> project.".  So I think to meet the minimum requirements, I think we should
>> at-least have one of the following (not all, just one) reviewed:
>>>>
>>>> 1) venus using the new uapi
>>>> 2) gfxstream vk using the new uapi
>>>> 3) amdgpu nctx out of "draft" mode and using the new uapi.
>>>> 4) virtio-intel using new uapi
>>>> 5) turnip using your new uapi
>>>
>>> forgot to mention this earlier, but
>>> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/23533
>>>
>>> Dmitry, you can also add, if you haven't already:
>>>
>>> Tested-by: Rob Clark <robdclark@gmail.com>
>>
>> Gurchetan, Turnip Mesa virtio support is ready to be merged upstream,
>> it's using this new syncobj UAPI. Could you please give yours r-b if you
>> don't have objections?
>>
> 
> Given that Turnip native contexts are reviewed using this UAPI, your change
> does now meet the requirements and is ready to merge.
> 
> One thing I noticed is you might need explicit padding between
> `num_out_syncobjs` and `in_syncobjs`.  Otherwise, feel free to add my
> acked-by.

The padding looks okay as-as, all the struct size and u64s are properly
aligned. I'll merge the patch soon, thanks.

-- 
Best regards,
Dmitry

