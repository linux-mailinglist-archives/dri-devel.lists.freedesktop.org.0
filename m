Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B10476F7EA
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 04:37:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0411F10E130;
	Fri,  4 Aug 2023 02:37:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E59F210E130
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 02:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=2wlSNh8LSVUW5RuMrMq4MofQk6R7wWyYFXwgLK4BrOw=; b=2NMrsEeJoEQfKZb4RDais900Rj
 i7G8j0oMCUrhXilynw0uAsvBRABZ36YYz6362HQe28ac8D54Lwm/1D1AK5lEkPUEmaA+Wfny2YEy5
 Io/kZGzyffqiVKts0w2DHHtHOAgCB6HsVbDKuwvtI53nsBJIG8ZwDS318bELRerQg4mkcxLOcz7cV
 f9WiLDL2xSBsTPim2sXaL0SuXsR0PJLYsrOW5bvYfeNi4fBRO2moBoT41fVdoJEzGGNudzMA9LhRV
 pnMG+b+XysOUv7IKrMYaqjoWy3SGEvIXGr8QbXj3irbqw/7KR+w4511T+6RrnWGTYnFAiOjj+tYp9
 rcjAjq6g==;
Received: from [2601:1c2:980:9ec0::2764]
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qRkgf-00BOJv-0x; Fri, 04 Aug 2023 02:37:09 +0000
Message-ID: <d8a57aee-bb8a-dc5a-7c4f-b8a293d37bec@infradead.org>
Date: Thu, 3 Aug 2023 19:37:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: drivers/gpu/drm/bridge/samsung-dsim.c link error
Content-Language: en-US
To: Adam Ford <aford173@gmail.com>
References: <20230803144227.2187749-1-nogikh@google.com>
 <CAHCN7x+8Qq6w0eRC0NwBfhgS7XH7fmmPr9xwhR54rWFNY37Ugg@mail.gmail.com>
 <9e77ccc3-07db-f1fe-ef99-981852d4772b@infradead.org>
 <CAHCN7xKG=8ygSi8st31fe+t3Mn+k-7VUHKixFCZUuuDLOX8-kQ@mail.gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <CAHCN7xKG=8ygSi8st31fe+t3Mn+k-7VUHKixFCZUuuDLOX8-kQ@mail.gmail.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Aleksandr Nogikh <nogikh@google.com>, syzkaller@googlegroups.com,
 jagan@amarulasolutions.com, dvyukov@google.com, m.szyprowski@samsung.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/3/23 19:26, Adam Ford wrote:
> On Thu, Aug 3, 2023 at 9:01 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>>
>> Hi--
>>
>> On 8/3/23 08:24, Adam Ford wrote:
>>> On Thu, Aug 3, 2023 at 9:42 AM Aleksandr Nogikh <nogikh@google.com> wrote:
>>>>
>>>> Hello,
>>>>
>>>> We've been seing the following linker error on arm64 syzbot instances:
>>>>
>>>> ld.lld: error: undefined symbol: phy_mipi_dphy_get_default_config_for_hsclk
>>>>>>> referenced by samsung-dsim.c:731 (drivers/gpu/drm/bridge/samsung-dsim.c:731)
>>>>>>>               drivers/gpu/drm/bridge/samsung-dsim.o:(samsung_dsim_init) in archive vmlinux.a
>>>>
>>>> Steps to reproduce on the latest linux-next:
>>>>
>>>> $ git checkout next-20230803
>>>> $ wget -O '.config' 'https://raw.githubusercontent.com/google/syzkaller/master/dashboard/config/linux/upstream-arm64-kasan.config'
>>>> $ make CC=clang ARCH=arm64 LD=ld.lld CROSS_COMPILE=aarch64-linux-gnu- olddefconfig
>>>>
>>>> This also prints:
>>>>
>>>> WARNING: unmet direct dependencies detected for GENERIC_PHY_MIPI_DPHY
>>>>   Depends on [n]: GENERIC_PHY [=n]
>>>>   Selected by [y]:
>>>>   - DRM_NWL_MIPI_DSI [=y] && DRM_BRIDGE [=y] && DRM [=y] && COMMON_CLK [=y] && OF [=y] && HAS_IOMEM [=y]
>>>>   - DRM_SAMSUNG_DSIM [=y] && DRM [=y] && DRM_BRIDGE [=y] && COMMON_CLK [=y] && OF [=y] && HAS_IOMEM [=y]
>>>>
>>>> $ make CC=clang ARCH=arm64 LD=ld.lld CROSS_COMPILE=aarch64-linux-gnu- -j$(nproc)
>>>>
>>>> The kernel should have still compiled fine even despite the message above, right?
>>
>> No. See drivers/Makefile:
>> obj-$(CONFIG_GENERIC_PHY)       += phy/
>>
>> so the drivers/phy/ subdir is only built when CONFIG_GENERIC_PHY is set,
>> but it's not set.
>>
>>>> Could you please take a look?
>>>
>>> GENERIC_PHY_MIPI_DPHY was enabled to use
>>> phy_mipi_dphy_get_default_config() which takes in the pixel clock,
>>> bits-per-pixel, number of lanes and phy structure.  It applies a bunch
>>> of math based on the info passed and fills in the structure, but that
>>> function itself doesn't appear to be referencing phy code, so it's
>>> likely safe.
>>>
>>> I think this can be resolved by enabling GENERIC_PHY.  I just checked
>>> linux-next and when I built the arm64 defconfig, it enables
>>> GENERIC_PHY=y, so I don't think this is an issue.  I also checked the
>>
>> defconfig doesn't matter in this case. The .config that was provided has:
>> # CONFIG_GENERIC_PHY is not set
>> CONFIG_GENERIC_PHY_MIPI_DPHY=y
>>
> 
> Where/how was the .config generated?
> 

Aleksandr posted a link to the config file above.

> Are you building linux-next or something else?  The .config file
> generated when I build the arm64 defconfig  show both enabled:

linux-next.


> $ grep GENERIC_PHY .config
> CONFIG_GENERIC_PHY=y
> CONFIG_GENERIC_PHY_MIPI_DPHY=y
> 

Yes, this is not a defconfig file.

> 
>> but yes, selecting GENERIC_PHY (needed in 3 places) does fix the warnings
>> and build error.  2 instance in drm/bridge/Kconfig and one in
>> drm/bridge/cadence/Kconfig (found by inspection).
>>
>>
>>
>>> multi_v7_defconfig for ARM and it also sets GENERIC_PHY=y for 32-bit
>>> ARM people using some of the Exynos boards.
>>>
>>> I don't know what version of Linux you're trying to build, but I can't
>>> replicate your issue.
>>
>> I had no problem replicating the kconfig warnings and build error.
> 
> If you can replicate the problem, I'd suggest submitting a patch.

Sure, I'll do that.

-- 
~Randy
