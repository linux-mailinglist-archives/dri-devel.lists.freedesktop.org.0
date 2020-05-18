Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D071D7004
	for <lists+dri-devel@lfdr.de>; Mon, 18 May 2020 06:58:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3F806E082;
	Mon, 18 May 2020 04:58:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 613D16E082
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 04:58:25 +0000 (UTC)
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20200518045823epoutp02f6724d8c222b185fb0682ca48f5a67c7~QBpSIrJkR1810118101epoutp02c
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 04:58:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20200518045823epoutp02f6724d8c222b185fb0682ca48f5a67c7~QBpSIrJkR1810118101epoutp02c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1589777903;
 bh=2vKXIIAYOJgXhTtQivWEVpWzLzbMQ4ucMNU0uUTwl/U=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=MmZzi/foElZN65Xwgb+7uAHNZDSVtBp7834w3bfhDGim/dXViessWyDHK0CzGsh8/
 eAWpyge7LQPM3wc9BIpf48hE3w3ntiuJYP8o+NlrffMkjgATKu6vzgLElf+MFeYhsh
 rArozyONz5XD2mZS6cT1sUV2Cm/JhboBV2wn/3m4=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200518045822epcas1p210f4b5c58774a0d81bf33380b4a9e7fe~QBpRn_InW2079620796epcas1p2P;
 Mon, 18 May 2020 04:58:22 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.40.153]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 49QRbv2j2kzMqYkX; Mon, 18 May
 2020 04:58:19 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 23.9D.04402.BE512CE5; Mon, 18 May 2020 13:58:19 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20200518045818epcas1p39ac7fcb92fd73391c1c3746c17e34b58~QBpN9eY0i3065630656epcas1p3x;
 Mon, 18 May 2020 04:58:18 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200518045818epsmtrp1ba3d66b3ebbc2bea915377d691a1fd53~QBpN7x5dT1824518245epsmtrp13;
 Mon, 18 May 2020 04:58:18 +0000 (GMT)
X-AuditID: b6c32a35-753ff70000001132-eb-5ec215ebf79b
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 45.34.18461.AE512CE5; Mon, 18 May 2020 13:58:18 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200518045818epsmtip132883eeffa5658720ed2b7a889712bea~QBpNpdb3G0973109731epsmtip1k;
 Mon, 18 May 2020 04:58:18 +0000 (GMT)
Subject: Re: [PATCH v2] drm/exynos: dsi: Remove bridge node reference in
 error handling path in probe function
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 jy0922.shim@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com,
 airlied@linux.ie, daniel@ffwll.ch, kgene@kernel.org, krzk@kernel.org
From: Inki Dae <inki.dae@samsung.com>
Message-ID: <4555b0a8-b919-b5c1-cacb-1e6aec8a1aa8@samsung.com>
Date: Mon, 18 May 2020 14:03:38 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200516105736.269669-1-christophe.jaillet@wanadoo.fr>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01TfUgUaRzmnZmdHaXtplXrh0HpHAUapqOuTZfGcUUNfYBQXGXgNqyTK+7H
 MLMbeQRtdeeZ2tlixeppCVl4excrW9qHqGRRWaZGH9ZibbQSlZHZokVxHzsOcf73vM/z/N7n
 93s/KNw4RCZTZQ6XKDsEG0PGE53X0jIzxpP6irM855K4I4P9GNdxtVnH/dvpxbkHUxMk9+rZ
 PYLrCC3k6iLjODc01K7n7h58q+eCkUc67v6VJpLzDfVgnK/+Nfm9ge+ebiH4oP8wyV+cfq7j
 wzU3Mf58637+twt+xEeDi/jo04CukCoqz7eKQokop4gOi7OkzFFawGzcYl5jNuVlsRnsSm4F
 k+IQ7GIBs3ZTYca6MlusYyZlj2Bzx6hCQVGYzNX5stPtElOsTsVVwIhSiU1aKS1XBLvidpQu
 tzjt37FZWdmmmHFXubU6/Ide+idxb03nOOFB7+lqFEcBnQuVt1tRNYqnjPQlBF1tTbgqGOkP
 CEYez9WEaQS9wV91XysmPo9imtCNINx7TactJhC8H25AqiuBlqCr3zcjJNIDCAKtr2ZCcDqA
 oObWx5kQkl4C3rYwqWIDvRq6a/v1KiZi/MB0e6yAopLo7XBnStAs86C/YYxQ6Th6LZyIbFNp
 nF4AobFTmIYXw6GO33Gt0wcUfDptUe0Qs/sP8hqdAG9uXtBrOBle11Xq1c6APoTA67uDaYsq
 BE8jI4TmyoHeM/WYuhFOp0HgSqZGp8LlL81Iy50L76ZqdVqWAaoqjZqFgRv3HiMNAwy3ekkN
 8xC5fVJ/FKU2zhqscdY0jbOmafw/uAURfjRflBR7qaiwEjv7soNo5jGnmy6hY4Ob+hBNIWaO
 YbjoarFRJ+xRKux9CCicSTTsiPYUGw0lQsVPouw0y26bqPQhU+zYvXhyksUZ+xoOl5k1Zefk
 5HC5bJ6JZZkFhuMjtmIjXSq4xHJRlET5ax1GxSV70LK/j+1MH8119AQrF02u/2WfFyPSrQd2
 dG0efPlNW0fFyKexorpvb5nzcn88fTR0dv+pxZ4vLc8z/SfWp11+U783GzX8vPHDuoTDu0OS
 T3R2vrhYa7ellb/464emDQVPJgfCD+Wt/ubQ5lT3vvbJ6KOARx78c9XZqrbr+fHyUsvH0eh5
 hlCsApuOy4rwHy7gdrXiAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIIsWRmVeSWpSXmKPExsWy7bCSnO4r0UNxBrPfGVv0njvJZLH14FxW
 i//bJjJbXPn6ns3ixb2LLBZbb0lb9D9+zWxx/vwGdouzTW/YLTY9vsZqcXnXHDaLGef3MVnM
 mPySzYHXY++3BSwem1Z1snls//aA1eN+93Emj81L6j36tqxi9Pi8Sc7j8931rAEcUVw2Kak5
 mWWpRfp2CVwZXfdXshf8E6no3vaapYHxg0AXIyeHhICJxPtfd5i6GLk4hAR2M0os2/aYsYuR
 AyghIbFlKweEKSxx+HAxRMlbRokp/xYzgfQKCxRI/F/7lhnEFhE4wygxdWMmSBGzwHpGiV1P
 n7JDdExnlNj6fCpYB5uAqsTEFffZQGxeATuJvT0n2UFsFqD4mW8bGEFsUYEIiefbbzBC1AhK
 nJz5hAXkCk4BF4lpj8NBwswC6hJ/5l1ihrDFJW49mc8EYctLNG+dzTyBUWgWku5ZSFpmIWmZ
 haRlASPLKkbJ1ILi3PTcYsMCw7zUcr3ixNzi0rx0veT83E2M4FjU0tzBuH3VB71DjEwcjIcY
 JTiYlUR4Iz/vixPiTUmsrEotyo8vKs1JLT7EKM3BoiTOe6NwYZyQQHpiSWp2ampBahFMlomD
 U6qByWTLEt21OScOXl33pjZsbWBl7eylVh8fOPwSq7zkFTJv54obH2f93pn5oirqSZXC/0/C
 aew56z31C/8Gphqs1+CXeRQWredXyqY7RyXl7/e0HuXlppKnt1/OOX/F0LlCTunBwYLW5Xzz
 /RcHJT7PrVmRf01HuuR68PrX33qiD4m9PPBRP31mgoqRpNfSPxJb32yfU7DA4IK32MS1xzaJ
 yQTk3WuKD+47ZLP5VNFrxh3fZJ/IsaUGZuXrb15v8c07//+drym7GQVnrMvff/ZBlsSc6VWT
 qlWmHf3y1aeA9YNf7dXPXlX3Tv/6e9fydt7vFQ/q0kIX5/FdTj669PnJDiVhnkcTtjVNOTHr
 nqnOqhQlluKMREMt5qLiRAAYCeXcNAMAAA==
X-CMS-MailID: 20200518045818epcas1p39ac7fcb92fd73391c1c3746c17e34b58
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200516105750epcas1p2227417d4e2387a0f6aec4a96b1ba7ae4
References: <CGME20200516105750epcas1p2227417d4e2387a0f6aec4a96b1ba7ae4@epcas1p2.samsung.com>
 <20200516105736.269669-1-christophe.jaillet@wanadoo.fr>
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
Cc: linux-samsung-soc@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgoyMC4gNS4gMTYuIOyYpO2bhCA3OjU37JeQIENocmlzdG9waGUgSkFJTExFVCDsnbQo6rCAKSDs
k7Qg6riAOgo+ICdleHlub3NfZHNpX3BhcnNlX2R0KCknIHRha2VzIGEgcmVmZXJlbmNlIHRvICdk
c2ktPmluX2JyaWRnZV9ub2RlJy4KPiBUaGlzIG11c3QgYmUgcmVsZWFzZWQgaW4gdGhlIGVycm9y
IGhhbmRsaW5nIHBhdGguCgpQaWNrZWQgaXQgdXAuCgpUaGFua3MsCklua2kgRGFlCgo+IAo+IElu
IG9yZGVyIHRvIGRvIHRoYXQsIGFkZCBhbiBlcnJvciBoYW5kbGluZyBwYXRoIGFuZCBtb3ZlIHRo
ZQo+ICdleHlub3NfZHNpX3BhcnNlX2R0KCknIGNhbGwgZnJvbSB0aGUgYmVnaW5uaW5nIHRvIHRo
ZSBlbmQgb2YgdGhlIHByb2JlCj4gZnVuY3Rpb24gdG8gZWFzZSB0aGUgZXJyb3IgaGFuZGxpbmcg
cGF0aC4KPiBUaGlzIGZ1bmN0aW9uIG9ubHkgc2V0cyBzb21lIHZhcmlhYmxlcyB3aGljaCBhcmUg
dXNlZCBvbmx5IGluIHRoZQo+ICd0cmFuc2ZlcicgZnVuY3Rpb24uCj4gCj4gVGhlIGNhbGwgY2hh
aW4gaXM6Cj4gICAgLnRyYW5zZmVyCj4gICAgIC0tPiBleHlub3NfZHNpX2hvc3RfdHJhbnNmZXIK
PiAgICAgICAtLT4gZXh5bm9zX2RzaV9pbml0Cj4gICAgICAgICAtLT4gZXh5bm9zX2RzaV9lbmFi
bGVfY2xvY2sgICh1c2UgYnVyc3RfY2xrX3JhdGUgYW5kIGVzY19jbGtfcmF0ZSkKPiAgICAgICAg
ICAgLS0+IGV4eW5vc19kc2lfc2V0X3BsbCAgICAgKHVzZSBwbGxfY2xrX3JhdGUpCj4gCj4gV2hp
bGUgYXQgaXQsIGFsc28gaGFuZGxlIGNhc2VzIHdoZXJlICdjb21wb25lbnRfYWRkKCknIGZhaWxz
Lgo+IAo+IFRoaXMgcGF0Y2ggaXMgc2ltaWxhciB0byBjb21taXQgNzA1MDVjMmVmOTRiICgiZHJt
L2V4eW5vczogZHNpOiBSZW1vdmUgYnJpZGdlIG5vZGUgcmVmZXJlbmNlIGluIHJlbW92YWwiKQo+
IHdoaWNoIGZpeGVkIHRoZSBpc3N1ZSBpbiB0aGUgcmVtb3ZlIGZ1bmN0aW9uLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IENocmlzdG9waGUgSkFJTExFVCA8Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28u
ZnI+Cj4gLS0tCj4gQSBGaXhlcyB0YWcgY291bGQgYmUgcmVxdWlyZWQsIGJ1dCBJJ3ZlIG5vdCBi
ZWVuIGFibGUgdG8gZmlndXJlIG91dCB3aGljaAo+IG9uZSB0byB1c2UuCj4gCj4gdjI6IG1vdmUg
YXJvdW5kICdleHlub3NfZHNpX3BhcnNlX2R0JyBpbnN0ZWFkIG9mIGFkZGluZyBtYW55IGdvdG9z
Cj4gICAgIGhhbmRsZSBjb21wb25lbnRfYWRkIGZhaWx1cmVzCj4gLS0tCj4gIGRyaXZlcnMvZ3B1
L2RybS9leHlub3MvZXh5bm9zX2RybV9kc2kuYyB8IDIwICsrKysrKysrKysrKysrKy0tLS0tCj4g
IDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZHNpLmMgYi9kcml2
ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZHNpLmMKPiBpbmRleCA5MDI5MzhkMjU2OGYu
LmE5ZDI0NDAyZmFiZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5v
c19kcm1fZHNpLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZHNp
LmMKPiBAQCAtMTc1OSwxMCArMTc1OSw2IEBAIHN0YXRpYyBpbnQgZXh5bm9zX2RzaV9wcm9iZShz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAJZHNpLT5kZXYgPSBkZXY7Cj4gIAlkc2kt
PmRyaXZlcl9kYXRhID0gb2ZfZGV2aWNlX2dldF9tYXRjaF9kYXRhKGRldik7Cj4gIAo+IC0JcmV0
ID0gZXh5bm9zX2RzaV9wYXJzZV9kdChkc2kpOwo+IC0JaWYgKHJldCkKPiAtCQlyZXR1cm4gcmV0
Owo+IC0KPiAgCWRzaS0+c3VwcGxpZXNbMF0uc3VwcGx5ID0gInZkZGNvcmUiOwo+ICAJZHNpLT5z
dXBwbGllc1sxXS5zdXBwbHkgPSAidmRkaW8iOwo+ICAJcmV0ID0gZGV2bV9yZWd1bGF0b3JfYnVs
a19nZXQoZGV2LCBBUlJBWV9TSVpFKGRzaS0+c3VwcGxpZXMpLAo+IEBAIC0xODIzLDExICsxODE5
LDI1IEBAIHN0YXRpYyBpbnQgZXh5bm9zX2RzaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQo+ICAJCXJldHVybiByZXQ7Cj4gIAl9Cj4gIAo+ICsJcmV0ID0gZXh5bm9zX2RzaV9w
YXJzZV9kdChkc2kpOwo+ICsJaWYgKHJldCkKPiArCQlyZXR1cm4gcmV0Owo+ICsKPiAgCXBsYXRm
b3JtX3NldF9kcnZkYXRhKHBkZXYsICZkc2ktPmVuY29kZXIpOwo+ICAKPiAgCXBtX3J1bnRpbWVf
ZW5hYmxlKGRldik7Cj4gIAo+IC0JcmV0dXJuIGNvbXBvbmVudF9hZGQoZGV2LCAmZXh5bm9zX2Rz
aV9jb21wb25lbnRfb3BzKTsKPiArCXJldCA9IGNvbXBvbmVudF9hZGQoZGV2LCAmZXh5bm9zX2Rz
aV9jb21wb25lbnRfb3BzKTsKPiArCWlmIChyZXQpCj4gKwkJZ290byBlcnJfZGlzYWJsZV9ydW50
aW1lOwo+ICsKPiArCXJldHVybiAwOwo+ICsKPiArZXJyX2Rpc2FibGVfcnVudGltZToKPiArCXBt
X3J1bnRpbWVfZGlzYWJsZShkZXYpOwo+ICsJb2Zfbm9kZV9wdXQoZHNpLT5pbl9icmlkZ2Vfbm9k
ZSk7Cj4gKwo+ICsJcmV0dXJuIHJldDsKPiAgfQo+ICAKPiAgc3RhdGljIGludCBleHlub3NfZHNp
X3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+IApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
