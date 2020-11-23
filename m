Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DB32BFE01
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 02:17:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D831589B45;
	Mon, 23 Nov 2020 01:17:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B355D89B45
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 01:17:02 +0000 (UTC)
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20201123011700epoutp012650cc977ba7bae98ea17ba47448b13e~J-i8MhaAD2235622356epoutp01O
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 01:17:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20201123011700epoutp012650cc977ba7bae98ea17ba47448b13e~J-i8MhaAD2235622356epoutp01O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1606094220;
 bh=zVzTnuyKE3DO2//uowBhMsWnup1z0a7x1hwyk7fg5zg=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=Aps6gfjyPJ2Q9prFEC5A2XDcfvIjNEaobfUnrat1AZ90L+MbwbRBMZvHFpkKivCwS
 zNFijCDn53fj96kkISoQ00K8uLuu3E3R4MiuUkqzsVfa6sray9oJl7J2or91SDr1aR
 sc36Xg+SqyQO73RCLGGMxhLEf9tfXbLSlCxqHrsQ=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20201123011659epcas1p1f73f65b6aba279f2b7958c17ccf58dd8~J-i7sOpua0596505965epcas1p1L;
 Mon, 23 Nov 2020 01:16:59 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.40.153]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4CfTlF1lw6zMqYkb; Mon, 23 Nov
 2020 01:16:57 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
 epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 47.4A.63458.18D0BBF5; Mon, 23 Nov 2020 10:16:49 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20201123011649epcas1p4824e4ed9cdcb96e74606da954f783edb~J-ix9TPv02005820058epcas1p4n;
 Mon, 23 Nov 2020 01:16:49 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20201123011649epsmtrp1720f6cfb9eb188fce3ea745a6eefd8b2~J-ix8Os7O1181211812epsmtrp1Z;
 Mon, 23 Nov 2020 01:16:49 +0000 (GMT)
X-AuditID: b6c32a36-6c9ff7000000f7e2-18-5fbb0d81f8fc
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 9F.D5.13470.18D0BBF5; Mon, 23 Nov 2020 10:16:49 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20201123011648epsmtip2c593d73923d4ce98001aae700522ba1f~J-ixpnLIB0813908139epsmtip2R;
 Mon, 23 Nov 2020 01:16:48 +0000 (GMT)
Subject: Re: [PATCH 1/2] drm/exynos: depend on COMMON_CLK to fix compile tests
To: Krzysztof Kozlowski <krzk@kernel.org>, Joonyoung Shim
 <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin
 Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, Paul Cercueil <paul@crapouillou.net>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
From: Inki Dae <inki.dae@samsung.com>
Message-ID: <5447e15e-d5a9-9d09-d6d1-6f9dff8cc142@samsung.com>
Date: Mon, 23 Nov 2020 10:24:23 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20201116175301.402787-1-krzk@kernel.org>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKJsWRmVeSWpSXmKPExsWy7bCmnm4j7+54g0uflS16z51ksvi/bSKz
 xZWv79ksXty7yGJx/vwGdouzTW/YLTY9vsZqcXnXHDaLGef3MVm8an7EZtG/+BKLxYzJL9kc
 eDxWX2pn89j7bQGLx+I9L5k8Nq3qZPPY/u0Bq8f97uNMHpuX1Hv0bVnF6PF5k1wAZ1S2TUZq
 YkpqkUJqXnJ+SmZeuq2Sd3C8c7ypmYGhrqGlhbmSQl5ibqqtkotPgK5bZg7QyUoKZYk5pUCh
 gMTiYiV9O5ui/NKSVIWM/OISW6XUgpScAssCveLE3OLSvHS95PxcK0MDAyNToMKE7IzlB9pZ
 Ck5yVTS+3c/cwHibo4uRk0NCwESi+c9y9i5GLg4hgR2MEg1vJzJCOJ8YJWbtOMUK4XxjlPi/
 9io7TMudY5ugEnsZJR62r2SBcN4zSrzbfp6ti5GDQ1ggQKLpqxBIg4jAAmaJbxudQWxmAVWJ
 13vfMoHYbED2xBX32UBsXgE7iR1NPWALWIDiezubWEBsUYEIiePdk9khagQlTs58AhbnFDCT
 WPXvAiPETHGJW0/mM0HY8hLNW2czg9wjIXCGQ2LuyW42iKtdJL6+nwZlC0u8Or4F6hspiZf9
 bewQDc2MEhNnnGaCcDoYJe4+vs4CUWUssX/pZCaQz5gFNCXW79KHCCtK7Pw9F+oKPol3X3tY
 QUokBHglOtqEIEqUJI5dvMEIYUtIXFgyEeoGD4nZNz+xTWBUnIXkt1lI/pmF5J9ZCIsXMLKs
 YhRLLSjOTU8tNiwwQo7uTYzg9KxltoNx0tsPeocYmTgYDzFKcDArifC2yu2MF+JNSaysSi3K
 jy8qzUktPsRoCgzticxSosn5wAyRVxJvaGpkbGxsYWJoZmpoqCTO+0e7I15IID2xJDU7NbUg
 tQimj4mDU6qByWmy+CUdtT08pzxuF5w4ctlvrZnX8as6Vja/vjQySX6yn8zXGq4xobz62jWP
 mkKds9vqGBodwh60/bvBkmOTI3DjxPrFaTsbEv5avhQO0Iq+O2/BCrVl6/L0lO6fY5h4duFx
 1w+CB/+YODnbqK97Pv1iWtbsGFu5332GqWEXtpaXvNxibfzvun4625mV51aoK2wXmlR396GG
 tN3Rh+faf65/cT7oh/7a13XRhk0J0rw7n4U+kVnq8nCJGOunOTWJX67ki97JnV9VvPPZwYYQ
 V07vP3eYTv0vT37K7xMbrt95lO9L4i3b6n+xPccK0pZPez/1muOb/uAfjdOdeqOT8+bkd3hn
 +Dcbbjtpw/TjjhJLcUaioRZzUXEiAHIgVz1YBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEIsWRmVeSWpSXmKPExsWy7bCSvG4j7+54g1ebmC16z51ksvi/bSKz
 xZWv79ksXty7yGJx/vwGdouzTW/YLTY9vsZqcXnXHDaLGef3MVm8an7EZtG/+BKLxYzJL9kc
 eDxWX2pn89j7bQGLx+I9L5k8Nq3qZPPY/u0Bq8f97uNMHpuX1Hv0bVnF6PF5k1wAZxSXTUpq
 TmZZapG+XQJXxvID7SwFJ7kqGt/uZ25gvM3RxcjJISFgInHn2CbWLkYuDiGB3YwS67ffY+li
 5ABKSEhs2coBYQpLHD5cDFHyllHiz7JeZpC4sICfxOYlDiBxEYFFzBIfrzxhApnJLKAq8Xrv
 WyaIhk5GibtXn7CAJNiAEhNX3GcDsXkF7CR2NPWwg9gsQPG9nU1gNaICERIt9/+wQ9QISpyc
 CdHLKWAmserfBUaIBeoSf+ZdYoawxSVuPZkPtVheonnrbOYJjEKzkLTPQtIyC0nLLCQtCxhZ
 VjFKphYU56bnFhsWGOallusVJ+YWl+al6yXn525iBEejluYOxu2rPugdYmTiYDzEKMHBrCTC
 2yq3M16INyWxsiq1KD++qDQntfgQozQHi5I4743ChXFCAumJJanZqakFqUUwWSYOTqkGpqNa
 82y05hyecO4Ek+c9ho0/Km1Zn74OX2D03ek+69uVGzvXZn9qX68u4SIf+SPBTLNavOn0QWW+
 g+EcovvKpXr6HgbE5uluumkaz/Fp4eNXf9dwCH5+4af25yijyMy/Nz5IWIvM3bcnijchwSDw
 bo70zc/TXmlPEfTcWPPA3nnxcV+J7NfiYXOYI0RPsQVOXlidsFXQ9uhu+bJ9p/qWmi09cnm9
 ycam+6t6M0/MTt99JiBgfvGE2eeZla79mbrmTRXPkfdRfKejPpXd3rlg+btKy0obxtgj2x99
 5PmllSxzMk1iq9jB3Z9Wzk29n7e/7/fWJq9trM3BlUKGJva5bnsyeq693cSUHbyk5aP4/1Yl
 luKMREMt5qLiRAAjRKH+NQMAAA==
X-CMS-MailID: 20201123011649epcas1p4824e4ed9cdcb96e74606da954f783edb
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201116175410epcas1p1c0dbe17b850b30baa05d768fbdc74f5d
References: <CGME20201116175410epcas1p1c0dbe17b850b30baa05d768fbdc74f5d@epcas1p1.samsung.com>
 <20201116175301.402787-1-krzk@kernel.org>
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
Cc: kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SEkgS3J6eXN6dG9mLAoKMjAuIDExLiAxNy4g7Jik7KCEIDI6NTPsl5AgS3J6eXN6dG9mIEtvemxv
d3NraSDsnbQo6rCAKSDsk7Qg6riAOgo+IFRoZSBFeHlub3MgRFJNIHVzZXMgQ29tbW9uIENsb2Nr
IEZyYW1ld29yayB0aHVzIGl0IGNhbm5vdCBiZSBidWlsdCBvbgo+IHBsYXRmb3JtcyB3aXRob3V0
IGl0IChlLmcuIGNvbXBpbGUgdGVzdCBvbiBNSVBTIHdpdGggUkFMSU5LIGFuZAo+IFNPQ19SVDMw
NVgpOgo+IAo+ICAgICAvdXNyL2Jpbi9taXBzLWxpbnV4LWdudS1sZDogZHJpdmVycy9ncHUvZHJt
L2V4eW5vcy9leHlub3NfbWl4ZXIubzogaW4gZnVuY3Rpb24gYG1peGVyX2JpbmQnOgo+ICAgICBl
eHlub3NfbWl4ZXIuYzooLnRleHQrMHg5NTgpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBjbGtf
c2V0X3BhcmVudCcKPiAKPiBSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRl
bC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwu
b3JnPgoKUGlja2VkIGl0IHVwLgoKVGhhbmtzLApJbmtpIERhZQoKPiAtLS0KPiAgZHJpdmVycy9n
cHUvZHJtL2V4eW5vcy9LY29uZmlnIHwgMyArKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
ZXh5bm9zL0tjb25maWcgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL0tjb25maWcKPiBpbmRleCA2
NDE3ZjM3NGI5MjMuLjk1MWQ1ZjcwOGU5MiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
ZXh5bm9zL0tjb25maWcKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL0tjb25maWcKPiBA
QCAtMSw3ICsxLDggQEAKPiAgIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5
Cj4gIGNvbmZpZyBEUk1fRVhZTk9TCj4gIAl0cmlzdGF0ZSAiRFJNIFN1cHBvcnQgZm9yIFNhbXN1
bmcgU29DIEV4eW5vcyBTZXJpZXMiCj4gLQlkZXBlbmRzIG9uIE9GICYmIERSTSAmJiAoQVJDSF9T
M0M2NFhYIHx8IEFSQ0hfUzVQVjIxMCB8fCBBUkNIX0VYWU5PUyB8fCBBUkNIX01VTFRJUExBVEZP
Uk0gfHwgQ09NUElMRV9URVNUKQo+ICsJZGVwZW5kcyBvbiBPRiAmJiBEUk0gJiYgQ09NTU9OX0NM
Swo+ICsJZGVwZW5kcyBvbiBBUkNIX1MzQzY0WFggfHwgQVJDSF9TNVBWMjEwIHx8IEFSQ0hfRVhZ
Tk9TIHx8IEFSQ0hfTVVMVElQTEFURk9STSB8fCBDT01QSUxFX1RFU1QKPiAgCWRlcGVuZHMgb24g
TU1VCj4gIAlzZWxlY3QgRFJNX0tNU19IRUxQRVIKPiAgCXNlbGVjdCBWSURFT01PREVfSEVMUEVS
Uwo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
