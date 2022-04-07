Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E82344F7E04
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 13:24:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEC7910E6DC;
	Thu,  7 Apr 2022 11:24:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C7D810E6DC
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 11:24:44 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20220407112442euoutp0260b18ba5d6f96d790da0ae0bf6749042~jmYRgPauB0191601916euoutp02C
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 11:24:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20220407112442euoutp0260b18ba5d6f96d790da0ae0bf6749042~jmYRgPauB0191601916euoutp02C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1649330682;
 bh=vjRisTLYuWjKcbGI8nSAS9yA5mwWMUdL2Jg/z3fc27M=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=CZP0H3u6g8hLKUxEzi969w6SwnATwTAW4JH8ICpH4MHleC0e6mBKrO8vvTZ22m+zy
 GEg0Is4qM7wyAhglq7+UfKPuigt/a0fDy6bWQBQ1DPSJ1L6O5e12qrBeBIxRhUQcqH
 6oM3U+4D1VBIKp2kIKi5Qm7xFTcTnKkLnXd696qE=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20220407112441eucas1p2a30ef15449e6cd6a3dd14a89ea2a469b~jmYREjnHw2449324493eucas1p2y;
 Thu,  7 Apr 2022 11:24:41 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 70.BE.10260.9F9CE426; Thu,  7
 Apr 2022 12:24:41 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20220407112441eucas1p1d577502ed059109d147f481432b9c2c6~jmYQpusSX1424914249eucas1p1M;
 Thu,  7 Apr 2022 11:24:41 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20220407112441eusmtrp118fe987fdc877d2fb05295b9ad461896~jmYQo4h_d0924509245eusmtrp1_;
 Thu,  7 Apr 2022 11:24:41 +0000 (GMT)
X-AuditID: cbfec7f5-bf3ff70000002814-58-624ec9f91984
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 48.7D.09404.9F9CE426; Thu,  7
 Apr 2022 12:24:41 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20220407112440eusmtip2f0e052ccbedfa4036011da4320050f15~jmYP7ePXV0933209332eusmtip2O;
 Thu,  7 Apr 2022 11:24:40 +0000 (GMT)
Message-ID: <4fda3d0b-e787-ece5-5357-228b852c1667@samsung.com>
Date: Thu, 7 Apr 2022 13:24:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v6 0/6] drm: exynos: dsi: Convert drm bridge
Content-Language: en-US
To: Robert Foss <robert.foss@linaro.org>, Adam Ford <aford173@gmail.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <CAG3jFytFrzzXVWODccVBKaiD+ZeW-Kt7sazVdTiXxdUGjdVyNw@mail.gmail.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCKsWRmVeSWpSXmKPExsWy7djPc7o/T/olGWyYZWJx5/ZpZov7iz+z
 WFz5+p7NYtL9CSwWXzZNYLPonLiE3WL5hH1sFqcaW1ksDvVFW3ya9ZDZYsXPrYwO3B5rP95n
 9Xh/o5XdY+esu+wesztmsnos3vOSyePOtT1sHve7jzN5LJl2lc2jb8sqxgDOKC6blNSczLLU
 In27BK6Mc/NPMhV8VKlovdDF2sB4V66LkZNDQsBEYt7W80xdjFwcQgIrGCVm/XvAAuF8YZRY
 MXEyK4TzmVFi85c5jDAtR/uboRLLGSUaTr1nhHA+Mkq8OHmVGaSKV8BO4vKJOawgNouAisSF
 2wtYIOKCEidnPgGzRQWSJFZvX80GYgsLOEi8mdzHBGIzC4hL3HoyH8wWEfCQWLV9O9hNzALz
 mYEa/rODJNgEDCW63naBNXMKBEpse/aOBaJZXqJ562xmiFNnc0psOZsJYbtIbD3fxg5hC0u8
 Or4FypaROD25B6iXA8jOl/g7wxgiXCFx7fUaqDHWEnfO/WIDKWEW0JRYv0sfIuwo0fRoBjNE
 J5/EjbeCEAfwSUzaNh0qzCvR0SYEUa0mMev4OridBy9cYp7AqDQLKUxmIfl9FpJXZiHsXcDI
 sopRPLW0ODc9tdg4L7Vcrzgxt7g0L10vOT93EyMwoZ3+d/zrDsYVrz7qHWJk4mA8xCjBwawk
 wluV65MkxJuSWFmVWpQfX1Sak1p8iFGag0VJnDc5c0OikEB6YklqdmpqQWoRTJaJg1OqgWnF
 2m+T91Sc3Xu6P159ZdunfVo7H/Q/3mzeX3RutvxmU2au/wt/b6/5/23+iy2TNG5sd9qhP/VT
 0dST2x6eNKgW/ZWqcaVScf72G4FzRWJ9Q5OrJyveW7RX6IiAV3uZUsG+l+m3jwVv+OW2/MzZ
 lOq7DjzRK0ojUoJ3Tb+52HPx5fiCGdZWtq1ekXuXbIuedK8pNjbx1flD50t9VRSCdUxPNQQv
 mvHnttG12KZtGaXTo2b+sJ2/+8AC1c/RC3eKSJremTnneZPIlB9/tRo/r3vPEurE4+mfGjVf
 qqp96Zkl32VDHijf86jOl9ydXlz03l8qz2Z9ix2rTI+9+uTDP+ff3/jackXdwan6y1PvF5nO
 VWIpzkg01GIuKk4EAImZDc3XAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrFIsWRmVeSWpSXmKPExsVy+t/xe7o/T/olGRw7KGZx5/ZpZov7iz+z
 WFz5+p7NYtL9CSwWXzZNYLPonLiE3WL5hH1sFqcaW1ksDvVFW3ya9ZDZYsXPrYwO3B5rP95n
 9Xh/o5XdY+esu+wesztmsnos3vOSyePOtT1sHve7jzN5LJl2lc2jb8sqxgDOKD2bovzSklSF
 jPziElulaEMLIz1DSws9IxNLPUNj81grI1MlfTublNSczLLUIn27BL2Mc/NPMhV8VKlovdDF
 2sB4V66LkZNDQsBE4mh/M2sXIxeHkMBSRon9HXMZIRIyEienNbBC2MISf651sUEUvWeU+HVh
 FxNIglfATuLyiTlgRSwCKhIXbi9ggYgLSpyc+QTMFhVIkrjU1Q42VFjAQeLN5D6wXmYBcYlb
 T+aD2SICHhKrtm9nAVnALLCYWWLP8Q4miG03mCS2r3wNVsUmYCjR9RbkDE4OToFAiW3P3rFA
 TDKT6NraxQhhy0s0b53NPIFRaBaSQ2YhWTgLScssJC0LGFlWMYqklhbnpucWG+kVJ+YWl+al
 6yXn525iBEbytmM/t+xgXPnqo94hRiYOxkOMEhzMSiK8Vbk+SUK8KYmVValF+fFFpTmpxYcY
 TYGhMZFZSjQ5H5hK8kriDc0MTA1NzCwNTC3NjJXEeT0LOhKFBNITS1KzU1MLUotg+pg4OKUa
 mLJ36b9+/XEFe25zNuPX014nlqnOe5fMxFlTzn2y6kosk9j0E2+2c8y6VqKwYGMY7+3851eS
 JiQpL5NSY04v6pfM4zmpUyB3ajoXr+SFdpUjPb0hwguObz81eepVqy3xeXMMG/d/THDOP1wq
 nNQwo+/wZ65b73Zd8ow6xGxl0Lm4uKZmx/OAy4d233xjXjKhxHi2Tmh08cSAa2FL37MffqE5
 bWGqj+el6cyi2csammamPS/Y4xtnm/BvfUSQqVVkVKdQ16qHa6suXXxgOX3lzVvvCqZzxRVI
 LVL0K9oZ19ErdqYzbk1SyNK+9ElpTt9+T7k4//33DRpB7uW685MPhix0S1B98mFu3uyJ2p+/
 WCuxFGckGmoxFxUnAgBW6qBYbQMAAA==
X-CMS-MailID: 20220407112441eucas1p1d577502ed059109d147f481432b9c2c6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20220303163725eucas1p26c4a165b20dd629f2129926b1b662154
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220303163725eucas1p26c4a165b20dd629f2129926b1b662154
References: <CGME20220303163725eucas1p26c4a165b20dd629f2129926b1b662154@eucas1p2.samsung.com>
 <20220303163654.3381470-1-jagan@amarulasolutions.com>
 <e104d9cf-73da-330a-db5a-d914839b273c@samsung.com>
 <CAHCN7xKpHFhRKSWQNPFjpav4B=LgipuVY5wNdkCYNQu71GS9Bg@mail.gmail.com>
 <CAG3jFytFrzzXVWODccVBKaiD+ZeW-Kt7sazVdTiXxdUGjdVyNw@mail.gmail.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Sam Ravnborg <sam@ravnborg.org>, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dear All,

On 31.03.2022 16:22, Robert Foss wrote:
> On Fri, 25 Mar 2022 at 17:04, Adam Ford <aford173@gmail.com> wrote:
>> On Fri, Mar 25, 2022 at 10:00 AM Marek Szyprowski
>> <m.szyprowski@samsung.com> wrote:
>>> On 03.03.2022 17:36, Jagan Teki wrote:
>>>> Updated series about drm bridge conversion of exynos dsi.
>>>>
>>>> Previous version can be accessible, here [1].
>>>>
>>>> Patch 1: tc358764 panel_bridge API
>>>>
>>>> Patch 2: connector reset
>>>>
>>>> Patch 3: bridge attach in MIC
>>>>
>>>> Patch 4: panel_bridge API
>>>>
>>>> Patch 5: bridge conversion
>>>>
>>>> Patch 6: atomic functions
>>>>
>>>>
>>>>
>>>> Any inputs?
>>>
>>> I'm really sorry for the delay on my side. I was really busy with other
>>> things and I was not able to check the display of the boards with remote
>>> access.
>>>
>>>
>>> Finally, this patchset works properly on all my Exynos-based test systems:
>>>
>>> 1. Exynos4210 Trats with Samsung s6e8aa0 DSI panel
>>>
>>> 2. Exynos4412 Trats2 with Samsung s6e8aa0 DSI panel
>>>
>>> 3. Exynos5250 Arndale with TC358764 DSI-LVDS bridge and LVDS panel
>>>
>>> 4. Exynos5433 TM2e with Samsung s6e3hf2 DSI panel and internal Exynos
>>> MIC bridge
>>>
>>>
>>> I will post my acked-by and tested-by tags for each patch.
>> Thank you so much!  I think a lot of people will celebrate when this
>> gets approved and merged.  ;-)
>>
>>
> Applied to drm-misc-next.


Thanks for merging this. Today (once the patches landed in linux-next) I 
found that there is one more issue left to fix.

On the Exynos4210-based Trats board I get the following error:

# ./modetest -c -Mexynos
could not get connector 56: No such file or directory
Segmentation fault

#

Surprisingly, all other boards, even Exynos4412-based Trats2 with 
exactly the same DSI controller and panel works fine:

# ./modetest -c -Mexynos
Connectors:
id      encoder status          name            size (mm) modes   encoders
71      70      connected       DSI-1           58x103 1       70
   modes:
         name refresh (Hz) hdisp hss hse htot vdisp vss vse vtot)
   720x1280 60 720 725 730 735 1280 1293 1295 1296 57153 flags: ; type: 
preferred, driver
   props:
         1 EDID:
                 flags: immutable blob
                 blobs:

                 value:
         2 DPMS:
                 flags: enum
                 enums: On=0 Standby=1 Suspend=2 Off=3
                 value: 0
         5 link-status:
                 flags: enum
                 enums: Good=0 Bad=1
                 value: 0
         6 non-desktop:
                 flags: immutable range
                 values: 0 1
                 value: 0
         4 TILE:
                 flags: immutable blob
                 blobs:

                 value:
         20 CRTC_ID:
                 flags: object
                 value: 54
73      0       connected       HDMI-A-1        0x0 0       72
   props:
         1 EDID:
                 flags: immutable blob
                 blobs:

                 value:
         2 DPMS:
                 flags: enum
                 enums: On=0 Standby=1 Suspend=2 Off=3
                 value: 0
         5 link-status:
                 flags: enum
                 enums: Good=0 Bad=1
                 value: 0
         6 non-desktop:
                 flags: immutable range
                 values: 0 1
                 value: 0
         4 TILE:
                 flags: immutable blob
                 blobs:

                 value:
         20 CRTC_ID:
                 flags: object
                 value: 0

(the only difference between Trats and Trats2 is the fact that Trats2 
has also HDMI output implemented).

It looks that something is missing in the connector initialization, but 
I didn't dig enough into it. The emulated framebuffer is properly 
registered and displayed on the panel.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

