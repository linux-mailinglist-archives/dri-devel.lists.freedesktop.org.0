Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E320D92651
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 16:16:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47A0189A67;
	Mon, 19 Aug 2019 14:16:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48F8789A67
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 14:16:31 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190819141629euoutp02bbefc9d043a17d543b8cb5df3d6ef9cc~8WJoxKm7R0791507915euoutp02T
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 14:16:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190819141629euoutp02bbefc9d043a17d543b8cb5df3d6ef9cc~8WJoxKm7R0791507915euoutp02T
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190819141629eucas1p18211663d3dd1f870707d68eb6698dcc2~8WJoZwSO50486104861eucas1p14;
 Mon, 19 Aug 2019 14:16:29 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 2D.E5.04374.C3FAA5D5; Mon, 19
 Aug 2019 15:16:28 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190819141628eucas1p28d8ca17075b6423bc814bd39c2b75506~8WJnNY4gm1533415334eucas1p2i;
 Mon, 19 Aug 2019 14:16:28 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190819141627eusmtrp27dd9ce37f9d06d187364e0de39ca8250~8WJm_kF_90526405264eusmtrp2K;
 Mon, 19 Aug 2019 14:16:27 +0000 (GMT)
X-AuditID: cbfec7f5-4ddff70000001116-80-5d5aaf3cb911
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 15.F4.04166.B3FAA5D5; Mon, 19
 Aug 2019 15:16:27 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190819141627eusmtip1716955188c0d47b9095ddd295251a2f3~8WJmiCMGK1439014390eusmtip1J;
 Mon, 19 Aug 2019 14:16:27 +0000 (GMT)
Subject: Re: [PATCH 1/2] video: omapfb2: Make standard and custom panel
 drivers mutually exclusive
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <2b79b0e9-14bd-5add-a602-49ef1f1f577c@samsung.com>
Date: Mon, 19 Aug 2019 16:16:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190816133250.GI5020@pendragon.ideasonboard.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01SbUhTYRjt3b27u5vNrlPzQYVoUJiQVvpjmpiB2SCCoH6UH9RNLyq6KZvf
 Bpo/dJmSJmhObZpDl4ZK5fwWnOIcEpZlTbHMj8AME5lagh/tepX8d97znPOc58BLYpIWvjsZ
 r0xhVEo6UUqIcOPw5tjZoNbwqHO2/ABZ3exXTPZpfYWQPSrVC2SGzXYka++bEMhadVNECCF/
 aLUS8r6NWlxepanky2cem3lyffkEITdbO3g3iHBRUAyTGJ/GqHyD74ninjeXYMkaUUbPaA3K
 RXqyEAlJoPzBulWDCpGIlFAGBCVV4wLusYZgbnVq/2FDUKudFBxYcleWCG7QiKCmZ2jfv4zA
 +IudCElnKgY0E0M4i10oGRS/qNgTYdQAgnm9YW8VQQVCaUETYrGYCoa2H/o9M06dgrGaUR6L
 XanbMDPcxuc0TmCpXNhbKqQuweffAxiLMcoNphZ0PA6fgI7laowNA8oogObZd3zu7lBY25lH
 HHaGJfPb/T6esNvFmllDC4JtzeK+uwNBY9kOwakuwqD5g30TaY84A63dvhx9GcYtFgFLA+UI
 1mUn7ghHeGqswDhaDJp8Cac+DW0NbcRBbGHXS6wESbWHqmkP1dEeqqP9n1uL8CbkxqSqFbGM
 2k/JpPuoaYU6VRnrE52keI3sv2h0x7zeifq37psQRSLpUbG8PDxKwqfT1JkKEwISk7qIM6rt
 lDiGzsxiVEl3VamJjNqEPEhc6ibOPvI9QkLF0ilMAsMkM6qDKY8UuueiEIvz9DFDaHQuPvaH
 HnniYP3S1LDmvaGL7BF252QJUepITr7Vy6mh7GPBN1OC7f3cs5/9m8XXJnUXbHWBw7vNb3pT
 PPJC7zjg9b31VyJXXb2mPE0nsYjOmw90xwde+W2nM2HTaVfzJH+zZ0j/wYqisKKRW9qU1my/
 qMDMxesBi1JcHUef98ZUavof1jyTP0EDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPIsWRmVeSWpSXmKPExsVy+t/xu7rW66NiDU6+17RY+PAus8WVr+/Z
 LDonLmG3WPFzK6PF1r1X2S3Wz7/F5sDm0XjjBpvH3m8LWDxmd8xk9bjffZzJY8m0q2wex29s
 Zwpgi9KzKcovLUlVyMgvLrFVija0MNIztLTQMzKx1DM0No+1MjJV0rezSUnNySxLLdK3S9DL
 mLd6AnNBB1fF7tNzGRsYl3B0MXJySAiYSDS8f8XWxcjFISSwlFHi1IlGIIcDKCEjcXx9GUSN
 sMSfa11QNa8ZJU4cvcQIkhAWSJHouHqEBcQWEbCQ6F00nRGkiFngIKPE2Y4zUB27mCQO7V4E
 1sEmYCUxsX0VmM0rYCex4ekSNhCbRUBV4vzc00wgtqhAhMSZ9ytYIGoEJU7OfAJmcwrYS1x7
 d5AZxGYWUJf4M+8SlC0ucevJfCYIW15i+9s5zBMYhWYhaZ+FpGUWkpZZSFoWMLKsYhRJLS3O
 Tc8tNtQrTswtLs1L10vOz93ECIy8bcd+bt7BeGlj8CFGAQ5GJR5ej2lRsUKsiWXFlbmHGCU4
 mJVEeCvmAIV4UxIrq1KL8uOLSnNSiw8xmgI9N5FZSjQ5H5gU8kriDU0NzS0sDc2NzY3NLJTE
 eTsEDsYICaQnlqRmp6YWpBbB9DFxcEo1MFbLZ20p4f3BtjCkR5fn6pPZRl0iincP3K3gixRO
 C9n9d/eiNXoBDv7612b6anaEfWO9uyruba19xd+l5Tta7pxbMi/lPJPHQdWyh5stb5VW3eNd
 9/R7z1u1ycaRKpcW9qzx7FJZvnZC9U6et/3i6+fqdSp+Ve+s+lpwe63L0q5lwjfP7Tivt1iJ
 pTgj0VCLuag4EQBR07UF0gIAAA==
X-CMS-MailID: 20190819141628eucas1p28d8ca17075b6423bc814bd39c2b75506
X-Msg-Generator: CA
X-RootMTR: 20190816133300epcas3p344aaa1347aeea65da7015a2598ff51df
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190816133300epcas3p344aaa1347aeea65da7015a2598ff51df
References: <20190816122228.9475-1-laurent.pinchart@ideasonboard.com>
 <20190816122228.9475-2-laurent.pinchart@ideasonboard.com>
 <96dc63bc-92b4-6d55-bbf5-006aab111bec@ti.com>
 <CGME20190816133300epcas3p344aaa1347aeea65da7015a2598ff51df@epcas3p3.samsung.com>
 <20190816133250.GI5020@pendragon.ideasonboard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1566224189;
 bh=TC+3r91YX0ioOSfBbV0cUJTMk0Vt1CuPGn8WWC1d+to=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=jw/KNFkvVFF5XSwkHXRvDi4uJ71yHYFE9WQuFOT+nAVMz+oBIpRTDI5+j0zorlL4u
 h/TXFDKkDhI477foN4QPAGT8A5qi9Xi0/MmX9OaRIBOzg+QDSkkLk4R7xCl+TmvaoO
 vCOpYjCu3dP71yPOa6rxSrS+x880y3XLObVhT65w=
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDgvMTYvMTkgMzozMiBQTSwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToKPiBPbiBGcmksIEF1
ZyAxNiwgMjAxOSBhdCAwNDoyMDo0NlBNICswMzAwLCBUb21pIFZhbGtlaW5lbiB3cm90ZToKPj4g
T24gMTYvMDgvMjAxOSAxNToyMiwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToKPj4+IFN0YW5kYXJk
IERSTSBwYW5lbCBkcml2ZXJzIGZvciBzZXZlcmFsIHBhbmVscyB1c2VkIGJ5IG9tYXBmYjIgYXJl
IG5vdwo+Pj4gYXZhaWxhYmxlLiBUaGVpciBtb2R1bGUgbmFtZSBjbGFzaGVzIHdpdGggdGhlIG1v
ZHVsZXMgZnJvbQo+Pj4gZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZGlzcGxheXMvLCBwYXJ0IG9m
IHRoZSBkZXByZWNhdGVkIG9tYXBmYjIgZmJkZXYKPj4KPj4gU2hvdWxkbid0IHRoYXQgcGF0aCBi
ZSBkcml2ZXJzL3ZpZGVvL2ZiZGV2L29tYXAyL29tYXBmYi9kaXNwbGF5cz8KPiAKPiBBYnNvbHV0
ZWx5IDotKSBDb3VsZCB0aGlzIGJlIGZpeGVkIHdoZW4gYXBwbHlpbmcgPyBPdGhlcndpc2UgSSds
bAo+IHN1Ym1pdCBhIHYyLgo+IAo+Pj4gZHJpdmVyLiBBcyBvbWFwZmIyIGNhbiBvbmx5IGJlIGNv
bXBpbGVkIHdoZW4gdGhlIG9tYXBkcm0gZHJpdmVyIGlzCj4+PiBkaXNhYmxlZCwgYW5kIHRoZSBE
Uk0gcGFuZWwgZHJpdmVycyBhcmUgdXNlbGVzcyBpbiB0aGF0IGNhc2UsIG1ha2UgdGhlCj4+PiBv
bWFwZmIyIHBhbmVscyBkZXBlbmQgb24gdGhlIHN0YW5kYXJkIERSTSBwYW5lbHMgYmVpbmcgZGlz
YWJsZWQgdG8gZml4Cj4+PiB0aGUgbmFtZSBjbGFzaC4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBM
YXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Cj4+PiAt
LS0KPj4+ICAgZHJpdmVycy92aWRlby9mYmRldi9vbWFwMi9vbWFwZmIvZGlzcGxheXMvS2NvbmZp
ZyB8IDUgKysrKysKPj4+ICAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQo+Pgo+PiBD
YydkIEJhcnRsb21pZWouCgpUaGFua3MgVG9taS4KCj4gT29wcywgc29ycnksIGZvcmdvdCB0byBk
byB0aGF0IDotUwo+IAo+PiBSZXZpZXdlZC1ieTogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2Vp
bmVuQHRpLmNvbT4KCkFja2VkLWJ5OiBCYXJ0bG9taWVqIFpvbG5pZXJraWV3aWN6IDxiLnpvbG5p
ZXJraWVAc2Ftc3VuZy5jb20+CgpCZXN0IHJlZ2FyZHMsCi0tCkJhcnRsb21pZWogWm9sbmllcmtp
ZXdpY3oKU2Ftc3VuZyBSJkQgSW5zdGl0dXRlIFBvbGFuZApTYW1zdW5nIEVsZWN0cm9uaWNzCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
