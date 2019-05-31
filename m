Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3D030F53
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2019 15:53:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCF13893CB;
	Fri, 31 May 2019 13:53:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2E71893CB
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2019 13:53:38 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190531135337euoutp0173f26c5c682297f2df333b6f903003f1~jyO05hRWF1218412184euoutp01U
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2019 13:53:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190531135337euoutp0173f26c5c682297f2df333b6f903003f1~jyO05hRWF1218412184euoutp01U
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190531135336eucas1p2cd8c5f4985e91de11ee90eb75448139e~jyO0YUFnj3262932629eucas1p2S;
 Fri, 31 May 2019 13:53:36 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 3A.EA.04298.0E131FC5; Fri, 31
 May 2019 14:53:36 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190531135335eucas1p2505142cc8fff1732f8d02ca2d779514d~jyOzk9O3x2145721457eucas1p2L;
 Fri, 31 May 2019 13:53:35 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190531135335eusmtrp17b93442935442e67635e6cc166f69bfc~jyOzVYBif2136321363eusmtrp1C;
 Fri, 31 May 2019 13:53:35 +0000 (GMT)
X-AuditID: cbfec7f2-f13ff700000010ca-84-5cf131e0c2f6
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 0F.7C.04146.FD131FC5; Fri, 31
 May 2019 14:53:35 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190531135334eusmtip174a9b96b496464a9271e48ad4b8d3a71~jyOylUtdN1620616206eusmtip1F;
 Fri, 31 May 2019 13:53:34 +0000 (GMT)
Subject: Re: [PATCHv4 00/24] drm/bridge: tc358767: DP support
To: Tomi Valkeinen <tomi.valkeinen@ti.com>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Lucas Stach
 <l.stach@pengutronix.de>, Andrey Gusakov
 <andrey.gusakov@cogentembedded.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Peter Ujfalusi
 <peter.ujfalusi@ti.com>, Jyri Sarha <jsarha@ti.com>, Benoit Parrot
 <bparrot@ti.com>
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <f8996a53-6a74-40bf-f9b0-5b8d0107a652@samsung.com>
Date: Fri, 31 May 2019 15:53:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190528082747.3631-1-tomi.valkeinen@ti.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNKsWRmVeSWpSXmKPExsWy7djPc7oPDD/GGDz7KWLR3GFr0XSogdXi
 W38ri8WVr+/ZLLo7O1gtHsy9yWTROXEJu8XdeydYLGZ9/MFqsX7+LTYHLo8HU/8zeeycdZfd
 Y3bHTFaP+93HmTz6/xp4HL+xnSmALYrLJiU1J7MstUjfLoEr49XuCywFz8Uquq+cYm5gnCfU
 xcjJISFgIrHj+3OmLkYuDiGBFYwS3c37WUESQgJfGCX2vJeCsD8zSkxfWwnTcPX+cUaIhuWM
 EhvOLmGDcN4ySvy8vo4NpEpYwFZizeqfrCAJEYF5zBL/m5cwgSTYBDQl/m6+CVTEwcErYCcx
 oasIxGQRUJV4cxbsIlGBCIn7xzaAHcErIChxcuYTFhCbU8BK4uCve8wgNrOAvMT2t3OgbHGJ
 W0/mg30gIXCIXWLV1NtsEJe6SOy6eYcRwhaWeHV8CzuELSNxenIPC4RdL3F/RQszRHMHo8TW
 DTuZIRLWEoePX2QFOY4Z6Ob1u/Qhwo4SbT07wc6XEOCTuPFWEOIGPolJ26YzQ4R5JTraoIGr
 KHH/7FaogeISSy98hbrMQ6Lly1G2CYyKs5B8OQvJZ7OQfDYL4YYFjCyrGMVTS4tz01OLDfNS
 y/WKE3OLS/PS9ZLzczcxApPU6X/HP+1g/Hop6RCjAAejEg/vBKGPMUKsiWXFlbmHGCU4mJVE
 eP+++BAjxJuSWFmVWpQfX1Sak1p8iFGag0VJnLea4UG0kEB6YklqdmpqQWoRTJaJg1OqgbGW
 692/BNbK+jVGhnGKX2+GpHKvO/m+/7RqJ+Phjz6FuUtnV2uuFHut+Xay0P7mqUK3Y+xSQz5v
 cFkbbFOfui/63a2iN2rfIwM3XXY0zfGzLJW802Rm9PVi05RiKw09j8XLFEuF+KccDXDUcpqY
 4OduZcmu0njNxO1/vPetqpw7sdOf1DMrKLEUZyQaajEXFScCAOwQOjlOAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrMIsWRmVeSWpSXmKPExsVy+t/xu7r3DT/GGHSvkrJo7rC1aDrUwGrx
 rb+VxeLK1/dsFt2dHawWD+beZLLonLiE3eLuvRMsFrM+/mC1WD//FpsDl8eDqf+ZPHbOusvu
 MbtjJqvH/e7jTB79fw08jt/YzhTAFqVnU5RfWpKqkJFfXGKrFG1oYaRnaGmhZ2RiqWdobB5r
 ZWSqpG9nk5Kak1mWWqRvl6CX8Wr3BZaC52IV3VdOMTcwzhPqYuTkkBAwkbh6/zhjFyMXh5DA
 UkaJ/29/MEIkxCV2z3/LDGELS/y51sUGYgsJvGaU2DxNA8QWFrCVWLP6JytIs4jAAmaJOy1v
 2SEm9TJKzFt3F2wSm4CmxN/NN4G6OTh4BewkJnQVgZgsAqoSb86CHSEqECFx5v0KFhCbV0BQ
 4uTMJ2A2p4CVxMFf98BuYBZQl/gz7xKULS+x/e0cKFtc4taT+UwTGAVnIWmfhaRlFpKWWUha
 FjCyrGIUSS0tzk3PLTbUK07MLS7NS9dLzs/dxAiMwG3Hfm7ewXhpY/AhRgEORiUe3glCH2OE
 WBPLiitzDzFKcDArifD+ffEhRog3JbGyKrUoP76oNCe1+BCjKdBvE5mlRJPzgckhryTe0NTQ
 3MLS0NzY3NjMQkmct0PgYIyQQHpiSWp2ampBahFMHxMHp1QDo9BK1Tuct0KTTbMWVr7cMHvv
 vylnPm7b6BBjuGTqcfXnR3Varcqinm5+Z9WVKMT4RrA5mftDlnmkqaKuv++KoOzVHFtm1Mds
 XvvzYtICqX+F5+autHi++pg+E7fqjMrbC9J2+op+9F68W6+Ilc9t7a30jvfqF5r/7da01N1X
 YqT4+OGDi75VS5VYijMSDbWYi4oTAXbx66zWAgAA
X-CMS-MailID: 20190531135335eucas1p2505142cc8fff1732f8d02ca2d779514d
X-Msg-Generator: CA
X-RootMTR: 20190528082813epcas2p239d993a4286c0a41d2b17d026bf0288b
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190528082813epcas2p239d993a4286c0a41d2b17d026bf0288b
References: <CGME20190528082813epcas2p239d993a4286c0a41d2b17d026bf0288b@epcas2p2.samsung.com>
 <20190528082747.3631-1-tomi.valkeinen@ti.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1559310817;
 bh=v98hrKIkmjvpE3zh9abOQAdZ5Oun07beFg4KWcb+Aic=;
 h=Subject:To:From:Date:In-Reply-To:References:From;
 b=m7IZZExncRUX+Rf9RjrC3EjjWgodHrWor5NM5mXb7XNS+USh+FNSQcEGHcyERlAg9
 Ns1tcAHh7lNdjWRozNYqZTPkFdd+FjAJDtGSdiK4DM0+lTjV4LVPp0RLKJK60mw0xI
 SvVQ3OXb73XGWQEAdV3hSIoZoK+EQPQIiGXFp9PA=
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

T24gMjguMDUuMjAxOSAxMDoyNywgVG9taSBWYWxrZWluZW4gd3JvdGU6Cj4gSGksCj4KPiB0YzM1
ODc2NyBicmlkZ2Ugd2FzIG9yaWdpbmFsbHkgaW1wbGVtZW50ZWQgZm9yIGVEUCB1c2Ugd2l0aCBh
biBlbWJlZGRlZAo+IHBhbmVsLiBJJ3ZlIGJlZW4gd29ya2luZyB0byBhZGQgRFAgYW5kIEhQRCBz
dXBwb3J0LCBhbmQgdGhpcyBzZXJpZXMgaXMKPiB0aGUgcmVzdWx0LiBJIGRpZCBoYXZlIGEgbG90
IG9mIGlzc3VlcyB3aXRoIGxpbmsgdHJhaW5pbmcsIGJ1dCB3aXRoCj4gdGhlc2UsIGl0J3MgYmVl
biB3b3JraW5nIHJlbGlhYmx5IHdpdGggbXkgZGV2aWNlcy4KPgo+IENoYW5nZXMgaW4gdjIKPiAq
IERyb3AgImltcGxlbWVudCBuYWl2ZSBIUEQgaGFuZGxpbmciLCBhbmQgaW1wbGVtZW50IEhQRCBp
bnRlcnJ1cHQgaGFuZGxpbmcuCj4KPiBDaGFuZ2VzIGluIHYzCj4gKiBWYXJpb3VzIHNtYWxsIGNv
bW1lbnQsIGRlc2NyaXB0aW9uIGFuZCBmb3JtYXR0aW5nIGNoYW5nZXMKPiAqICdocGQtbnVtJyBE
VCBwcm9wZXJ0eSByZW5hbWVkIHRvICd0b3NoaWJhLGhwZC1waW4nCj4gKiBDaGVjayBEUDBDVEwg
PT0gMCBhdCB0aGUgYmVnaW5uaW5nIG9mIHRjX21haW5fbGlua19lbmFibGUKPiAqIERpc2FibGUg
b25seSB0aGUgdmlkZW8gc3RyZWFtIGluIHRjX3N0cmVhbV9kaXNhYmxlKCkKPiAqIEZpeCB0Y19j
b25uZWN0b3JfZGV0ZWN0IGZvciBlRFAgcGFuZWxzCj4KPiBDaGFuZ2VzIGluIHY0Cj4gKiBBZGQg
InJlYWQgZGlzcGxheV9wcm9wcyBpbiBnZXRfbW9kZXMoKSIKPiAqIFJlbW92ZSB0aGUgdGNfZ2V0
X2Rpc3BsYXlfcHJvcHMgY2FsbCBmcm9tIGRldGVjdCBjYWxsYmFjawo+ICogRml4IHRoZSBEUDBD
VEwgY2hlY2sgaW4gdGNfbWFpbl9saW5rX2VuYWJsZS4gT25seSBjaGVjayBmb3IgRFBfRU4gYml0
LAo+ICAgYXMgd2UgY2FuIGhhdmUgb3RoZXIgYml0cyBzZXQgKGUuZy4gYWZ0ZXIgcmVzZXQgVklE
X01OX0dFTiBpcyBzZXQpCj4gKiBBZGRlZCBzb21lIHJldmlld2VkLWJ5cwo+Cj4gIFRvbWkKPgo+
IFRvbWkgVmFsa2VpbmVuICgyNCk6Cj4gICBkcm0vYnJpZGdlOiB0YzM1ODc2NzogZml4IHRjX2F1
eF9nZXRfc3RhdHVzIGVycm9yIGhhbmRsaW5nCj4gICBkcm0vYnJpZGdlOiB0YzM1ODc2NzogcmVz
ZXQgdm9sdGFnZS1zd2luZyAmIHByZS1lbXBoYXNpcwo+ICAgZHJtL2JyaWRnZTogdGMzNTg3Njc6
IGZpeCBhbnNpIDhiMTBiIHVzZQo+ICAgZHJtL2JyaWRnZTogdGMzNTg3Njc6IGNsZWFudXAgc3By
ZWFkICYgc2NyYW1ibGVyX2Rpcwo+ICAgZHJtL2JyaWRnZTogdGMzNTg3Njc6IHJlbW92ZSB1bnVz
ZWQgc3dpbmcgJiBwcmVlbXAKPiAgIGRybS9icmlkZ2U6IHRjMzU4NzY3OiBjbGVhbnVwIGF1eF9s
aW5rX3NldHVwCj4gICBkcm0vYnJpZGdlOiB0YzM1ODc2NzogbW92ZSB2aWRlbyBzdHJlYW0gc2V0
dXAgdG8gdGNfbWFpbl9saW5rX3N0cmVhbQo+ICAgZHJtL2JyaWRnZTogdGMzNTg3Njc6IHNwbGl0
IHN0cmVhbSBlbmFibGUvZGlzYWJsZQo+ICAgZHJtL2JyaWRnZTogdGMzNTg3Njc6IG1vdmUgUFhM
IFBMTCBlbmFibGUvZGlzYWJsZSB0byBzdHJlYW0KPiAgICAgZW5hYmxlL2Rpc2FibGUKPiAgIGRy
bS9icmlkZ2U6IHRjMzU4NzY3OiBhZGQgbGluayBkaXNhYmxlIGZ1bmN0aW9uCj4gICBkcm0vYnJp
ZGdlOiB0YzM1ODc2NzogZGlzYWJsZSBvbmx5IHZpZGVvIHN0cmVhbSBpbiB0Y19zdHJlYW1fZGlz
YWJsZQo+ICAgZHJtL2JyaWRnZTogdGMzNTg3Njc6IGVuc3VyZSBEUCBpcyBkaXNhYmxlZCBiZWZv
cmUgTFQKPiAgIGRybS9icmlkZ2U6IHRjMzU4NzY3OiByZW1vdmUgdW5uZWNlc3NhcnkgbXNsZWVw
Cj4gICBkcm0vYnJpZGdlOiB0YzM1ODc2NzogdXNlIG1vcmUgcmVsaWFibGUgc2VxIHdoZW4gZmlu
aXNoaW5nIExUCj4gICBkcm0vYnJpZGdlOiB0YzM1ODc2NzogY2xlYW51cCBMVCByZXN1bHQgY2hl
Y2sKPiAgIGRybS9icmlkZ2U6IHRjMzU4NzY3OiBjbGVhbi11cCBsaW5rIHRyYWluaW5nCj4gICBk
cm0vYnJpZGdlOiB0YzM1ODc2NzogcmVtb3ZlIGNoZWNrIGZvciB2aWRlbyBtb2RlIGluIGxpbmsg
ZW5hYmxlCj4gICBkcm0vYnJpZGdlOiB0YzM1ODc2NzogdXNlIGJyaWRnZSBtb2RlX3ZhbGlkCj4g
ICBkcm0vYnJpZGdlOiB0YzM1ODc2NzogcmVtb3ZlIHRjX2Nvbm5lY3Rvcl9iZXN0X2VuY29kZXIK
PiAgIGRybS9icmlkZ2U6IHRjMzU4NzY3OiBjb3B5IHRoZSBtb2RlIGRhdGEsIGluc3RlYWQgb2Yg
c3RvcmluZyB0aGUKPiAgICAgcG9pbnRlcgo+ICAgZHJtL2JyaWRnZTogdGMzNTg3Njc6IHJlYWQg
ZGlzcGxheV9wcm9wcyBpbiBnZXRfbW9kZXMoKQo+ICAgZHJtL2JyaWRnZTogdGMzNTg3Njc6IGFk
ZCBHUElPICYgaW50ZXJydXB0IHJlZ2lzdGVycwo+ICAgZHJtL2JyaWRnZTogdGMzNTg3Njc6IGFk
ZCBJUlEgYW5kIEhQRCBzdXBwb3J0Cj4gICBkdC1iaW5kaW5nczogdGMzNTg3Njc6IGFkZCBIUEQg
c3VwcG9ydAo+Cj4gIC4uLi9kaXNwbGF5L2JyaWRnZS90b3NoaWJhLHRjMzU4NzY3LnR4dCAgICAg
ICB8ICAgMSArCj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYyAgICAgICAgICAg
ICB8IDU5MyArKysrKysrKysrKy0tLS0tLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAzODIgaW5zZXJ0
aW9ucygrKSwgMjEyIGRlbGV0aW9ucygtKQoKClF1ZXVlZCB0byBkcm0tbWlzYy1uZXh0LgoKClJl
Z2FyZHMKCkFuZHJ6ZWoKCgoKPgo+IC0tCj4gVGV4YXMgSW5zdHJ1bWVudHMgRmlubGFuZCBPeSwg
UG9ya2thbGFua2F0dSAyMiwgMDAxODAgSGVsc2lua2kuCj4gWS10dW5udXMvQnVzaW5lc3MgSUQ6
IDA2MTU1MjEtNC4gS290aXBhaWtrYS9Eb21pY2lsZTogSGVsc2lua2kKPgo+Cj4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
