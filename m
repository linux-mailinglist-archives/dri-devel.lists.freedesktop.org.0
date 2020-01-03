Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D2312F80C
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jan 2020 13:15:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B12C689D86;
	Fri,  3 Jan 2020 12:15:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 353EB8961E
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2020 12:15:05 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200103121503euoutp02f755efc364c2b72529a8fc37ad596e7d~mX3uJhb6Y2208522085euoutp02S
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2020 12:15:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200103121503euoutp02f755efc364c2b72529a8fc37ad596e7d~mX3uJhb6Y2208522085euoutp02S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1578053703;
 bh=ZYRSG2dnRN2oLiPJQ2LIXSPSrUDBNRb5suqvQsyXhO4=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=Zn6dhuB+mcy67uxhwk7X2oYyOonNDpV4aQVxqP5pewysu2dE556VrxZXRcWN+K6hX
 xY9NNLpAJKb8PnaT+kE9vXHKOhCWFbO+1JFhjMQhyW+r34whYUa6R+5FxxbWq6P2ho
 zlSWgemlagqnHrmn8miVj1gbPCEtXwqBla447rho=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200103121503eucas1p13bfbe8b3592eb8827c2283f099be7228~mX3uBWn_G0835208352eucas1p1p;
 Fri,  3 Jan 2020 12:15:03 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id CC.66.60679.7403F0E5; Fri,  3
 Jan 2020 12:15:03 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200103121502eucas1p2030838b2fe5856b92dd84fa9a3f0c1a8~mX3s97Fzn1198811988eucas1p2L;
 Fri,  3 Jan 2020 12:15:02 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200103121502eusmtrp19e172d9b605d03a839a363221c831aff~mX3s9UZLb2556325563eusmtrp1K;
 Fri,  3 Jan 2020 12:15:02 +0000 (GMT)
X-AuditID: cbfec7f4-0cbff7000001ed07-93-5e0f3047c88d
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 6F.E3.08375.6403F0E5; Fri,  3
 Jan 2020 12:15:02 +0000 (GMT)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200103121502eusmtip12804f41b83594e4780542c64be02ac40~mX3srJ1G13250032500eusmtip1G;
 Fri,  3 Jan 2020 12:15:02 +0000 (GMT)
Subject: Re: [PATCH -next] fbdev: s3c-fb: use
 devm_platform_ioremap_resource() to simplify code
To: Jingoo Han <jingoohan1@gmail.com>, YueHaibing <yuehaibing@huawei.com>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <908e757a-11e8-c3f0-13d2-5dc8564e5c43@samsung.com>
Date: Fri, 3 Jan 2020 13:15:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <SL2P216MB0105ADD044BE3CA7B33CB6ECAA8F0@SL2P216MB0105.KORP216.PROD.OUTLOOK.COM>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprLKsWRmVeSWpSXmKPExsWy7djP87ruBvxxBu23pCyufH3PZrHiy0x2
 ixN9H1gtLu+aw2Zx5+tzFgdWj52z7rJ7tBx5y+pxv/s4k8fnTXIBLFFcNimpOZllqUX6dglc
 Gdu37GMpOMRZsX7dP6YGxnfsXYycHBICJhJHZ55m6WLk4hASWMEo8e37ITaQhJDAF0aJRSvL
 IBKfGSU+rn/JCNNxfc1BdojEckaJJ4e+Q7W/ZZRYPn0X2FxhgUSJ6/d+gY0SEfCUWPNnOStI
 EbPAcUaJqc8vg41iE7CSmNi+CszmFbCT+PrpDlgDi4CKxKHuA8wgtqhAhMSnB4dZIWoEJU7O
 fMICYnMKxEgsX30ILM4sIC5x68l8JghbXqJ562xmkGUSAovYJeb/ngB1t4vEsneLWCBsYYlX
 x7dAQ0BG4vTkHhaIhnWMEn87XkB1bwf6Z/I/Nogqa4k750D+4QBaoSmxfpc+RNhRYumK/8wg
 YQkBPokbbwUhjuCTmLRtOlSYV6KjTQiiWk1iw7INbDBru3auZJ7AqDQLyWuzkLwzC8k7sxD2
 LmBkWcUonlpanJueWmyUl1quV5yYW1yal66XnJ+7iRGYaE7/O/5lB+OuP0mHGAU4GJV4eBOU
 +eOEWBPLiitzDzFKcDArifCWB/LGCfGmJFZWpRblxxeV5qQWH2KU5mBREuc1XvQyVkggPbEk
 NTs1tSC1CCbLxMEp1cA4NU3zgLTD2yNXZ3SWP925vHzhQ47iV3f9CuYYTp7++vy+xT2MMUFW
 smW6zCldVUlpLsk8jx9drzjL9+jBm59aU2b7+85ZO4n3Qm71XQbW+2ILtyndutN2/3hP6Zr5
 te/MzvyXr7ZLu3nC9d0zZ0uR49v+G0fYsAutSnm0I/+L5zO75U4R0XrnlViKMxINtZiLihMB
 d470gzADAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRmVeSWpSXmKPExsVy+t/xu7puBvxxBl1LhSyufH3PZrHiy0x2
 ixN9H1gtLu+aw2Zx5+tzFgdWj52z7rJ7tBx5y+pxv/s4k8fnTXIBLFF6NkX5pSWpChn5xSW2
 StGGFkZ6hpYWekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6Gdu37GMpOMRZsX7dP6YGxnfs
 XYycHBICJhLX1xwEsrk4hASWMkpM+DeLqYuRAyghI3F8fRlEjbDEn2tdbBA1rxklupYfZQNJ
 CAskSnz5sZcZxBYR8JRY82c5K0gRs8BxRoktl+cxQXQ8YJTY2rgOrIpNwEpiYvsqRhCbV8BO
 4uunO2CTWARUJA51HwCrERWIkDi8YxZUjaDEyZlPWEBsToEYieWrD7GC2MwC6hJ/5l1ihrDF
 JW49mc8EYctLNG+dzTyBUWgWkvZZSFpmIWmZhaRlASPLKkaR1NLi3PTcYkO94sTc4tK8dL3k
 /NxNjMDI2nbs5+YdjJc2Bh9iFOBgVOLhTVDmjxNiTSwrrsw9xCjBwawkwlseyBsnxJuSWFmV
 WpQfX1Sak1p8iNEU6LmJzFKiyfnAqM8riTc0NTS3sDQ0NzY3NrNQEuftEDgYIySQnliSmp2a
 WpBaBNPHxMEp1cDo+dLJ/czv6kfTp6qXF8vU8z5+1sV1ReR74gxHg4k1N7h2P2k+m9B95+8z
 Zfc6Ad73IqceJyXtuN18QuKn3hf1pYZZE83q7Bo4GhbUFd4/ZxTt6Ji3+HX6BY2fHyaleHXF
 dVxknPslsePxPQYXkx27HyxgsTItD4+aOHXW47v/dkuf4rp6Zm+dEktxRqKhFnNRcSIA1B1P
 ycICAAA=
X-CMS-MailID: 20200103121502eucas1p2030838b2fe5856b92dd84fa9a3f0c1a8
X-Msg-Generator: CA
X-RootMTR: 20190917192130epcas4p487980f3b24a63f66203a009f1e59293e
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190917192130epcas4p487980f3b24a63f66203a009f1e59293e
References: <20190904115523.25068-1-yuehaibing@huawei.com>
 <CGME20190917192130epcas4p487980f3b24a63f66203a009f1e59293e@epcas4p4.samsung.com>
 <SL2P216MB0105ADD044BE3CA7B33CB6ECAA8F0@SL2P216MB0105.KORP216.PROD.OUTLOOK.COM>
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
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDkvMTcvMTkgOToyMSBQTSwgSmluZ29vIEhhbiB3cm90ZToKPiAKPiAKPiDvu79PbiA5LzQv
MTksIDc6NTcgQU0sIFl1ZUhhaWJpbmcgd3JvdGU6Cj4gCj4+IFVzZSBkZXZtX3BsYXRmb3JtX2lv
cmVtYXBfcmVzb3VyY2UoKSB0byBzaW1wbGlmeSB0aGUgY29kZSBhIGJpdC4KPj4gVGhpcyBpcyBk
ZXRlY3RlZCBieSBjb2NjaW5lbGxlLgo+Pgo+PiBSZXBvcnRlZC1ieTogSHVsayBSb2JvdCA8aHVs
a2NpQGh1YXdlaS5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IFl1ZUhhaWJpbmcgPHl1ZWhhaWJpbmdA
aHVhd2VpLmNvbT4KPj4KPiBBY2tlZC1ieTogSmluZ29vIEhhbiA8amluZ29vaGFuMUBnbWFpbC5j
b20+CgpUaGFua3MsIHBhdGNoIHF1ZXVlZCBmb3IgdjUuNiAoYWxzbyBzb3JyeSBmb3IgdGhlIGRl
bGF5KS4KCkJlc3QgcmVnYXJkcywKLS0KQmFydGxvbWllaiBab2xuaWVya2lld2ljegpTYW1zdW5n
IFImRCBJbnN0aXR1dGUgUG9sYW5kClNhbXN1bmcgRWxlY3Ryb25pY3MKCj4+IC0tLQo+PiAgZHJp
dmVycy92aWRlby9mYmRldi9zM2MtZmIuYyB8IDMgKy0tCj4+ICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Zp
ZGVvL2ZiZGV2L3MzYy1mYi5jIGIvZHJpdmVycy92aWRlby9mYmRldi9zM2MtZmIuYwo+PiBpbmRl
eCBiYTA0ZDdhLi40M2FjOGQ3IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3Mz
Yy1mYi5jCj4+ICsrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvczNjLWZiLmMKPj4gQEAgLTE0MTEs
OCArMTQxMSw3IEBAIHN0YXRpYyBpbnQgczNjX2ZiX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKnBkZXYpCj4+ICAKPj4gIAlwbV9ydW50aW1lX2VuYWJsZShzZmItPmRldik7Cj4+ICAKPj4g
LQlyZXMgPSBwbGF0Zm9ybV9nZXRfcmVzb3VyY2UocGRldiwgSU9SRVNPVVJDRV9NRU0sIDApOwo+
PiAtCXNmYi0+cmVncyA9IGRldm1faW9yZW1hcF9yZXNvdXJjZShkZXYsIHJlcyk7Cj4+ICsJc2Zi
LT5yZWdzID0gZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlKHBkZXYsIDApOwo+PiAgCWlm
IChJU19FUlIoc2ZiLT5yZWdzKSkgewo+PiAgCQlyZXQgPSBQVFJfRVJSKHNmYi0+cmVncyk7Cj4+
ICAJCWdvdG8gZXJyX2xjZF9jbGs7Cj4+IC0tIAo+PiAyLjcuNApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
