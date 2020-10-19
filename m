Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FE5292231
	for <lists+dri-devel@lfdr.de>; Mon, 19 Oct 2020 07:30:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D51B16E083;
	Mon, 19 Oct 2020 05:30:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A95F86E083
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Oct 2020 05:30:41 +0000 (UTC)
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20201019053039epoutp022f4bfaa1aecf497732e8098ad0923958~-Tba8Rgjo0116601166epoutp02O
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Oct 2020 05:30:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20201019053039epoutp022f4bfaa1aecf497732e8098ad0923958~-Tba8Rgjo0116601166epoutp02O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1603085439;
 bh=WeTTCzDpOQ7XbkeWqPVnTgIy6m9BJhORQyCxqSptRMI=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=tEe/FqeRV6go9ZdfDzlCJziW7GsU7qCNEGe3sCxSLRB2k9rNLFp5pmkRJLNoyd8tL
 3OsXAq0tM4ZNd+98apIR8RRWTrN5ykYsT+wnaBxx2dZdc2IiecEHRCKK+t7UY+kEJl
 tj6zOORzZ52C73CaZqPD01o8FG0/BwtQwEsSIC4o=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTP id
 20201019053037epcas1p2013dd979619a6b5efce63af4de47feae~-TbZMGEI51360613606epcas1p2h;
 Mon, 19 Oct 2020 05:30:37 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.40.157]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4CF5233HQ4zMqYkt; Mon, 19 Oct
 2020 05:30:35 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 51.94.09918.B742D8F5; Mon, 19 Oct 2020 14:30:35 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20201019053034epcas1p4f0e7875ba34fb6ac270034e7520cec97~-TbVunWEJ2374623746epcas1p4e;
 Mon, 19 Oct 2020 05:30:34 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20201019053033epsmtrp25d0a8da8029c0cc621ed3d277916408b~-TbVuIP-f0823908239epsmtrp2G;
 Mon, 19 Oct 2020 05:30:33 +0000 (GMT)
X-AuditID: b6c32a36-713ff700000026be-81-5f8d247bcb15
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 7E.1E.08745.9742D8F5; Mon, 19 Oct 2020 14:30:33 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20201019053033epsmtip208d2ba83f6aaf51c187ed0b7356431a5~-TbVl327g3161631616epsmtip2Y;
 Mon, 19 Oct 2020 05:30:33 +0000 (GMT)
Subject: Re: [PATCH] drm/exynos/hdmi: add support for 1920x1200@60Hz mode
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
From: Inki Dae <inki.dae@samsung.com>
Message-ID: <2c460f28-96a6-d2c4-a6c1-9879036a4183@samsung.com>
Date: Mon, 19 Oct 2020 14:37:41 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20201009130524.30828-1-m.szyprowski@samsung.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpjk+LIzCtJLcpLzFFi42LZdlhTX7dapTfe4N12CYtb686xWlz5+p7N
 Ysb5fUwWa4/cZbeYMfklmwOrx/3u40wefVtWMXp83iQXwByVbZORmpiSWqSQmpecn5KZl26r
 5B0c7xxvamZgqGtoaWGupJCXmJtqq+TiE6DrlpkDtFJJoSwxpxQoFJBYXKykb2dTlF9akqqQ
 kV9cYquUWpCSU2BZoFecmFtcmpeul5yfa2VoYGBkClSYkJ3x4fQhxoLbnBWN668yNTA+Yu9i
 5OSQEDCReLhtGWMXIxeHkMAORommO5eYIJxPjBI/T7WyQjifGSV+/VzKDNPyr+U4O0RiF6PE
 gxmrofrfA/W3HQYbLCzgKXH2zEqwDhGBUom5/4+BxZkFAiVuz+wCs9kEVCUmrrjPBmLzCthJ
 PH7yA8xmAYp3965iBbFFBSIkjndPZoeoEZQ4OfMJC4jNCVT//tsmZoiZ4hK3nsxngrDlJZq3
 zmYGOUhC4CW7xO7GfqizXSQ+vLkAZQtLvDq+BRoCUhKf3+1lg2hoZpSYOOM0E4TTwShx9/F1
 FogqY4n9SycDJTiAVmhKrN+lDxFWlNj5ey4jxGY+iXdfe1hBSiQEeCU62oQgSpQkjl28wQhh
 S0hcWDKRDcL2kFh+4RzjBEbFWUh+m4Xkn1lI/pmFsHgBI8sqRrHUguLc9NRiwwIj5PjexAhO
 kFpmOxgnvf2gd4iRiYPxEKMEB7OSCG+kYFe8EG9KYmVValF+fFFpTmrxIUZTYGhPZJYSTc4H
 pui8knhDUyNjY2MLE0MzU0NDJXHeP9od8UIC6YklqdmpqQWpRTB9TBycUg1M08VfpITXlH2I
 9Gn/unRV99mDvw5XXlzv5L2Z7dqmiG87/txIWchc2dTJvsM6fE2Sy9PNXuvsXwhf2bFtl+rx
 TQu8yz2uvk9rZHr+bOprBbbV/R+PlARvUPWZterb8/4eq5cbn/X9ZDgqush78aawcL59xaYc
 WdsSpKd/c9Fe2ig4yexEeOyjQ3vWaR6/n3mz8PZ7v8sV73h1TCzfpP9OWK51clnjxdeFdXF7
 NfUm7AkNMeT4diNh3qowZqfPdnq3GvauLd257cvrk6tlWqWFeZz/L7Xdt+PcLcb0UuMk7s4L
 LGGfljQ5WF902sZq3ur+r2ZGxv704wdC0pceKI27X/O0OcjM3TS+Zot8nOKRFCWW4oxEQy3m
 ouJEAF3wSegZBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrELMWRmVeSWpSXmKPExsWy7bCSvG6lSm+8wby5Vha31p1jtbjy9T2b
 xYzz+5gs1h65y24xY/JLNgdWj/vdx5k8+rasYvT4vEkugDmKyyYlNSezLLVI3y6BK+PD6UOM
 Bbc5KxrXX2VqYHzE3sXIySEhYCLxr+U4kM3FISSwg1Hi5pKbLF2MHEAJCYktWzkgTGGJw4eL
 IUreMkpMO3GVBaRXWMBT4uyZlcwgtohAqcSr/vuMIDazQKDE5w+bmSEaJjJKnH+1DmwZm4Cq
 xMQV99lAbF4BO4nHT36A2SxA8e7eVawgtqhAhETL/T/sEDWCEidnPgFbxglU//7bJmaIBeoS
 f+ZdgrLFJW49mc8EYctLNG+dzTyBUWgWkvZZSFpmIWmZhaRlASPLKkbJ1ILi3PTcYsMCo7zU
 cr3ixNzi0rx0veT83E2M4GjQ0trBuGfVB71DjEwcjIcYJTiYlUR4IwW74oV4UxIrq1KL8uOL
 SnNSiw8xSnOwKInzfp21ME5IID2xJDU7NbUgtQgmy8TBKdXAFHxAZNa0Z3rq74KO6vOYnFVb
 d26PXueRZfFnVl0ojz1r7jKV8YvrgQ2veHZPOJp4oelvvabE3XX2Pvpm5Wcv7vdfwLNFbJV5
 3tZjKR6s7C/X9SbHP7rY5q28UmQiz1fjFWwur/ljmS7Iv83Ju3/+41Hz7Q89Bb2uxssonnSy
 N9pavir6W6uu2/8UtxuBUfceu+1darMz2lkxu+vGiSle3n/ennq0WjqNRenC82Oy88u5Gg8k
 FBhW6lvZ/u7e/Sdd2aau5pezhcbelz8MphxQTBETnbTlYKF8zM/Pc8UmyrTlpm5d9HyG5wS2
 o10a809avTAJnuN/Sef6k7V/t7gyml35WqdmNkPxR/Zb5qzsWCWW4oxEQy3mouJEACYmWmP1
 AgAA
X-CMS-MailID: 20201019053034epcas1p4f0e7875ba34fb6ac270034e7520cec97
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201009130531eucas1p25ba0c17803bd0647c65603feb3180799
References: <CGME20201009130531eucas1p25ba0c17803bd0647c65603feb3180799@eucas1p2.samsung.com>
 <20201009130524.30828-1-m.szyprowski@samsung.com>
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
Cc: Andrzej Hajda <a.hajda@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgoyMC4gMTAuIDkuIOyYpO2bhCAxMDowNeyXkCBNYXJlayBTenlwcm93c2tpIOydtCjqsIApIOyT
tCDquIA6Cj4gQWRkIGNsb2NrIGNvbmZpZ3VyYXRpb24gZm9yIDE1NE1IeiBwaXhlbGNsb2NrIHRv
IEV4eW5vczU0MnggSERNSVBIWSwKPiB3aGljaCBpcyByZXF1aXJlZCBmb3IgMTkyMHgxMjAwQDYw
SHogbW9kZS4gVGhlIFBMTCBjb25maWd1cmF0aW9uIGRhdGEKPiBoYXMgYmVlbiB0YWtlbiBmcm9t
IHRoZSB2ZW5kb3IncyBrZXJuZWwgdHJlZSBmb3IgdGhlIE9kcm9pZCBYVTQgYm9hcmQuCgpNZXJn
ZWQuCgpUaGFua3MsCklua2kgRGFlCgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1hcmVrIFN6eXByb3dz
a2kgPG0uc3p5cHJvd3NraUBzYW1zdW5nLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2V4
eW5vcy9leHlub3NfaGRtaS5jIHwgOSArKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5z
ZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5v
c19oZG1pLmMgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19oZG1pLmMKPiBpbmRleCBk
YzAxYzE4OGMwZTAuLjM5ZmE1ZDNiMDFlZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
ZXh5bm9zL2V4eW5vc19oZG1pLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5v
c19oZG1pLmMKPiBAQCAtNTIyLDYgKzUyMiwxNSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGhkbWlw
aHlfY29uZmlnIGhkbWlwaHlfNTQyMF9jb25maWdzW10gPSB7Cj4gIAkJCTB4NTQsIDB4NEIsIDB4
MjUsIDB4MDMsIDB4MDAsIDB4ODAsIDB4MDEsIDB4ODAsCj4gIAkJfSwKPiAgCX0sCj4gKwl7Cj4g
KwkJLnBpeGVsX2Nsb2NrID0gMTU0MDAwMDAwLAo+ICsJCS5jb25mID0gewo+ICsJCQkweDAxLCAw
eEQxLCAweDIwLCAweDAxLCAweDQwLCAweDMwLCAweDA4LCAweENDLAo+ICsJCQkweDhDLCAweEU4
LCAweEMxLCAweEQ4LCAweDQ1LCAweEEwLCAweEFDLCAweDgwLAo+ICsJCQkweDA4LCAweDgwLCAw
eDA5LCAweDg0LCAweDA1LCAweDAyLCAweDI0LCAweDg2LAo+ICsJCQkweDU0LCAweDNGLCAweDI1
LCAweDAzLCAweDAwLCAweDAwLCAweDAxLCAweDgwLAo+ICsJCX0sCj4gKwl9LAo+ICB9Owo+ICAK
PiAgc3RhdGljIGNvbnN0IHN0cnVjdCBoZG1pcGh5X2NvbmZpZyBoZG1pcGh5XzU0MzNfY29uZmln
c1tdID0gewo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
