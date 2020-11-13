Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7859A2B1917
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 11:32:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58A776E47E;
	Fri, 13 Nov 2020 10:32:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E05686E47E
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 10:32:38 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20201113103226euoutp018e462320763a0239a55ffab9f57dfbff~HCrCogFth0802308023euoutp01i
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 10:32:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20201113103226euoutp018e462320763a0239a55ffab9f57dfbff~HCrCogFth0802308023euoutp01i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1605263546;
 bh=K10MK5Wi8CtuwiAAfsiSsNTiWneQD6krBChUBMOq+Ro=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=cPPej3heW9SWT/gVe4Y9hV+V3hgSnFOj/DlDTQUnVlG/coWqLgqnCighIhjHfC4XY
 rsO7x60lTn1S+BwlGXASmw4AP8hpHoe6dYWxQjH9V8gsf4ZFxFmoqPawb+8BMw9D9D
 /Ophdx2BIk/3yj6mFNVJlRuq+1G//9V7ak6r108g=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20201113103225eucas1p2ae8c849aa41b5779a365afd09f9097ca~HCrCU9TCk3237732377eucas1p2M;
 Fri, 13 Nov 2020 10:32:25 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id BC.2A.27958.9B06EAF5; Fri, 13
 Nov 2020 10:32:25 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20201113103225eucas1p2326d979b94a33d018c24a9f526e7a016~HCrB6nRv73235632356eucas1p2S;
 Fri, 13 Nov 2020 10:32:25 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20201113103225eusmtrp1c6d8cd6f5a767bf411c84895acc77319~HCrB5cnTl2016920169eusmtrp1d;
 Fri, 13 Nov 2020 10:32:25 +0000 (GMT)
X-AuditID: cbfec7f2-f15ff70000006d36-56-5fae60b9e56e
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 26.4B.21957.9B06EAF5; Fri, 13
 Nov 2020 10:32:25 +0000 (GMT)
Received: from [106.210.123.115] (unknown [106.210.123.115]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20201113103224eusmtip18c767fb6587650496fa0abf25e4f19ba~HCrA8TQLG2053620536eusmtip1t;
 Fri, 13 Nov 2020 10:32:23 +0000 (GMT)
Subject: Re: [PATCH v9 0/5] Exynos: Simple QoS for exynos-bus using
 interconnect
To: Chanwoo Choi <cw00.choi@samsung.com>, Georgi Djakov
 <georgi.djakov@linaro.org>, inki.dae@samsung.com
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <6687cdd3-6e5b-f3c1-f784-33cc7c0d589a@samsung.com>
Date: Fri, 13 Nov 2020 11:32:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <9cb7e3a6-2a3f-8f46-2bf1-d6d8ea01613b@samsung.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAKsWRmVeSWpSXmKPExsWy7djP87o7E9bFG6w+p25xf14ro8XGGetZ
 La5/ec5qMf/IOVaLK1/fs1lM37uJzWLS/QksFufPb2C32PT4GqvF5V1z2Cw+9x5htJhxfh+T
 xdojd9ktbjeuYLNo3XuE3WLG5JdsDgIem1Z1snncubaHzeN+93Emj81L6j36tqxi9Pi8SS6A
 LYrLJiU1J7MstUjfLoEr4+Cap2wFE7gqFv54xtrA2MnRxcjJISFgInFz7mT2LkYuDiGBFYwS
 x5d/Z4JwvjBKXNjyjBHC+cwocebhWkaYlkuzTrBBJJYzSlyZtxCq5SOjxJybt1hBqoQFgiQm
 3j/CDmKLCGRJrD0xgQWkiFngNZPE4ZvnmUASbAKGEr1H+8DG8grYSZzZcJ4NxGYRUJXY8/8l
 WLOoQJzEhI0tLBA1ghInZz4BszkF7CVeHtgO1sssIC5x68l8JghbXmL72znMIMskBFZzSkz5
 cJgV4m4XiZenrrJD2MISr45vgbJlJE5P7mGBaGhmlOjZfZsdwpnAKHH/+AKor60l7pz7BXQe
 B9AKTYn1u/RBTAkBR4ndW80gTD6JG28FIW7gk5i0bTozRJhXoqNNCGKGisTvVdOZIGwpie4n
 /1kmMCrNQvLZLCTfzELyzSyEtQsYWVYxiqeWFuempxYb5qWW6xUn5haX5qXrJefnbmIEJrrT
 /45/2sE499VHvUOMTByMhxglOJiVRHiVHdbEC/GmJFZWpRblxxeV5qQWH2KU5mBREuddNRso
 JZCeWJKanZpakFoEk2Xi4JRqYNKT/XJrvlheR0vqx4XtUmp8uncPiG+OWlSYfLA9qf6EtsHe
 CJuJf1/eefBhSuYeEyVJIQFul47mj7v3bp939VHIGvagl3MDLq9TfLH7ljzfJi3hysdqs1xc
 Ts3iYegu/mmY8MVZfcpKNz9Tj4q8b1aeaxNXx1b5e/Wyr9lnVfDx5C+b+LZtJ9ZyrE3QfKTE
 W/+lLqhm005/hblf1a2YZFfn39kf9+Hjpor1bo9ULuQxLlhsrmWVHCwQyjnt8D8O3Vv+QkdW
 r9gze6M4D4ckC1Pjso0TmpsatP0myVz6URy8/6aX4Js7TdWTgwVeRiy94vTxz4zSubM+J8fr
 cpbdVtb3PxXOODn1ZxhLS/eSB0osxRmJhlrMRcWJALGYWXDjAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0hTURyAO/dud3fG6LZpncQsFhYo7pWzMy3rD6kVERFEL1KnXaalTna3
 UMmyh1ELTZPQlm1JRUvMdGo2s1KZmShJD7YoRTSdmImZlkt8tLkC//vg933ncPgdEucPsALJ
 lHQdrU1XpQoJP1bnfHtvuC2hKl5S2M9FfaY8gGpKn7CRc2qYjcz2t2z08dc4gUpeWAl0o6+Q
 hbq7qznI+tXBRh8aywg0mW8HqLT7JYYe23s56Mt5C4HyXtg5qLR4hNhBKa0VVwllj6OJUPZd
 a8eUtffPKQvqKoBy0hq8nzgq2qrV6HX0+mQNo9smPCZFMpFUgUSyCIVIunnL8SiZXCiO2XqC
 Tk05TWvFMQmi5JbKISKj0C+z3O1i54KrpAFwSUhFwPfGN4QB+JF86gGArfdu4gZAegaB0HxJ
 6HMEcNZh+OeMA+hsL2F5BwLqACzqs3O87E+dhPcGHCyvhFOjGCwrmub4CjeA1rsLmNciKCnM
 bysAXuZRMbCrupvwMosKgU0LI4snBVBx0F2UT/iclbDj1uDibVxqOxxpblhscWoTnDW9x328
 Gn4eNGM+XgcbxsrwQsA3LsmNSxLjksS4JLkLWBXAn9Yzaeo0RipiVGmMPl0tStKkWYFn2U9f
 /6l9BkzfJkStACNBK4AkLvTnbdhRGc/nnVBlZdNaTbxWn0ozrUDueU8RHhiQpPH8lnRdvDRS
 IpdGRCokckXkZuFqXv0dT0SpVTr6FE1n0Nr/HUZyA3OxWMdazkvLneggyTZJs/hz8KrnDyUZ
 Oa6WWC1PefjiBdKlsF3H9a9cFjaXa5Yc7B/7OlacWX9py5xGNdNYtV/uvM4fsObIQkqcxSuc
 t3flnB242FFcDZwFpdTzjlWPbEc+let7TIKa3p5Pgmfl+urEqBuxXb/XXBbPmciSLObarH1f
 9Oj9FsVBgKiePEtSZYKj47b4lC0qbHouy91vcTPUbMDeAvWyhrqfhqQhHGveE3tkJuhj1e7s
 QxsjZNzw+US1KyFm2cLyV7aRH7cig3de6Gyajxs+MxGqzrd9VwYPTW0Iy8lq/HalISNx41QI
 TG6TmDsFXTNf/FHvu4lRIYtJVklDcS2j+gvpkUyDdQMAAA==
X-CMS-MailID: 20201113103225eucas1p2326d979b94a33d018c24a9f526e7a016
X-Msg-Generator: CA
X-RootMTR: 20201112141041eucas1p1a29130955afd4ec1d5d94cf17183920c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201112141041eucas1p1a29130955afd4ec1d5d94cf17183920c
References: <CGME20201112141041eucas1p1a29130955afd4ec1d5d94cf17183920c@eucas1p1.samsung.com>
 <20201112140931.31139-1-s.nawrocki@samsung.com>
 <b0a8e994-06d2-e04a-579c-40580b71f760@linaro.org>
 <9cb7e3a6-2a3f-8f46-2bf1-d6d8ea01613b@samsung.com>
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org, sw0312.kim@samsung.com, a.swigon@samsung.com,
 robh+dt@kernel.org, linux-kernel@vger.kernel.org, myungjoo.ham@samsung.com,
 krzk@kernel.org, linux-arm-kernel@lists.infradead.org,
 m.szyprowski@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Georgi, Chanwoo,

On 13.11.2020 10:07, Chanwoo Choi wrote:
> On 11/13/20 5:48 PM, Georgi Djakov wrote:
>> On 11/12/20 16:09, Sylwester Nawrocki wrote:
[...]
>>
>> Good work Sylwester! Thank you and all the reviewers! What would be the merge
>> path for this patchset? Looks like there is no build dependency between patches.
>> Should i take just patches 2,3 or also patch 1? Chanwoo?
> 
> Hi Georgi,
> 
> If you take the patch 2,3, I'll apply patch 1,4 to devfreq.git.

> Hi Sylwester,
> First of all, thanks for your work to finish it for a long time.
> I'm very happy about finishing this work. It is very necessary feature
> for the QoS. Once again, thank for your work.

I would also like to thank everyone for provided feedback!

As far as building is concerned the patches could be applied in any
order. I think we could also apply the drm/exynos patch in same
merge window. There could be runtime (or git bisect) regression 
only in case when INTERCONNECT is enabled and only (or as first)
the dts and drm/exynos patches are applied.

Hmm, maybe it's better to hold on with the drm patch, INTERCONNECT
is disabled in arch/arm/configs/{multi_v7_defconfig, exynos_defconfig}  
but it is enabled in arch/arm64/configs/defconfig.

-- 
Regards,
Sylwester
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
