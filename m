Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A090C5082F9
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 09:56:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A94B210F1E3;
	Wed, 20 Apr 2022 07:56:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A89210F1D3
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 07:56:06 +0000 (UTC)
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20220420075603epoutp0355df51dfd859b313d5101f87a727673b~ni6z9nHPm3035830358epoutp03d
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 07:56:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20220420075603epoutp0355df51dfd859b313d5101f87a727673b~ni6z9nHPm3035830358epoutp03d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1650441363;
 bh=M9HvEE5NcKQUrqGqE6i+kOsIDLbwyBOY5HTkit9ErSo=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=fnhXvvBaVOLFzSxumWLXHhSItgJ0TGpRIzocsRiXxhlOC3BqCaqm+MWs+wMVV4Mbj
 jvIUMw5O2NF47lbADL8xqQMaviIFliK7EkueWTbliMxnyRnO6BO98CoX4T4z6VplCt
 nAbkofz4m21UCMwhGZose3eBsZlVVDxZ9PUdiaDQ=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20220420075602epcas1p475c3b660e87635fc49f66378abdb95bd~ni6zSs41o3004030040epcas1p4G;
 Wed, 20 Apr 2022 07:56:02 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.36.144]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4KjtJx5kpjz4x9Q3; Wed, 20 Apr
 2022 07:56:01 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
 epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 C9.FE.39539.19CBF526; Wed, 20 Apr 2022 16:56:01 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20220420075601epcas1p4a80b77be683df8ccd68be008d57f3100~ni6xr9q2W2990329903epcas1p4B;
 Wed, 20 Apr 2022 07:56:01 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20220420075601epsmtrp2e96a1f16bf6e5e87ae4d00516c30d02d~ni6xlxmod2136621366epsmtrp2G;
 Wed, 20 Apr 2022 07:56:01 +0000 (GMT)
X-AuditID: b6c32a36-c1dff70000019a73-91-625fbc91c095
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 87.28.03370.09CBF526; Wed, 20 Apr 2022 16:56:00 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20220420075600epsmtip2185b9e32f61ab60a62757711346c655f~ni6xPEwJ92729127291epsmtip2R;
 Wed, 20 Apr 2022 07:56:00 +0000 (GMT)
Message-ID: <3b31ce4d-02ca-cdde-9c17-553102e8c149@samsung.com>
Date: Wed, 20 Apr 2022 17:08:30 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm/exynos: fix IS_ERR() vs NULL check in probe
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@oracle.com>
From: Inki Dae <inki.dae@samsung.com>
In-Reply-To: <20220412041936.GK12805@kadam>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOJsWRmVeSWpSXmKPExsWy7bCmnu7EPfFJBrvW6Fr0njvJZPFg3jY2
 i9f/prNY/N82kdniytf3bBZfNk1gs9h6S9pi7+ut7BZnm96wW8w4v4/JYu2Ru+wWn2Y9ZLaY
 MfklmwOvx9qP91k99n5bwOJx59oeNo/t3x6wetzvPs7k8fHpLRaPvi2rGD0+b5IL4IjKtslI
 TUxJLVJIzUvOT8nMS7dV8g6Od443NTMw1DW0tDBXUshLzE21VXLxCdB1y8wBOllJoSwxpxQo
 FJBYXKykb2dTlF9akqqQkV9cYquUWpCSU2BaoFecmFtcmpeul5daYmVoYGBkClSYkJ3xavka
 xoJ2wYrr284zNTBO5+ti5OSQEDCR2PFjP0sXIxeHkMAORolvf1ZBOZ8YJX4c280G4XxmlDiw
 /iQzTMuza1uhqnYxSszZtIQZwnnPKPF25iUmkCpeATuJOXcfsoDYLAKqEo8u/2CHiAtKnJz5
 BCwuKhAh8evWI7C4sICLxLalnWAbmAXEJW49mQ82R0RAR+JyJ0gvF1C8l0XiX8NpsCI2oKET
 V9xnA7E5BbQllm6YzATRLC/RvHU22EUSAjc4JD5uvwZ1t4vE52l72SFsYYlXx7dA2VISn9/t
 ZYNomMwocef6ChYIZwajxOGf1xkhqowl9i8FWcEBtEJTYv0ufYiwosTO33MZITbzSbz72sMK
 UiIhwCvR0SYEUaIkceziDagpEhIXlkxkg7A9JGbe/c02gVFxFlLAzEIKgFlI/pmFsHgBI8sq
 RrHUguLc9NRiwwIjeIQn5+duYgSnaC2zHYyT3n7QO8TIxMF4iFGCg1lJhDd0ZnySEG9KYmVV
 alF+fFFpTmrxIUZTYPRMZJYSTc4HZom8knhDE0sDEzMjYxMLQzNDJXHeVdNOJwoJpCeWpGan
 phakFsH0MXFwSjUw2T4pnjRrRqb/Qgalk29ij5xvy7uyXWftoRUPbsa6Lzz4sV2v+vND7vK9
 X/TfKV4rj+PMvKLr/VE0zD8s/EDQYSGGXf2x84usJt37+e23xCylz4feXq2yDum+npe/9Ypt
 2pNVW8oefnXfkjrF8JY2s8+V+bJ8IQcf/37Mu8ROlPmDZ1yn1QNOnifRdxk4dkgppAbO3FH9
 I2KRRBcj/1Tt2LvLzyv4f1V6sIzRzlx59YubRy4GyLD4p0Z+jDmrqLl5R62vaArL8u+tL/6J
 3iy3q1p39OeS81kX0ucvMljM3G//zWTjrsX7380pnN7l2f7Jsq8wds4CbZkwz5jad98PsV8p
 1zs87fbXJa8rwttkE5RYijMSDbWYi4oTAbX28phaBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGIsWRmVeSWpSXmKPExsWy7bCSvO6EPfFJBvvbzC16z51ksngwbxub
 xet/01ks/m+byGxx5et7NosvmyawWby4d5HFYustaYu9r7eyW5xtesNuMeP8PiaLtUfuslt8
 mvWQ2WLG5JdsDnweaz/eZ/XY+20Bi8eda3vYPLZ/e8Dqcb/7OJPHx6e3WDz6tqxi9Pi8SS6A
 I4rLJiU1J7MstUjfLoEr49XyNYwF7YIV17edZ2pgnM7XxcjJISFgIvHs2laWLkYuDiGBHYwS
 J8/OBnI4gBISElu2ckCYwhKHDxdDlLxllFi2agMbSC+vgJ3EnLsPWUBsFgFViUeXf7BDxAUl
 Ts58AhYXFYiQWLZrKpgtLOAisW1pJzOIzSwgLnHryXwmEFtEQEficidILxdQfCKLxNw3bxkh
 tl1mlGjbvw6sig1ow8QV98E2cwpoSyzdMJkJ5DpmAXWJ9fOEIIbKSzRvnc08gVFoFpI7ZiHZ
 NwuhYxaSjgWMLKsYJVMLinPTc4sNC4zyUsv1ihNzi0vz0vWS83M3MYKjUktrB+OeVR/0DjEy
 cTAeYpTgYFYS4Q2dGZ8kxJuSWFmVWpQfX1Sak1p8iFGag0VJnPdC18l4IYH0xJLU7NTUgtQi
 mCwTB6dUA9Pab7smpa98+I1p16uEfz9ye30OPHk8m+/fwm4z5rOuM7xPztbt+nNUstmgqH9h
 618O5Y/HWBNatqxSTyqTttlz5nj+xZjz634vYK+3KeubL80Wts9VT+jOiszW8OrqE8osbzNL
 66qWtr94rya63SzNbo7a7iUc2+3lle5Md9q7M/nfnqc/vtyeEnNZaA5Dvt9nj63ue0yvfZTj
 PxSpNUts3ZMLq2YrNvbs5m3N/vDg6N9XZU+O5W54n6XddfjWKumbZUEHhadsnSzkvnvDzkdq
 B6Xn/mlckDMl49npfVOmi/b2mtT+ycqRVK08/XKq5oxwyysTtnw6uCZy/rEA8S7mk/wBZYvX
 8/vsNzf8/ermXCWW4oxEQy3mouJEACguqEM5AwAA
X-CMS-MailID: 20220420075601epcas1p4a80b77be683df8ccd68be008d57f3100
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220408102327epcas1p409b13bf2da7e19b0a24571ce50e3ea92
References: <CGME20220408102327epcas1p409b13bf2da7e19b0a24571ce50e3ea92@epcas1p4.samsung.com>
 <20220408102134.GA14120@kili>
 <c7606920-b5c9-f8e3-3026-631a796c195a@samsung.com>
 <20220412041936.GK12805@kadam>
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
Cc: linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

22. 4. 12. 13:19에 Dan Carpenter 이(가) 쓴 글:
> On Tue, Apr 12, 2022 at 10:01:20AM +0900, Inki Dae wrote:
>> Hi Dan Carpenter.
>>
>> Same patch[1] was posted so I will pick it up. 
>>
>> [1] https://protect2.fireeye.com/v1/url?k=94e9d569-f562c05f-94e85e26-000babff9b5d-4d4f5b20cfffa24c&q=1&e=727c2c54-2082-4e0f-87d7-c6702bf4c81e&u=https%3A%2F%2Fwww.spinics.net%2Flists%2Farm-kernel%2Fmsg967488.html 
>>
> 
> It's not the same.  That one returns -EINVAL and mine returns
> -EPROBE_DEFER.  I obvoiously thought that -EPROBE_DEFER was the correct
> return but I wasn't positive.  -EPROBE_DEFER is kind of a special
> return so I think it matters to get this correct.
> 

Correct so I requested[1] him to fix it but the delivery failed. :( I will just pick your patch up. :)
[Delivery Failure] Re: [PATCH -next] drm/exynos: mic: fix return value check in exynos_mic_probe().

[1] My email sent below,
--------------------
22. 4. 6. 18:22에 Yang Yingliang 이(가) 쓴 글:
 > If of_graph_get_remote_node() fails, it returns NULL pointer, replaces
 > IS_ERR() check with NULL pointer check.
 >
 > Fixes: dd8b6803bc49 ("exynos: drm: dsi: Attach in_bridge in MIC driver")
 > Reported-by: Hulk Robot <hulkci@huawei.com>
 > Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
 > ---
 > drivers/gpu/drm/exynos/exynos_drm_mic.c | 4 ++--
 > 1 file changed, 2 insertions(+), 2 deletions(-)
 >
 > diff --git a/drivers/gpu/drm/exynos/exynos_drm_mic.c 
b/drivers/gpu/drm/exynos/exynos_drm_mic.c
 > index 9e06f8e2a863..43fc357a6682 100644
 > --- a/drivers/gpu/drm/exynos/exynos_drm_mic.c
 > +++ b/drivers/gpu/drm/exynos/exynos_drm_mic.c
 > @@ -434,9 +434,9 @@ static int exynos_mic_probe(struct platform_device *pdev)
 >
 > remote = of_graph_get_remote_node(dev->of_node, 1, 0);
 > mic->next_bridge = of_drm_find_bridge(remote);
 > - if (IS_ERR(mic->next_bridge)) {
 > + if (!mic->next_bridge) {
 > DRM_DEV_ERROR(dev, "mic: Failed to find next bridge\n");
 > - ret = PTR_ERR(mic->next_bridge);
 > + ret = -EINVAL;

-EPROBE_DEFER should be returned instead. Could you modify and resend it again?

> regards,
> dan carpenter
> 
> 
