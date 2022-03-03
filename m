Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E463A4CC255
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 17:11:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 000AB10E295;
	Thu,  3 Mar 2022 16:11:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C7DC10E295
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 16:11:05 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20220303161103euoutp0149062c479d618a7497e4de6328477b9f~Y6tTQyUJ21952619526euoutp01Q
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 16:11:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20220303161103euoutp0149062c479d618a7497e4de6328477b9f~Y6tTQyUJ21952619526euoutp01Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1646323863;
 bh=Z4qtBHD+IaW1qt8mrP82zLA3GASfxYr/MqtXGiS++Dg=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=G1sf3pCXUdXWOi6WDVUF2oLamXm6OtVfDzrIQO1nYgPDJGllBLLKnXndzB5joGIMb
 D08QIdmOJ6AwjarSOl6CTfsbidDlF5oneKcZxI8JG/InDVBKO8Q7Bu5v2YbCguAczn
 5Z8t9A6w1PfxMOLdc/wkVuZIfjMZ8I4ZdU5aOIoc=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20220303161103eucas1p1db7d35ec764af9156e3485a1a93060f0~Y6tTFv1oV1092010920eucas1p1P;
 Thu,  3 Mar 2022 16:11:03 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id CC.AB.10260.798E0226; Thu,  3
 Mar 2022 16:11:03 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20220303161102eucas1p2c7ca1ee3cd5925371e2f2876f7325b69~Y6tSnklBv0419604196eucas1p2C;
 Thu,  3 Mar 2022 16:11:02 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20220303161102eusmtrp10a75f749e399c49f56c9410f01945ee3~Y6tSm41g01072610726eusmtrp1n;
 Thu,  3 Mar 2022 16:11:02 +0000 (GMT)
X-AuditID: cbfec7f5-bf3ff70000002814-81-6220e8970c16
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id E7.49.09404.698E0226; Thu,  3
 Mar 2022 16:11:02 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20220303161102eusmtip2f3da8ac62cb4ad071c0e7e5b02e9da89~Y6tSIRXOa3233932339eusmtip2N;
 Thu,  3 Mar 2022 16:11:02 +0000 (GMT)
Message-ID: <ac077b37-5861-594f-560f-654f9257959d@samsung.com>
Date: Thu, 3 Mar 2022 17:11:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v3 RESEND 21/24] drm/exynos/decon5433: add local path
 support
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Inki Dae
 <inki.dae@samsung.com>, Andrzej Hajda <andrzej.hajda@intel.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <9c1dc8ee-c717-377b-879c-0706a1613cf3@canonical.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCKsWRmVeSWpSXmKPExsWy7djP87rTXygkGbx+ImRxf/FnFosrX9+z
 WUy6P4HFYuPbH0wWM87vY3Jg9ZjV0MvmsXjPSyaP+93HmTz6tqxi9Pi8SS6ANYrLJiU1J7Ms
 tUjfLoEr41PjK+aCTsGKn2+WsjUwPubtYuTkkBAwkTi3cA5LFyMXh5DACkaJXe9/MkM4Xxgl
 Nh2aBJX5zCjRePUxG0zLlu0LmCASyxkljv/9zAiSEBL4yChxbB1YEa+AncSEZatZuxg5OFgE
 VCQOP3eCCAtKnJz5hAXEFhVIknhwoI8dxBYWCJbo3tENZjMLiEvcejIfbL6IQDujxJunrWwQ
 CTeJxrv3mEFsNgFDia63XWBxTgFHiRM35kPVyEs0b50N9oKEwAUOiR2/OxghrnaROH77FiuE
 LSzx6vgWdghbRuL05B4WiIZmRomH59ayQzg9jBKXm2ZAdVtL3Dn3iw3kHWYBTYn1u/Qhwo4S
 2599ZgcJSwjwSdx4KwhxBJ/EpG3TmSHCvBIdbUIQ1WoSs46vg1t78MIl5gmMSrOQwmUWkv9n
 IXlnFsLeBYwsqxjFU0uLc9NTi43zUsv1ihNzi0vz0vWS83M3MQITzul/x7/uYFzx6qPeIUYm
 DsZDjBIczEoivJaaCklCvCmJlVWpRfnxRaU5qcWHGKU5WJTEeZMzNyQKCaQnlqRmp6YWpBbB
 ZJk4OKUamBhUb+fdnHUzIYtxx9EzPY6yq0sWF+2/OOVyicTClvrF/34//On84VruPJ0AwQSH
 zmshB9kmSMelv3vbcciulGf5iotB0/7ZCR0Jks24ue5KgovtvwPXfRgKuQ8Vx2Q9e/wh7nrb
 /RLH/RWBgW+WJt63u3ksa5XUgo7HXVGm4pMs4kMcPf3fd5qu0/Hf9VqxxmfNwxbZs/fsFvFn
 KW/5rTd75/eiFdsXaMhcuSZ0r4HpsaFs8cP+SEH3pi0yWxdvrihJmO9iL3zjtF7Wki8VP+ct
 b4s9+1t8WlBG0lnXtNqXic83W0Sv+yHE/pC/fK5IzWKmJ6Yx9qwF002WmqzUuLpRV9pgdiCv
 8izB7a3M7kosxRmJhlrMRcWJAOYguBSnAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKIsWRmVeSWpSXmKPExsVy+t/xe7rTXigkGbzZbmRxf/FnFosrX9+z
 WUy6P4HFYuPbH0wWM87vY3Jg9ZjV0MvmsXjPSyaP+93HmTz6tqxi9Pi8SS6ANUrPpii/tCRV
 ISO/uMRWKdrQwkjP0NJCz8jEUs/Q2DzWyshUSd/OJiU1J7MstUjfLkEv41PjK+aCTsGKn2+W
 sjUwPubtYuTkkBAwkdiyfQFTFyMXh5DAUkaJvdu+sUMkZCROTmtghbCFJf5c62LrYuQAKnrP
 KLG8GCTMK2AnMWHZalaQMIuAisTh504QYUGJkzOfsIDYogJJEi+3bQSbIiwQLNG9oxtsOrOA
 uMStJ/PB1ooItDNK/Hx+kwUi4SbRePceM8Q995kkzu58yAySYBMwlOh6C3IDJwengKPEiRvz
 2SAazCS6tnYxQtjyEs1bZzNPYBSaheSQWUgWzkLSMgtJywJGllWMIqmlxbnpucVGesWJucWl
 eel6yfm5mxiB8bXt2M8tOxhXvvqod4iRiYPxEKMEB7OSCK+lpkKSEG9KYmVValF+fFFpTmrx
 IUZTYGBMZJYSTc4HRnheSbyhmYGpoYmZpYGppZmxkjivZ0FHopBAemJJanZqakFqEUwfEwen
 VAOTUd6JPy8TrtrttrD0VQ/e/yph75WIpx1n0/vEXsTPm2fCwrkvY+qPirYqDyfZUh+fnZed
 3R4ymwt+MPbSuTH541b5KU2zp5lkZVxkWe35rLFl9gXZw5tnnrY8Z6XyPjTBek/NQYuakn2L
 Wcy+pQeYnN3a6eAjujXrT1bBzashu6am19Zkurm29a80OLPk7HpZltUtH7Q2Hszfnvs3M3dN
 Z+/UzH8zL8+J3/B/a5WFQZLgpZKaI+/nPZxXtE695TGzLEeD+tTkxhzLSZbaOf6Tbn+WWvvE
 OOpVaofPD65NKmbXc2Z0X2WJWfgwa8Vz2Zn3s6MCHZS1A0Pk+rwO1q55LCMkw+ag7f1ln1Lh
 CUElluKMREMt5qLiRAACoYq2OAMAAA==
X-CMS-MailID: 20220303161102eucas1p2c7ca1ee3cd5925371e2f2876f7325b69
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190325071401eucas1p10df709b256570f1aba9cbc4e875da1b3
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190325071401eucas1p10df709b256570f1aba9cbc4e875da1b3
References: <20190325071349.22600-1-a.hajda@samsung.com>
 <CGME20190325071401eucas1p10df709b256570f1aba9cbc4e875da1b3@eucas1p1.samsung.com>
 <20190325071349.22600-22-a.hajda@samsung.com>
 <b3c98aa3-751b-acc4-8e57-5566af27f922@canonical.com>
 <6270db2d-667d-8d6f-9289-be92da486c25@samsung.com>
 <9c1dc8ee-c717-377b-879c-0706a1613cf3@canonical.com>
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
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Krzysztof,

On 03.03.2022 17:03, Krzysztof Kozlowski wrote:
> On 02/03/2022 02:00, Inki Dae wrote:
>> 22. 2. 7. 01:51에 Krzysztof Kozlowski 이(가) 쓴 글:
>>> On 25/03/2019 08:13, Andrzej Hajda wrote:
>>>> GSCALERs in Exynos5433 have local path to DECON and DECON_TV.
>>>> They can be used as extra planes with support for non-RGB formats and scaling.
>>>> To enable it on DECON update_plane and disable_plane callback should
>>>> be modified. Moreover DSD mux should be set accordingly, and finally
>>>> atomic_check callback should be used to limit the number of active planes.
>>>>
>>>> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
>>>> ---
>>>>   drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 80 +++++++++++++++----
>>>>   drivers/gpu/drm/exynos/regs-decon5433.h       |  6 ++
>>>>   2 files changed, 72 insertions(+), 14 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/ex
>>> Hi guys!
>>>
>>> I am working on DRM bindings conversion to DT schema format and I found
>>> this set only partially applied. I merged the DTS patches ("dsd" clock),
>>> but I think the driver and bindings were not picked up.
>>>
>>> Nevertheless I am going to include the "dsd" clock in the new bindings,
>>> so the DTS passes DT schema checks. Let me know if other approach
>>> (revert of DTS change) should be taken.
>>>
>> Sorry for late response.
>>
>> As of now, "dsd" is a dead property not used anywhere.
>> This patch series makes real user not to work correctly due to ABI change.
>> How about reverting it until this patch series is merged after fixing the real user problem?
> The Exynos5433 DECON bindings were already merged by Rob, so someone
> would need to send a revert. However this does not answer the actual
> question - whether the "dsd" clock is necessary, whether it is there
> (routed to DECON). If it is, it should stay in the bindings.

It is routed to DECON hardware and enabling it is needed to make the so 
called 'local path' (when DECON takes image data directly from the 
GSCALER hardware block instead of the memory buffer) working.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

