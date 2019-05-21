Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 164C4251BE
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2019 16:18:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65567893BC;
	Tue, 21 May 2019 14:18:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E240893BC
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 14:18:25 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190521141823euoutp0216751cefb9f2d94b74ad5bc136b38e5f~guHme62Uu3094230942euoutp02k
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 14:18:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190521141823euoutp0216751cefb9f2d94b74ad5bc136b38e5f~guHme62Uu3094230942euoutp02k
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190521141822eucas1p2939537d8a1b0a15cf756689bc6789e7c~guHlX-jKo2140721407eucas1p2k;
 Tue, 21 May 2019 14:18:22 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 65.E5.04325.EA804EC5; Tue, 21
 May 2019 15:18:22 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190521141821eucas1p2ee20b0dd14f87f718080a1e9dd52e713~guHkg6tdU2140721407eucas1p2j;
 Tue, 21 May 2019 14:18:21 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190521141821eusmtrp1ac2ab1393a9e283f2bc1a96d40beb509~guHkROtpc0979809798eusmtrp1x;
 Tue, 21 May 2019 14:18:21 +0000 (GMT)
X-AuditID: cbfec7f5-b75ff700000010e5-a4-5ce408ae39f0
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 11.92.04140.CA804EC5; Tue, 21
 May 2019 15:18:20 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190521141820eusmtip230ad3a3b5bcf15a9702426c3a06025f6~guHjmRDBG1172311723eusmtip2O;
 Tue, 21 May 2019 14:18:20 +0000 (GMT)
Subject: Re: [PATCHv3 22/23] drm/bridge: tc358767: add IRQ and HPD support
To: Tomi Valkeinen <tomi.valkeinen@ti.com>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Lucas Stach <l.stach@pengutronix.de>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Andrey Smirnov <andrew.smirnov@gmail.com>, Peter
 Ujfalusi <peter.ujfalusi@ti.com>, Jyri Sarha <jsarha@ti.com>, Benoit Parrot
 <bparrot@ti.com>, dri-devel@lists.freedesktop.org
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <34a9e6fa-2457-ed8e-1bdd-ac09eac2d265@samsung.com>
Date: Tue, 21 May 2019 16:18:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1ea932c7-a6d6-e4fc-bad4-ea9519656018@ti.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNKsWRmVeSWpSXmKPExsWy7djPc7rrOJ7EGNz7yGTR3GFr0XSogdXi
 W38ri8WVr+/ZLLo7O1gtHsy9yWTROXEJu8XdeydYLGZ9/MFqsX7+LTYHLo8HU/8zeeycdZfd
 Y3bHTFaP+93HmTz6/xp4HL+xnSmALYrLJiU1J7MstUjfLoEro+PXVLaCzUoVb3qMGxibpLsY
 OTkkBEwkbl8+xw5iCwmsYJS49Umgi5ELyP7CKLF63hQ2COczo8TZDf9YYTrOT9/PBJFYzijx
 7sEWRoj2t4wS2+/ygdjCAl4Sp+dNYwYpEhGYwyzxb3I7M0iCTUBT4u/mm2wgNq+AncSyLd/A
 drMIqEpMO7qFBcQWFYiQuH9sAytEjaDEyZlPgOIcHJwCVhIXX0SChJkF5CWat85mhrDFJW49
 mQ92kITAIXaJOa17GCEudZH4tPk31NXCEq+Ob2GHsGUkTk/uYYGw6yXur2hhhmjuYJTYumEn
 M0TCWuLw8YusIIuZgY5ev0sfIuwoMeXhNkaQsIQAn8SNt4IQN/BJTNo2nRkizCvR0SYEUa0o
 cf/sVqiB4hJLL3xlg7A9JF5dO8k8gVFxFpInZyH5bBaSz2Yh3LCAkWUVo3hqaXFuemqxcV5q
 uV5xYm5xaV66XnJ+7iZGYJI6/e/41x2M+/4kHWIU4GBU4uG1ePg4Rog1say4MvcQowQHs5II
 7+lTj2KEeFMSK6tSi/Lji0pzUosPMUpzsCiJ81YzPIgWEkhPLEnNTk0tSC2CyTJxcEo1MG7u
 dikUEZSY83XvhljGzhP+L/XrVFqCDkdqMfH/Wf3u6SuDSfE3gtzv8nnaTb/l9Tj01YzF0bcZ
 zIM/GPw7fFFMts313WM9M0u2OarXjnenpxvNzci6qvAj6tNktSgBk7p4n8726jbnqYn3vCZv
 ZU1TOffl948262O7/a18tR88M+VYmvT1qxJLcUaioRZzUXEiAJGJw6lOAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRmVeSWpSXmKPExsVy+t/xe7prOJ7EGFz6Ym7R3GFr0XSogdXi
 W38ri8WVr+/ZLLo7O1gtHsy9yWTROXEJu8XdeydYLGZ9/MFqsX7+LTYHLo8HU/8zeeycdZfd
 Y3bHTFaP+93HmTz6/xp4HL+xnSmALUrPpii/tCRVISO/uMRWKdrQwkjP0NJCz8jEUs/Q2DzW
 yshUSd/OJiU1J7MstUjfLkEvo+PXVLaCzUoVb3qMGxibpLsYOTkkBEwkzk/fz9TFyMUhJLCU
 UeLFnMnMEAlxid3z30LZwhJ/rnWxQRS9ZpQ48uMyK0hCWMBL4vS8acwgCRGBBcwS3Vcus0ON
 YpJY0XWYCaSKTUBT4u/mm2wgNq+AncSyLd/YQWwWAVWJaUe3sIDYogIREmfer2CBqBGUODnz
 CZDNwcEpYCVx8UUkSJhZQF3iz7xLzBC2vETz1tlQtrjErSfzmSYwCs5C0j0LScssJC2zkLQs
 YGRZxSiSWlqcm55bbKRXnJhbXJqXrpecn7uJERiD24793LKDsetd8CFGAQ5GJR7eB/cexwix
 JpYVV+YeYpTgYFYS4T196lGMEG9KYmVValF+fFFpTmrxIUZToN8mMkuJJucD00NeSbyhqaG5
 haWhubG5sZmFkjhvh8DBGCGB9MSS1OzU1ILUIpg+Jg5OqQZGzj+v7riEH7B9EmCV9IFhfnOD
 zY6dasW2L4VLehfey2S3ndCkG9YQkDe/6tJRo9Bv00s0dD7OTXjWrrP3zPewGPaqc9dmfppw
 4aHwXu0Tny5Xr/p7jbf1zKF/Zum3ZyccdJqr77A8uvLij8ssD+OtLl5k+p579MpN0QbZEpEr
 D2K//k+I2hV9S4mlOCPRUIu5qDgRANDWop/XAgAA
X-CMS-MailID: 20190521141821eucas1p2ee20b0dd14f87f718080a1e9dd52e713
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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1558448303;
 bh=Gxjo0cyaP0Kc/Z8t+cKyB1Fc4tk52PpFJzE0wJfkOKc=;
 h=Subject:To:From:Date:In-Reply-To:References:From;
 b=FyQ2TgXkWt/AnSnRZxzvPm2SS4K6g6osaKI9FSBXyYKBGTJWLoUygemDlcxuij7O1
 6ZBwZHwEDQiyDm4SUxu/cBoLheVo3CvPsaFUSXsy0DzJ6pGFLMD7tItI73ycxiWDMu
 XgIonarsbtaLV+8F9aNjDC2McESA2o329NfUl344=
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

T24gMjEuMDUuMjAxOSAxMzozNCwgVG9taSBWYWxrZWluZW4gd3JvdGU6Cj4gT24gMjEvMDUvMjAx
OSAxMDowNywgQW5kcnplaiBIYWpkYSB3cm90ZToKPgo+Pj4gQEAgLTEyMTQsMTkgKzEyMzQsNDMg
QEAgc3RhdGljIGludCB0Y19jb25uZWN0b3JfZ2V0X21vZGVzKHN0cnVjdCBkcm1fY29ubmVjdG9y
ICpjb25uZWN0b3IpCj4+PiAgIAlyZXR1cm4gY291bnQ7Cj4+PiAgIH0KPj4+ICAgCj4+PiAtc3Rh
dGljIHZvaWQgdGNfY29ubmVjdG9yX3NldF9wb2xsaW5nKHN0cnVjdCB0Y19kYXRhICp0YywKPj4+
IC0JCQkJICAgICBzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQo+Pj4gLXsKPj4+IC0J
LyogVE9ETzogYWRkIHN1cHBvcnQgZm9yIEhQRCAqLwo+Pj4gLQljb25uZWN0b3ItPnBvbGxlZCA9
IERSTV9DT05ORUNUT1JfUE9MTF9DT05ORUNUIHwKPj4+IC0JCQkgICAgRFJNX0NPTk5FQ1RPUl9Q
T0xMX0RJU0NPTk5FQ1Q7Cj4+PiAtfQo+Pj4gLQo+Pj4gICBzdGF0aWMgY29uc3Qgc3RydWN0IGRy
bV9jb25uZWN0b3JfaGVscGVyX2Z1bmNzIHRjX2Nvbm5lY3Rvcl9oZWxwZXJfZnVuY3MgPSB7Cj4+
PiAgIAkuZ2V0X21vZGVzID0gdGNfY29ubmVjdG9yX2dldF9tb2RlcywKPj4+ICAgfTsKPj4+ICAg
Cj4+PiArc3RhdGljIGVudW0gZHJtX2Nvbm5lY3Rvcl9zdGF0dXMgdGNfY29ubmVjdG9yX2RldGVj
dChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLAo+Pj4gKwkJCQkJCSAgICAgYm9vbCBm
b3JjZSkKPj4+ICt7Cj4+PiArCXN0cnVjdCB0Y19kYXRhICp0YyA9IGNvbm5lY3Rvcl90b190Yyhj
b25uZWN0b3IpOwo+Pj4gKwlib29sIGNvbm47Cj4+PiArCXUzMiB2YWw7Cj4+PiArCWludCByZXQ7
Cj4+IHVudXNlZCB2YXIKPiBOZWVkZWQgZm9yIHRjX3dyaXRlL3JlYWQuLi4gPSggQ2xlYW5pbmcg
dGhlc2UgdXAgd2lsbCBiZSB0aGUgbmV4dCBzdGVwLgoKCmFhaCwgSSBmb3Jnb3QgYWJvdXQgdGhp
cyBwYXR0ZXJuIDopCgoKPgo+Pj4gKwo+Pj4gKwlpZiAodGMtPmhwZF9waW4gPCAwKSB7Cj4+PiAr
CQlpZiAoIXRjLT5wYW5lbCkKPj4+ICsJCQlyZXR1cm4gY29ubmVjdG9yX3N0YXR1c191bmtub3du
Owo+Pj4gKwo+Pj4gKwkJY29ubiA9IHRydWU7Cj4+PiArCX0gZWxzZSB7Cj4+PiArCQl0Y19yZWFk
KEdQSU9JLCAmdmFsKTsKPj4+ICsKPj4+ICsJCWNvbm4gPSB2YWwgJiBCSVQodGMtPmhwZF9waW4p
Owo+Pj4gKwl9Cj4+PiArCj4+PiArCWlmIChmb3JjZSAmJiBjb25uKQo+Pj4gKwkJdGNfZ2V0X2Rp
c3BsYXlfcHJvcHModGMpOwo+Pgo+PiBXaHkgZG8geW91IGNhbGwgdGNfZ2V0X2Rpc3BsYXlfcHJv
cHMgaGVyZT8gSXQgaXMgY2FsbGVkIGFscmVhZHkgaW4gLmVuYWJsZS4KPj4KPj4gSWYgeW91IG5l
ZWQgaXQgZm9yIGdldF9tb2RlcyB5b3UgY2FuIGNhbGwgaXQgdGhlcmUuIEhlcmUgaXQgbG9va3Mg
dW5yZWxhdGVkLgo+IFllcywgaXQncyBuZWVkZWQgZm9yIGdldF9tb2Rlcy4gT3IgbW9yZSBzcGVj
aWZpY2FsbHksIGZvciB0Y19tb2RlX3ZhbGlkLiBJIGFncmVlIGl0IAo+IGRvZXNuJ3QgcXVpdGUg
ZmVlbCByaWdodCwgYnV0IEkgd291bGRuJ3Qgc2F5IGl0J3MgdW5yZWxhdGVkLCBvciB0aGF0IHRo
aXMgaXMgYSB3cm9uZyBwbGFjZS4KPgo+IEFmYWljcywgd2UgbmVlZCB0Y19nZXRfZGlzcGxheV9w
cm9wcyBpbiBicmlkZ2VfZW5hYmxlLCBmb3IgdGhlIGNhc2Ugd2hlcmUgd2UgZG9uJ3QgaGF2ZSAK
PiBocGQuIFdlIGNvdWxkIGNhbGwgdGNfZ2V0X2Rpc3BsYXlfcHJvcHMgaW4gZ2V0X21vZGVzLCBi
dXQgSSBkb24ndCBrbm93IGlmIHdlIGFsd2F5cyBnZXQgYSAKPiBnZXRfbW9kZXMgY2FsbC4gT3Ig
bWF5YmUgd2UgZ2V0IG11bHRpcGxlIGdldF9tb2RlcyBjYWxscywgYW5kIHdlIGRvIHVubmVjZXNz
YXJ5IAo+IHRjX2dldF9kaXNwbGF5X3Byb3BzIGNhbGxzLgoKCi5kZXRlY3QgY2FuIGJlIGFsc28g
Y2FsbGVkIG11bHRpcGxlIHRpbWVzLgoKCj4KPiBOb3cgdGhhdCBJIHdyb3RlIHRoZSBhYm92ZSwg
aXQgbWFrZXMgbWUgd29uZGVyIHdoZXRoZXIgdGhlIGdldF9tb2RlcyB3b3JrcyBpbiB0aGUgY3Vy
cmVudCAKPiBwYXRjaGVzIGlmIHdlIGRvbid0IGhhdmUgaHBkLi4uCj4KPiBXZSBjb3VsZCBjYWNo
ZSB0Y19nZXRfZGlzcGxheV9wcm9wcyByZXN1bHRzLCB0b28sIGJ1dCBJJ20gbm90IHN1cmUgd2hl
biB0byBjbGVhciB0aGUgCj4gY2FjaGUsIGVzcGVjaWFsbHkgaWYgd2UgZG9uJ3QgaGF2ZSBocGQu
CgoKSWYgSSByZW1lbWJlciBjb3JyZWN0bHkgd2l0aG91dCBocGQgdXNlcnNwYWNlICdpbmZvcm1z
JyBkcml2ZXIgdGhhdCBzaW5rCmlzIGNvbm5lY3RlZCAodmlhIHN0YXR1cyBzeXNmcyBwcm9wZXJ0
eSksIGluIHN1Y2ggY2FzZQouZmlsbF9tb2Rlcy8uZ2V0X21vZGVzIGlzIGNhbGxlZCBvbiBjaGFu
Z2UuCgoKPgo+IERpc3BsYXlQb3J0IHNwZWMgdGFsa3MgYWJvdXQgZG9pbmcgdGhlIGRpc3BsYXkt
cHJvcHMgcmVhZGluZyBhbmQgRURJRCByZWFkaW5nIHdoZW4gCj4gaGFuZGxpbmcgSFBELgo+Cj4g
SSB0aGluayBpdCB3b3VsZCBiZSBiZXN0IHRvIGNoYW5nZSB0aGUgY29kZSBzbyB0aGF0IHdlIHJl
YWQgZGlzcGxheSBwcm9wcyBhbmQgRURJRCBpbiBIUEQsIAo+IGJ1dCBzbyB0aGF0IHdlIGFsc28g
Y2FuIHJlYWQgdGhlbSBsYXRlciAod2hlbiBuZWVkZWQsIHByb2JhYmx5IGJyaWRnZSBlbmFibGUg
YW5kIAo+IGdldF9tb2RlcykgaWYgd2UgaGF2ZW4ndCBkb25lIHRoZSByZWFkcyBhbHJlYWR5LiBJ
J3ZlIGhhZCB0aGlzIGluIG1pbmQgc2luY2UgSSBzdGFydGVkIHRoZSAKPiBzZXJpZXMsIGJ1dCBh
cyBpdCBkaWRuJ3QgZmVlbCBsaWtlIGEgc2ltcGxlIGNoYW5nZSwgSSBsZWZ0IGl0IGZvciBsYXRl
ci4KCgpNeSBhcHByb2FjaCBhbmQgZXhwZXJpZW5jZSBzdWdnZXN0IHRoYXQgZGV0ZWN0LCBzaG91
bGQgYmUgcmF0aGVyCmxpZ2h0d2VpZ2h0IGFuZCBzaG91bGQgbm90IG1vZGlmeSBzdGF0ZSwgSSBh
bSBub3QgZXZlbiBzdXJlIGlmIGl0IGlzCmNhbGxlZCBhdCBhbGwgb24gZm9yY2VkIGNvbm5lY3Rv
ci4KCgpSZWdhcmRzCgpBbmRyemVqCgoKPgo+PiBSZW1vdmluZyB0aGUgY2FsbCBmcm9tIGhlcmUg
c2hvdWxkIGFsc28gc2ltcGxpZnkgZnVuY3Rpb24gZmxvdzoKPj4KPj4gIMKgwqDCoCBpZiAodGMt
PmhwZF9waW4gPCAwKQo+Pgo+PiAgwqDCoMKgIMKgwqDCoCByZXR1cm4gdGMtPnBhbmVsID8gY29u
bmVjdG9yX3N0YXR1c19jb25uZWN0ZWQgOgo+PiBjb25uZWN0b3Jfc3RhdHVzX2Rpc2Nvbm5lY3Rl
ZDsKPj4KPj4gIMKgwqDCoCB0Y19yZWFkKEdQSU9JLCAmdmFsKTsKPj4KPj4gIMKgwqDCoCByZXR1
cm4gKHZhbCAmIEJJVCh0Yy0+aHBkX3BpbikpPyA/IGNvbm5lY3Rvcl9zdGF0dXNfY29ubmVjdGVk
IDoKPj4gY29ubmVjdG9yX3N0YXR1c19kaXNjb25uZWN0ZWQ7Cj4+Cj4+Cj4+PiArCj4+PiArCWlm
IChjb25uKQo+Pj4gKwkJcmV0dXJuIGNvbm5lY3Rvcl9zdGF0dXNfY29ubmVjdGVkOwo+Pj4gKwll
bHNlCj4+PiArCQlyZXR1cm4gY29ubmVjdG9yX3N0YXR1c19kaXNjb25uZWN0ZWQ7Cj4+PiArCj4+
PiArZXJyOgo+Pgo+PiB1bnVzZWQgbGFiZWwvY29kZT8KPiBOZWVkZWQgZm9yIHRjX3dyaXRlL3Jl
YWQgdG9vLgo+Cj4+PiBAQCAtMTI0OSw2ICsxMjkzLDE1IEBAIHN0YXRpYyBpbnQgdGNfYnJpZGdl
X2F0dGFjaChzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlKQo+Pj4gICAJaWYgKHJldCkKPj4+ICAg
CQlyZXR1cm4gcmV0Owo+Pj4gICAKPj4+ICsJLyogRG9uJ3QgcG9sbCBpZiBkb24ndCBoYXZlIEhQ
RCBjb25uZWN0ZWQgKi8KPj4+ICsJaWYgKHRjLT5ocGRfcGluID49IDApIHsKPj4+ICsJCWlmICh0
Yy0+aGF2ZV9pcnEpCj4+PiArCQkJdGMtPmNvbm5lY3Rvci5wb2xsZWQgPSBEUk1fQ09OTkVDVE9S
X1BPTExfSFBEOwo+Pj4gKwkJZWxzZQo+Pj4gKwkJCXRjLT5jb25uZWN0b3IucG9sbGVkID0gRFJN
X0NPTk5FQ1RPUl9QT0xMX0NPTk5FQ1QgfAo+Pj4gKwkJCQkJICAgICAgIERSTV9DT05ORUNUT1Jf
UE9MTF9ESVNDT05ORUNUOwo+Pgo+PiBCaWtlc2hlZGRpbmc6IHdvdWxkbid0IGJlIG1vcmUgY2xl
YXIgdG8gdXNlID86wqAgb3BlcmF0b3I/Cj4gRGVwZW5kcyBvbiB0aGUgcmVhZGVyLCBJIGd1ZXNz
LiBJIGxpa2UgPzogd2hlbiB0aGUgcGFyYW1ldGVycyBhcmUgcmVsYXRpdmVseSBzaW1wbGUgKHNh
eSwgCj4gYSBzaW5nbGUgdmFyaWFibGUpLiBIZXJlIGl0J3MgYSBiaXQgc28tYW5kLXNvIHdpdGgg
dGhlIHNlY29uZCBjYXNlJ3MgYml0d2lzZS1vci4KPgo+ICAgVG9taQo+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
