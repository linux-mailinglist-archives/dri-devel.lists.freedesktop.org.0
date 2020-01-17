Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E30A414079E
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2020 11:10:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4797F6F4CD;
	Fri, 17 Jan 2020 10:10:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5480C6F4CD
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 10:10:50 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200117100508euoutp01bf710633ea82ef9da75e85175901b1ee~qpISTS2U01523615236euoutp01K
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 10:05:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200117100508euoutp01bf710633ea82ef9da75e85175901b1ee~qpISTS2U01523615236euoutp01K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1579255508;
 bh=ZtzInfg5OMhRAkzieWaDxtpxgiMJMusa19oHNwl24u4=;
 h=Subject:To:From:Date:In-Reply-To:References:From;
 b=syMJm7fhZWHgpuMPqrPzZSfS/k5wMjt5A0TsnRbs2na2N/j16INP5qAhpVILhx1zD
 ldVfMfmLw5ZyhEPbRvHQc0S8CwDGCohVjs2EZLCcCfpEnF3jb73z0v4q8epsASQ0gh
 GbzGoW93AgzyJ3sySKBdwwMthGkxzCtOGCw7E5Q8=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200117100508eucas1p291be92060240444501ffa2eb20368c15~qpISDBrao1770017700eucas1p2v;
 Fri, 17 Jan 2020 10:05:08 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id EF.7B.60679.4D6812E5; Fri, 17
 Jan 2020 10:05:08 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200117100507eucas1p267985dff857eeaf21972376057a1e68e~qpIRrJPAL1582515825eucas1p23;
 Fri, 17 Jan 2020 10:05:07 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200117100507eusmtrp1b89a487c1950b44afb34ba5afd1005c2~qpIRlVg6m3122531225eusmtrp1Y;
 Fri, 17 Jan 2020 10:05:07 +0000 (GMT)
X-AuditID: cbfec7f4-0cbff7000001ed07-ee-5e2186d4510f
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 4A.46.07950.3D6812E5; Fri, 17
 Jan 2020 10:05:07 +0000 (GMT)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200117100507eusmtip153597002621da5078b4e930839190e3e~qpIRT7NqH1761117611eusmtip1j;
 Fri, 17 Jan 2020 10:05:07 +0000 (GMT)
Subject: Re: [PATCH] drm/bridge: tfp410: add pclk limits
To: Tomi Valkeinen <tomi.valkeinen@ti.com>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Neil Armstrong
 <narmstrong@baylibre.com>
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <74052be2-5100-e5fa-ec87-eb56ed5838bf@samsung.com>
Date: Fri, 17 Jan 2020 11:05:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200113134528.9851-1-tomi.valkeinen@ti.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCKsWRmVeSWpSXmKPExsWy7djP87pX2hTjDLrXC1lc+fqezaJz4hJ2
 i0N90Rbr599ic2DxeH+jld1jdsdMVo/73ceZPI7f2M4UwBLFZZOSmpNZllqkb5fAlbHoFXfB
 a86KkxfmsDQwtnB0MXJySAiYSMx6voCxi5GLQ0hgBaNE37lXbCAJIYEvjBIvlvNB2J8ZJTbP
 d4BpWHC+gwmiYTmjxKFXbSwQzltGidW9v9hBqoQFLCROPtnADGKLCKxnlLjTYQNiswloSvzd
 fBNsA6+AncTi3tlg9SwCqhL3bnWA1YsKREg8ufKYFaJGUOLkzCcsIDangJXEv4eTmEBsZgF5
 ieats5khbHGJW0/mg10kIdDOLvHj/3U2iFNdJK51zmWHsIUlXh3fAmXLSJye3MMCYddL3F/R
 wgzR3MEosXXDTmaIhLXEnXO/gAZxAG3QlFi/Sx8i7Cix9+AVZpCwhACfxI23ghA38ElM2jYd
 Kswr0dEmBFGtKHH/7FaogeISSy98hbrMQ+LvypeMExgVZyH5chaSz2Yh+WwWwg0LGFlWMYqn
 lhbnpqcWG+WllusVJ+YWl+al6yXn525iBKaV0/+Of9nBuOtP0iFGAQ5GJR7eGUEKcUKsiWXF
 lbmHGCU4mJVEeE/OkI0T4k1JrKxKLcqPLyrNSS0+xCjNwaIkzmu86GWskEB6YklqdmpqQWoR
 TJaJg1OqgdGqVapgL8frAxPTu1+/NRb8tPjJ2e++l3nvbZK4WDH/Rf9M2WNT92V1LHJ46vUr
 Wcv5ftmO0K6Z87/tEZ+yKFJihkaafUG2Cucnb1a1TSzH8jbOXH6xxWdX5g37ngl1oWf2WwpP
 OD7nu7RwztHi+F0+j/wYlKrNLI9mhr874b35UHb7Z8n/5ZVKLMUZiYZazEXFiQBIdZ15JwMA
 AA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprHIsWRmVeSWpSXmKPExsVy+t/xu7qX2xTjDP5PNLG48vU9m0XnxCXs
 Fof6oi3Wz7/F5sDi8f5GK7vH7I6ZrB73u48zeRy/sZ0pgCVKz6Yov7QkVSEjv7jEVina0MJI
 z9DSQs/IxFLP0Ng81srIVEnfziYlNSezLLVI3y5BL2PRK+6C15wVJy/MYWlgbOHoYuTkkBAw
 kVhwvoOpi5GLQ0hgKaPE5i9XmCAS4hK7579lhrCFJf5c62KDKHrNKLG9bxtYQljAQuLkkw3M
 IAkRgfWMEue3XWeHqOpllFj46gUrSBWbgKbE38032UBsXgE7icW9s9lBbBYBVYl7tzrAJokK
 REi8/X2TFaJGUOLkzCcsIDangJXEv4eTwE5iFlCX+DPvEjOELS/RvHU2lC0ucevJfKYJjIKz
 kLTPQtIyC0nLLCQtCxhZVjGKpJYW56bnFhvpFSfmFpfmpesl5+duYgTGzbZjP7fsYOx6F3yI
 UYCDUYmHd0aQQpwQa2JZcWXuIUYJDmYlEd6TM2TjhHhTEiurUovy44tKc1KLDzGaAj03kVlK
 NDkfGNN5JfGGpobmFpaG5sbmxmYWSuK8HQIHY4QE0hNLUrNTUwtSi2D6mDg4pRoYtdcmLQtr
 lFy7/1fppScvu9dE7P6r7f8h/s0l55effvDEWn63eCYjVFCRVbjO+9Dh3qBVr0I38QVwVijz
 aAhqsa950nSHKT1jXenVZZsncMZLbq3fr1a+rNfT9OJLwZC+xiipm4EnGKTuyudG33///URH
 DNeUOXeWdm/cVCSqFlE8Z5Zpxww9JZbijERDLeai4kQAVZFi5rECAAA=
X-CMS-MailID: 20200117100507eucas1p267985dff857eeaf21972376057a1e68e
X-Msg-Generator: CA
X-RootMTR: 20200113134541eucas1p2c48474f8c113c25aa0fe18d280bdb118
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200113134541eucas1p2c48474f8c113c25aa0fe18d280bdb118
References: <CGME20200113134541eucas1p2c48474f8c113c25aa0fe18d280bdb118@eucas1p2.samsung.com>
 <20200113134528.9851-1-tomi.valkeinen@ti.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTMuMDEuMjAyMCAxNDo0NSwgVG9taSBWYWxrZWluZW4gd3JvdGU6Cj4gQWRkIHBpeGVsIGNs
b2NrIGxpbWl0cyB0byB0aGUgZHJpdmVyIGFzIHBlciBURlA0MTAgZGF0YXNoZWV0OiBtaW4gMjVN
SHosCj4gbWF4IDE2NU1Iei4KPgo+IFNpZ25lZC1vZmYtYnk6IFRvbWkgVmFsa2VpbmVuIDx0b21p
LnZhbGtlaW5lbkB0aS5jb20+ClJldmlld2VkLWJ5OiBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNh
bXN1bmcuY29tPgoKwqAtLQpSZWdhcmRzCkFuZHJ6ZWoKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2UvdGktdGZwNDEwLmMgfCAxMCArKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAx
MCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90
aS10ZnA0MTAuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktdGZwNDEwLmMKPiBpbmRleCA2
ZjZkNmQxZTYwYWUuLmYzNzhhOGY3OWJjYiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL3RpLXRmcDQxMC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aS10ZnA0
MTAuYwo+IEBAIC0xNjcsMTAgKzE2NywyMCBAQCBzdGF0aWMgdm9pZCB0ZnA0MTBfZGlzYWJsZShz
dHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlKQo+ICAJZ3Bpb2Rfc2V0X3ZhbHVlX2NhbnNsZWVwKGR2
aS0+cG93ZXJkb3duLCAxKTsKPiAgfQo+ICAKPiArc3RhdGljIGVudW0gZHJtX21vZGVfc3RhdHVz
IHRmcDQxMF9tb2RlX3ZhbGlkKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UsCj4gKwkJCQkJICAg
ICAgY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUpCj4gK3sKPiArCWlmIChtb2Rl
LT5jbG9jayA8IDI1MDAwIHx8IG1vZGUtPmNsb2NrID4gMTY1MDAwKQo+ICsJCXJldHVybiBNT0RF
X0JBRDsKPiArCj4gKwlyZXR1cm4gTU9ERV9PSzsKPiArfQo+ICsKPiAgc3RhdGljIGNvbnN0IHN0
cnVjdCBkcm1fYnJpZGdlX2Z1bmNzIHRmcDQxMF9icmlkZ2VfZnVuY3MgPSB7Cj4gIAkuYXR0YWNo
CQk9IHRmcDQxMF9hdHRhY2gsCj4gIAkuZW5hYmxlCQk9IHRmcDQxMF9lbmFibGUsCj4gIAkuZGlz
YWJsZQk9IHRmcDQxMF9kaXNhYmxlLAo+ICsJLm1vZGVfdmFsaWQJPSB0ZnA0MTBfbW9kZV92YWxp
ZCwKPiAgfTsKPiAgCj4gIHN0YXRpYyB2b2lkIHRmcDQxMF9ocGRfd29ya19mdW5jKHN0cnVjdCB3
b3JrX3N0cnVjdCAqd29yaykKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
