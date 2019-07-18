Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 850426D087
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 16:56:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12AFB6E3F4;
	Thu, 18 Jul 2019 14:56:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3688F6E3F4
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 14:56:00 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190718145558euoutp02298a20aebc7c4e7728727df3b80e88d0~yiC_apj9F1231212312euoutp02_
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 14:55:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190718145558euoutp02298a20aebc7c4e7728727df3b80e88d0~yiC_apj9F1231212312euoutp02_
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190718145557eucas1p110f12b7f20e86ba9ffa81dbf6ccb2f3b~yiC9vjnAF1109211092eucas1p1E;
 Thu, 18 Jul 2019 14:55:57 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id AD.B8.04298.D78803D5; Thu, 18
 Jul 2019 15:55:57 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190718145557eucas1p15a48800d76400fa564f5e153212c010d~yiC9IKDYm1366213662eucas1p1I;
 Thu, 18 Jul 2019 14:55:57 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190718145557eusmtrp2f5d1c3349bcbf8d88cb3306d5f7c67fe~yiC86EM231858018580eusmtrp2k;
 Thu, 18 Jul 2019 14:55:57 +0000 (GMT)
X-AuditID: cbfec7f2-f13ff700000010ca-66-5d30887d22fb
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id EE.79.04140.C78803D5; Thu, 18
 Jul 2019 15:55:57 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190718145556eusmtip29fbe69b16a5dbc623a31d5527f3093e7~yiC8cM-g63238732387eusmtip2A;
 Thu, 18 Jul 2019 14:55:56 +0000 (GMT)
Subject: Re: [PATCH] drm/bridge: fix RC_CORE dependency
To: Arnd Bergmann <arnd@arndb.de>
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <7da08013-5ee0-1c39-e16b-8b6843a28381@samsung.com>
Date: Thu, 18 Jul 2019 16:55:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a0q5xmi+mCvb1ET4d1uQmbnw+J2VkjRCzjemCXGy+5OBg@mail.gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOKsWRmVeSWpSXmKPExsWy7djP87q1HQaxBhfOa1v0njvJZPF30jF2
 i//bJjJbHF70gtHiytf3bBadE5ewW1zeNYfN4sW9t0wWdycfYXTg9Pj9axKjx95vC1g8ds66
 y+4xu2Mmq8eUTgmP7d8esHrc7z7O5HF81y12j8+b5AI4o7hsUlJzMstSi/TtErgyfnxtZCtY
 yFPxa8Nv5gbGiVxdjBwcEgImEkdeyHYxcnEICaxglHj8bQ4jhPOFUeLp0RPsEM5nRonWgxtY
 YTqmnTeGiC9nlFg5q4kJwnnLKLHu9l6gdk4OYQFziV2zH7GC2CICihJTXzxjBiliFnjHJPFm
 UhcTSIJNQFPi7+abbCA2r4CdRPP332BxFgFViZU3P4HFRQXCJH4u6ISqEZQ4OfMJC4jNKRAo
 cevSerAFzALyEtvfzmGGsMUlbj2ZD3aRhMAjdompd+eBXSQh4CKx7fVhNghbWOLV8S3sELaM
 xP+d85kg7HqJ+ytamCGaOxgltm7YyQyRsJY4fPwi2P/MQFev36UPEXaUOHt3DQskWPgkbrwV
 hLiBT2LStunMEGFeiY42IYhqRYn7Z7dCDRSXWHrhK9sERqVZSD6bheSbWUi+mYWwdwEjyypG
 8dTS4tz01GLDvNRyveLE3OLSvHS95PzcTYzA5HX63/FPOxi/Xko6xCjAwajEwxuQaxArxJpY
 VlyZe4hRgoNZSYT39kv9WCHelMTKqtSi/Pii0pzU4kOM0hwsSuK81QwPooUE0hNLUrNTUwtS
 i2CyTBycUg2MojoPd2qdNHnNU9i/TvA9u3bl4/fb+/frLm3lN1p0mevc+pfTp32R074scuLB
 z4MlwvEigWf/n2m9dcRP9GqqnZOu/oR4K9OZe9KzOpcsTgqUObF6DUvyCqbJVlvYhKbIBgln
 aS+pb7k7NUI6YlXKsSm9ATdOf3edev6G3zf/oB3yNsq3Vlb8UGIpzkg01GIuKk4EABhnH5Za
 AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBIsWRmVeSWpSXmKPExsVy+t/xe7q1HQaxBn0GFr3nTjJZ/J10jN3i
 /7aJzBaHF71gtLjy9T2bRefEJewWl3fNYbN4ce8tk8XdyUcYHTg9fv+axOix99sCFo+ds+6y
 e8zumMnqMaVTwmP7twesHve7jzN5HN91i93j8ya5AM4oPZui/NKSVIWM/OISW6VoQwsjPUNL
 Cz0jE0s9Q2PzWCsjUyV9O5uU1JzMstQifbsEvYwfXxvZChbyVPza8Ju5gXEiVxcjB4eEgInE
 tPPGXYxcHEICSxklDrxuYexi5ASKi0vsnv+WGcIWlvhzrYsNxBYSeM0ocXunKYgtLGAusWv2
 I1YQW0RAUWLqi2fMIIOYBd4xSZzcO50ZYmoLk8Shqe1gU9kENCX+br4JNolXwE6i+ftvJhCb
 RUBVYuXNT2wgF4kKhEkcPZEHUSIocXLmExYQm1MgUOLWpfVgy5gF1CX+zLvEDGHLS2x/OwfK
 Fpe49WQ+0wRGoVlI2mchaZmFpGUWkpYFjCyrGEVSS4tz03OLjfSKE3OLS/PS9ZLzczcxAmN1
 27GfW3Ywdr0LPsQowMGoxMMbkGsQK8SaWFZcmXuIUYKDWUmE9/ZL/Vgh3pTEyqrUovz4otKc
 1OJDjKZAv01klhJNzgemkbySeENTQ3MLS0NzY3NjMwslcd4OgYMxQgLpiSWp2ampBalFMH1M
 HJxSDYwbpSptbmiq8VX9ed877+LmYJmZp3VfWurah++eVVn1//kzBsuO8z4nN+27839it17c
 /niDTc7ikR5R8qevl7A9OuM0PXzPnofWbQUTT8X9S14+N42fa0LfDq3l2e942jcnfyzlir82
 vfZjZVb0sV7d3iUGuz78qU6N3FrxPXD2/Hk/z8UcWThDiaU4I9FQi7moOBEAqD0GN+sCAAA=
X-CMS-MailID: 20190718145557eucas1p15a48800d76400fa564f5e153212c010d
X-Msg-Generator: CA
X-RootMTR: 20190718134253epcas3p32a5afece52c47aaac0cd5795ff4cf022
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190718134253epcas3p32a5afece52c47aaac0cd5795ff4cf022
References: <CGME20190718134253epcas3p32a5afece52c47aaac0cd5795ff4cf022@epcas3p3.samsung.com>
 <20190718134240.2265724-1-arnd@arndb.de>
 <ea59751e-7391-e3e9-bb46-00e86b25f1a8@samsung.com>
 <CAK8P3a0q5xmi+mCvb1ET4d1uQmbnw+J2VkjRCzjemCXGy+5OBg@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1563461758;
 bh=BWVW0fKTFihsP0lM43tVLHndB+z6WqLVgsWkRd4FhEM=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=hTEl5gPJFS8KPlF28walMtHkRYMldjDqLXaC94OnkYQaKKNyeTlGxX5EADnRHCB3u
 bjUPOi4ePV6c15r/tSiLCmsa8b3nfipf7oA6NnNsZl04iIsiARR9lOYpavSgCzqVBD
 n3ATy9iHi2mNKWnwiRZMfA1andWJkHpH3Z7I9md0=
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
Cc: David Airlie <airlied@linux.ie>,
 =?UTF-8?Q?Ronald_Tschal=c3=a4r?= <ronald@innovation.ch>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTguMDcuMjAxOSAxNjoyMSwgQXJuZCBCZXJnbWFubiB3cm90ZToKPiBPbiBUaHUsIEp1bCAx
OCwgMjAxOSBhdCA0OjE2IFBNIEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+IHdy
b3RlOgo+PiBIaSBBcm5kLAo+Pgo+PiBPbiAxOC4wNy4yMDE5IDE1OjQyLCBBcm5kIEJlcmdtYW5u
IHdyb3RlOgo+Pj4gVXNpbmcgJ2ltcGx5JyBjYXVzZXMgYSBuZXcgcHJvYmxlbSwgYXMgaXQgYWxs
b3dzIHRoZSBjYXNlIG9mCj4+PiBDT05GSUdfSU5QVVQ9bSB3aXRoIFJDX0NPUkU9eSwgd2hpY2gg
ZmFpbHMgdG8gbGluazoKPj4+Cj4+PiBkcml2ZXJzL21lZGlhL3JjL3JjLW1haW4ubzogSW4gZnVu
Y3Rpb24gYGlyX2RvX2tleXVwJzoKPj4+IHJjLW1haW4uYzooLnRleHQrMHgyYjQpOiB1bmRlZmlu
ZWQgcmVmZXJlbmNlIHRvIGBpbnB1dF9ldmVudCcKPj4+IGRyaXZlcnMvbWVkaWEvcmMvcmMtbWFp
bi5vOiBJbiBmdW5jdGlvbiBgcmNfcmVwZWF0JzoKPj4+IHJjLW1haW4uYzooLnRleHQrMHgzNTAp
OiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBpbnB1dF9ldmVudCcKPj4+IGRyaXZlcnMvbWVkaWEv
cmMvcmMtbWFpbi5vOiBJbiBmdW5jdGlvbiBgcmNfYWxsb2NhdGVfZGV2aWNlJzoKPj4+IHJjLW1h
aW4uYzooLnRleHQrMHg5MGMpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBpbnB1dF9hbGxvY2F0
ZV9kZXZpY2UnCj4+Pgo+Pj4gQWRkIGEgJ2RlcGVuZHMgb24nIHRoYXQgYWxsb3dzIGJ1aWxkaW5n
IGJvdGggd2l0aCBhbmQgd2l0aG91dAo+Pj4gQ09ORklHX1JDX0NPUkUsIGJ1dCBkaXNhbGxvd3Mg
Y29tYmluYXRpb25zIHRoYXQgZG9uJ3QgbGluay4KPj4+Cj4+PiBGaXhlczogNTAyM2NmMzIyMTBk
ICgiZHJtL2JyaWRnZTogbWFrZSByZW1vdGUgY29udHJvbCBvcHRpb25hbCIpCj4+PiBTaWduZWQt
b2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+Pgo+PiBQcm9wZXIgc29sdXRp
b24gaGFzIGJlZW4gYWxyZWFkeSBtZXJnZWQgdmlhIGlucHV0IHRyZWVbMV0uCj4+Cj4+Cj4+IFsx
XToKPj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC9DQUtkQWtSVEdYTmJVc3VLQVNOR0xm
d1V3QzdBc29kOUs1YmFZTFBXUFU3RVgtNDIteUFAbWFpbC5nbWFpbC5jb20vCj4gQXQgdGhhdCBs
aW5rLCBJIG9ubHkgc2VlIHRoZSBwYXRjaCB0aGF0IGNhdXNlZCB0aGUgcmVncmVzc2lvbiwgbm90
Cj4gdGhlIHNvbHV0aW9uLiBBcmUgeW91IHN1cmUgaXQncyBmaXhlZD8KCgpVcHMsIHlvdSBhcmUg
cmlnaHQsIEkgdGhvdWdoIHlvdSBhcmUgZml4aW5nIHdoYXQgdGhpcyBwYXRjaCBhdHRlbXB0ZWQg
dG8KZml4IDopCgpBbnl3YXksIHdlIHdhbnQgdG8gYXZvaWQgZGVwZW5kZW5jeSBvbiBSQ19DT1JF
IC0gdGhpcyBkcml2ZXIgZG9lcyBub3QKcmVxdWlyZSBpdCwgYnV0IHdpdGggUkNfQ09SRSBpdCBo
YXMgYWRkaXRpb25hbCBmZWF0dXJlcy4KCk1heWJlICJpbXBseSBJTlBVVCIgd291bGQgaGVscD8K
CgpSZWdhcmRzCgpBbmRyemVqCgoKPgo+ICAgICAgIEFybmQKPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
