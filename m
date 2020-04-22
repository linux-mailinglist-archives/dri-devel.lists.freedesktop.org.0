Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AA51B3591
	for <lists+dri-devel@lfdr.de>; Wed, 22 Apr 2020 05:33:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3359F6E4BB;
	Wed, 22 Apr 2020 03:33:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D7996E4BB
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Apr 2020 03:33:29 +0000 (UTC)
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20200422033327epoutp029db80ddb56c801bf280286d73ae9c637~IBttcRWeM0202102021epoutp02X
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Apr 2020 03:33:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20200422033327epoutp029db80ddb56c801bf280286d73ae9c637~IBttcRWeM0202102021epoutp02X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1587526407;
 bh=rHRFhOm3d5X3uCzrv6JCkr/Ga5lu4G0lQQo0a8i9lGI=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=M81xgS/HNgOmemFKY2ZaGxzmRXpYDVCxjf63pnw2CJEN2qzFlZvbpTd3oviGy8AKX
 c/b+eJ6PW/LntiNaAUGVPWp4uSfQN0fTjL5v5QtujzJ1erZg2qKK4gV9AVQrOSIQeb
 pOYvYO1GZuC1HXN5cbjPHZJe+nkWeePp7CzqiHmw=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTP id
 20200422033326epcas1p3445abb3dc8e8ea5ea94bdd7414615af1~IBtsd99P20666006660epcas1p38;
 Wed, 22 Apr 2020 03:33:26 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.40.153]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 496Qxw042jzMqYkZ; Wed, 22 Apr
 2020 03:33:24 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 E1.AC.04744.30BBF9E5; Wed, 22 Apr 2020 12:33:23 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200422033323epcas1p173c1775e4f262ad67fd6cf5b3c03e48d~IBtpafPcC3085130851epcas1p12;
 Wed, 22 Apr 2020 03:33:23 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200422033323epsmtrp2871297e58febd5706787c9a36d57c39e~IBtpZmnzm1058110581epsmtrp2k;
 Wed, 22 Apr 2020 03:33:23 +0000 (GMT)
X-AuditID: b6c32a38-26bff70000001288-08-5e9fbb03869c
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 FA.90.04024.30BBF9E5; Wed, 22 Apr 2020 12:33:23 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200422033323epsmtip20a692321730c3e5cfb52e70ae63cba61~IBtpL78Lg2768627686epsmtip2O;
 Wed, 22 Apr 2020 03:33:23 +0000 (GMT)
Subject: Re: [PATCH] drm/exynos: Delete an error message in three functions
To: Markus Elfring <Markus.Elfring@web.de>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Joonyoung
 Shim <jy0922.shim@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Kukjin Kim <kgene@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>
From: Inki Dae <inki.dae@samsung.com>
Message-ID: <a088b8e7-869b-8f8f-b9a1-9b68de7b714c@samsung.com>
Date: Wed, 22 Apr 2020 12:38:24 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <57b725ed-f705-b5e1-0da6-3d16801c7c85@web.de>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrFJsWRmVeSWpSXmKPExsWy7bCmri7z7vlxBiufWFn0njvJZPF/20Rm
 iytf37NZvLh3kcVi6y1pi/7Hr5ktzp/fwG5xtukNu8Wmx9dYLS7vmsNmMeP8PqCGWc9ZLWZM
 fslm8fF/M7MDn8f56b1sHnu/LWDx2LSqk81j+7cHrB73u48zeWxeUu/Rt2UVo8fnTXIet59t
 YwngjMq2yUhNTEktUkjNS85PycxLt1XyDo53jjc1MzDUNbS0MFdSyEvMTbVVcvEJ0HXLzAG6
 XUmhLDGnFCgUkFhcrKRvZ1OUX1qSqpCRX1xiq5RakJJTYFmgV5yYW1yal66XnJ9rZWhgYGQK
 VJiQnbHu/HTWgjsiFWvf5TYwNgp2MXJySAiYSDy79p21i5GLQ0hgB6PEmtmT2CCcT4wSCw7+
 ZodwvjFKPNx1jA2mpamrBaplL6PE3GlTWUASQgLvGSWOH6oGsYUFvCWmr5kE1i0isJhZYtG2
 vYwgCWaBYoneo0tYQWw2AVWJiSvug03lFbCT+NS7iB3EZgGKXzw8DSjOwSEqECFx+msiRImg
 xMmZT8B2cQpYScycvJgNYqS4xK0n85kgbHmJ5q2zmUH2SgisY5c4cfULI8TVLhK9C7ewQtjC
 Eq+Ob2GHsKUkPr/bywbR0MwoMXHGaSYIp4NR4u7j6ywQVcYS+5dOZgK5iFlAU2L9Ln2IsKLE
 zt9zoR7jk3j3tYcVpERCgFeio00IokRJ4tjFG1A3SEhcWDIRGooeEqsv7mGawKg4C8lvs5D8
 MwvJP7MQFi9gZFnFKJZaUJybnlpsWGCCHNubGMHpWstiB+Oecz6HGAU4GJV4eG+cnxcnxJpY
 VlyZe4hRgoNZSYR3w0OgEG9KYmVValF+fFFpTmrxIUZTYMhPZJYSTc4H5pK8knhDUyNjY2ML
 E0MzU0NDJXHeqddz4oQE0hNLUrNTUwtSi2D6mDg4pRoYm35a2nlOX2d4b3XLglmXJc+XFZmE
 PJ16aotNdoXlkZ+Od0s2tCl/uL4qZRbr7wDbG0tbtq15ITOVTdN/esVck0DBkK+H3Lpb93jH
 eXmdOmOgsqXg+mmhMrt3K+P2W3Bfnrjv0Q7f0Ltf9C6xm06dks9gNvP5078rq1v6py1aZM52
 5cv2R/p33yqxFGckGmoxFxUnAgDVZBnj7QMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBIsWRmVeSWpSXmKPExsWy7bCSvC7z7vlxBrcuylj0njvJZPF/20Rm
 iytf37NZvLh3kcVi6y1pi/7Hr5ktzp/fwG5xtukNu8Wmx9dYLS7vmsNmMeP8PqCGWc9ZLWZM
 fslm8fF/M7MDn8f56b1sHnu/LWDx2LSqk81j+7cHrB73u48zeWxeUu/Rt2UVo8fnTXIet59t
 YwngjOKySUnNySxLLdK3S+DKWHd+OmvBHZGKte9yGxgbBbsYOTkkBEwkmrpaWLsYuTiEBHYz
 Shx59oOxi5EDKCEhsWUrB4QpLHH4cDFEyVtGib39rawgvcIC3hLT10xiB0mICCxllph8+B07
 SIJZoFhi24c17BAdvYwSR4/vZwJJsAmoSkxccZ8NxOYVsJP41LsIrIEFKH7x8DSwuKhAhMTz
 7TcYIWoEJU7OfMICYnMKWEnMnLyYDWKBusSfeZeYIWxxiVtP5jNB2PISzVtnM09gFJqFpH0W
 kpZZSFpmIWlZwMiyilEytaA4Nz232LDAMC+1XK84Mbe4NC9dLzk/dxMjOD61NHcwXl4Sf4hR
 gINRiYf3xvl5cUKsiWXFlbmHGCU4mJVEeDc8BArxpiRWVqUW5ccXleakFh9ilOZgURLnfZp3
 LFJIID2xJDU7NbUgtQgmy8TBKdXAuOxgZ6v0sZ1rZI+X7Mo5fi7uZd2DKc9TllrwlWRGiZz+
 dO9hatZP3dqVU7um5DQvXbbbI/nGGgEzjnVXC/wsSjo39ifKtzn5bNl019SwVzd5d+X/fyHW
 n20dpI22r5yh9kx7qkn7DbfNzsVhIcbCyn79M+apCK3bu/HBwqm7fv1YeOPY9pdC35VYijMS
 DbWYi4oTAd2g5qjLAgAA
X-CMS-MailID: 20200422033323epcas1p173c1775e4f262ad67fd6cf5b3c03e48d
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200405121842epcas1p4c947a40c70881e72c38d6c9cc75c60d5
References: <CGME20200405121842epcas1p4c947a40c70881e72c38d6c9cc75c60d5@epcas1p4.samsung.com>
 <57b725ed-f705-b5e1-0da6-3d16801c7c85@web.de>
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
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Tang Bin <tangbin@cmss.chinamobile.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTWFya3VzIEVsZnJpbmcsCgoyMC4gNC4gNS4g7Jik7ZuEIDk6MTjsl5AgTWFya3VzIEVsZnJp
bmcg7J20KOqwgCkg7JO0IOq4gDoKPiBGcm9tOiBNYXJrdXMgRWxmcmluZyA8ZWxmcmluZ0B1c2Vy
cy5zb3VyY2Vmb3JnZS5uZXQ+Cj4gRGF0ZTogU3VuLCA1IEFwciAyMDIwIDE0OjEwOjA5ICswMjAw
Cj4gCj4gVGhlIGZ1bmN0aW9uIOKAnHBsYXRmb3JtX2dldF9pcnHigJ0gY2FuIGxvZyBhbiBlcnJv
ciBhbHJlYWR5Lgo+IFRodXMgb21pdCByZWR1bmRhbnQgbWVzc2FnZXMgZm9yIHRoZSBleGNlcHRp
b24gaGFuZGxpbmcgaW4gdGhlCj4gY2FsbGluZyBmdW5jdGlvbnMuCj4gCj4gVGhpcyBpc3N1ZSB3
YXMgZGV0ZWN0ZWQgYnkgdXNpbmcgdGhlIENvY2NpbmVsbGUgc29mdHdhcmUuCgpQaWNrZWQgaXQg
dXAuCgpUaGFua3MsCklua2kgRGFlLgoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBNYXJrdXMgRWxmcmlu
ZyA8ZWxmcmluZ0B1c2Vycy5zb3VyY2Vmb3JnZS5uZXQ+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9leHlub3MvZXh5bm9zX2RybV9kc2kuYyAgICAgfCA0ICstLS0KPiAgZHJpdmVycy9ncHUvZHJt
L2V4eW5vcy9leHlub3NfZHJtX3JvdGF0b3IuYyB8IDQgKy0tLQo+ICBkcml2ZXJzL2dwdS9kcm0v
ZXh5bm9zL2V4eW5vc19kcm1fc2NhbGVyLmMgIHwgNCArLS0tCj4gIDMgZmlsZXMgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZHNpLmMgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9z
L2V4eW5vc19kcm1fZHNpLmMKPiBpbmRleCBlMDgwYWE5MjMzOGMuLmEwMGM2ZGQxNmM4YSAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZHNpLmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZHNpLmMKPiBAQCAtMTgxMywxMCAr
MTgxMyw4IEBAIHN0YXRpYyBpbnQgZXh5bm9zX2RzaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpwZGV2KQo+ICAJfQo+IAo+ICAJZHNpLT5pcnEgPSBwbGF0Zm9ybV9nZXRfaXJxKHBkZXYs
IDApOwo+IC0JaWYgKGRzaS0+aXJxIDwgMCkgewo+IC0JCWRldl9lcnIoZGV2LCAiZmFpbGVkIHRv
IHJlcXVlc3QgZHNpIGlycSByZXNvdXJjZVxuIik7Cj4gKwlpZiAoZHNpLT5pcnEgPCAwKQo+ICAJ
CXJldHVybiBkc2ktPmlycTsKPiAtCX0KPiAKPiAgCWlycV9zZXRfc3RhdHVzX2ZsYWdzKGRzaS0+
aXJxLCBJUlFfTk9BVVRPRU4pOwo+ICAJcmV0ID0gZGV2bV9yZXF1ZXN0X3RocmVhZGVkX2lycShk
ZXYsIGRzaS0+aXJxLCBOVUxMLAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9z
L2V4eW5vc19kcm1fcm90YXRvci5jIGIvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJt
X3JvdGF0b3IuYwo+IGluZGV4IGRhZmE4N2I4MjA1Mi4uMmQ5NGFmYmEwMzFlIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9yb3RhdG9yLmMKPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fcm90YXRvci5jCj4gQEAgLTI5MywxMCAr
MjkzLDggQEAgc3RhdGljIGludCByb3RhdG9yX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYpCj4gIAkJcmV0dXJuIFBUUl9FUlIocm90LT5yZWdzKTsKPiAKPiAgCWlycSA9IHBsYXRm
b3JtX2dldF9pcnEocGRldiwgMCk7Cj4gLQlpZiAoaXJxIDwgMCkgewo+IC0JCWRldl9lcnIoZGV2
LCAiZmFpbGVkIHRvIGdldCBpcnFcbiIpOwo+ICsJaWYgKGlycSA8IDApCj4gIAkJcmV0dXJuIGly
cTsKPiAtCX0KPiAKPiAgCXJldCA9IGRldm1fcmVxdWVzdF9pcnEoZGV2LCBpcnEsIHJvdGF0b3Jf
aXJxX2hhbmRsZXIsIDAsIGRldl9uYW1lKGRldiksCj4gIAkJCSAgICAgICByb3QpOwo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fc2NhbGVyLmMgYi9kcml2
ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fc2NhbGVyLmMKPiBpbmRleCA5M2M0M2M4ZDkx
NGUuLmNlMTg1NzEzOGY4OSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4
eW5vc19kcm1fc2NhbGVyLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19k
cm1fc2NhbGVyLmMKPiBAQCAtNTAyLDEwICs1MDIsOCBAQCBzdGF0aWMgaW50IHNjYWxlcl9wcm9i
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAJCXJldHVybiBQVFJfRVJSKHNjYWxl
ci0+cmVncyk7Cj4gCj4gIAlpcnEgPSBwbGF0Zm9ybV9nZXRfaXJxKHBkZXYsIDApOwo+IC0JaWYg
KGlycSA8IDApIHsKPiAtCQlkZXZfZXJyKGRldiwgImZhaWxlZCB0byBnZXQgaXJxXG4iKTsKPiAr
CWlmIChpcnEgPCAwKQo+ICAJCXJldHVybiBpcnE7Cj4gLQl9Cj4gCj4gIAlyZXQgPSBkZXZtX3Jl
cXVlc3RfdGhyZWFkZWRfaXJxKGRldiwgaXJxLCBOVUxMLAlzY2FsZXJfaXJxX2hhbmRsZXIsCj4g
IAkJCQkJSVJRRl9PTkVTSE9ULCAiZHJtX3NjYWxlciIsIHNjYWxlcik7Cj4gLS0KPiAyLjI2LjAK
PiAKPiAKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
