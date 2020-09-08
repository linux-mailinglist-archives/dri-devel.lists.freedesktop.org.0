Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E06D42610C4
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 13:36:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 299876E1B8;
	Tue,  8 Sep 2020 11:36:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFD7A6E1B8
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 11:36:52 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200908113650euoutp01e459dcd3ef01d39eec149920b2a1b741~yy_b4BiwM0752907529euoutp01E
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 11:36:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200908113650euoutp01e459dcd3ef01d39eec149920b2a1b741~yy_b4BiwM0752907529euoutp01E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1599565010;
 bh=g5440TnfUUbLi30vNa07P7jouFmRBB7rucNUoU6i/8E=;
 h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
 b=V090EhWDFrTzsPdP/INxD7HxK8udml6ICXBHv37R5dewamurmh5/BLBm0VhZkFwit
 eEgZtTnFxefnBq6b7rvpR7q+s/f4/SPLW2pcQ6P93YoyagooMRGUJKaeQNS0SQhLga
 sSQ7ssmdksVPndzwaGvxcGkDlzE+WYu7ps2ob2wk=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200908113650eucas1p1fdcd72f2a4c03cf2c852203be2ffb75a~yy_bkCV6k0524005240eucas1p1k;
 Tue,  8 Sep 2020 11:36:50 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 2F.85.06318.2DC675F5; Tue,  8
 Sep 2020 12:36:50 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200908113649eucas1p2c2fd05202aa5795554058866e11e571e~yy_bRI5cF0080300803eucas1p28;
 Tue,  8 Sep 2020 11:36:49 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200908113649eusmtrp1648c91b18ae53c7a17db386efd24449a~yy_bQliCs2002320023eusmtrp1n;
 Tue,  8 Sep 2020 11:36:49 +0000 (GMT)
X-AuditID: cbfec7f5-371ff700000018ae-11-5f576cd28ec8
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 4C.94.06017.1DC675F5; Tue,  8
 Sep 2020 12:36:49 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200908113649eusmtip1c65e586662a29c729c5ddbee20ef9cfc~yy_a4yt_k0553105531eusmtip15;
 Tue,  8 Sep 2020 11:36:49 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH v4] video: fbdev: ssd1307fb: Added support to Column offset
To: Rob Herring <robh@kernel.org>, Rodrigo Alencar
 <455.rodrigo.alencar@gmail.com>
Message-ID: <2f18ec01-6041-d3f2-787e-16490faf2fbe@samsung.com>
Date: Tue, 8 Sep 2020 13:36:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200727204016.GA836415@bogus>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrAKsWRmVeSWpSXmKPExsWy7djP87qXcsLjDS5uZrf4ePcrs8X8I+dY
 La58fc9mcaLvA6vF5V1z2Cz+79nB7sDmsXPWXXaPTas62Tzudx9n8vi8SS6AJYrLJiU1J7Ms
 tUjfLoErY++V04wF09kqVn3/x9jA+JWli5GTQ0LAROLasRbGLkYuDiGBFYwSx+9dYYFwvjBK
 XJr8iw3C+cwosWn9fkaYlp4VZ5ghEssZJdq7TrCCJIQE3jJKfHttAmKzCVhJTGxfBdTAwSEs
 EChx9oE9SFhEIETicts9JhCbWaBGYtGRg8wgNq+AncSqeXPBbBYBFYmFzy6xgdiiAhESnx4c
 ZoWoEZQ4OfMJ2NmcAjoSj068YYGYIy5x68l8qJnyEtvfzgG7TUJgEbvEo8vzoY52kfj7cC0r
 hC0s8er4FnYIW0bi9OQeFoiGdYwSfzteQHVvZ5RYPvkfG0SVtcSdc6Cw4ABaoSmxfpc+RNhR
 4s2jR8wgYQkBPokbbwUhjuCTmLRtOlSYV6KjTQiiWk1iw7INbDBru3auZJ7AqDQLyWuzkLwz
 C8k7sxD2LmBkWcUonlpanJueWmycl1quV5yYW1yal66XnJ+7iRGYbk7/O/51B+O+P0mHGAU4
 GJV4eD18w+KFWBPLiitzDzFKcDArifA6nT0dJ8SbklhZlVqUH19UmpNafIhRmoNFSZzXeNHL
 WCGB9MSS1OzU1ILUIpgsEwenVANjyEH+5d9iDmbnpP2LurGW/6bNUvOjE1PEL5hfPXRVnTfq
 wK7e780uAQ7MS4uzjy2Y3z7JqGK19Zm0FTsU9h1+ofmR+9hExo4pyUtmzPvBtnMF91qLKY86
 E/9b7lGvaLz43mPOBs1A/5X3JvWwfF0abrYme+ohfWvNuG1Nc+7tnnSsb1bXbF/xCUosxRmJ
 hlrMRcWJANjodZ8zAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIIsWRmVeSWpSXmKPExsVy+t/xu7oXc8LjDfad17f4ePcrs8X8I+dY
 La58fc9mcaLvA6vF5V1z2Cz+79nB7sDmsXPWXXaPTas62Tzudx9n8vi8SS6AJUrPpii/tCRV
 ISO/uMRWKdrQwkjP0NJCz8jEUs/Q2DzWyshUSd/OJiU1J7MstUjfLkEvY++V04wF09kqVn3/
 x9jA+JWli5GTQ0LARKJnxRnmLkYuDiGBpYwSLdN3ADkcQAkZiePryyBqhCX+XOtig6h5zShx
 8tUuZpAEm4CVxMT2VYwg9cICgRJnH9iDmCICIRJtS8NAKpgFaiS+Pt3NBNF6iFHi1OyFbCAJ
 XgE7iVXz5oKNYRFQkVj47BJYXFQgQuLwjlmMEDWCEidnPgG7k1NAR+LRiTcsEEPVJf7Mu8QM
 YYtL3HoynwnClpfY/nYO8wRGoVlI2mchaZmFpGUWkpYFjCyrGEVSS4tz03OLjfSKE3OLS/PS
 9ZLzczcxAqNr27GfW3Ywdr0LPsQowMGoxMP7wSssXog1say4MhfoKQ5mJRFep7On44R4UxIr
 q1KL8uOLSnNSiw8xmgI9N5FZSjQ5Hxj5eSXxhqaG5haWhubG5sZmFkrivB0CB2OEBNITS1Kz
 U1MLUotg+pg4OKUaGHvC4gQSNfQCQt4sXtx25v+N9BOlrSfkN81zv/aXVf0l08HnGjJpL/pc
 8hha90/1Ydlr6zr9379H/Ocy/f7ohgukGdiefLIt9tCyBiON6Ub8Wv8TDE88cL+p9X7OK+sD
 2ypYY/zPB82N/Dxhaf5Ju4xJ6ia/vHU0pYQVXDZlOvamNWj92uW6VYmlOCPRUIu5qDgRAOyu
 cxLEAgAA
X-CMS-MailID: 20200908113649eucas1p2c2fd05202aa5795554058866e11e571e
X-Msg-Generator: CA
X-RootMTR: 20200727204022eucas1p2e9b7da30fb7157d3d6802833c0625e5d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200727204022eucas1p2e9b7da30fb7157d3d6802833c0625e5d
References: <1595622138-3965-1-git-send-email-455.rodrigo.alencar@gmail.com>
 <CGME20200727204022eucas1p2e9b7da30fb7157d3d6802833c0625e5d@eucas1p2.samsung.com>
 <20200727204016.GA836415@bogus>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


[ added dri-devel ML to Cc: ]

On 7/27/20 10:40 PM, Rob Herring wrote:
> On Fri, 24 Jul 2020 17:22:18 -0300, Rodrigo Alencar wrote:
>> This patch provides support for displays like VGM128064B0W10,
>> which requires a column offset of 2, i.e., its segments starts
>> in SEG2 and ends in SEG129.
>>
>> Signed-off-by: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
>> ---
>>  Documentation/devicetree/bindings/display/ssd1307fb.txt | 1 +
>>  drivers/video/fbdev/ssd1307fb.c                         | 8 ++++++--
>>  2 files changed, 7 insertions(+), 2 deletions(-)
>>
> 
> Acked-by: Rob Herring <robh@kernel.org>

Applied to drm-misc-next tree, thanks and sorry for the delay.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
