Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C81F74FDF59
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 14:20:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52F3E10E6BE;
	Tue, 12 Apr 2022 12:20:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F7A310E6BE
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 12:20:18 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20220412122016euoutp0194520d3d1c4c90543df91473519edd00~lJXN2U0S22695126951euoutp01s
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 12:20:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20220412122016euoutp0194520d3d1c4c90543df91473519edd00~lJXN2U0S22695126951euoutp01s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1649766016;
 bh=BDybMGA4dDcxZnNOOPbbRFkyFAfQhujZpFD4978121s=;
 h=Date:Subject:From:To:Cc:In-Reply-To:References:From;
 b=R4v8ee0JHeC8scY7FS19HCnOZL2KK2XEUV3pMXCUIRxUlS07w5poiDt1B6JhTD1hT
 WtVWGM9JVumkOpELJReq9IYAubnAVV1oRGa6zNf+3j6nuowlztALmH1EzFdFOg5bo0
 bpmGQUsmPWOHiY9ructqqeFS6KqT3FTIB4MuHxao=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20220412122016eucas1p2a17d71a8ce9739e177073415fc973e6f~lJXNmQQjm2952929529eucas1p22;
 Tue, 12 Apr 2022 12:20:16 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 1D.12.10009.F7E65526; Tue, 12
 Apr 2022 13:20:16 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20220412122015eucas1p197acdf99666ac103d77c041547c0812d~lJXNEYF8v2746627466eucas1p1I;
 Tue, 12 Apr 2022 12:20:15 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20220412122015eusmtrp22b7933427b8bf2cc9c6f0287302c832b~lJXNDeb581343813438eusmtrp2j;
 Tue, 12 Apr 2022 12:20:15 +0000 (GMT)
X-AuditID: cbfec7f2-e95ff70000002719-e8-62556e7f8b39
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 33.81.09404.F7E65526; Tue, 12
 Apr 2022 13:20:15 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20220412122014eusmtip2210bb0cde1992ae02badece8bc50c2cf~lJXMdUuNP1916519165eusmtip2F;
 Tue, 12 Apr 2022 12:20:14 +0000 (GMT)
Message-ID: <f0474a95-4ba3-a74f-d7de-ef7aab12bc86@samsung.com>
Date: Tue, 12 Apr 2022 14:20:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v6 0/6] drm: exynos: dsi: Convert drm bridge
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: Robert Foss <robert.foss@linaro.org>, Adam Ford <aford173@gmail.com>
In-Reply-To: <4fda3d0b-e787-ece5-5357-228b852c1667@samsung.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCKsWRmVeSWpSXmKPExsWy7djPc7oNeaFJBk3hFndun2a2uL/4M4vF
 la/v2Swm3Z/AYvFl0wQ2i86JS9gtlk/Yx2ZxqrGVxeJQX7TFp1kPmS1W/NzK6MDtsfbjfVaP
 9zda2T12zrrL7jG7Yyarx+I9L5k87lzbw+Zxv/s4k8eSaVfZPPq2rGIM4IzisklJzcksSy3S
 t0vgytg47wlrwUvjij+ruxgbGJdodzFyckgImEhc+rGfqYuRi0NIYAWjxJ6jJxghnC+MElt2
 T2eGcD4zSpzrfcYG03KyYx07RGI5o8SCxj6olo+MErNffWUFqeIVsJOY3X2BHcRmEVCVWDDv
 DBtEXFDi5MwnLCC2qECSxOrtq8HiwgIOEm8m9zGB2MwC4hK3nswHs9kEDCW63naB1YgIeEis
 2r6dBWQZs8B8ZqDm/2ALOAXsJbo/TmGEaJaXaN46G+xuCYHpnBLta1uZIO52kTiyfzLUD8IS
 r45vYYewZST+7wTZxgFk50v8nWEMEa6QuPZ6DTOEbS1x59wvNpASZgFNifW79CHCjhJNj2Yw
 Q3TySdx4KwhxAZ/EpG3TocK8Eh1tQhDVahKzjq+D23nwwiXmCYxKs5ACZRaS52ch+WUWwt4F
 jCyrGMVTS4tz01OLDfNSy/WKE3OLS/PS9ZLzczcxAhPa6X/HP+1gnPvqo94hRiYOxkOMEhzM
 SiK8/eqhSUK8KYmVValF+fFFpTmpxYcYpTlYlMR5kzM3JAoJpCeWpGanphakFsFkmTg4pRqY
 JCIvLPiTsVNDM7/2iWro7MA/JwVuaS4OrWHyEFok6rPy1CoDyfANFxLUd5W2pbTxzQp5Lubr
 8rAjY//RsvJFL94dnGayqEszcVqKSIqo1UpPYe7CU9fttALlbN78+9x1Zdn/wmdTu8806h1s
 3L3OqMX+xIzm3O9Lni/w6Np83j5don0+d+Cyr85dKkG3QnuilfR2zhL1MZ+Rnj/B7J1i7Me2
 4nLOo6WyryeGtt1aEJ9ruMwmhm/utoqF61wc+JTMRV2/vlvqMDHGcLF/15nZi7cn31/2/Pb9
 vFS3H931Lzz94qdcMbwr11h06NOWyXzplx3ND9f9dcmYvFThbInj3Y0OjhtSD5RVTr0059UB
 JZbijERDLeai4kQAJMp7LdcDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrFIsWRmVeSWpSXmKPExsVy+t/xe7r1eaFJBosfSVjcuX2a2eL+4s8s
 Fle+vmezmHR/AovFl00T2Cw6Jy5ht1g+YR+bxanGVhaLQ33RFp9mPWS2WPFzK6MDt8faj/dZ
 Pd7faGX32DnrLrvH7I6ZrB6L97xk8rhzbQ+bx/3u40weS6ZdZfPo27KKMYAzSs+mKL+0JFUh
 I7+4xFYp2tDCSM/Q0kLPyMRSz9DYPNbKyFRJ384mJTUnsyy1SN8uQS9j47wnrAUvjSv+rO5i
 bGBcot3FyMkhIWAicbJjHXsXIxeHkMBSRomPz78wQyRkJE5Oa2CFsIUl/lzrYoMoes8o0b97
 MViCV8BOYnb3BXYQm0VAVWLBvDNsEHFBiZMzn7CA2KICSRKXutoZQWxhAQeJN5P7mEBsZgFx
 iVtP5oPZbAKGEl1vu8B6RQQ8JFZt384CsoxZYDGzxJ7jHUwQm3uZJZbubQKbxClgL9H9cQoj
 xCQzia6tXVC2vETz1tnMExiFZiE5ZBaShbOQtMxC0rKAkWUVo0hqaXFuem6xkV5xYm5xaV66
 XnJ+7iZGYCRvO/Zzyw7Gla8+6h1iZOJgPMQowcGsJMLbrx6aJMSbklhZlVqUH19UmpNafIjR
 FBgaE5mlRJPzgakkryTe0MzA1NDEzNLA1NLMWEmc17OgI1FIID2xJDU7NbUgtQimj4mDU6qB
 acUUdXfhVSIS/2/LZix/krvT0PZLZddO352fF/D4MH1lKO26vmXNRu14M5PF0XI6/wvrN6s/
 vPAprtOmObYjLiTv6+6rH7MZjv7yyLzv8mrWrAXhq3fzdmm17Vku/EXz+fSICRz/tz6Q7Gd/
 e4VvM9Pzl+1Cq9IPeZzlnf7/ruV8McHSk59z+l0U2R+J1M2wPt91NTTPrnqH8uxpHPsmP1+u
 sHDKArG0unsnGjU3X+/4oL1h3z/O+7852RasaMi96/H9z93lMrlaAZy/U5aeVI6ZzNhf/dFI
 QZfJ69nbrPhu52c+x0WfJe7MW9LCkLRuhmaV3ELNlhK7sila0WIpjFrXHa/eaOOxe768KDJ9
 ixJLcUaioRZzUXEiAEWGRH1tAwAA
X-CMS-MailID: 20220412122015eucas1p197acdf99666ac103d77c041547c0812d
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
 <4fda3d0b-e787-ece5-5357-228b852c1667@samsung.com>
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

On 07.04.2022 13:24, Marek Szyprowski wrote:
> On 31.03.2022 16:22, Robert Foss wrote:
>> On Fri, 25 Mar 2022 at 17:04, Adam Ford <aford173@gmail.com> wrote:
>>> On Fri, Mar 25, 2022 at 10:00 AM Marek Szyprowski
>>> <m.szyprowski@samsung.com> wrote:
>>>> On 03.03.2022 17:36, Jagan Teki wrote:
>>>>> Updated series about drm bridge conversion of exynos dsi.
>>>>>
>>>>> Previous version can be accessible, here [1].
>>>>>
>>>>> Patch 1: tc358764 panel_bridge API
>>>>>
>>>>> Patch 2: connector reset
>>>>>
>>>>> Patch 3: bridge attach in MIC
>>>>>
>>>>> Patch 4: panel_bridge API
>>>>>
>>>>> Patch 5: bridge conversion
>>>>>
>>>>> Patch 6: atomic functions
>>>>>
>>>>>
>>>>>
>>>>> Any inputs?
>>>>
>>>> I'm really sorry for the delay on my side. I was really busy with 
>>>> other
>>>> things and I was not able to check the display of the boards with 
>>>> remote
>>>> access.
>>>>
>>>>
>>>> Finally, this patchset works properly on all my Exynos-based test 
>>>> systems:
>>>>
>>>> 1. Exynos4210 Trats with Samsung s6e8aa0 DSI panel
>>>>
>>>> 2. Exynos4412 Trats2 with Samsung s6e8aa0 DSI panel
>>>>
>>>> 3. Exynos5250 Arndale with TC358764 DSI-LVDS bridge and LVDS panel
>>>>
>>>> 4. Exynos5433 TM2e with Samsung s6e3hf2 DSI panel and internal Exynos
>>>> MIC bridge
>>>>
>>>>
>>>> I will post my acked-by and tested-by tags for each patch.
>>> Thank you so much!  I think a lot of people will celebrate when this
>>> gets approved and merged.  ;-)
>>>
>>>
>> Applied to drm-misc-next.
>
>
> Thanks for merging this. Today (once the patches landed in linux-next) 
> I found that there is one more issue left to fix.
>
> On the Exynos4210-based Trats board I get the following error:
>
> # ./modetest -c -Mexynos
> could not get connector 56: No such file or directory
> Segmentation fault
>
> #
>
> Surprisingly, all other boards, even Exynos4412-based Trats2 with 
> exactly the same DSI controller and panel works fine:
>
> # ./modetest -c -Mexynos
> Connectors:
> id      encoder status          name            size (mm) modes encoders
> 71      70      connected       DSI-1           58x103 1       70

This is related to the asynchronous DSI driver registration and DSI 
device probe.

If the DSI driver has been registered before the DRM component device 
bind, everything is fine: the DRM connector is created by 
panel_bridge_attach() and then that connector is registered to userspace 
by the drm_modeset_register_all() in the last steps of initializing the 
compound DRM device.

However, when DSI driver is not yet registered during the DRM component 
bind, the DRM device finishes registration without any connector 
('exynos-drm exynos-drm: [drm] Cannot find any crtc or sizes' message). 
Then, when DSI driver gets registered, the connector is created by 
panel_brige_attach(), but there is no code, which would call 
drm_connector_register() to make it available for userspace.

Exactly the same issue has been earlier fixed by the commit deee3284cba3 
("drm/exynos/dsi: register connector if it is created after drm bind").

The following patch fixes this with the current code:

diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index ff1c37b2e6e5..2165f38989f1 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -86,6 +86,9 @@ static int panel_bridge_attach(struct drm_bridge *bridge,
         if (connector->funcs->reset)
                 connector->funcs->reset(connector);

+       if (bridge->dev->registered)
+               drm_connector_register(connector);
+
         return 0;
  }

If this is okay, I will send it as a proper patch, tagged as a fix for 
934aef885f9d ("drm: bridge: panel: Reset the connector state pointer").

> modes:
>         name refresh (Hz) hdisp hss hse htot vdisp vss vse vtot)
>   720x1280 60 720 725 730 735 1280 1293 1295 1296 57153 flags: ; type: 
> preferred, driver
>   props:
>         1 EDID:
>                 flags: immutable blob
>                 blobs:
>
>                 value:
>         2 DPMS:
>                 flags: enum
>                 enums: On=0 Standby=1 Suspend=2 Off=3
>                 value: 0
>         5 link-status:
>                 flags: enum
>                 enums: Good=0 Bad=1
>                 value: 0
>         6 non-desktop:
>                 flags: immutable range
>                 values: 0 1
>                 value: 0
>         4 TILE:
>                 flags: immutable blob
>                 blobs:
>
>                 value:
>         20 CRTC_ID:
>                 flags: object
>                 value: 54
> 73      0       connected       HDMI-A-1        0x0 0       72
>   props:
>         1 EDID:
>                 flags: immutable blob
>                 blobs:
>
>                 value:
>         2 DPMS:
>                 flags: enum
>                 enums: On=0 Standby=1 Suspend=2 Off=3
>                 value: 0
>         5 link-status:
>                 flags: enum
>                 enums: Good=0 Bad=1
>                 value: 0
>         6 non-desktop:
>                 flags: immutable range
>                 values: 0 1
>                 value: 0
>         4 TILE:
>                 flags: immutable blob
>                 blobs:
>
>                 value:
>         20 CRTC_ID:
>                 flags: object
>                 value: 0
>
> (the only difference between Trats and Trats2 is the fact that Trats2 
> has also HDMI output implemented).
>
> It looks that something is missing in the connector initialization, 
> but I didn't dig enough into it. The emulated framebuffer is properly 
> registered and displayed on the panel.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

