Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B1421261B
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 16:24:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 730D26E94C;
	Thu,  2 Jul 2020 14:24:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 614556E94C
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 14:24:06 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200702142405euoutp01406d57d5b27022127d69303c159712c6~d9ZC71cRg0656606566euoutp01I
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 14:24:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200702142405euoutp01406d57d5b27022127d69303c159712c6~d9ZC71cRg0656606566euoutp01I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1593699845;
 bh=//LXM4/HTvL6WYgoxxkZWqAQvhLUGYM0Ek5/xXeKpMo=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=b3sxOBpjDvjPa42ZZy3qlEKHj60BMAduJIBnu4dOjDEgvGz7GQSHP8HHh5Vt2ZGUn
 nda93IUni2XkOmBhv2jGWok7BW9+N8xDoUC7dBBqGlXZblKKeGO+Uoxg0Y/YuiUA/I
 qxnLk3urTGx3XSMg8tZ/4R0avLubp0bk+7sGORf0=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200702142404eucas1p2c09b4e5243d0565547e6ed3773ab92b8~d9ZCrBVRR1436014360eucas1p29;
 Thu,  2 Jul 2020 14:24:04 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id EF.79.05997.40EEDFE5; Thu,  2
 Jul 2020 15:24:04 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200702142404eucas1p29aad1027cfe7f37f7978bcdde2bff421~d9ZCR_LfI1430314303eucas1p2r;
 Thu,  2 Jul 2020 14:24:04 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200702142404eusmtrp106891f7824aab08f5fa46ca96bab1f79~d9ZCRNbh62233522335eusmtrp1N;
 Thu,  2 Jul 2020 14:24:04 +0000 (GMT)
X-AuditID: cbfec7f4-677ff7000000176d-54-5efdee04a6c2
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id FC.9C.06314.40EEDFE5; Thu,  2
 Jul 2020 15:24:04 +0100 (BST)
Received: from [106.210.123.115] (unknown [106.210.123.115]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200702142403eusmtip1efda640323c7e185c7a51b53422d6bf3~d9ZBOK-NU0493804938eusmtip1X;
 Thu,  2 Jul 2020 14:24:02 +0000 (GMT)
Subject: Re: [RFC PATCH v5 2/6] interconnect: Add generic interconnect
 driver for Exynos SoCs
To: Georgi Djakov <georgi.djakov@linaro.org>
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <0320bbbe-6e51-e5ef-1a2a-a2a2fd815514@samsung.com>
Date: Thu, 2 Jul 2020 16:24:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <d3a45a91-d223-d3a2-a9fb-adadca98c80d@linaro.org>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0hTYRzlu7u7u4rT67T8YVY0JDBKsyJu+SilPwb+I0FE4aMtb2q6Kbtq
 KUQT38+GUtpS85FlA1OXqGn2WOaQLS1Ny3ysUAsDs3BBpWbbrpL/nXN+5/CdAx/JEw3yPcl4
 RQqjVEgTxYQj3tH/e3Af/m01an/DiC9trslBdFtlC59+Z/nCp9/+XCToil4dQZeZ1Tg9NNQq
 oHUzY3x6pLuKoCuHnmB0c9+UgJ7IbLLS8nniuFCi0xYQksmxx4TEXGTAJA/vXJWUtmuRZEm3
 I5w46xgYwyTGpzFKv+BzjnH17d/x5BXxZZVxAlehJq9C5EACdQh6G+qwQuRIiqgmBIaSPB5H
 LAgKJrIEHFlCMNzTw9+IaE1Tdiyi7iFYrHDnTD8QPNfoke3gRkXD9fuPBDbsTu2FxlvLuM3E
 o0wYXBtvwWwHgvKHkpel9oCQCobsG6O4DeOUN6iq2wgb3kJFQmljLcF5XGHg5qzd42D15/YP
 27M8ygM+zN7GOLwTOheq7BuAmheAsbBawNU+AXmZFozDbvDV0L6ue4GxvBjnAlkIinsmBBxR
 IzAbahHnCoDJwT/WGqT1CR9o6fbj5BB49rkZs8lAOcP7BVeuhDOUdVTwOFkI+bkizu0Ny9qK
 9QqeUDS7hquRWLNpmmbTHM2mOZr/79YiXIs8mFRWHsuwBxTMJV9WKmdTFbG+55PkOmT9Zca/
 BksX6l6R6RFFIrGTUG1YjRLxpWlsulyPgOSJ3YWhr4xRImGMND2DUSZFK1MTGVaPtpG42EN4
 sH4+UkTFSlOYBIZJZpQbV4x08FShIJ+jmBvh+/FFwmicfDBi+kysOcx9awxjOmYyzfGqy+ZE
 a+FBng4XSmXLu7bPkxcPv6lSufxiI06VLL9WDAWra5ZkvSf5JrlTWH5fjDGsrvnu2HhbeHYA
 +2kmNW13SXzviPeca4glsDOIcAFZ6JHW02kDD5grjTmR00+7/MMyxDgbJ/Xfw1Oy0n8K02rf
 YQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrAIsWRmVeSWpSXmKPExsVy+t/xu7os7/7GGbxaLWpxf14ro8XGGetZ
 La5/ec5qceXrezaL6Xs3sVlMuj+BxeL8+Q3sFpseX2O1uLxrDpvFjPP7mCzWHrnLbnG7cQWQ
 O/klmwOvx6ZVnWwed67tYfO4332cyWPzknqPvi2rGD0+b5ILYIvSsynKLy1JVcjILy6xVYo2
 tDDSM7S00DMysdQzNDaPtTIyVdK3s0lJzcksSy3St0vQy1i05QNLwR+liobTt1kaGFfIdDFy
 ckgImEisOnOXtYuRi0NIYCmjxN5tb9i7GDmAElIS81uUIGqEJf5c62KDqHnPKLFn8j8mkISw
 QLzE0SkHmEFsEQEdiaWzf7OAFDELnGGSOLrsKSNExz0mic5tPSwgVWwChhK9R/sYQWxeATuJ
 lmlXweIsAioSDXM3soHYogKxEt/ubWGDqBGUODnzCVgNJ1B927FLYL3MAuoSf+ZdYoawxSVu
 PZnPBGHLS2x/O4d5AqPQLCTts5C0zELSMgtJywJGllWMIqmlxbnpucWGesWJucWleel6yfm5
 mxiBsbvt2M/NOxgvbQw+xCjAwajEwzvh+N84IdbEsuLK3EOMEhzMSiK8TmdPxwnxpiRWVqUW
 5ccXleakFh9iNAV6biKzlGhyPjCt5JXEG5oamltYGpobmxubWSiJ83YIHIwREkhPLEnNTk0t
 SC2C6WPi4JRqYExoP2Z56N9P6Q/JT7c+lrBMYdmeF7Fz3qTmJWlZq2UOff11Pc6TT084K2TJ
 7J6bmbXX2sWDL+YbP9pvwdii+cPIu0C5sJ35rsKxDA7j5cnHTP7+2negrP1GdvVxnRne3CLB
 xvcuB+qse/5oZ/bLVSuDz3A5uv8zcAqXcz7N9i/y2//WawbCPEosxRmJhlrMRcWJAHiDkMDz
 AgAA
X-CMS-MailID: 20200702142404eucas1p29aad1027cfe7f37f7978bcdde2bff421
X-Msg-Generator: CA
X-RootMTR: 20200529163223eucas1p2f663280abb499b4114b2f2930b43a4e5
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200529163223eucas1p2f663280abb499b4114b2f2930b43a4e5
References: <20200529163200.18031-1-s.nawrocki@samsung.com>
 <CGME20200529163223eucas1p2f663280abb499b4114b2f2930b43a4e5@eucas1p2.samsung.com>
 <20200529163200.18031-3-s.nawrocki@samsung.com>
 <f7f76798-4ee7-6e4a-fa3e-1acb0af76c2e@linaro.org>
 <1c277836-efdf-f7b8-aa62-7369349fe21f@samsung.com>
 <d3a45a91-d223-d3a2-a9fb-adadca98c80d@linaro.org>
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
Cc: linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com,
 sw0312.kim@samsung.com, a.swigon@samsung.com, krzk@kernel.org,
 linux-kernel@vger.kernel.org, cw00.choi@samsung.com, myungjoo.ham@samsung.com,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 m.szyprowski@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02.07.2020 14:33, Georgi Djakov wrote:
> On 7/2/20 15:01, Sylwester Nawrocki wrote:
>> On 01.07.2020 14:50, Georgi Djakov wrote:
>>> On 5/29/20 19:31, Sylwester Nawrocki wrote:

>>>> +static int exynos_generic_icc_remove(struct platform_device *pdev)
>>>> +{
>>>> +	struct exynos_icc_priv *priv = platform_get_drvdata(pdev);
>>>> +	struct icc_node *parent_node, *node = priv->node;
>>>> +
>>>> +	parent_node = exynos_icc_get_parent(priv->dev->parent->of_node);
>>>> +	if (parent_node && !IS_ERR(parent_node))
>>>
>>> Nit: !IS_ERR_OR_NULL?
>>
>> It was left on purpose that way but I changed it now to IS_ERR_OR_NULL.
> 
> Well, i have no strong opinion on that, it's up to you.

I will leave it as you suggested, otherwise we are likely to see
"clean up" patches sooner or later.
 
>>>> +		icc_link_destroy(node, parent_node);
>>>> +
>>>> +	icc_nodes_remove(&priv->provider);
>>>> +	icc_provider_del(&priv->provider);
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static int exynos_generic_icc_probe(struct platform_device *pdev)
>>>> +{
>>>> +	struct device *bus_dev = pdev->dev.parent;
>>>> +	struct exynos_icc_priv *priv;
>>>> +	struct icc_provider *provider;
>>>> +	struct icc_node *icc_node, *icc_parent_node;
>>>> +	int ret;
>>>> +
>>>> +	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
>>>> +	if (!priv)
>>>> +		return -ENOMEM;
>>>> +
>>>> +	priv->dev = &pdev->dev;
>>>> +	platform_set_drvdata(pdev, priv);
>>>> +
>>>> +	provider = &priv->provider;
>>>> +
>>>> +	provider->set = exynos_generic_icc_set;
>>>> +	provider->aggregate = icc_std_aggregate;
>>>> +	provider->xlate = exynos_generic_icc_xlate;
>>>> +	provider->dev = bus_dev;
>>>> +	provider->inter_set = true;
>>>> +	provider->data = priv;
>>>> +
>>>> +	ret = icc_provider_add(provider);
>>>
>>> Nit: Maybe it would be better to move this after the node is created. The
>>> idea is to create the nodes first and add the provider when the topology is
>>> populated. It's fine either way here, but i am planning to change this in
>>> some of the existing provider drivers.
>>
>> OK, it makes the clean up path a bit less straightforward. And still we need 
>> to register the provider before calling icc_node_add().
>> I made a change as below.
>>
>> --------------8<------------------
>> @@ -124,14 +123,14 @@ static int exynos_generic_icc_probe(struct platform_device *pdev)
>>  	provider->inter_set = true;
>>  	provider->data = priv;
>>  
>> +	icc_node = icc_node_create(pdev->id);
>> +	if (IS_ERR(icc_node))
>> +		return PTR_ERR(icc_node);
>> +
>>  	ret = icc_provider_add(provider);
>> -	if (ret < 0)
>> +	if (ret < 0) {
>> +		icc_node_destroy(icc_node->id);
>>  		return ret;
>> -
>> -	icc_node = icc_node_create(pdev->id);
>> -	if (IS_ERR(icc_node)) {
>> -		ret = PTR_ERR(icc_node);
>> -		goto err_prov_del;
>>  	}
>>  
>>  	priv->node = icc_node;
>> @@ -171,9 +170,7 @@ static int exynos_generic_icc_probe(struct platform_device *pdev)
>>  		icc_link_destroy(icc_node, icc_parent_node);
>>  err_node_del:
>>  	icc_nodes_remove(provider);
>> -err_prov_del:
>>  	icc_provider_del(provider);
>> -
>>  	return ret;
>>  }
>> --------------8<------------------
> 
> Actually i need to post some patches first, so maybe keep it as is for now and
> we will update it afterwards. Sorry for the confusion.

OK, anyway this helped me to remove a memory leak, which was there since
icc_nodes_remove() was used before a call to icc_node_add() in order 
to free the node allocated with icc_node_create(), instead of 
icc_node_destroy().

>>> All looks good to me, but it seems that the patch-set is not on
>>> Rob's radar currently, so please re-send and CC the DT mailing list.
>>
>> Thanks, indeed I missed some mailing list when posting. I will make sure
>> Rob and DT ML list is on Cc, especially that I have added new "bus-width" 
>> property in v6.
> 
> Ok, good. I have been thinking about bus-width and we might want to make it
> even a generic DT property if there are multiple platforms which want to
> use it - maybe if the bus-width is the same across the whole interconnect
> provider. But as most of the existing drivers have different bus-widths, i
> haven't done it yet, but let's see and start a discussion.

I see, it sounds good to me. Having an array property to allow specifying
bus width for each node is probably not so good idea.

-- 
Regards,
Sylwester
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
