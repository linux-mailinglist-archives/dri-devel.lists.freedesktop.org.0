Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CF44B4CA
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 11:18:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 362206E336;
	Wed, 19 Jun 2019 09:17:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 333896E336
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 09:17:58 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190619091756euoutp026c8e2bb436bc3ac052a5dc0cb10a3203~pjujQ7IUV1953419534euoutp02P
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 09:17:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190619091756euoutp026c8e2bb436bc3ac052a5dc0cb10a3203~pjujQ7IUV1953419534euoutp02P
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190619091755eucas1p2c7036ec9b6c8be09b2cf2f8a5ae6f103~pjuihnVfu2998329983eucas1p2G;
 Wed, 19 Jun 2019 09:17:55 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id DA.9D.04377.3CDF90D5; Wed, 19
 Jun 2019 10:17:55 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190619091754eucas1p2edbfee21d2ec8feacc183927de9a0eae~pjuhufNCy2132521325eucas1p2l;
 Wed, 19 Jun 2019 09:17:54 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190619091754eusmtrp196587f03ea943b7a4b68b6e3d4d171c5~pjuhfdH3d0190801908eusmtrp1L;
 Wed, 19 Jun 2019 09:17:54 +0000 (GMT)
X-AuditID: cbfec7f4-12dff70000001119-0a-5d09fdc3d42f
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id A9.B8.04140.2CDF90D5; Wed, 19
 Jun 2019 10:17:54 +0100 (BST)
Received: from [106.120.51.75] (unknown [106.120.51.75]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190619091753eusmtip1fa0a4c315cf7b4226f56c37589e72378~pjugkhlax2980129801eusmtip1b;
 Wed, 19 Jun 2019 09:17:53 +0000 (GMT)
Subject: Re: [RFT 02/10] clk: samsung: Add bus clock for GPU/G3D on Exynos4412
To: Krzysztof Kozlowski <krzk@kernel.org>
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <97cf3337-44da-b5b0-0b45-e44ef5c90615@samsung.com>
Date: Wed, 19 Jun 2019 11:17:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190618190534.4951-3-krzk@kernel.org>
Content-Language: en-GB
X-Brightmail-Tracker: H4sIAAAAAAAAA01SaUxTWRj19q0Fiq8FwxecjGOjiZiouOZGjdHESd4/ifNDU0O06hMN0Gof
 RdEQEUShrcqgE51ChIgIVg1aCEgVFwQKkoANCAbEusW6IWLrymbbVyO5f879vnPuOSe5LKE6
 R8eyu3RpgkGnTVHTYWRty/fOeffG5InxtUWAj3W0yfBYYQuDr52povDQBQvCvT4PhSdq/yVw
 SVMHhbs/D9G40F1AYsvRUQqfePGOwJ2dVxlsf9FD4WHLEwp3OYppfKbzlgxfaRpgcHmvS4Zd
 9//G93u9NM5taGLweM81Etscowi/GW4lVwN/+exlxI/8KET80KNchm/4Ukry9dYBhrfb8mm+
 7stTinebnTK++vxBvrs1m+KP19gQ77X/mRChCVu5XUjZlS4YFqzaErazaNBD7i5B++pvPkdZ
 /mNCcha4JdDv+c6YUBir4ioRNA9bCeniQ9BRZw6yVJwXQUlf+i/FwLc+JJEqEHi7ykKKQQTv
 i1voACuKS4D3+e+oAI7m4qB37CsVIBGci4aRLjMZWNDcQjjWfDxooeBWwfilHFkAk9xs+Hiq
 J/jQNG4j+OrtIY4S2v5/GdTK/THOPssLcgguBrJ9FykJz4C6weJgIuAes3Dz4SGZlHstmKpc
 odZR8NZZw0j4D2g/aSElQQ4Cy41+RroUIHA7S0OKFXDP6fJbsH6LOKhyLJDGa6C5/QMZGAMX
 CY8GlVKISCisPU1IYwXkHVFJ7FkwYjsdihML5pcTZAFSWydVs06qY51Ux/rbtxSRNhQjGMXU
 JEFcpBP2zhe1qaJRlzR/mz7Vjvw/t33c6buOHKNbGxHHInWEgvOyiSpKmy5mpDYiYAl1tCI8
 R56oUmzXZuwXDPrNBmOKIDai6SypjlEcmPJ0k4pL0qYJyYKwWzD82spYeWwW0lQsDb/zsVy5
 OK+oIX/TbWrm5w3L64+a1fod6w9nxP+X2ZHVvawyd0tEfE3PMs+JU/80RbUaybLItMyE6PRP
 1Zk1erZa09Vnyp1z8Ea2vU/vKHe47657KJIXpyaLylee/ornE0Weeev3/GVi4pQzdA+S28I1
 FZqcI5Wl7teevYJRTYo7tQvnEgZR+xPtrR3etQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0hTURzAObuP3VmD21Q8GGRdiDJoNnXtGCZ9ES5GURkUltitLiq6zXY3
 yz6UVPYwNV1WNs2tSCN7zlapOKGL+SpaPpplLp8gIWZl2UutzRHI+fKD/+/HOQf+FKZwEKFU
 us7IG3RcJkMG4C/mWj1rxVlZ8rrH3WGo8FW7BM2aW6TIXvaAQJPVBQD1fhsj0N8nJRiyNr8i
 UM/3SRKZB4pxVHBmhkAXRsYx5HI9lKLaETeBvhR8IFB3QwWJylxNEnSv2SNFVb2dEtTZEY86
 eqdIlOdslqI5tx1HNQ0zAH380oZvguzdyruA/fPbDNjJt3lS1jltw9l6i0fK1tacI9mn04ME
 O3C+VcI+unmc7Wk7QbBFjhrATtUu27Y4SRlr0JuM/PI0vWDcyOxRoUilKgYpI6NjlKooTfKG
 SDUTERd7kM9Mz+YNEXH7lGnlE2N4lhUcqW8cBrnekw9kFKSjoednn5cDKAVdBWCRWIrlA8o7
 CIXWU4zfCYQz7nzS74wDeOX1MOEbBNJb4cV3/RIfB9HhsHf2B+GTMPoNCW+Jbwh/YQewrGAY
 81kkrYKFz4vmr5bTcXDuzsn5GqdXws+lbtLHwfRuWN6Qi/udJbD96ug8y7xPrRw6O+9g9Co4
 U9mF+TkEnvh2m/BzGHw6UYEVA4VlQW5ZkFgWJJYFiQ3gNSCINwnaVK0QqRQ4rWDSpSoP6LW1
 wLsxT1p+OepA/qdEEdAUYBbL6z5TyQqCyxZytCKAFMYEyRedlCUr5Ae5nKO8QZ9iMGXyggjU
 3s+VYKHBB/Te/dMZU1RqlQbFqDRRmqj1iAmRn6Wf7VXQqZyRz+D5LN7wv5NQstBcUJEqjnwP
 cVS3JXQ7u4OtN0wZMcUR239nfV1eGV2iv2w/HNLXyt1fe8dqtbcZpxN6LomaXeJU4NIq86Bt
 s3l112B4Y9oml8Rmix9LURx6vyKg0910Xbf/fWbfosIzOTsCkzhh8nRYoro/TDmalHhtKO+R
 Z3RLF0M6jyW+3KmmnAwupHGqNZhB4P4BuA4FGkcDAAA=
X-CMS-MailID: 20190619091754eucas1p2edbfee21d2ec8feacc183927de9a0eae
X-Msg-Generator: CA
X-RootMTR: 20190618190558epcas3p211c71991aba4f3a2273be82be41324a8
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190618190558epcas3p211c71991aba4f3a2273be82be41324a8
References: <20190618190534.4951-1-krzk@kernel.org>
 <CGME20190618190558epcas3p211c71991aba4f3a2273be82be41324a8@epcas3p2.samsung.com>
 <20190618190534.4951-3-krzk@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1560935876;
 bh=tkIJ6Zdk/r4opylr6EAzPBGo0oQmTLvcNpJPcBJpEcA=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=boobkESBTTT8izIV5hAugqN3CjPDR0jVkm8uDBSWwKrvS49mWUY6GiSGr4x3IfTmB
 HFPkylAIygkGnfCg630V2rvIPzAQDM0D4Id+1lXCUbiggHAnv0G31IaXc034NyzyLI
 y2kk55jjXDWjmdNqLzXSez/fHKwFWYWcg6T8aofo=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Mark Rutland <mark.rutland@arm.com>, David Airlie <airlied@linux.ie>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Michael Turquette <mturquette@baylibre.com>, Will Deacon <will.deacon@arm.com>,
 Tomasz Figa <tomasz.figa@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>,
 Joseph Kogut <joseph.kogut@gmail.com>, linux-samsung-soc@vger.kernel.org,
 Chanwoo Choi <cw00.choi@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNi8xOC8xOSAyMTowNSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBBZGQgSUQgYW5k
IGdhdGUgZm9yIGJ1cyBjbG9jayBmb3IgR1BVIChNYWxpIDQwMCkgb24gRXh5bm9zNDQxMi4KClBh
dGNoIGFwcGxpZWQgdG8gY2xrL3NhbXN1bmcgdHJlZSwgdGhhbmtzLgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
