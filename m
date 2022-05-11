Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2F3523B89
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 19:29:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3141A1124A2;
	Wed, 11 May 2022 17:29:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A286D1124A2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 17:29:40 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20220511172938euoutp01cb4ede6190ba81b923cc7e77a7ea6e7b~uHSnTj0YD1455214552euoutp01T
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 17:29:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20220511172938euoutp01cb4ede6190ba81b923cc7e77a7ea6e7b~uHSnTj0YD1455214552euoutp01T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1652290178;
 bh=Hy3IgoOlIYsrEOFGO4Xqy+pmLgI03cVvuJvDrZD0rjA=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=eRKDibC+3Jb14gPQicpfSkF9r/cj9znXraAB6yXtJ5ZMBM0dbKI50sCqwdkr4qGs2
 R1OcKRLSrxiCF2jGY+jT0GiI/4A6g0cxDNeTE0iaiAUkElA4XXSlteDEskjOpvJFw4
 gShX72kYM/NoJF6oUrzz5cdmTCN0bMSqDLqdvAlY=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20220511172937eucas1p26abebf61b05bd2d552fe99bed77e793d~uHSmUNnmH0247702477eucas1p2N;
 Wed, 11 May 2022 17:29:37 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 14.4B.09887.182FB726; Wed, 11
 May 2022 18:29:37 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20220511172936eucas1p114b5a124b5f444e745f8a24e2fd4447e~uHSlPvP8d0371003710eucas1p1J;
 Wed, 11 May 2022 17:29:36 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20220511172936eusmtrp176c1cb3a78cc34f221c8495e84df880b~uHSlN2MAV2223222232eusmtrp1A;
 Wed, 11 May 2022 17:29:36 +0000 (GMT)
X-AuditID: cbfec7f4-45bff7000000269f-6e-627bf281c364
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 63.3E.09522.082FB726; Wed, 11
 May 2022 18:29:36 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20220511172935eusmtip21f33bc69c11eff23579a6457f9f35b95~uHSkRMZoT1320913209eusmtip2J;
 Wed, 11 May 2022 17:29:35 +0000 (GMT)
Message-ID: <e3aa060b-f7ab-403f-53be-5fbb8b22226c@samsung.com>
Date: Wed, 11 May 2022 19:29:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH V2 0/3] DSI host and peripheral initialisation ordering
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, DRI Development
 <dri-devel@lists.freedesktop.org>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <c94fceb7-20d6-b7e4-a8cd-6a2f459990d6@denx.de>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sf0xTVxjNfe/18WhS82glXNiYrBuSOYcDNnMjk4xsk6dmEXXLjBhngRdg
 awvps1t1GSkRCBRkrZgINQgLnSjrcNaWH/6YoQELY9INqWGTraKgYotdKeBw4Eb7cOO/c853
 Tr7z3VwKF+vJGKpAeZBVKWVyKSkk2q/NO18rmf4i+/WhtrXo6GA/hub8Ogy5mwME+qfdgKOp
 hmYCXT/dTSKDc55Ew7M+Es1Y9CS639gGUL/XRaBKgykMfe23EchbXgJQeeVpAbLXZKEx23EB
 mjaO4cjqNQjeljDf+d0CxjdSFsac1P5CMKeMfQRzZa6JYCa+soUxXcbflwYV9QKm+fIkxlha
 K0mmTz+EMaM3L5NMx9xtAXOqfyfjrnJgTFnvEyIzYq/wrVxWXvAZq9qQdkCYPzk9gRXpYjQN
 TbeAFpgjdSCcgvQbsNRpAjogpMT0GQCvNPeQPJkBsHJBj/EkAOD44n3Bs0hHw+NlVwuAVd0m
 gid+AIdr+8igS0SnwYaKRSyICToeHqk24bweAfvrx4kgjqSzodfrCukSejvUn9CHsjgdBX8b
 bwytXk3fwKBzwCwIEpyexaHPMRlKkHQS1E3pQolwOhV62i3L6TXwiO0kHgxAulwI66ZKSb74
 u7DMyteAtAQ+dFjDePw8HKitXqpELeFCuFiXwssaeNNjXranwtHBJ2TQgtOvwHMXN/ByOjS6
 upaTq+DIVATfYBU81n4C52URrCgX8+610Oho+29n989DuB5IjStexbjieuOKW4z/720CRCuI
 YtWcIo/lkpXs54mcTMGplXmJOYUKC1j6tANPHTOdoOWhP9EOMArYAaRw6WrR1RpNtliUKzt0
 mFUVfqxSy1nODp6jCGmUKKfge5mYzpMdZD9l2SJW9WyKUeExWixnh/Vw/L3SpNp7se7ezvX7
 0izOjT9uvV28sPeQZF/Gpm2t5xWPPGdws2W0nv4re1YZO6J+Ne7OWbK7prrlo5gd9sTBDK3J
 26XpJeMeXTB92Weti30/ej1U//HO2K8dL65JeMH8Xjq7XfNBjylTnjr89/Sf6JOtuIHeldIT
 q7Rd3ZRe4Kv5Id3n2agM39mavFgd9yD+Q5LhSi7s1hk6LYFvf3r5wf6j3K5Lzqy7m7XJF88N
 Fd34Zk9HywFXlXzcpub2BKJdjzPPe1K7NudHFl73HYtTSLYUT7zkz1DcUvSQ+z25CVtKG+OJ
 4jvXFqLrn7ojqKRtgbvzKSrZOtGbCZccWdFSgsuXJa3DVZzsXzcpFSQjBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMKsWRmVeSWpSXmKPExsVy+t/xe7oNn6qTDDrmS1r0njvJZPHtYxeT
 xf3Fn1ks/m+byGzxdu5iFouzyw6yWUw8/5PN4srX92wWXzZNYLN4Pn8do8XJN1dZLDonLmG3
 WPhxK4vFm7ZGRou2zmWsFof6oi0ebp3CavFp1kNmiy1vJrI6CHus/Xif1eP9jVZ2j9kNF1k8
 5s06weKx99sCFo+n/VvZPXbOuguU6JjJ6rF4z0smj02rOtk8Tky4xORx59oeNo/t3x6wesw7
 Gehxv/s4k0fr0V8sAYJRejZF+aUlqQoZ+cUltkrRhhZGeoaWFnpGJpZ6hsbmsVZGpkr6djYp
 qTmZZalF+nYJehkvPz1lKuiSqpi74DZjA+Ma0S5GTg4JAROJ7XO/s3UxcnEICSxllOiacJIF
 IiEjcXJaAyuELSzx51oXVNF7RonfW9eAJXgF7CTmdvxlArFZBFQlmnuWMEPEBSVOznwCNIiD
 Q1QgSeLIYX6QsLCAt8SE6RPYQGxmAXGJW0/mM4HMFBG4zCTR8/8AI4jDLPCTWeLAvftgC4QE
 OpklOleCXcQmYCjR9bYLrJtTwFri9bZNUJPMJLq2djFC2PISzVtnM09gFJqF5I5ZSBbOQtIy
 C0nLAkaWVYwiqaXFuem5xYZ6xYm5xaV56XrJ+bmbGIGpZduxn5t3MM579VHvECMTB+MhRgkO
 ZiUR3v19FUlCvCmJlVWpRfnxRaU5qcWHGE2BgTGRWUo0OR+Y3PJK4g3NDEwNTcwsDUwtzYyV
 xHk9CzoShQTSE0tSs1NTC1KLYPqYODilGpjU/lcf+XCtiS9bJv1kb7WHUdlJwQN/gxb6V7ZU
 nPMV3ifDIpa086dli7TDxffmAe6OpsdnXbI9dUPhFFNKwfyNSyQkORdnGcQ0hq1f//onx/My
 oeNlqR31Ttlzl+8K9k5K27bmW8VhMZbkB4WCbYtY7RY0XOzffmbF7Z/8xz9IKK3d7SOxdoFO
 oay25c/dhl8dtzr8M9dTYXFYZ3607SYz6567D9LmT1EWuxV09HrLqcx2+5snHBULvS0lYry+
 Jt0vPv9s4zqHNZP/fzZQzAln9PrpmFt4s3hT9UIv9YWFd4+kejFWd03dbPX582MWqzetzCo5
 H/km2+/nnKpSeHDhVzfPlvv2zsu3rHxs+1GJpTgj0VCLuag4EQDBHzC7tgMAAA==
X-CMS-MailID: 20220511172936eucas1p114b5a124b5f444e745f8a24e2fd4447e
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
 <c94fceb7-20d6-b7e4-a8cd-6a2f459990d6@denx.de>
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
Cc: Jagan Teki <jagan@amarulasolutions.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Raphael GALLAIS-POU - foss <raphael.gallais-pou@foss.st.com>,
 Jonas Karlman <jonas@kwiboo.se>, Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Andrzej Hajda <andrzej.hajda@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11.05.2022 17:47, Marek Vasut wrote:
> On 5/11/22 16:58, Marek Szyprowski wrote:
>> Hi Dave,
>>
>> On 05.04.2022 13:43, Dave Stevenson wrote:
>>> On Fri, 18 Mar 2022 at 12:25, Dave Stevenson
>>> <dave.stevenson@raspberrypi.com>  wrote:
>>>> On Fri, 4 Mar 2022 at 15:18, Dave Stevenson
>>>> <dave.stevenson@raspberrypi.com>  wrote:
>>>>> Hi All
>>>> A gentle ping on this series. Any comments on the approach?
>>>> Thanks.
>>> I realise the merge window has just closed and therefore folks have
>>> been busy, but no responses on this after a month?
>>>
>>> Do I give up and submit a patch to document that DSI is broken and 
>>> no one cares?
>>
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
>>
>>
>> The only remaining thing to resolve is the moment of enabling DSI host.
>> The proper sequence is:
>>
>> 1. host power on, 2. device power on, 3. host init, 4. device init, 5.
>> video enable.
>
> +CC Raphael, STM32MP1 has similar topic.
>
>> #1 is done in dsi's pre_enable, #2 is done in panel's prepare. #3 was so
>> far done in the first host transfer call, which usually happens in
>> panel's prepare, then the #4 happens. Then video enable is done in the
>> enable callbacks.
>>
>> Jagan wants to move it to the dsi host pre_enable() to let it work with
>> DSI bridges controlled over different interfaces
>> (https://lore.kernel.org/all/20220504114021.33265-6-jagan@amarulasolutions.com/ 
>>
>> ). This however fails on Exynos with DSI panels, because when dsi's
>> pre_enable is called, the dsi device is not yet powered. I've discussed
>> this with Andrzej Hajda and we came to the conclusion that this can be
>> resolved by adding the init() callback to the struct mipi_dsi_host_ops.
>> Then DSI client (next bridge or panel) would call it after powering self
>> on, but before sending any DSI commands in its pre_enable/prepare 
>> functions.
>>
>> I've prepared a prototype of such solution. This approach finally
>> resolved all the initialization issues! The bridge chain finally matches
>> the hardware, no hack are needed, and everything is controlled by the
>> DRM core. This prototype also includes the Jagan's patches, which add
>> IMX support to Samsung DSIM. If one is interested, here is my git repo
>> with all the PoC patches:
>>
>> https://protect2.fireeye.com/v1/url?k=fc60b660-9deba379-fc613d2f-74fe485cbfec-6741e6fb26af486e&q=1&e=07baacdb-540b-46fa-be0f-f534635150ec&u=https%3A%2F%2Fgithub.com%2Fmszyprow%2Flinux%2Ftree%2Fv5.18-next-20220511-dsi-rework 
>>
>
> Can you CC me on the iMX DSIM discussion/patches ? It seems I was left 
> out of it all, even though I work with the iMX8M DRM stuff extensively.


https://lore.kernel.org/all/20220504114021.33265-1-jagan@amarulasolutions.com/

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

