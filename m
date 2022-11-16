Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4803162B4C3
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 09:14:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00B6410E1A7;
	Wed, 16 Nov 2022 08:14:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD2E310E1A7
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 08:14:23 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20221116081422euoutp012f9c907d1171b4c03a33d0f98733f315~oAov8MwkI2599225992euoutp01Y
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 08:14:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20221116081422euoutp012f9c907d1171b4c03a33d0f98733f315~oAov8MwkI2599225992euoutp01Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1668586462;
 bh=3aqws/YncWkTS4/qF0rNbgttcL9y+V5YDpD/Ac+7C0s=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=dSRLnooZKEzU9MZav1AwO5/Pp04+1hLapUn4joZ8Y2oTEZnrx0EwkDoyGGvUCXARq
 Tc/N7vuOvq6L4LnPFkCcAr2pPbK3HysqOG7m1ABHvGtUVW6C0OPrvjaEjK2Jc4TKZe
 OQjgOlekbeu2H4+7K1A3eRXZ5yi4uQ7hXohrXsWU=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20221116081421eucas1p24f04236bedd7fdef8c9c6adb4b3aaebf~oAovbR0BX2135021350eucas1p2g;
 Wed, 16 Nov 2022 08:14:21 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 48.85.09561.DDB94736; Wed, 16
 Nov 2022 08:14:21 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20221116081421eucas1p2afc12af3222e875b0391d3cc8272c8c4~oAovEmkN02121421214eucas1p2n;
 Wed, 16 Nov 2022 08:14:21 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20221116081421eusmtrp2f83526b4fd7e69c14d3de14cdc86acb5~oAovDX4v70570805708eusmtrp2Z;
 Wed, 16 Nov 2022 08:14:21 +0000 (GMT)
X-AuditID: cbfec7f2-0b3ff70000002559-7d-63749bddbba1
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id F3.73.08916.DDB94736; Wed, 16
 Nov 2022 08:14:21 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20221116081420eusmtip2e19f4cef99e32f0c69125464cfd8ed37~oAouKLoza0674806748eusmtip2e;
 Wed, 16 Nov 2022 08:14:20 +0000 (GMT)
Message-ID: <5d1170f5-7fa4-6131-fe83-bd4467d601ee@samsung.com>
Date: Wed, 16 Nov 2022 09:14:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH 1/1] drm/shmem: Dual licence the files as GPL-2 and MIT
Content-Language: en-US
To: Robert Swindells <rjs@fdy2.co.uk>, noralf@tronnes.org,
 liuzixian4@huawei.com, airlied@redhat.com, tzimmermann@suse.de,
 lucas.demarchi@intel.com, kraxel@redhat.com, robh@kernel.org,
 kuba@kernel.org, marcel.ziswiler@toradex.com, sfr@canb.auug.org.au,
 daniel.vetter@ffwll.ch, cai.huoqing@linux.dev, nroberts@igalia.com,
 emil.velikov@collabora.com, sam@ravnborg.org, boris.brezillon@collabora.com,
 dan.carpenter@oracle.com
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20221112194210.7657-2-rjs@fdy2.co.uk>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupjk+LIzCtJLcpLzFFi42LZduznOd27s0uSDXb/UbK4emsBk8XpM6eY
 LJq2Lma2eP1vOovFwod3mS2ufH3PZvG06y2bxbNbJ5ktLmzrY7WY9m0DUOzxMjaLxsermCym
 nnrHbjHn0hpGi9cHVrJZ/N+zg91ixc+tjBZb915lt9jyZiKrg7BH440bbB477i5h9Pj+4gqL
 x95vC1g8Wo68ZfWYMLubzWPxnpdMHptWdbJ5LGyYyuxxv/s4k8fHp7dYPJZMu8rm8X4fkNh8
 utpj0ysPj/U9RxgDBKK4bFJSczLLUov07RK4Mjr3z2Ut+M1eceDWS8YGxldsXYycHBICJhJT
 ehazdDFycQgJrGCUmPXsMwtIQkjgC6PEs+UuEInPjBJPN09kh+n4s2sdVNFyRomO+/UQRR8Z
 JXofzmYCSfAK2El873zPCmKzCKhKTN/aCRUXlDg58wlYs6hAisTCLTeA4hwcwgLeEu8fcIGE
 mQXEJW49mQ9WLiKwiVnixXt2iLiyxLfDLxhBbDYBQ4mut11gH3AKGEu8/XWUCaJGXqJ562xm
 kHskBJq4JNZ/+s4IcbSLxLqNM6FsYYlXx7dAPSMj8X8nyDKQhnZGiQW/70M5ExglGp7fguqw
 lrhz7hcbyKXMApoS63fpQ4QdJWY1XGYHCUsI8EnceCsIcQSfxKRt05khwrwSHW1CENVqErOO
 r4Nbe/DCJeYJjEqzkEJlFpL3ZyF5ZxbC3gWMLKsYxVNLi3PTU4sN81LL9YoTc4tL89L1kvNz
 NzECk+zpf8c/7WCc++qj3iFGJg7GQ4wSHMxKIrz5k0uShXhTEiurUovy44tKc1KLDzFKc7Ao
 ifOyzdBKFhJITyxJzU5NLUgtgskycXBKNTBJ+Jw1dG+481TjbsPbd29NSh1+beNt2nTFdJdf
 eWL5MTmBBb76/I92VnmL1xTq3S3LlOj4+tyb5794b8Uf2Uju4tcqZ+f/6DV8cPNH9oobXQpC
 19dfsGfocObXEymdtX5SpveceCPmwz8S9H2P+gpybYxTMz28f3Uvd3/YEcvzN6Ik/RpPn2F5
 MMVz15uzD+/ubzrpHB57sEEy6fhGlXm6nJqa7fNUk3PPTNvEpXFgn1HLhO7a5XMulHS+vWSz
 5N8p9eIF6hs/ORYv/fXT1O3Cil6GsCiuGKtzvbfbzBf9uWZ2dLbVgld1shenfj4155+ywc7w
 zG6RE6WtM9yjw/6JPBL77zI3af/ToMOpz5YqsRRnJBpqMRcVJwIAw7JUmyEEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIKsWRmVeSWpSXmKPExsVy+t/xe7p3Z5ckG+ycy2lx9dYCJovTZ04x
 WTRtXcxs8frfdBaLhQ/vMltc+fqezeJp11s2i2e3TjJbXNjWx2ox7dsGoNjjZWwWjY9XMVlM
 PfWO3WLOpTWMFq8PrGSz+L9nB7vFip9bGS227r3KbrHlzURWB2GPxhs32Dx23F3C6PH9xRUW
 j73fFrB4tBx5y+oxYXY3m8fiPS+ZPDat6mTzWNgwldnjfvdxJo+PT2+xeCyZdpXN4/0+ILH5
 dLXHplceHut7jjAGCETp2RTll5akKmTkF5fYKkUbWhjpGVpa6BmZWOoZGpvHWhmZKunb2aSk
 5mSWpRbp2yXoZXTun8ta8Ju94sCtl4wNjK/Yuhg5OSQETCT+7FrH0sXIxSEksJRR4sre78wQ
 CRmJk9MaWCFsYYk/17rYIIreM0oc2vCZESTBK2An8b3zPVgRi4CqxPStnUwQcUGJkzOfAE3l
 4BAVSJFYdyQKxBQW8JZ4/4ALpIJZQFzi1pP5YNUiApuYJdb9sIWIK0t8O/yCEWLVekaJ3oUr
 wQ5lEzCU6HrbBWZzChhLvP11lAmiwUyia2sXI4QtL9G8dTbzBEahWUiumIVk3ywkLbOQtCxg
 ZFnFKJJaWpybnltsqFecmFtcmpeul5yfu4kRmFa2Hfu5eQfjvFcf9Q4xMnEwHmKU4GBWEuHN
 n1ySLMSbklhZlVqUH19UmpNafIjRFBgUE5mlRJPzgYktryTe0MzA1NDEzNLA1NLMWEmc17Og
 I1FIID2xJDU7NbUgtQimj4mDU6qByX+CTeuudQktyQ+jbihwOcmv0rrfej4gddnZy2y3IoU4
 VxXPrPW/8ejftgevVH6IBd/bse3E0rnmBXes9d/6hTRuPHqNa23udNmICp6CxuNBuYHdSt0u
 M4PPLZ9UM+3RtQ1HM+wbDJYEfD/XojzHcSX/StMyv01eieem1QixbT4+h++WwCThgxbJq7Oe
 WucIbDxoK1wp1X9QuflA/FO2Ofdnyd3f/0qD5ULSnWsXs5+7CRrpvK5cdYezPNmv9Qe3ePVM
 wb/74taYfv3z+OieFqWk5fs+HntR33570i+W+b+vv+Dsmuhh97B4Yo20xOJlYiaJB7VcZKel
 d5l/qjn38ezWvzPXCb9kYVtSLfT6aY0SS3FGoqEWc1FxIgC7E/qUtAMAAA==
X-CMS-MailID: 20221116081421eucas1p2afc12af3222e875b0391d3cc8272c8c4
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20221112194358eucas1p2b09c16f41bba1d70a115233f4b5c31a7
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20221112194358eucas1p2b09c16f41bba1d70a115233f4b5c31a7
References: <20221112194210.7657-1-rjs@fdy2.co.uk>
 <CGME20221112194358eucas1p2b09c16f41bba1d70a115233f4b5c31a7@eucas1p2.samsung.com>
 <20221112194210.7657-2-rjs@fdy2.co.uk>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12.11.2022 20:42, Robert Swindells wrote:
> Contributors to these files are:
>
> Noralf Trønnes <noralf@tronnes.org>
> Liu Zixian <liuzixian4@huawei.com>
> Dave Airlie <airlied@redhat.com>
> Thomas Zimmermann <tzimmermann@suse.de>
> Lucas De Marchi <lucas.demarchi@intel.com>
> Gerd Hoffmann <kraxel@redhat.com>
> Rob Herring <robh@kernel.org>
> Jakub Kicinski <kuba@kernel.org>
> Marcel Ziswiler <marcel.ziswiler@toradex.com>
> Stephen Rothwell <sfr@canb.auug.org.au>
> Daniel Vetter <daniel.vetter@ffwll.ch>
> Cai Huoqing <cai.huoqing@linux.dev>
> Neil Roberts <nroberts@igalia.com>
> Marek Szyprowski <m.szyprowski@samsung.com>
> Emil Velikov <emil.velikov@collabora.com>
> Sam Ravnborg <sam@ravnborg.org>
> Boris Brezillon <boris.brezillon@collabora.com>
> Dan Carpenter <dan.carpenter@oracle.com>
>
> Signed-off-by: Robert Swindells <rjs@fdy2.co.uk>


Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>


Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

