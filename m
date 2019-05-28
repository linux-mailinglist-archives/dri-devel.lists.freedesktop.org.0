Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8F72C502
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 13:00:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B47DF6E1B4;
	Tue, 28 May 2019 11:00:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 270916E1B4
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 11:00:05 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190528110002euoutp02631bcb8bb5671f59c796562bcf055729~i07av0Pxs2543125431euoutp02O
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 11:00:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190528110002euoutp02631bcb8bb5671f59c796562bcf055729~i07av0Pxs2543125431euoutp02O
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190528110002eucas1p23fa72e6463b322a121ed1c2c482fc72d~i07aM3ljk0201802018eucas1p2h;
 Tue, 28 May 2019 11:00:02 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 35.C5.04298.1B41DEC5; Tue, 28
 May 2019 12:00:01 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190528110001eucas1p15745075485ba96cfc65d5932440ce5ad~i07ZYZzsS3151431514eucas1p12;
 Tue, 28 May 2019 11:00:01 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190528110000eusmtrp1a15e3036d0ffbf89d4d84db029d53ff5~i07ZKTOn91303913039eusmtrp1X;
 Tue, 28 May 2019 11:00:00 +0000 (GMT)
X-AuditID: cbfec7f2-f13ff700000010ca-d3-5ced14b1518a
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id BC.54.04140.0B41DEC5; Tue, 28
 May 2019 12:00:00 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190528110000eusmtip1af4f68cc6f46dc2fcee1e6257c52e898~i07YsgFiT2020320203eusmtip1H;
 Tue, 28 May 2019 11:00:00 +0000 (GMT)
Subject: Re: [PATCHv3 22/23] drm/bridge: tc358767: add IRQ and HPD support
To: Tomi Valkeinen <tomi.valkeinen@ti.com>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Lucas Stach <l.stach@pengutronix.de>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Andrey Smirnov <andrew.smirnov@gmail.com>, Peter
 Ujfalusi <peter.ujfalusi@ti.com>, Jyri Sarha <jsarha@ti.com>, Benoit Parrot
 <bparrot@ti.com>, dri-devel@lists.freedesktop.org
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <e3d98790-c915-947b-c54f-23f142a5c317@samsung.com>
Date: Tue, 28 May 2019 12:59:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <4bc546d2-e3cf-ffc0-69b8-3369b4e84993@ti.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01SfSzUcRz2vd/L/Rynn8PuE23mmi22HEv5rWKJrVvW1l+9yJaTn5flju6c
 vCwZxSEpxFwnpozM8tZ5adJ2luNMkWbYdNr4h8wUSvOS82P57/k8z/P5fp5n+1KYqJdwpeKV
 yaxKKU+QkAK8o3/90/FW58UI3yytlMnRBjLZxiyCWSt+iDNfV5dIpjBfSzAzVZM8Jv/pKz4z
 /W0AZ3TLfwimuXqKPCeQzTzb5sm6ddN82XNtJSGzFJp4suJNX5lpopN3mQwXnI1mE+JTWJU0
 KFIQN9K5TiZ9EKbmmheILDQqKEC2FND+UPNmFS9AAkpENyB43t1PcMMKgq6Rej43/EJQOF7O
 319pqTWSnFCPYG6uCXHDIoLN3pVdlxN9EYZelGNWwZnWY7BVmodZBZL2gs32SdKKhXQQdI3m
 8KwYpz1hMPfvLu9CXwNLfwvBeRxhsHJ2JyFF2dKnYcFw1EpjtDt0LuoxDotharaaZ70FtJEP
 BT1mnIsaCpMlH0kOO8G86e1ehSMwVPpoz3MfLA0PMG5Zi8DQ0o1xwhnoM40S1sPYTujmd1KO
 Doay7x3ISgPtABOLjlwGByjpqMA4WgjaXBHn9gDLsGHvQTHUjazupZHB/Pgg9gR56A6U1B1o
 pjvQTPc/Qw3CG5GY1agVsazaT8ne9VHLFWqNMtbnVqKiDe38qqEt088utPolyohoCknshYx5
 IUJEyFPUaQojAgqTOAsDy35EiITR8rR0VpV4U6VJYNVG5EbhErEww2bmhoiOlSezt1k2iVXt
 qzzK1jULuUU1hYFzZoCxyXJsKry23TAePBDaGDJ2oWS9UZqZEVaXc73o5JiXOZ8+XCX1NlSk
 2vNCetzTL9W2vg6JfDys/30HW5N7ZdrlVdhlx7htiOd7YpD3xJK+aDiw+8q9ukM6leYUc6Ik
 RvLZzbJc6TI7FbZ9VfPy/fk+/w2zp01AmwRXx8n9vDGVWv4P9VnJOlEDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRmVeSWpSXmKPExsVy+t/xu7obRN7GGExfaWzR3GFr0XSogdXi
 W38ri8WVr+/ZLLo7O1gtHsy9yWTROXEJu8XdeydYLGZ9/MFqsX7+LTYHLo8HU/8zeeycdZfd
 Y3bHTFaP+93HmTz6/xp4HL+xnSmALUrPpii/tCRVISO/uMRWKdrQwkjP0NJCz8jEUs/Q2DzW
 yshUSd/OJiU1J7MstUjfLkEv48L2n2wF+3kr2k69Zm1gvMjVxcjJISFgIrFh0SG2LkYuDiGB
 pYwSHU972CES4hK7579lhrCFJf5c64Iqes0o8bx9AliRsICXxOl505hBEiICC5gluq9cZoeo
 6mKWuPB5GlgVm4CmxN/NN9lAbF4BO4kdF5uZQGwWAVWJk22/wOKiAhESZ96vYIGoEZQ4OfMJ
 kM3BwSlgJfF6qzJImFlAXeLPvEvMELa8xPa3c6BscYlbT+YzTWAUnIWkexaSlllIWmYhaVnA
 yLKKUSS1tDg3PbfYSK84Mbe4NC9dLzk/dxMjMAq3Hfu5ZQdj17vgQ4wCHIxKPLwWp17HCLEm
 lhVX5h5ilOBgVhLhtZ3yJkaINyWxsiq1KD++qDQntfgQoynQbxOZpUST84EJIq8k3tDU0NzC
 0tDc2NzYzEJJnLdD4GCMkEB6YklqdmpqQWoRTB8TB6dUA6O4mc+f0+2x8WuZV/5waIzYsl4l
 5E5hxfy1R+RzIqYveumeaTDtvOVaX6HIy5933ZDJX6bZUZ9azHFtBvNz35zfW24tW6XR5Fmp
 2j3T1+zEnP+vdT+cXumqXf1C10JB3n7edwd9+5CeuusiZfv82CU6NIoXX917tFtJbdvOC2rp
 XmulH9ppRiixFGckGmoxFxUnAgCVYwtu2AIAAA==
X-CMS-MailID: 20190528110001eucas1p15745075485ba96cfc65d5932440ce5ad
X-Msg-Generator: CA
X-RootMTR: 20190503123143epcas1p3e660a6578d5a6261e7885928db6cba8f
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190503123143epcas1p3e660a6578d5a6261e7885928db6cba8f
References: <20190503122949.12266-1-tomi.valkeinen@ti.com>
 <CGME20190503123143epcas1p3e660a6578d5a6261e7885928db6cba8f@epcas1p3.samsung.com>
 <20190503122949.12266-23-tomi.valkeinen@ti.com>
 <93a0800e-ab83-e2f3-32d8-eb9e5ef8c5f1@samsung.com>
 <1ea932c7-a6d6-e4fc-bad4-ea9519656018@ti.com>
 <34a9e6fa-2457-ed8e-1bdd-ac09eac2d265@samsung.com>
 <4bc546d2-e3cf-ffc0-69b8-3369b4e84993@ti.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1559041202;
 bh=8cbDh+Qpml4RmG993F+IfhcFp1KxwT6mHdmG5RMFEYo=;
 h=Subject:To:From:Date:In-Reply-To:References:From;
 b=rc65ZY+OD6JIOwy2yCIdpUBPLloaiWnsNSjBJp7wSRcuZly7AvxKSuA0H0GSek1He
 Asfkcod8bzhjsHXNH2my4kz5MavOANbpFauIirxA7GayPU3P60ZOPOiwIWTMr3FiR4
 +ZNYJ+eQQZMFAFgEUf4CQGZUel3VqPRiu7cI+4hg=
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

T24gMjcuMDUuMjAxOSAxNzoxMSwgVG9taSBWYWxrZWluZW4gd3JvdGU6Cj4gT24gMjEvMDUvMjAx
OSAxNzoxOCwgQW5kcnplaiBIYWpkYSB3cm90ZToKPgo+Pj4gRGlzcGxheVBvcnQgc3BlYyB0YWxr
cyBhYm91dCBkb2luZyB0aGUgZGlzcGxheS1wcm9wcyByZWFkaW5nIGFuZCBFRElEIHJlYWRpbmcg
d2hlbgo+Pj4gaGFuZGxpbmcgSFBELgo+Pj4KPj4+IEkgdGhpbmsgaXQgd291bGQgYmUgYmVzdCB0
byBjaGFuZ2UgdGhlIGNvZGUgc28gdGhhdCB3ZSByZWFkIGRpc3BsYXkgcHJvcHMgYW5kIEVESUQg
aW4gSFBELAo+Pj4gYnV0IHNvIHRoYXQgd2UgYWxzbyBjYW4gcmVhZCB0aGVtIGxhdGVyICh3aGVu
IG5lZWRlZCwgcHJvYmFibHkgYnJpZGdlIGVuYWJsZSBhbmQKPj4+IGdldF9tb2RlcykgaWYgd2Ug
aGF2ZW4ndCBkb25lIHRoZSByZWFkcyBhbHJlYWR5LiBJJ3ZlIGhhZCB0aGlzIGluIG1pbmQgc2lu
Y2UgSSBzdGFydGVkIHRoZQo+Pj4gc2VyaWVzLCBidXQgYXMgaXQgZGlkbid0IGZlZWwgbGlrZSBh
IHNpbXBsZSBjaGFuZ2UsIEkgbGVmdCBpdCBmb3IgbGF0ZXIuCj4+Cj4+IE15IGFwcHJvYWNoIGFu
ZCBleHBlcmllbmNlIHN1Z2dlc3QgdGhhdCBkZXRlY3QsIHNob3VsZCBiZSByYXRoZXIKPj4gbGln
aHR3ZWlnaHQgYW5kIHNob3VsZCBub3QgbW9kaWZ5IHN0YXRlLCBJIGFtIG5vdCBldmVuIHN1cmUg
aWYgaXQgaXMKPj4gY2FsbGVkIGF0IGFsbCBvbiBmb3JjZWQgY29ubmVjdG9yLgo+IEkganVzdCBy
ZWFsaXplZCB0aGF0IHRoaXMgaXMgbm90IGV4YWN0bHkgcGVyZmVjdC4uLgo+Cj4gTGluayB0cmFp
bmluZyBjYW4gYWRqdXN0IHRoZSBsaW5rIHNwZWVkIGFuZC9vciBudW1iZXIgb2YgbGFuZXMsIGFs
dGhvdWdoIAo+IHRoZSBkcml2ZXIgZG9lc24ndCBzdXBwb3J0IHRoaXMgYXQgdGhlIG1vbWVudC4g
VGhlIHNwZWVkIGFuZCBudW1iZXIgb2YgCj4gbGFuZXMgYWZmZWN0IHRoZSB2aWRlbyBtb2RlcyB0
aGF0IGFyZSBwb3NzaWJsZSwgc28gdGhleSBhZmZlY3QgZ2V0X21vZGVzLgo+Cj4gU28uLi4gSSB0
aGluayB0aGUgZHJpdmVyIHNob3VsZCBzZXQgdXAgdGhlIGxpbmsgZnVsbHkgYmVmb3JlIGdldF9t
b2RlcyAKPiBnZXQgY2FsbGVkLCBpbnN0ZWFkIG9mIGxlYXZpbmcgdGhlIGxpbmsgc2V0dXAgdG8g
dGhlIHBvaW50IHdoZXJlIHdlIAo+IGVuYWJsZSB0aGUgYnJpZGdlLiBNYXliZS4uLiBUaGlzIGlz
IG5vdCBleGFjdGx5IGNsZWFyIHRvIG1lID0pLgoKCk1vcmVvdmVyIGxpbmsgc3RhdGUgY2FuIGNo
YW5nZSBkdXJpbmcgd29yaywgc28gZnVsbCBpbXBsZW1lbnRhdGlvbgpzaG91bGQgaGFuZGxlIEhQ
RCBwdWxzZXMgKGJlbG93IDFtcyBpZiBJIHJlbWVtYmVyIGNvcnJlY3RseSkgcmUtdHJhaW4gaWYK
bmVjZXNzYXJ5IGFuZCB1c2UgZHJtX2Nvbm5lY3Rvcl9zZXRfbGlua19zdGF0dXNfcHJvcGVydHkg
YXMgd2VsbCA6KQoKClJlZ2FyZHMKCkFuZHJ6ZWoKCgo+Cj4gSW4gYW55IGNhc2UsIEkgdGhpbmsg
dGhhdCdzIGZ1dHVyZSB3b3JrLiBJIGhhdmUgY2hhbmdlZCB0aGUgY29kZSB0byByZWFkIAo+IHRo
ZSBkaXNwbGF5IHByb3BzIGluIGdldF9tb2RlcygpLCBhbmQgSSBoYXZlIGFub3RoZXIgc21hbGwg
Zml4IHRvby4gSSdsbCAKPiBzZW5kIHY0IHRoaXMgd2VlaywgYW5kIGhvcGVmdWxseSB3ZSBjYW4g
Z2V0IHRoaXMgbWVyZ2VkLgo+Cj4gICBUb21pCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
