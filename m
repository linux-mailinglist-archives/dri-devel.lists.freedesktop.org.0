Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F2938A5E
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 14:32:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 695DC89DFD;
	Fri,  7 Jun 2019 12:32:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51F6789DFD
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 12:32:03 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190607123202euoutp02de2025a31f89c6ab3cd783ba7021b4e7~l6ol8-eJ00301203012euoutp02K
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 12:32:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190607123202euoutp02de2025a31f89c6ab3cd783ba7021b4e7~l6ol8-eJ00301203012euoutp02K
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190607123201eucas1p1b5dccf24841b045e5b2290e240c48b98~l6olY_evB1805518055eucas1p1M;
 Fri,  7 Jun 2019 12:32:01 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 66.92.04325.1495AFC5; Fri,  7
 Jun 2019 13:32:01 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190607123200eucas1p18998abac85d88ff568264e037ab3d8cb~l6okls4-C0627106271eucas1p1o;
 Fri,  7 Jun 2019 12:32:00 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190607123200eusmtrp2d7d98c291cf1704ee4dcd8b952a8e8c5~l6okWPl0s0938109381eusmtrp29;
 Fri,  7 Jun 2019 12:32:00 +0000 (GMT)
X-AuditID: cbfec7f5-b75ff700000010e5-69-5cfa59410ad5
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 1D.88.04146.0495AFC5; Fri,  7
 Jun 2019 13:32:00 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190607123200eusmtip2dac82c9117639c6dfeee028971a3d57c~l6okJOITR2451924519eusmtip2f;
 Fri,  7 Jun 2019 12:32:00 +0000 (GMT)
Subject: Re: [PATCH v2] video: fbdev: da8xx-fb: add COMPILE_TEST support
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Message-ID: <56fcd283-07b9-f198-b2cd-0f4afe565622@samsung.com>
Date: Fri, 7 Jun 2019 14:32:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <fe534641-82b7-c3f7-4296-db4ba4ff30e6@samsung.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpjleLIzCtJLcpLzFFi42LZduzneV3HyF8xBj0nhCyufH3PZnGi7wOr
 xeVdc9gcmD3udx9n8vi8SS6AKYrLJiU1J7MstUjfLoEr4+PsD2wFd5gqFr9Yx9jAuJCpi5GT
 Q0LARGJt+1FWEFtIYAWjxPmbBV2MXED2F0aJ2ZNfsUM4nxklLvSeZYTpuHLuKAtEYjmjxIRd
 ncwQzltGiVsfzzODVAkLeEjsOL8PrINNwEpiYvsqMFtEIEFixfQZYDavgJ1EY8NysHoWARWJ
 hf/fsoDYogIREvePbWCFqBGUODnzCVCcg4NTwF7iwi8bkDCzgLjErSfzmSBseYntb+eA3SAh
 8JlN4uGaB+wQl7pI7JtwhRXCFpZ4dXwLVFxG4v9OkGaQhnWMEn87XkB1b2eUWD75HxtElbXE
 4eMXWUE2MwtoSqzfpQ8RdpS43T2NGSQsIcAnceOtIMQRfBKTtk2HCvNKdLQJQVSrSWxYtoEN
 Zm3XzpVQJR4SRxtCJjAqzkLy5Cwkn81C8tkshBMWMLKsYhRPLS3OTU8tNs5LLdcrTswtLs1L
 10vOz93ECEwdp/8d/7qDcd+fpEOMAhyMSjy8Huw/Y4RYE8uKK3MPMUpwMCuJ8JZd+BEjxJuS
 WFmVWpQfX1Sak1p8iFGag0VJnLea4UG0kEB6YklqdmpqQWoRTJaJg1OqgTFVzYjf2uv0qjd9
 a2foHJ5hfmOHrFm08KQpTOlHGaL6I1r1yry6pjq2N9RO0jR691rxdRaTKtM25QPTt19aM2Ur
 53LFVPNfJ5s6ipym8vO9nj/zP+dnzfl6n0RMr7FG8q1m2fIk10nBVeOWSdyUkojYK6Jqt9P8
 WVL3zrcs0OdzP7Rg1f2+UiWW4oxEQy3mouJEAPy9s1sZAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeLIzCtJLcpLzFFi42I5/e/4PV2HyF8xBuceSlpc+fqezeJE3wdW
 i8u75rA5MHvc7z7O5PF5k1wAU5SeTVF+aUmqQkZ+cYmtUrShhZGeoaWFnpGJpZ6hsXmslZGp
 kr6dTUpqTmZZapG+XYJexsfZH9gK7jBVLH6xjrGBcSFTFyMnh4SAicSVc0dZQGwhgaWMEl0z
 aroYOYDiMhLH15dBlAhL/LnWxdbFyAVU8ppRYuaNj4wgCWEBD4kd5/eB2WwCVhIT21eB2SIC
 CRJPX89ng5hpJ9HVshnM5gWyGxuWM4PYLAIqEgv/vwXbKyoQIXHm/QoWiBpBiZMzn7CA3MAp
 YC9x4ZcNSJhZQF3iz7xLzBC2uMStJ/OZIGx5ie1v5zBPYBSchaR7FpKWWUhaZiFpWcDIsopR
 JLW0ODc9t9hQrzgxt7g0L10vOT93EyMwIrYd+7l5B+OljcGHGAU4GJV4eB0YfsYIsSaWFVfm
 HmKU4GBWEuEtu/AjRog3JbGyKrUoP76oNCe1+BCjKdBvE5mlRJPzgdGaVxJvaGpobmFpaG5s
 bmxmoSTO2yFwMEZIID2xJDU7NbUgtQimj4mDU6qB0clhnvRWv8u6+7uuP+nPefijY9dejbWi
 7FsT7nGFuk/kn3DvwsG5yyszzntEdpletN6vN1941Y+4E/K3Vko2VL/1vvhA992q6V/2rZrP
 3e+65ue5xVtby+P7oq6+m847ff+U+Tp6r/Y8f32z7YHBJK/pO3rKzGZq8JgmHogtOrPixOZz
 hSJs1c5KLMUZiYZazEXFiQCSuioPngIAAA==
X-CMS-MailID: 20190607123200eucas1p18998abac85d88ff568264e037ab3d8cb
X-Msg-Generator: CA
X-RootMTR: 20190607123200eucas1p18998abac85d88ff568264e037ab3d8cb
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190607123200eucas1p18998abac85d88ff568264e037ab3d8cb
References: <fe534641-82b7-c3f7-4296-db4ba4ff30e6@samsung.com>
 <CGME20190607123200eucas1p18998abac85d88ff568264e037ab3d8cb@eucas1p1.samsung.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1559910722;
 bh=vqbGOMy12XkJS45GPFssVA29gnSK7Mg2h0V+4KbPPpY=;
 h=Subject:From:To:Date:In-Reply-To:References:From;
 b=Gw2/Rgyq7EJ18b79hzBEuSTkHdNvrA3RhL+SHw4q/dLRByN9bIwNniBPAW652JR9W
 MA0CJvvswTfTCp8p5CQ1aAVnb/BOY1GgXWoG1zKor6GMnG80ADKE6xcuTmw9lmz+iz
 aYpV6ya7afGmfJRrnguCAOdEx3AwqbMEA3t87d/o=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDUvMjEvMTkgMTI6NTMgUE0sIEJhcnRsb21pZWogWm9sbmllcmtpZXdpY3ogd3JvdGU6Cj4g
QWRkIENPTVBJTEVfVEVTVCBzdXBwb3J0IHRvIGRhOHh4LWZiIGRyaXZlciBmb3IgYmV0dGVyIGNv
bXBpbGUKPiB0ZXN0aW5nIGNvdmVyYWdlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEJhcnRsb21pZWog
Wm9sbmllcmtpZXdpY3ogPGIuem9sbmllcmtpZUBzYW1zdW5nLmNvbT4KCkkgcXVldWVkIHRoZSBw
YXRjaCBmb3IgdjUuMy4KCkJlc3QgcmVnYXJkcywKLS0KQmFydGxvbWllaiBab2xuaWVya2lld2lj
egpTYW1zdW5nIFImRCBJbnN0aXR1dGUgUG9sYW5kClNhbXN1bmcgRWxlY3Ryb25pY3MKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
