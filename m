Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2733819A1
	for <lists+dri-devel@lfdr.de>; Sat, 15 May 2021 17:46:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42DD86E25A;
	Sat, 15 May 2021 15:46:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D90766E25A
 for <dri-devel@lists.freedesktop.org>; Sat, 15 May 2021 15:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=P+RTKeX6Kja8G+tGDZBGGO6+rqjm+B03PRJo0wF1NjQ=; b=mosDPOOd0ECGyenTYSD6NCeRQj
 31rokdyjqJlNZLCYqOwuhL5qGH5tmJlNuLAb5565ruJM54Zp8LwQsm2ba6YKoXMuuOtyEqE8HZ5Lk
 1NGwuTCie4dgsKAI44J5+dFAYDDLXR0o5ihBjL155q2mE0NoW41dtqBnD+3tvS0GBhz1UW+i1x3QX
 CkO/JzqrZ4FX0PVcUdELs2Zbp0pHDCSmMMRS1cMUt8OTeDSNblsQErcbWdzYfsvkx1aV2Lm9zRxtn
 RH6vhZWmLz4cOhCn3eTsT5hxI/pP1CGi9zTeYUDXAPVk2O8wsOmszMFN5wVejFyg+60fqR+UJGMWI
 iKibU9Ow==;
Received: from [2601:1c0:6280:3f0::7376]
 by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lhwUs-00CbB8-MV; Sat, 15 May 2021 15:46:34 +0000
Subject: Re: [PATCH v3] drm/bridge/sii8620: fix dependency on extcon
To: Robert Foss <robert.foss@linaro.org>
References: <20210419090124.153560-1-robert.foss@linaro.org>
 <1627725d-1c7e-109f-f995-e761bb022ccc@infradead.org>
 <d295f001-575d-f14c-b0c1-1444dd29a03e@infradead.org>
 <75b35f2f-72bb-522a-afd8-6c26cd553588@infradead.org>
 <CAG3jFyv5gBSG-xkQFDkQMhpqWa4-_e7GTb4pr4dJjZcNLW4ZQw@mail.gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <e8b14660-6f3f-f4d8-bee2-1aa818782663@infradead.org>
Date: Sat, 15 May 2021 08:46:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CAG3jFyv5gBSG-xkQFDkQMhpqWa4-_e7GTb4pr4dJjZcNLW4ZQw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, cw00.choi@samsung.com,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, m.purski@samsung.com,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/15/21 5:09 AM, Robert Foss wrote:
> Hey Randy,
> 
> I missed sending out a notification, but this patch was merged into
> drm-misc-next.
> 
> https://cgit.freedesktop.org/drm/drm-misc/commit/?id=08319adbdde15ef7cee1970336f63461254baa2a

OK, thanks, Robert.

I was mainly asking because the 0day bot sent out a build failure
that this patch fixes, but it was dated 2021-MAY-05, so I guess I can
just ignore it, since it is so old. :)


> On Sat, 15 May 2021 at 07:35, Randy Dunlap <rdunlap@infradead.org> wrote:
>>
>> On 4/19/21 10:54 AM, Randy Dunlap wrote:
>>> On 4/19/21 10:10 AM, Randy Dunlap wrote:
>>>> On 4/19/21 2:01 AM, Robert Foss wrote:
>>>>> The DRM_SIL_SII8620 kconfig has a weak `imply` dependency
>>>>> on EXTCON, which causes issues when sii8620 is built
>>>>> as a builtin and EXTCON is built as a module.
>>>>>
>>>>> The symptoms are 'undefined reference' errors caused
>>>>> by the symbols in EXTCON not being available
>>>>> to the sii8620 driver.
>>>>>
>>>>> Fixes: 688838442147 ("drm/bridge/sii8620: use micro-USB cable detection logic to detect MHL")
>>>>> Signed-off-by: Robert Foss <robert.foss@linaro.org>
>>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>>> ---
>>>>>
>>>>> LKP reported issue:
>>>>> https://lore.kernel.org/lkml/202104040604.SSTe2Cxf-lkp@intel.com/
>>>>>
>>>>>
>>>>> Changes since v1:
>>>>>  - Fix typo on comment
>>>>>
>>>>> Changes since v2:
>>>>>  - Randy: Changed from `depends` to `select`
>>>>
>>>> I don't know why my name is on that. I didn't
>>>> suggest any change -- I just reported that v2
>>>> had a problem.
>>>>
>>>>
>>>>>
>>>>>
>>>>>  drivers/gpu/drm/bridge/Kconfig | 2 +-
>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
>>>>> index 22a467abd3e9..70402da5cc70 100644
>>>>> --- a/drivers/gpu/drm/bridge/Kconfig
>>>>> +++ b/drivers/gpu/drm/bridge/Kconfig
>>>>> @@ -169,7 +169,7 @@ config DRM_SIL_SII8620
>>>>>     tristate "Silicon Image SII8620 HDMI/MHL bridge"
>>>>>     depends on OF
>>>>>     select DRM_KMS_HELPER
>>>>> -   imply EXTCON
>>>>> +   select EXTCON
>>>>>     depends on RC_CORE || !RC_CORE
>>>>>     help
>>>>>       Silicon Image SII8620 HDMI/MHL bridge chip driver.
>>>>
>>>>
>>>> Thanks. Works For Me.
>>>>
>>>> Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested
>>>
>>> Actually I can upgrade that to:
>>>
>>> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
>>
>> Hi,
>> Is anyone merging this patch?
>>
>> thanks.
>> --


-- 
~Randy

