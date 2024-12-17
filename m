Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F120B9F5780
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 21:17:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A111E10E9D7;
	Tue, 17 Dec 2024 20:17:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBCA610E671;
 Tue, 17 Dec 2024 20:17:27 +0000 (UTC)
Message-ID: <61b95c08-a3c2-4f92-b6e5-df77fd2491e2@lankhorst.se>
Date: Tue, 17 Dec 2024 21:17:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] kernel/cgroups: Add "dmem" memory accounting
 cgroup.
To: Tejun Heo <tj@kernel.org>, Simona Vetter <simona.vetter@ffwll.ch>,
 Dave Airlie <airlied@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Zefan Li <lizefan.x@bytedance.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Friedrich Vock <friedrich.vock@gmx.de>, cgroups@vger.kernel.org,
 linux-mm@kvack.org, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20241204134410.1161769-1-dev@lankhorst.se>
 <20241213-proud-kind-uakari-df3a70@houat>
 <80c49a80-d49c-4ca5-9568-9f7950618275@lankhorst.se>
 <20241213-gentle-glittering-salamander-22addf@houat>
 <5a50a992-9286-4179-8031-ffb514bca34f@lankhorst.se>
 <20241217-meek-bullfinch-of-luck-2c3468@houat>
 <a69a3500-be17-4899-bdb9-c6a63bf8dc81@lankhorst.se>
 <Z2GwpOQDVshpv-ml@slm.duckdns.org>
 <c0a539e7-0f1b-496a-9848-73a7ada66bfb@lankhorst.se>
 <Z2HBqtKDSTkd1lST@slm.duckdns.org>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <Z2HBqtKDSTkd1lST@slm.duckdns.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey,

Den 2024-12-17 kl. 19:23, skrev Tejun Heo:
> Hello,
> 
> On Tue, Dec 17, 2024 at 06:37:22PM +0100, Maarten Lankhorst wrote:
>> Den 2024-12-17 kl. 18:11, skrev Tejun Heo:
>>> On Tue, Dec 17, 2024 at 03:28:50PM +0100, Maarten Lankhorst wrote:
>>>> Now that all patches look good, what is needed to merge the series? Without
>>>> patch 6/7 as it is a hack for testing.
>>>
>>> There were some questions raised about device naming. One thing we want to
>>> get right from the beginning is the basic interface.
>>>
>>> Thanks.
>>>
>> I believe it was solved. The conclusion appears to be that we go with how we
>> defined it in this series. drm/$pciid/$regionname. With the only regions
>> defined now being VRAM. Main memory will be a followup, but requires some
>> discussions on hwo to be prevent double accounting, and what to do with the
>> limited amount of mappable memory.
> 
> Provided Johannes is okay with the series, how do you want to route the
> series? If you want to route it through drm, that's fine by me and please
> feel free to add:
> 
>   Acked-by: Tejun Heo <tj@kernel.org>
> 
> Thanks.
> 

Thank you!

I've discussed this with the DRM maintainers. What was suggested is to 
create a topic branch, merge it to drm-misc whichwhere it will be picked 
up into drm.git during the next pull request. At the same time the topic 
branch can be also be merged into the cgroup tree if needed.

The drm-misc tree already handles dma-buf and fbdev core, think DMEM 
could fit in there too.

Cheers,
~Maarten
