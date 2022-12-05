Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 207E3642A1C
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 15:10:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E936D10E072;
	Mon,  5 Dec 2022 14:10:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B82E010E072
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Dec 2022 14:10:45 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20221205141044euoutp01c4e094c26daf66d8eba1fa22ab03a297~t6wUeCNtG2730527305euoutp01T
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Dec 2022 14:10:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20221205141044euoutp01c4e094c26daf66d8eba1fa22ab03a297~t6wUeCNtG2730527305euoutp01T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1670249444;
 bh=1FnWs5NlhK/IcYzuuu1bSm04a7tkIdV5CeIDyp4i0Pk=;
 h=Date:Subject:From:To:Cc:In-Reply-To:References:From;
 b=XF4Ye/nl1Fu1JkBLzfNnCyBdryD4ShLUgmp1Fvdus/0+WYGyO6267jgPlKr73joIm
 iCtIuzrrMXMi/sN1mjHa7N5yLzt+3pg7uFHb3yOuYRfgcS8wrgsZ1tlRXkjUVG0q72
 ciMNQTZlfxYLgoEyoWd8YDSfkLf1Xx8E5S1pR+zc=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20221205141043eucas1p23b100143b3189778ddde93f5e5b1e2a3~t6wULfbIe2222322223eucas1p2w;
 Mon,  5 Dec 2022 14:10:43 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 00.5B.09549.3EBFD836; Mon,  5
 Dec 2022 14:10:43 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20221205141043eucas1p104a1e77304da5b5b8b287c10d9d00daa~t6wTsLVsw1614716147eucas1p1G;
 Mon,  5 Dec 2022 14:10:43 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20221205141043eusmtrp23d9766abbaddc434e21ea033505174c4~t6wTnbJro3234132341eusmtrp2L;
 Mon,  5 Dec 2022 14:10:43 +0000 (GMT)
X-AuditID: cbfec7f5-f5dff7000000254d-d4-638dfbe322f1
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id A6.E5.09026.2EBFD836; Mon,  5
 Dec 2022 14:10:43 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20221205141042eusmtip2a56af7237c75db6751c32fdb5c37033d~t6wTEEwSq2339423394eusmtip2N;
 Mon,  5 Dec 2022 14:10:42 +0000 (GMT)
Message-ID: <edbee2a1-abef-e74c-1651-3401fe234b41@samsung.com>
Date: Mon, 5 Dec 2022 15:10:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [v2,5/6] drm/fb-helper: Schedule deferred-I/O worker after
 writing to framebuffer
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, javierm@redhat.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
In-Reply-To: <81399603-6253-b671-85c7-373f196b73ed@samsung.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFKsWRmVeSWpSXmKPExsWy7djP87qPf/cmG6x8r2px4voiJouFD+8y
 W/zfNpHZ4srX92wWC6ctZ7RYMJvbYuLtDewWCz9uZbFo61zGarHlzURWBy6Pvd8WsHjsnHWX
 3WPTqk42j3knAz3udx9n8ti8pN7j/b6rbB6bT1cHcERx2aSk5mSWpRbp2yVwZezoXMBUcE+w
 Yv71BuYGxgt8XYycHBICJhJzFyxi72Lk4hASWMEosWP1LiYI5wujROuZTawQzmdGiYOdm5hg
 Wmbf2ABVtZxR4viPfVBVHxklZmzbzQZSxStgJ7H6QxsLiM0ioCLRfH8PVFxQ4uTMJ2BxUYEU
 iQM7z4JNFRZIkPg28RMjiM0sIC5x68l8sDibgKFE19susF4RgXmMEot/JIAsYxZYzSixcsM7
 oAQHB6eAvcSPh/YQvfISzVtnM4PUSAi0c0pc7O6EOttF4k1HHzuELSzx6vgWKFtG4v/O+UxQ
 DYwSC37fh3ImMEo0PL/FCFFlLXHn3C+wbcwCmhLrd+lDhB0lFuzqZgcJSwjwSdx4KwhxBJ/E
 pG3TmSHCvBIdbUIQ1WoSs46vg1t78MIl5gmMSrOQgmUWkvdnIXlnFsLeBYwsqxjFU0uLc9NT
 i43zUsv1ihNzi0vz0vWS83M3MQKT1+l/x7/uYFzx6qPeIUYmDsZDjBIczEoivC829iYL8aYk
 VlalFuXHF5XmpBYfYpTmYFES510xpSNZSCA9sSQ1OzW1ILUIJsvEwSnVwNQ5e1vM+sulGuee
 XO2dpbpNX3v7OaUC/XexJ7akbZ53dd9L7YsKjiYzzqa/nPVb6Mmi6i16+Q72rc7y/TNbGqpL
 35dkcRT2+P65M/HMYyvuE677WVPW6/qeiVeabfpt6of5XdGftadNclbeZMEx50bh/cwsxZ82
 PqLTpm6ODVKRdst7ttjyvt/TMtU0ric6i9/75bUqbeK7J2IZ5Znrf3p9mJdz1R335oNfExZ8
 bJ94ytmoRa7MtLyPJdjxzVVt/wOfTM+UJl2zXSo8q+YUo7ucjyy/sNy9iUsy5IRe2nPteXx5
 43tZ5g2XNfp9pI+W9uZusbv36HVQ1yf70uhnhsHRjvNuq0xdFFzjn/48TomlOCPRUIu5qDgR
 AC9wjSPNAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrLIsWRmVeSWpSXmKPExsVy+t/xe7qPf/cmGzSvZLY4cX0Rk8XCh3eZ
 Lf5vm8hsceXrezaLhdOWM1osmM1tMfH2BnaLhR+3sli0dS5jtdjyZiKrA5fH3m8LWDx2zrrL
 7rFpVSebx7yTgR73u48zeWxeUu/xft9VNo/Np6sDOKL0bIryS0tSFTLyi0tslaINLYz0DC0t
 9IxMLPUMjc1jrYxMlfTtbFJSczLLUov07RL0MnZ0LmAquCdYMf96A3MD4wW+LkZODgkBE4nZ
 NzYwdTFycQgJLGWU+Px0FytEQkbi5LQGKFtY4s+1LjaIoveMEs8ntzGCJHgF7CRWf2hjAbFZ
 BFQkmu/vYYOIC0qcnPkELC4qkCLR3vOPCcQWFkiQ+DbxE1gvs4C4xK0n88HibAKGEl1vIRaI
 CMxjlLhy/AIjiMMssJpR4s//XkaI1cuZJGYfOQLUwsHBKWAv8eOhPcQkM4murV1QU+UlmrfO
 Zp7AKDQLySGzkCychaRlFpKWBYwsqxhFUkuLc9Nzi430ihNzi0vz0vWS83M3MQLjdduxn1t2
 MK589VHvECMTB+MhRgkOZiUR3hcbe5OFeFMSK6tSi/Lji0pzUosPMZoCQ2Mis5Rocj4wYeSV
 xBuaGZgamphZGphamhkrifN6FnQkCgmkJ5akZqemFqQWwfQxcXBKNTB1tBsVvHY8tOcSj9Wv
 I7mKjNlGU+Rs5lybZ3zGtOPOW78vj20qcooVl3SLtr2+fsm+xOXIhlQB/+3KylnGX3d/zv1s
 XdAgKHQ0sJS/PPxPe1+nXebf5y5LLVjEGBQK/s3cvuyuQPwRmalPdl4wqbc6zWlsErRf8kvC
 myubOP9EOAvs/ZhV1M+4eofHIvG6dfKZnn/fWc64mxlbfvZw9a85l85c2HJ58wS+4OC1mi9u
 VV3lfaX4SI7rYrK9T42k8xHtdwzHPtrJbpiuV9ek/NydNzTdpqug8ufD9QwvK6cKK1/tPzmp
 o//Zr5fWmlt31afKhqn0Om/3Mvb4r358SUHFzrflm7cvaD2nslzHwlyJpTgj0VCLuag4EQDV
 iL3lYAMAAA==
X-CMS-MailID: 20221205141043eucas1p104a1e77304da5b5b8b287c10d9d00daa
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20221117125800eucas1p29bc0adbe623ca0c42e903e771bf68b33
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20221117125800eucas1p29bc0adbe623ca0c42e903e771bf68b33
References: <20221115115819.23088-6-tzimmermann@suse.de>
 <CGME20221117125800eucas1p29bc0adbe623ca0c42e903e771bf68b33@eucas1p2.samsung.com>
 <ee076724-cee3-cd6a-de44-191e058fddbb@samsung.com>
 <1424be58-3f19-7ed4-e3c9-5517c05032f2@suse.de>
 <81399603-6253-b671-85c7-373f196b73ed@samsung.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17.11.2022 18:21, Marek Szyprowski wrote:
> On 17.11.2022 17:07, Thomas Zimmermann wrote:
>> Am 17.11.22 um 13:57 schrieb Marek Szyprowski:
>>> On 15.11.2022 12:58, Thomas Zimmermann wrote:
>>>> Schedule the deferred-I/O worker instead of the damage worker after
>>>> writing to the fbdev framebuffer. The deferred-I/O worker then 
>>>> performs
>>>> the dirty-fb update. The fbdev emulation will initialize deferred I/O
>>>> for all drivers that require damage updates. It is therefore a valid
>>>> assumption that the deferred-I/O worker is present.
>>>>
>>>> It would be possible to perform the damage handling directly from 
>>>> within
>>>> the write operation. But doing this could increase the overhead of the
>>>> write or interfere with a concurrently scheduled deferred-I/O worker.
>>>> Instead, scheduling the deferred-I/O worker with its regular delay of
>>>> 50 ms removes load off the write operation and allows the deferred-I/O
>>>> worker to handle multiple write operations that arrived during the 
>>>> delay
>>>> time window.
>>>>
>>>> v2:
>>>>     * keep drm_fb_helper_damage() (Daniel)
>>>>     * use fb_deferred_io_schedule_flush() (Daniel)
>>>>     * clarify comments (Daniel)
>>>>
>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>>
>>> This patch, merged into today's linux-next as commit 7f5cc4a3e5e4
>>> ("drm/fb-helper: Schedule deferred-I/O worker after writing to
>>> framebuffer"), triggers a following warning on Raspberry Pi 3 & 4 as
>>> well as all Amlogic Meson G12A/B based boards:
>>>
>>> ------------[ cut here ]------------
>>> WARNING: CPU: 0 PID: 220 at drivers/video/fbdev/core/fb_defio.c:340
>>
>> Thank you so much for reporting. That line should never be executed 
>> with vc4 et al.
>>
>> If you have the time, could you please try the attached patch and 
>> report the results. Thanks a lot.
>
> This fixes the issue observed on my Raspberry Pi 3/4 and Amlogic Meson 
> based boards. Feel free to add:
>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

Gentle ping. This issue is not fixed in linux-next.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

