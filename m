Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B422D41D21
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 09:02:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B15CA89260;
	Wed, 12 Jun 2019 07:02:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E407789260
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 07:02:13 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190612070212euoutp01ec85dde63fadb7f08e6c5bf93980dc51~nYXCtIHA11878118781euoutp01O
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 07:02:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190612070212euoutp01ec85dde63fadb7f08e6c5bf93980dc51~nYXCtIHA11878118781euoutp01O
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190612070211eucas1p290dbd703c3d9d40387004e84dbef065a~nYXCDpzPA1264012640eucas1p2V;
 Wed, 12 Jun 2019 07:02:11 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 9C.FC.04325.373A00D5; Wed, 12
 Jun 2019 08:02:11 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190612070210eucas1p1c478fb74744a81095b654074651b5dd5~nYXBMLbMm2813128131eucas1p1K;
 Wed, 12 Jun 2019 07:02:10 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190612070210eusmtrp17641ccec4451dd6e634e189978a47937~nYXA9Sspi2934629346eusmtrp1K;
 Wed, 12 Jun 2019 07:02:10 +0000 (GMT)
X-AuditID: cbfec7f5-b75ff700000010e5-0f-5d00a3737ff4
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 47.D3.04140.273A00D5; Wed, 12
 Jun 2019 08:02:10 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190612070209eusmtip2695dd495424d2e34bf27f04da35fb7f6~nYXAVbKIy0779107791eusmtip2L;
 Wed, 12 Jun 2019 07:02:09 +0000 (GMT)
Subject: Re: [PATCH v1 2/2] drm/stm: dsi: add power on/off phy ops
To: =?UTF-8?Q?Yannick_Fertr=c3=a9?= <yannick.fertre@st.com>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Heiko Stuebner
 <heiko@sntech.de>, Sam Ravnborg <sam@ravnborg.org>, Nickey Yang
 <nickey.yang@rock-chips.com>, Philippe Cornu <philippe.cornu@st.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>, Vincent Abriou
 <vincent.abriou@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <91abfd99-1737-33bb-77aa-2bf1f076cebd@samsung.com>
Date: Wed, 12 Jun 2019 09:02:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1558952499-15418-3-git-send-email-yannick.fertre@st.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02SWUwTURiFuZ2lA1ocC4ZfUdEmxKixuD2MG3GLGXxQEzVRlGiFCRLWdChu
 DzaiWKrIohFpCWhotRKNUmy1KghTQ4MsggLiCtG6xAZ9QKpEKzIZiLx995xz73/+5FKYMkDM
 oFIysjlthiZNRYbgzqbh9kV8VVDCYk91FFPQ3ixjarwtiDkhPCGZEWcxxnQNfR+l9z6CyS+2
 yBn7hx6CeX6/nGSMPV6CqQjcJBjr72+I6T/5hWBsww7EtHY34Mzp/FPkWpqt81/GWZfprZw1
 G8oI9k3PQ5K96+8n2L4zHhlbaznOWi52k2zA9Ahn7/ZUYGxj/RL24686jB20z96miA9ZncSl
 peRw2pjY/SEHA0+q5FlFoYc97qsyPRImGVEwBfRyqCs7TxpRCKWkbQgKBYtMNJT0DwSVt6Il
 YxCBwVgtG78x8MKGScY1BO+aenHpMIDA+SwXiakwej34CqvkohFOlxPQWP6TEA2Sng+B2pek
 yAo6FvS1LlxknI4G86tCucjT6F3ww2VHUmYqNJd5RzMUFUxvgpv6laKM0VGQ6zBjEkfAK2+l
 TJwF9BUKyn41klLVjWAt8BMSh8FXzx25xDOh5fxZXOLj0Gc7iUmXDQgct12YZKwCt6eTEAdj
 o6Vv3Y+R5HVQYLuAiTLQodA7MFXqEAolztIxWQGGPKWUngt9bY6xByPA2jE01oyFgfoarAjN
 NU1Y0jRhM9OEzUz/O1xGeDWK4HR8ejLHL8vgDql5TTqvy0hWJ2am29Hop2z56xm6h+r/HBAQ
 TSHVZEVD6cheJaHJ4Y+kCwgoTBWuWJoalKBUJGmOHOW0mfu0ujSOF1AkhasiFMeC+vco6WRN
 NpfKcVmcdtyVUcEz9Gi6jQ/v2M7kRCe1YVMcvU61a8Hn3Su215Xc+Zlr6zJ25VmrWgKtNwTB
 9nrniDPSgK3xb7YShksB+7MNk9YUs3HZ12Wfkn3nvgkJW5J06n03dmx1U4kV8U2oZtac0j73
 YPw9y9PH5+YFLA9OUCX+hebhed2dvnyHpSK3KK7E2a3C+YOaJQswLa/5BzT0cTCQAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmplleLIzCtJLcpLzFFi42I5/e/4Pd2ixQyxBnf/KFn0njvJZLHxyWlG
 i6ZDp9gs/m+byGxx5et7IOvRa1aLzolL2C02Pb7GanF51xw2i65rT1gt5v1dy2qx9Pc7RosH
 LS9YLVb83MpocebqARaL9s5WNgcBj73fFrB47Jx1l91jdsdMVo871/aweWz/9oDV4373cSaP
 zUvqPZZMu8rm8XfWfhaP7dfmMXsc3Gfo8fTHXmaPz5vkAnij9GyK8ktLUhUy8otLbJWiDS2M
 9AwtLfSMTCz1DI3NY62MTJX07WxSUnMyy1KL9O0S9DL+nlrMXjCBr+L44WVMDYyHuLsYOTkk
 BEwk3l5fwdzFyMUhJLCUUeLx9nmsEAlxid3z3zJD2MISf651sUEUvWaUOH3zJgtIQljASeJ1
 /2J2kISIwAJWibarvYwQVVcZJeYfvAVWxSagKfF38002EJtXwE6iYfNOsDiLgKrE7Fv97CC2
 qECExOxdDSwQNYISJ2c+AbI5ODgF3CTWNliBhJkF1CX+zLvEDGHLSzRvnQ1li0vcejKfaQKj
 4Cwk3bOQtMxC0jILScsCRpZVjCKppcW56bnFRnrFibnFpXnpesn5uZsYgUlg27GfW3Ywdr0L
 PsQowMGoxMN7YPr/GCHWxLLiytxDjBIczEoivEbZDLFCvCmJlVWpRfnxRaU5qcWHGE2BfpvI
 LCWanA9MUHkl8YamhuYWlobmxubGZhZK4rwdAgdjhATSE0tSs1NTC1KLYPqYODilGhjzos7u
 +BT9tshr/m1prc5HXzij5PhecEjM3LzQ+4DNP3OeL/MnLdfVN6hguO0SGvX12IfqB/FKn5Qc
 4orZCs8JqmgVSuTfuNQzd51P2AP+t7EzYjW2aqVMq3KYFb2f58q+fb/S69V+bTl6hDcpN7Dc
 w/prdiPzVJt/Hz7dL5u/fvfK63YKF+2UWIozEg21mIuKEwHedbClGAMAAA==
X-CMS-MailID: 20190612070210eucas1p1c478fb74744a81095b654074651b5dd5
X-Msg-Generator: CA
X-RootMTR: 20190527102223epcas1p2c69f1e7cf18cd08f7184b0e0b6cf5837
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190527102223epcas1p2c69f1e7cf18cd08f7184b0e0b6cf5837
References: <1558952499-15418-1-git-send-email-yannick.fertre@st.com>
 <CGME20190527102223epcas1p2c69f1e7cf18cd08f7184b0e0b6cf5837@epcas1p2.samsung.com>
 <1558952499-15418-3-git-send-email-yannick.fertre@st.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1560322932;
 bh=CzNp08rqtjUdtpSyrEtzVUY/SAEVmfbKxjuvR5Yj+bQ=;
 h=Subject:To:From:Date:In-Reply-To:References:From;
 b=ZbN5WId2X6++zBiesiBWi/5d4YCU9O3gTip6EHqr7gNkBvaXVvMTh/1dr5rLuSr5T
 EDpqZ6sSuy3od4pDEjeTuWXdJ8tVUCDK+S/iuPH9ka+/FkWWlSdpUWRTc0JTksQS/p
 5OHBSMR9oJkHs4L0Mdf3XXX77kVcX6RVLd3hmu/c=
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

T24gMjcuMDUuMjAxOSAxMjoyMSwgWWFubmljayBGZXJ0csOpIHdyb3RlOgo+IFRoZXNlIG5ldyBw
aHlzaWNhbCBvcGVyYXRpb25zIGFyZSBoZWxwZnVsIHRvIHBvd2VyX29uL29mZiB0aGUgZHNpCj4g
d3JhcHBlci4gSWYgdGhlIGRzaSB3cmFwcGVyIGlzIHBvd2VyZWQgaW4gdmlkZW8gbW9kZSwgdGhl
IGRpc3BsYXkKPiBjb250cm9sbGVyIChsdGRjKSByZWdpc3RlciBhY2Nlc3Mgd2lsbCBoYW5nIHdo
ZW4gRFNJIGZpZm9zIGFyZSBmdWxsLgo+Cj4gU2lnbmVkLW9mZi1ieTogWWFubmljayBGZXJ0csOp
IDx5YW5uaWNrLmZlcnRyZUBzdC5jb20+CgoKUmV2aWV3ZWQtYnk6IEFuZHJ6ZWogSGFqZGEgPGEu
aGFqZGFAc2Ftc3VuZy5jb20+CgoKwqAtLQpSZWdhcmRzCkFuZHJ6ZWoKCgo+IC0tLQo+ICBkcml2
ZXJzL2dwdS9kcm0vc3RtL2R3X21pcGlfZHNpLXN0bS5jIHwgMjEgKysrKysrKysrKysrKysrKysr
KystCj4gIDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3N0bS9kd19taXBpX2RzaS1zdG0uYyBiL2Ry
aXZlcnMvZ3B1L2RybS9zdG0vZHdfbWlwaV9kc2ktc3RtLmMKPiBpbmRleCAwMWRiMDIwLi4wYWIz
MmZlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zdG0vZHdfbWlwaV9kc2ktc3RtLmMK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vc3RtL2R3X21pcGlfZHNpLXN0bS5jCj4gQEAgLTIxMCwx
MCArMjEwLDI3IEBAIHN0YXRpYyBpbnQgZHdfbWlwaV9kc2lfcGh5X2luaXQodm9pZCAqcHJpdl9k
YXRhKQo+ICAJaWYgKHJldCkKPiAgCQlEUk1fREVCVUdfRFJJVkVSKCIhVElNRU9VVCEgd2FpdGlu
ZyBQTEwsIGxldCdzIGNvbnRpbnVlXG4iKTsKPiAgCj4gKwlyZXR1cm4gMDsKPiArfQo+ICsKPiAr
c3RhdGljIHZvaWQgZHdfbWlwaV9kc2lfcGh5X3Bvd2VyX29uKHZvaWQgKnByaXZfZGF0YSkKPiAr
ewo+ICsJc3RydWN0IGR3X21pcGlfZHNpX3N0bSAqZHNpID0gcHJpdl9kYXRhOwo+ICsKPiArCURS
TV9ERUJVR19EUklWRVIoIlxuIik7Cj4gKwo+ICAJLyogRW5hYmxlIHRoZSBEU0kgd3JhcHBlciAq
Lwo+ICAJZHNpX3NldChkc2ksIERTSV9XQ1IsIFdDUl9EU0lFTik7Cj4gK30KPiAgCj4gLQlyZXR1
cm4gMDsKPiArc3RhdGljIHZvaWQgZHdfbWlwaV9kc2lfcGh5X3Bvd2VyX29mZih2b2lkICpwcml2
X2RhdGEpCj4gK3sKPiArCXN0cnVjdCBkd19taXBpX2RzaV9zdG0gKmRzaSA9IHByaXZfZGF0YTsK
PiArCj4gKwlEUk1fREVCVUdfRFJJVkVSKCJcbiIpOwo+ICsKPiArCS8qIERpc2FibGUgdGhlIERT
SSB3cmFwcGVyICovCj4gKwlkc2lfY2xlYXIoZHNpLCBEU0lfV0NSLCBXQ1JfRFNJRU4pOwo+ICB9
Cj4gIAo+ICBzdGF0aWMgaW50Cj4gQEAgLTI4Nyw2ICszMDQsOCBAQCBkd19taXBpX2RzaV9nZXRf
bGFuZV9tYnBzKHZvaWQgKnByaXZfZGF0YSwgY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUg
Km1vZGUsCj4gIAo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGR3X21pcGlfZHNpX3BoeV9vcHMgZHdf
bWlwaV9kc2lfc3RtX3BoeV9vcHMgPSB7Cj4gIAkuaW5pdCA9IGR3X21pcGlfZHNpX3BoeV9pbml0
LAo+ICsJLnBvd2VyX29uID0gZHdfbWlwaV9kc2lfcGh5X3Bvd2VyX29uLAo+ICsJLnBvd2VyX29m
ZiA9IGR3X21pcGlfZHNpX3BoeV9wb3dlcl9vZmYsCj4gIAkuZ2V0X2xhbmVfbWJwcyA9IGR3X21p
cGlfZHNpX2dldF9sYW5lX21icHMsCj4gIH07Cj4gIAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
