Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF9038B58
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 15:15:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C75CD8994D;
	Fri,  7 Jun 2019 13:15:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F18598994D
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 13:15:48 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190607131547euoutp02d5582b73f68a97cf8b54395e6713f469~l7Oy_-lnY2516725167euoutp02r
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 13:15:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190607131547euoutp02d5582b73f68a97cf8b54395e6713f469~l7Oy_-lnY2516725167euoutp02r
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190607131547eucas1p17a29021d184c2fdc92215207b42c3b4d~l7OylP_zC2082420824eucas1p1D;
 Fri,  7 Jun 2019 13:15:47 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 5F.40.04377.2836AFC5; Fri,  7
 Jun 2019 14:15:46 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190607131546eucas1p2999c6f139b236f55d5221bf570ec407a~l7OxvxmJD0758407584eucas1p2S;
 Fri,  7 Jun 2019 13:15:46 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190607131545eusmtrp1dc6e0def4d00d6a7fd3a6899b23d219e~l7OxgSPIy2955529555eusmtrp1e;
 Fri,  7 Jun 2019 13:15:45 +0000 (GMT)
X-AuditID: cbfec7f4-12dff70000001119-25-5cfa6382c79a
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id E9.E7.04140.1836AFC5; Fri,  7
 Jun 2019 14:15:45 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190607131545eusmtip2eea72019007ee471243f353ff7d9832a~l7OxKTzzU1429714297eusmtip2e;
 Fri,  7 Jun 2019 13:15:45 +0000 (GMT)
Subject: Re: [PATCH 1/2] drm/bridge: sii902x: re-order conditions to prevent
 out of bounds read
To: Dan Carpenter <dan.carpenter@oracle.com>, Jyri Sarha <jsarha@ti.com>
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <08cc5236-0741-3b08-d133-9d354ad20d1d@samsung.com>
Date: Fri, 7 Jun 2019 15:15:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190607072704.GA25229@mwanda>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIKsWRmVeSWpSXmKPExsWy7djPc7pNyb9iDL5M1bHoPXeSyeL1v+ks
 Fv+3TWS2uPL1PZtFd2cHq8XWW9IWnROXsDuwe+z9toDFY3bHTFaP7d8esHrc7z7O5PHx6S0W
 j+M3tjN5fN4kF8AexWWTkpqTWZZapG+XwJVxZVpewW+OissH9zA2MG5g72Lk5JAQMJF48Ho5
 WxcjF4eQwApGie03PzFDOF8YJb4cm8cO4XxmlLhwfDdTFyMHWMuNYyUQ8eWMEj83/mGCcN4y
 Sny/cZcRZK6wQKLE8hd3mEFsEQEPiRnnvoDtYBY4wCjxeOM8sOVsApoSfzffZAOxeQXsJG5/
 2w0WZxFQkTh3+AsTiC0qECHxZecmRogaQYmTM5+wgNicAjoSS9cfA4szC8hLbH87hxnCFpe4
 9WQ+E8Rz+9gl1u/lg7BdJD68f88MYQtLvDq+BRoAMhKnJ/ewQNj1EvdXtID9LyHQwSixdcNO
 qAZricPHL7KCvM8MdPT6XfqQkHCU+LKFH8Lkk7jxVhDiAj6JSdumM0OEeSU62oQgZihK3D+7
 FWqeuMTSC1/ZJjAqzULy1ywkv8xC8ssshLULGFlWMYqnlhbnpqcWG+WllusVJ+YWl+al6yXn
 525iBCak0/+Of9nBuOtP0iFGAQ5GJR5eB4afMUKsiWXFlbmHGCU4mJVEeMsu/IgR4k1JrKxK
 LcqPLyrNSS0+xCjNwaIkzlvN8CBaSCA9sSQ1OzW1ILUIJsvEwSnVwDgv6i779YPTQhZf+zbT
 cImHyuw/X6cGOco/NXy2fdYzJ1v/U9WHWqxMSxPXGmemH63vqYzaEHFedOOXz2IXBLTydX8I
 dW9Qmp7O8jyRPemW+oH2Qu7c/rvTHa4un9n97BPHR7vC1c9EFW9ujrSKs1oiax+yaFHgSTbB
 /0XfrjoxrvtkubDixBklluKMREMt5qLiRAC+EV1ZRAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRmVeSWpSXmKPExsVy+t/xe7qNyb9iDK60mVn0njvJZPH633QW
 i//bJjJbXPn6ns2iu7OD1WLrLWmLzolL2B3YPfZ+W8DiMbtjJqvH9m8PWD3udx9n8vj49BaL
 x/Eb25k8Pm+SC2CP0rMpyi8tSVXIyC8usVWKNrQw0jO0tNAzMrHUMzQ2j7UyMlXSt7NJSc3J
 LEst0rdL0Mu4Mi2v4DdHxeWDexgbGDewdzFycEgImEjcOFbSxcjFISSwlFFi7rXtQHFOoLi4
 xO75b5khbGGJP9e62CCKXjNKHJ72hg0kISyQKLH8xR2wIhEBD4kZ576AFTELHGCU6Lj8jhEk
 ISRQL3Hz+FmwIjYBTYm/m2+CNfMK2Enc/rYbbBuLgIrEucNfmEBsUYEIidm7GlggagQlTs58
 AmZzCuhILF1/DGwms4C6xJ95l5ghbHmJ7W/nQNniEreezGeawCg0C0n7LCQts5C0zELSsoCR
 ZRWjSGppcW56brGRXnFibnFpXrpecn7uJkZgFG479nPLDsaud8GHGAU4GJV4eGcw/YwRYk0s
 K67MPcQowcGsJMJbduFHjBBvSmJlVWpRfnxRaU5q8SFGU6DnJjJLiSbnAxNEXkm8oamhuYWl
 obmxubGZhZI4b4fAwRghgfTEktTs1NSC1CKYPiYOTqkGxrM9646fqP+oEx7+QbDFs3bKZrn9
 sYeDzyzy21V8W2vrkiiPDIune86Lt0v9eblej/FB66Uep1Uqno2nqyw5WEU3Fz/cwsh9YPP8
 nrldj0+81Iwrdg4UyRS4v/ODvcJe28jJa0vN2r6JtKQbOyfeTn3/ddo2kbv86YIlky17fO5z
 TDdu/KH6WImlOCPRUIu5qDgRAG0tCx/YAgAA
X-CMS-MailID: 20190607131546eucas1p2999c6f139b236f55d5221bf570ec407a
X-Msg-Generator: CA
X-RootMTR: 20190607072733epcas1p34d1a3afb68cb189947c794b1fc8c73a0
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190607072733epcas1p34d1a3afb68cb189947c794b1fc8c73a0
References: <CGME20190607072733epcas1p34d1a3afb68cb189947c794b1fc8c73a0@epcas1p3.samsung.com>
 <20190607072704.GA25229@mwanda>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1559913347;
 bh=ipSDqzXkxZSsKLogWJP+Bk1GtfirClhZZo/Ssubnam4=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=OiZDw3+a7+lJpCgIYaaNef0VX7qjSyZ3A5FkduDPT+t8pPuB5FGtjtLCbfPOHcQew
 ZmcuK3FZ4C+L1JtwSbb4pqsFA1T4eDwpz0/X5/V10Kq7t1rTPdtzlswZfgNvzEuh+I
 tDwNSfWJ05VEXyY0647j9JGAXJDINcd3EGMuEFws=
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDcuMDYuMjAxOSAwOToyNywgRGFuIENhcnBlbnRlciB3cm90ZToKPiBUaGlzIHNob3VsZCBj
aGVjayB0aGF0ICJpIiBpcyB3aXRoaW4gYm91bmRzIGJlZm9yZSBjaGVja2luZyByZWFkaW5nIGZy
b20KPiB0aGUgYXJyYXkuCj4KPiBGaXhlczogZmY1NzgxNjM0YzQxICgiZHJtL2JyaWRnZTogc2lp
OTAyeDogSW1wbGVtZW50IEhETUkgYXVkaW8gc3VwcG9ydCIpCj4gU2lnbmVkLW9mZi1ieTogRGFu
IENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL3NpaTkwMnguYyB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2Uvc2lpOTAyeC5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5MDJ4LmMKPiBp
bmRleCBkNmY5OGQzODhhYzIuLjZiMDM2MTZkNmJjMyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL3NpaTkwMnguYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lp
OTAyeC5jCj4gQEAgLTU4OSw4ICs1ODksOCBAQCBzdGF0aWMgaW50IHNpaTkwMnhfYXVkaW9faHdf
cGFyYW1zKHN0cnVjdCBkZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKPiAgCWlmIChyZXQpCj4gIAkJ
Z290byBvdXQ7Cj4gIAo+IC0JZm9yIChpID0gMDsgc2lpOTAyeC0+YXVkaW8uaTJzX2ZpZm9fc2Vx
dWVuY2VbaV0gJiYKPiAtCQkgICAgIGkgPCBBUlJBWV9TSVpFKHNpaTkwMngtPmF1ZGlvLmkyc19m
aWZvX3NlcXVlbmNlKTsgaSsrKQo+ICsJZm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUoc2lpOTAy
eC0+YXVkaW8uaTJzX2ZpZm9fc2VxdWVuY2UpICYmCj4gKwkJICAgIHNpaTkwMngtPmF1ZGlvLmky
c19maWZvX3NlcXVlbmNlW2ldOyBpKyspCj4gIAkJcmVnbWFwX3dyaXRlKHNpaTkwMngtPnJlZ21h
cCwKPiAgCQkJICAgICBTSUk5MDJYX1RQSV9JMlNfRU5BQkxFX01BUFBJTkdfUkVHLAo+ICAJCQkg
ICAgIHNpaTkwMngtPmF1ZGlvLmkyc19maWZvX3NlcXVlbmNlW2ldKTsKClF1ZXVlZCB0byBkcm0t
bWlzYy1uZXh0LgoKLS0KUmVnYXJkcwpBbmRyemVqCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
