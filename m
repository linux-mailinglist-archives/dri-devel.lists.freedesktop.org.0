Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5852B1970
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 12:00:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E44FA6E44F;
	Fri, 13 Nov 2020 11:00:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E37CD6E44F
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 11:00:45 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20201113110034euoutp015e25ad4c56e7fa34a26b9acb330d6371~HDDm8pux_3152631526euoutp01-
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 11:00:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20201113110034euoutp015e25ad4c56e7fa34a26b9acb330d6371~HDDm8pux_3152631526euoutp01-
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1605265234;
 bh=7odYSbGs70MQycT7i1R6gEMJa7Kr2avIugtbNw4LTII=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=cDqJYpRLKytyLpzzS1uZcSAjmX/x1q2ZYrac7Y+8gWDVkqqAsuywnuvx6GP5seGnH
 bN3j7W+N3Ezluy0VrBywDSDaTgYYGcYUbfMCg3ecqy7dD9eALKh5Q5hDF+zseRFtbW
 YzDhV7Bv5vOEikkXuS+8eNcKrYjizY70QDD8cIsM=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20201113110034eucas1p196f6567f8033230ee9b1feca13212d43~HDDmsnRkB0710707107eucas1p11;
 Fri, 13 Nov 2020 11:00:34 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 38.C9.44805.1576EAF5; Fri, 13
 Nov 2020 11:00:33 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20201113110033eucas1p1eaa1d1bd8944d8abc509ded03f45aeef~HDDmCvC6l1771217712eucas1p1c;
 Fri, 13 Nov 2020 11:00:33 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20201113110033eusmtrp257062263f757e3ca08119cd5e9c0f6a2~HDDl-blPy2309123091eusmtrp2l;
 Fri, 13 Nov 2020 11:00:33 +0000 (GMT)
X-AuditID: cbfec7f4-b4fff7000000af05-f1-5fae6751f9d4
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 31.6E.16282.1576EAF5; Fri, 13
 Nov 2020 11:00:33 +0000 (GMT)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20201113110032eusmtip2db1dd7ac887b957aee7f5b534b222540~HDDlLe4P61664016640eusmtip2-;
 Fri, 13 Nov 2020 11:00:32 +0000 (GMT)
Subject: Re: [PATCH v9 0/5] Exynos: Simple QoS for exynos-bus using
 interconnect
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi
 <cw00.choi@samsung.com>, Georgi Djakov <georgi.djakov@linaro.org>,
 inki.dae@samsung.com
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <2e4f8aa1-7be0-f65c-da7c-277327626812@samsung.com>
Date: Fri, 13 Nov 2020 12:00:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <6687cdd3-6e5b-f3c1-f784-33cc7c0d589a@samsung.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPKsWRmVeSWpSXmKPExsWy7djP87qB6eviDY5Ns7S4P6+V0WLjjPWs
 Fte/PGe1mH/kHKvFla/v2Sym793EZjHp/gQWi/PnN7BbbHp8jdXi8q45bBafe48wWsw4v4/J
 4nbjCjaL1r1H2C0Ov2lntZgx+SWbg4DHplWdbB53ru1h87jffZzJY/OSeo++LasYPT5vkgtg
 i+KySUnNySxLLdK3S+DKWPh1NXvBT+6K7TPbWBoYj3N2MXJySAiYSMx6vIwFxBYSWMEo8X6/
 bRcjF5D9hVHi1bsVbBDOZ0aJ5Q/XssB0LL73iREisZxR4ubaJ0wQzntGiVsz3rODVAkLBElM
 vH+EHSQhIjCTUeLvzp1gLcwC55kkFv68B1bFJmAo0fW2iw3E5hWwk7i2YQpQnIODRUBV4tnF
 UpCwqECSxPYt21khSgQlTs58AnYGp4C9xMd9fWBxZgF5ie1v5zBD2OISt57MB7tIQmAxp0Tf
 x19MEHe7SLyas5AVwhaWeHV8CzuELSPxfydMQzOjxMNza9khnB5GictNMxghqqwl7pz7xQZy
 HbOApsT6XfogpoSAo8TurWYQJp/EjbeCEDfwSUzaNp0ZIswr0dEmBDFDTWLW8XVwWw9euMQ8
 gVFpFpLPZiH5ZhaSb2YhrF3AyLKKUTy1tDg3PbXYKC+1XK84Mbe4NC9dLzk/dxMjMM2d/nf8
 yw7G5a8+6h1iZOJgPMQowcGsJMKr7LAmXog3JbGyKrUoP76oNCe1+BCjNAeLkjhv0haglEB6
 YklqdmpqQWoRTJaJg1OqgYnh2H4baQezqV+unVo9+65F95Lda96+XqS3uffFrn3XN7cIeVyP
 CtnKr619NuVw9Pm04w0snfe2MNt2MDw9EyXawrPYooWH6WPI3x8xLFMF0rq33HfnkN2pt3jx
 Za0Eda2lD8OTHNkZJ3E83Mdh3iDDZx++3yk10Vv0aV2KFe9X23kbHd3ljvdaCeStPcD+8OD6
 ND7GXXvnXnE9t6dQ9Fud2IR3R2zVijeVyG0wy+XWMbpX9WPdvhufVi+IclpdkGbiyRGqdL2n
 9ePJhKTHD95dZDpo/2H5x42MBTdSov0Pv36XGWMUP/OB3YoDb/3uuU69YTT799+ARN+rMlfV
 5RrfxnXlucXHcRqtDpu1N0+JpTgj0VCLuag4EQDdZUi44gMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrEIsWRmVeSWpSXmKPExsVy+t/xe7qB6eviDc5e47a4P6+V0WLjjPWs
 Fte/PGe1mH/kHKvFla/v2Sym793EZjHp/gQWi/PnN7BbbHp8jdXi8q45bBafe48wWsw4v4/J
 4nbjCjaL1r1H2C0Ov2lntZgx+SWbg4DHplWdbB53ru1h87jffZzJY/OSeo++LasYPT5vkgtg
 i9KzKcovLUlVyMgvLrFVija0MNIztLTQMzKx1DM0No+1MjJV0rezSUnNySxLLdK3S9DLWPh1
 NXvBT+6K7TPbWBoYj3N2MXJySAiYSCy+94mxi5GLQ0hgKaPEwTP7WSESMhInpzVA2cISf651
 sYHYQgJvGSW+P6sFsYUFgiQm3j/CDtIsIjCTUeLq8v9gDrPAeSaJg2/Os0OMXcsksejrZrBR
 bAKGEl1vIUbxCthJXNswBaiIg4NFQFXi2cVSkLCoQJLEzONn2SFKBCVOznzCAmJzCthLfNzX
 BzaGWcBMYt7mh8wQtrzE9rdzoGxxiVtP5jNNYBSahaR9FpKWWUhaZiFpWcDIsopRJLW0ODc9
 t9hIrzgxt7g0L10vOT93EyMwsrcd+7llB+PKVx/1DjEycTAeYpTgYFYS4VV2WBMvxJuSWFmV
 WpQfX1Sak1p8iNEU6J2JzFKiyfnA1JJXEm9oZmBqaGJmaWBqaWasJM5rcgSoSSA9sSQ1OzW1
 ILUIpo+Jg1Oqgcn3n9PCom2iqV0SeSE/vnubqCTKzfinbuPweeY3y7qPATJrr990EEyQ7Xr7
 OfP+b5mqhWKvFWfqMYaq8P1krv3kvHrJShu1C2psrQbdN7ncYh5mNFrXKepenC/6bkfh9Knc
 y0yM2ldbX1VzUaxX1E65vzp2denDMskDUfvON2ssTv/utfS3woSzVcfNp81dmryJ8ceOuQtn
 q5f778oyPabuvMk+99EhNVOD4u3L9F5vnyR45p9N9flbrZdPFHLYlVdvjCjaKeqxfY3Duri8
 8uSqCQWbUtL5k2csb2ZR7bgtVdfpuP22ypVgAY2X8Rz3ephWbFXmPnPO/Iqi3+prSpahov9M
 eiK7HFd52bbLKLEUZyQaajEXFScCAOQMj1x1AwAA
X-CMS-MailID: 20201113110033eucas1p1eaa1d1bd8944d8abc509ded03f45aeef
X-Msg-Generator: CA
X-RootMTR: 20201112141041eucas1p1a29130955afd4ec1d5d94cf17183920c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201112141041eucas1p1a29130955afd4ec1d5d94cf17183920c
References: <CGME20201112141041eucas1p1a29130955afd4ec1d5d94cf17183920c@eucas1p1.samsung.com>
 <20201112140931.31139-1-s.nawrocki@samsung.com>
 <b0a8e994-06d2-e04a-579c-40580b71f760@linaro.org>
 <9cb7e3a6-2a3f-8f46-2bf1-d6d8ea01613b@samsung.com>
 <6687cdd3-6e5b-f3c1-f784-33cc7c0d589a@samsung.com>
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
 krzk@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sylwester,

On 13.11.2020 11:32, Sylwester Nawrocki wrote:
> On 13.11.2020 10:07, Chanwoo Choi wrote:
>> On 11/13/20 5:48 PM, Georgi Djakov wrote:
>>> On 11/12/20 16:09, Sylwester Nawrocki wrote:
> [...]
>>> Good work Sylwester! Thank you and all the reviewers! What would be the merge
>>> path for this patchset? Looks like there is no build dependency between patches.
>>> Should i take just patches 2,3 or also patch 1? Chanwoo?
>> Hi Georgi,
>>
>> If you take the patch 2,3, I'll apply patch 1,4 to devfreq.git.
>> Hi Sylwester,
>> First of all, thanks for your work to finish it for a long time.
>> I'm very happy about finishing this work. It is very necessary feature
>> for the QoS. Once again, thank for your work.
> I would also like to thank everyone for provided feedback!
>
> As far as building is concerned the patches could be applied in any
> order. I think we could also apply the drm/exynos patch in same
> merge window. There could be runtime (or git bisect) regression
> only in case when INTERCONNECT is enabled and only (or as first)
> the dts and drm/exynos patches are applied.
>
> Hmm, maybe it's better to hold on with the drm patch, INTERCONNECT
> is disabled in arch/arm/configs/{multi_v7_defconfig, exynos_defconfig}
> but it is enabled in arch/arm64/configs/defconfig.

I don't think we need to delay DRM patch. Exynos DRM mixer is not 
available on ARM64 SoCs, so this won't be an issue.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
