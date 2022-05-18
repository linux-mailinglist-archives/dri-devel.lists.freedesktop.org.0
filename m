Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8AD52BBAE
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 16:05:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A83B10E390;
	Wed, 18 May 2022 14:05:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D50C10E824
 for <dri-devel@lists.freedesktop.org>; Wed, 18 May 2022 14:05:46 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20220518140544euoutp02ec208ec616d2bf56772afc26eb841393~wOBk5lrKq1609716097euoutp02X
 for <dri-devel@lists.freedesktop.org>; Wed, 18 May 2022 14:05:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20220518140544euoutp02ec208ec616d2bf56772afc26eb841393~wOBk5lrKq1609716097euoutp02X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1652882744;
 bh=QSJXmbJcWQ8ofOjzR+Eo0Sw6MmNsMbJssNSMMeW8qCg=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=DOb9+ghkN2csyqfjUH8sOvY8/U9jRynHC65DShxvHASpaaurOuzqV5W5Lx6e3llLW
 jmwO0cvLdKj20BhMJ+xCvl5GMgZGdiB0b5sr5qEZ1zVH/LhIWLomdRWiSTXr6Ge+rr
 y6whj3MccYT2OiFontJf669VY/C7orT50mUleeLU=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20220518140543eucas1p1c18201145b53c3d9b765074739170465~wOBkn0pMa0596405964eucas1p1E;
 Wed, 18 May 2022 14:05:43 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id CF.21.09887.73DF4826; Wed, 18
 May 2022 15:05:43 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20220518140543eucas1p1f31079ac2aafaa41bf5a9c8563c8555c~wOBj1-dvO0594005940eucas1p1H;
 Wed, 18 May 2022 14:05:43 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20220518140543eusmtrp1d534905945b001e3cf95846240fdf42e~wOBj0yWrm0330603306eusmtrp1Q;
 Wed, 18 May 2022 14:05:43 +0000 (GMT)
X-AuditID: cbfec7f4-471ff7000000269f-82-6284fd37e242
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 04.48.09522.63DF4826; Wed, 18
 May 2022 15:05:42 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20220518140541eusmtip1b9270e23c249e874ee87e1c551159165~wOBiwxfJn2705527055eusmtip1Q;
 Wed, 18 May 2022 14:05:41 +0000 (GMT)
Message-ID: <b4eb6670-79a9-eec0-bbd1-6c5a0e31ff08@samsung.com>
Date: Wed, 18 May 2022 16:05:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH V2 0/3] DSI host and peripheral initialisation ordering
Content-Language: en-US
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <CAPY8ntDR54vaBuwQN2F_j4_rxYgkFmsxc+mKYBn0YLe8=CtxtQ@mail.gmail.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01SfUxTVxzNfe/19SOUPQqGK9tcVnGJM1aQTm7mxGnI8gxLNjYS4yTRAk9s
 RlvX0o0hJpgJ0k5YQRfsUz4WFBSGsNpVK+qgc5SGtXwMGGEiGM10tR2rZd2oQ0Y/3Pjv3HN+
 557fubk8XHScTOLJlcWMWikrEpMCwtK/MLQxffFYXspshxRVuxwYCvj0GJpp8RNoyVKLI29D
 C4GcrX0kqh1aINHYn3MkmjcZSPSg6RJADs84gXS157joK9+3BPJUHgWoUtfKQbaavegxexdH
 Zk8t500R3emb4dBzkxVc+kz5CEE3sgMEfSPQTNBWdnqZqzJy6Jbrv2G0qV1H0gOGUYy+PXGd
 pK8EZjl0oyObnvncjtEVPwQJ+vLg4XepDwRvFDBF8o8Z9aaM/YKDdXf3HqpOK/l9bAErB0fX
 6wGfBykpNPsGcD0Q8ETUBQAv/vUHCAkiah7AL/6WRQQ/gIvlT7jPHD87dVhEaAPwnzZ39OAD
 sNM2F7YLqQx45/yXZAgT1DpotT2M8nHQYbxPhPAqKg96PON4CMdTWdBQbwjP41QinLrfhIVw
 ApUG+9unyVAATo1wYO/04/BFJJUK9V592MCnsmHTj/6o+SV4xXs2XAhSQT6cPlmFR/bOhCf0
 vUQEx0O33Rzt8wIcPHlimectYxVcPJ0WoUvgxKOvo9at8LYrSIZGcGo97Lq2KULvgOy4NeqM
 hZPeuMgGsbDOUo9HaCGsqhRFpl+BrP3Sf5l9w6O4AYjZFY/CrijPrujC/p/bDIh2kMhoNYpC
 RrNZyXwi0cgUGq2yUJKvUpjA8l8dfGqfvwra3D6JDWA8YAOQh4sThEBxLE8kLJB9WsqoVfvU
 2iJGYwPP8whxojBf3i0TUYWyYuZDhjnEqJ+pGI+fVI69fU+/561T50lDc356Q1e8hAnuW2M/
 MPlOzlTZWiSOed3YsGPLA5bIznUO70mwSbrLLOdySzKfC5QGv89a3FwxVfpNSteGDv+qW9t1
 yS/zM+Kt5pwqe3FfHrd1XTVnzKWtx3cFLlOfjaV3b6jbfe/9BHGWvE7QA9a29VwoCuCnVF7L
 8JByyXFRevjpQFxHTnVqB5U/pLs1K/UecH13lt3m2tnlrEjOLNl980hpQYzbpOuZfC3D6t84
 svoXTM4V1xjZLckpu6QFvtSfctml1aPbLI88seTOmNn3erX9NZIRzRPfRyacvtr40Kj69fhW
 5xlFyvayO+7gmoniI53mF5PEhOagLPVVXK2R/Qs3qR8WGgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprDKsWRmVeSWpSXmKPExsVy+t/xu7pmf1uSDLrfWlr0njvJZPHtYxeT
 xf3Fn1ks/m+byGzxdu5iFouzyw6yWUw8/5PN4srX92wWXzZNYLN4Pn8do8XJN1dZLDonLmG3
 WPhxK4vFm7ZGRou2zmWsFof6oi0+zXrIbLHlzURWByGPtR/vs3q8v9HK7jG74SKLx7xZJ1g8
 9n5bwOKxc9ZdoFjHTFaPxXteMnlsWtXJ5nFiwiUmjzvX9rB5bP/2gNVj3slAj/vdx5k8Wo/+
 YvHYfLo6QCBKz6Yov7QkVSEjv7jEVina0MJIz9DSQs/IxFLP0Ng81srIVEnfziYlNSezLLVI
 3y5BL2PSw+iCXuOKd1d+MjUwNmp2MXJySAiYSFw/28nUxcjFISSwlFHi85EnLBAJGYmT0xpY
 IWxhiT/Xutggit4zSlx9Pg+siFfATuLe0qlsIDaLgKrEzkMvGCHighInZ4IM4uAQFUiSOHKY
 HyQsLOAtMWH6BLByZgFxiVtP5jOB2CICxhLHVt0Fm88scJVV4s/5fkaIZfOZJT7d+Qm2jE3A
 UKLrbRdYN6dAoMT8M5+hJplJdG3tYoSw5SW2v53DPIFRaBaSO2YhWTgLScssJC0LGFlWMYqk
 lhbnpucWG+oVJ+YWl+al6yXn525iBCaTbcd+bt7BOO/VR71DjEwcjIcYJTiYlUR4GXNbkoR4
 UxIrq1KL8uOLSnNSiw8xmgIDYyKzlGhyPjCd5ZXEG5oZmBqamFkamFqaGSuJ83oWdCQKCaQn
 lqRmp6YWpBbB9DFxcEo1MK2cf9b90FuhpJvOL/p7Vpx6ER/CGhvW63VM7PT+TU4H7qf6Hr57
 UjHWyXS+kK7T7J2y5wyCXu9rYg6WOjxPuCd995x1OSar78uvNaidZ3nfoDPoq9+K/OcZRtqG
 bXyXFmeddhRm9PiUW3VXQMfr4QpTtdSv394Wu5Xdv3Mu4tZUt/0B+fs7jog86lB8UOog8O70
 slWJm6Tc37Os7p3bMHffJvl9ad1JYd69wenx/ckzP1yq09wo/zZpypnTD622hp0Uf5T3cDFD
 e+uuhbc4z5+z0KqslDNjV9t9xnNq1fKzm/ZkfZ2R8o2Nf7fNXaXqFZdXhUkvsqnlE/uxYj9/
 oGXy/LUmvf+XeTvKTr/+x0CJpTgj0VCLuag4EQDdmB7LrwMAAA==
X-CMS-MailID: 20220518140543eucas1p1f31079ac2aafaa41bf5a9c8563c8555c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20220405114402eucas1p1d139ce6825a481d1318f013cf27a5fe7
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220405114402eucas1p1d139ce6825a481d1318f013cf27a5fe7
References: <cover.1646406653.git.dave.stevenson@raspberrypi.com>
 <CAPY8ntC-2Yij+a5wWEZ3BRBSh7bz+74coHCoB01ZhY550H+BDg@mail.gmail.com>
 <CGME20220405114402eucas1p1d139ce6825a481d1318f013cf27a5fe7@eucas1p1.samsung.com>
 <CAPY8ntAi1tM7BZEpKkMAasRH3R_+tJCUFY7k-yVBdtogvxQNRA@mail.gmail.com>
 <e96197f9-948a-997e-5453-9f9d179b5f5a@samsung.com>
 <CAPY8ntDR54vaBuwQN2F_j4_rxYgkFmsxc+mKYBn0YLe8=CtxtQ@mail.gmail.com>
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
Cc: Marek Vasut <marex@denx.de>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Douglas Anderson <dianders@chromium.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <andrzej.hajda@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave,

On 11.05.2022 17:47, Dave Stevenson wrote:
> On Wed, 11 May 2022 at 15:58, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>> On 05.04.2022 13:43, Dave Stevenson wrote:
>>> On Fri, 18 Mar 2022 at 12:25, Dave Stevenson
>>> <dave.stevenson@raspberrypi.com>  wrote:
>>>> On Fri, 4 Mar 2022 at 15:18, Dave Stevenson
>>>> <dave.stevenson@raspberrypi.com>  wrote:
>>>>> Hi All
>>>> A gentle ping on this series. Any comments on the approach?
>>>> Thanks.
>>> I realise the merge window has just closed and therefore folks have
>>> been busy, but no responses on this after a month?
>>>
>>> Do I give up and submit a patch to document that DSI is broken and no one cares?
>> Thanks for pointing this patchset in the 'drm: bridge: Add Samsung MIPI
>> DSIM bridge' thread, otherwise I would miss it since I'm not involved
>> much in the DRM development.
>>
>> This resolves most of the issues in the Exynos DSI and its recent
>> conversion to the drm bridge framework. I've added the needed
>> prepare_upstream_first flags to the panels and everything works fine
>> without the bridge chain order hacks.
>>
>> Feel free to add:
>>
>> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Thanks for testing it. I was almost at the stage of abandoning the patch set.
>
>> The only remaining thing to resolve is the moment of enabling DSI host.
>> The proper sequence is:
>>
>> 1. host power on, 2. device power on, 3. host init, 4. device init, 5.
>> video enable.
>>
>> #1 is done in dsi's pre_enable, #2 is done in panel's prepare. #3 was so
>> far done in the first host transfer call, which usually happens in
>> panel's prepare, then the #4 happens. Then video enable is done in the
>> enable callbacks.
> What's your definition of host power on and host init here? What state
> are you defining the DSI interface to be in after each operation?

Well, lets start from the point that I'm not a DSI specialist nor I'm 
not the exynos-dsi author. I just played a bit with the code trying to 
restore proper driver operation on the various Exynos based boards I have.

By the host/device power on I mean enabling their power regulators. By 
host init I mean executing the samsung_dsim_init() function, which 
basically sets the lp-11 state if I understand it right.


>> Jagan wants to move it to the dsi host pre_enable() to let it work with
>> DSI bridges controlled over different interfaces
>> (https://lore.kernel.org/all/20220504114021.33265-6-jagan@amarulasolutions.com/
>> ).
> I think I'm in agreement with Jagan.
> As documented in patch 4/4:
> + * A DSI host should keep the PHY powered down until the pre_enable
> operation is
> + * called. All lanes are in an undefined idle state up to this point, and it
> + * must not be assumed that it is LP-11.
> + * pre_enable should initialise the PHY, set the data lanes to LP-11, and the
> + * clock lane to either LP-11 or HS depending on the mode_flag
> + * %MIPI_DSI_CLOCK_NON_CONTINUOUS.

Right, this theory makes sense.

However Exynos DSI for some reasons did the host initialization in the 
first call of the samsung_dsim_host_transfer(). If I moved the host 
initialization to pre_enable (before powering the panel on), executing 
DSI commands failed (timeout). This issue happens on all boards I have 
access (Trats, Trats2, Arndale, TM2e), so this must be an issue with 
Exynos DSI host itself not related to particular panel/bridge.

If I call samsung_dsim_init() once again, before issuing the first DSI 
command, then everything works fine. I've tried to check which part of 
that function is needed to be executed before transferring the commands, 
but it turned out that the complete host reset and (re)configuration is 
necessary. It looks that the initialization will need to be done twice, 
first time in the pre_enable to satisfy Jagan case, then on the first 
dsi transfer to make it work with real DSI panels.

Here is a git repo with such change: 
https://github.com/mszyprow/linux/tree/v5.18-next-20220511-dsi-rework-v2


>> This however fails on Exynos with DSI panels, because when dsi's
>> pre_enable is called, the dsi device is not yet powered.
> Sorry, I'm not following what the issue is here? DSI lanes being at
> LP-11 when the sink isn't powered, so potential for leakage through
> the device?

I also have no idea why sending DSI commands fails if host is 
initialized without device being powered up first. Maybe powering it 
later causes some glitches on the lines? However it looks doing the 
initialization again on the first transfer is enough to fix it.

> In which case the device should NOT set pre_enable_upstream first, and
> the host gets powered up and down with each host_transfer call the
> device makes in pre_enable.

Doing the initialization on each host_transfer also is not an option, 
because in such case the panel is not initialized properly. I get no 
errors, but also there is no valid display on the panel in such case.

> (Whilst I can't claim that I know of every single DSI device, most
> datasheets I've encountered have required LP-11 on the lanes before
> powering up the device).


>> I've discussed
>> this with Andrzej Hajda and we came to the conclusion that this can be
>> resolved by adding the init() callback to the struct mipi_dsi_host_ops.
>> Then DSI client (next bridge or panel) would call it after powering self
>> on, but before sending any DSI commands in its pre_enable/prepare functions.
> You may as well have a mipi_dsi_host_ops call to fully control the DSI
> host state, and forget about changing the pre_enable/post_disable
> order. However it involves even more changes to all the panel and
> bridge drivers.

True. Although setting prepare_upstream_first/pre_enable_upstream_first 
flags also requires to revisit all the dsi panels and bridges.


It looks that I've focused too much on finding a single place of the dsi 
initialization, what resulted in that host_init callback. I can live 
without it, doing the initialization twice.

> If you've added an init hook, don't you also need a deinint hook to
> ensure that the host is restored to the "power on but not inited"
> state before device power off? Currently it feels unbalanced, but
> largely as I don't know exactly what you're defining that power on
> state to be.

So far I had no use case for that deinit hook.


Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

