Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8B312A255
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2019 15:32:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4711D6E5CC;
	Tue, 24 Dec 2019 14:32:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 8297 seconds by postgrey-1.36 at gabe;
 Mon, 23 Dec 2019 14:52:49 UTC
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63C7689E06
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2019 14:52:49 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBNCYQVr111236;
 Mon, 23 Dec 2019 06:34:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1577104466;
 bh=luhAp8x69B7pBfJnUY11gQs7GAIFTA9VMCqiV9I3CoQ=;
 h=Subject:From:To:CC:References:Date:In-Reply-To;
 b=mIotBoYGH4Wi7Q9O+3qotWB+ABYFvbtwgbueUsDd5dfMbszs27BJ4fH7TEoM1ubUE
 nIpGpI/remtyz4jjNyur5FQeAFHzEGC6YREwrKOwKM24+rEeGOBvFz3C2kKv/ElQBA
 lzmY33F5ani98+ZOunZccsrai42KzsSMKcN7Dy5s=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBNCYQGc028128
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 23 Dec 2019 06:34:26 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 23
 Dec 2019 06:34:24 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 23 Dec 2019 06:34:24 -0600
Received: from [10.24.69.159] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBNCYLSk080203;
 Mon, 23 Dec 2019 06:34:22 -0600
Subject: Re: [PATCH v1] phy: Add DisplayPort configuration options
From: Kishon Vijay Abraham I <kishon@ti.com>
To: Yuti Amonkar <yamonkar@cadence.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Maxime Ripard <maxime@cerno.tech>
References: <1577084071-5332-1-git-send-email-yamonkar@cadence.com>
 <ca6d9a16-0cba-cde7-f60c-75305f88bf33@ti.com>
Message-ID: <64987727-12bd-ec92-ff80-0b3c330b12a3@ti.com>
Date: Mon, 23 Dec 2019 18:06:17 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <ca6d9a16-0cba-cde7-f60c-75305f88bf33@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Tue, 24 Dec 2019 14:29:55 +0000
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
Cc: praneeth@ti.com, mparab@cadence.com, tomi.valkeinen@ti.com, jsarha@ti.com,
 sjakhade@cadence.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

KyBNYXhpbWUgKEZpeGVkIE1heGltZSdzIGVtYWlsIGFkZHJlc3MpCgpPbiAyMy8xMi8xOSA1OjU3
IFBNLCBLaXNob24gVmlqYXkgQWJyYWhhbSBJIHdyb3RlOgo+ICsgTWF4aW1lCj4gCj4gSGksCj4g
Cj4gT24gMjMvMTIvMTkgMTI6MjQgUE0sIFl1dGkgQW1vbmthciB3cm90ZToKPj4gQWxsb3cgRGlz
cGxheVBvcnQgUEhZcyB0byBiZSBjb25maWd1cmVkIHRocm91Z2ggdGhlIGdlbmVyaWMKPj4gZnVu
Y3Rpb25zIHRocm91Z2ggYSBjdXN0b20gc3RydWN0dXJlIGFkZGVkIHRvIHRoZSBnZW5lcmljIHVu
aW9uLgo+PiBUaGUgY29uZmlndXJhdGlvbiBzdHJ1Y3R1cmUgaXMgdXNlZCBmb3IgcmVjb25maWd1
cmF0aW9uIG9mCj4+IERpc3BsYXlQb3J0IFBIWXMgZHVyaW5nIGxpbmsgdHJhaW5pbmcgb3BlcmF0
aW9uLgo+Pgo+PiBUaGUgcGFyYW1ldGVycyBhZGRlZCBoZXJlIGFyZSB0aGUgb25lcyBkZWZpbmVk
IGluIHRoZSBEaXNwbGF5UG9ydAo+PiBzcGVjIHdoaWNoIGluY2x1ZGUgbGluayByYXRlLCBudW1i
ZXIgb2YgbGFuZXMsIHZvbHRhZ2Ugc3dpbmcKPj4gYW5kIHByZS1lbXBoYXNpcy4KPiAKPiBXaGlj
aCB2ZXJzaW9uIG9mIGRpc3BsYXkgcG9ydCBzcGVjaWZpY2F0aW9uPwo+IAo+IFJlc3Qgb2YgY29t
bWl0IGxvZyBzaG91bGQgbW92ZSBiZWxvdyB0aGUgIi0tLSIKPiAKPiAKPj4KPj4gVGhpcyBwYXRj
aCB3YXMgYSBwYXJ0IG9mIFsxXSBzZXJpZXMgZWFybGllciBidXQgd2UgdGhpbmsgdGhhdCBpdCBu
ZWVkcwo+PiB0byBoYXZlIGEgc2VwYXJhdGUgYXR0ZW50aW9uIG9mIHRoZSByZXZpZXdlcnMuIEFs
c28gYXMgYm90aCBbMV0gJiBbMl0gYXJlCj4+IGRlcGVuZGVudCBvbiB0aGlzIHBhdGNoLCBvdXIg
c2luY2VyZSByZXF1ZXN0IHRvIHJldmlld2VycyB0byBoYXZlIGEKPj4gZmFzdGVyIHJldmlldyBv
ZiB0aGlzIHBhdGNoLgo+Pgo+PiBbMV0KPj4KPj4gaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMTkv
MTIvMTEvNDU1Cj4+Cj4+IFsyXQo+Pgo+PiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL2Nv
dmVyLzExMjcxMTkxLwo+IAo+IFRoYW5rcwo+IEtpc2hvbgo+IAo+Pgo+PiBTaWduZWQtb2ZmLWJ5
OiBZdXRpIEFtb25rYXIgPHlhbW9ua2FyQGNhZGVuY2UuY29tPgo+PiAtLS0KPj4gwqAgaW5jbHVk
ZS9saW51eC9waHkvcGh5LWRwLmggfCA5NQo+PiArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrCj4+IMKgIGluY2x1ZGUvbGludXgvcGh5L3BoeS5owqDCoMKgIHzC
oCA0ICsrCj4+IMKgIDIgZmlsZXMgY2hhbmdlZCwgOTkgaW5zZXJ0aW9ucygrKQo+PiDCoCBjcmVh
dGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9saW51eC9waHkvcGh5LWRwLmgKPj4KPj4gZGlmZiAtLWdp
dCBhL2luY2x1ZGUvbGludXgvcGh5L3BoeS1kcC5oIGIvaW5jbHVkZS9saW51eC9waHkvcGh5LWRw
LmgKPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4gaW5kZXggMDAwMDAwMC4uMThjYWQyMwo+PiAt
LS0gL2Rldi9udWxsCj4+ICsrKyBiL2luY2x1ZGUvbGludXgvcGh5L3BoeS1kcC5oCj4+IEBAIC0w
LDAgKzEsOTUgQEAKPj4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wICovCj4+
ICsvKgo+PiArICogQ29weXJpZ2h0IChDKSAyMDE5IENhZGVuY2UgRGVzaWduIFN5c3RlbXMgSW5j
Lgo+PiArICovCj4+ICsKPj4gKyNpZm5kZWYgX19QSFlfRFBfSF8KPj4gKyNkZWZpbmUgX19QSFlf
RFBfSF8KPj4gKwo+PiArI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+Cj4+ICsKPj4gKy8qKgo+PiAr
ICogc3RydWN0IHBoeV9jb25maWd1cmVfb3B0c19kcCAtIERpc3BsYXlQb3J0IFBIWSBjb25maWd1
cmF0aW9uIHNldAo+PiArICoKPj4gKyAqIFRoaXMgc3RydWN0dXJlIGlzIHVzZWQgdG8gcmVwcmVz
ZW50IHRoZSBjb25maWd1cmF0aW9uIHN0YXRlIG9mIGEKPj4gKyAqIERpc3BsYXlQb3J0IHBoeS4K
Pj4gKyAqLwo+PiArc3RydWN0IHBoeV9jb25maWd1cmVfb3B0c19kcCB7Cj4+ICvCoMKgwqAgLyoq
Cj4+ICvCoMKgwqDCoCAqIEBsaW5rX3JhdGU6Cj4+ICvCoMKgwqDCoCAqCj4+ICvCoMKgwqDCoCAq
IExpbmsgUmF0ZSwgaW4gTWIvcywgb2YgdGhlIG1haW4gbGluay4KPj4gK8KgwqDCoMKgICoKPj4g
K8KgwqDCoMKgICogQWxsb3dlZCB2YWx1ZXM6IDE2MjAsIDIxNjAsIDI0MzAsIDI3MDAsIDMyNDAs
IDQzMjAsIDU0MDAsIDgxMDAKPj4gTWIvcwo+PiArwqDCoMKgwqAgKi8KPj4gK8KgwqDCoCB1bnNp
Z25lZCBpbnQgbGlua19yYXRlOwo+PiArCj4+ICvCoMKgwqAgLyoqCj4+ICvCoMKgwqDCoCAqIEBs
YW5lczoKPj4gK8KgwqDCoMKgICoKPj4gK8KgwqDCoMKgICogTnVtYmVyIG9mIGFjdGl2ZSwgY29u
c2VjdXRpdmUsIGRhdGEgbGFuZXMsIHN0YXJ0aW5nIGZyb20KPj4gK8KgwqDCoMKgICogbGFuZSAw
LCB1c2VkIGZvciB0aGUgdHJhbnNtaXNzaW9ucyBvbiBtYWluIGxpbmsuCj4+ICvCoMKgwqDCoCAq
Cj4+ICvCoMKgwqDCoCAqIEFsbG93ZWQgdmFsdWVzOiAxLCAyLCA0Cj4+ICvCoMKgwqDCoCAqLwo+
PiArwqDCoMKgIHVuc2lnbmVkIGludCBsYW5lczsKPj4gKwo+PiArwqDCoMKgIC8qKgo+PiArwqDC
oMKgwqAgKiBAdm9sdGFnZToKPj4gK8KgwqDCoMKgICoKPj4gK8KgwqDCoMKgICogVm9sdGFnZSBz
d2luZyBsZXZlbHMsIGFzIHNwZWNpZmllZCBieSBEaXNwbGF5UG9ydCBzcGVjaWZpY2F0aW9uLAo+
PiArwqDCoMKgwqAgKiB0byBiZSB1c2VkIGJ5IHBhcnRpY3VsYXIgbGFuZXMuIE9uZSB2YWx1ZSBw
ZXIgbGFuZS4KPj4gK8KgwqDCoMKgICogdm9sdGFnZVswXSBpcyBmb3IgbGFuZSAwLCB2b2x0YWdl
WzFdIGlzIGZvciBsYW5lIDEsIGV0Yy4KPj4gK8KgwqDCoMKgICoKPj4gK8KgwqDCoMKgICogTWF4
aW11bSB2YWx1ZTogMwo+PiArwqDCoMKgwqAgKi8KPj4gK8KgwqDCoCB1bnNpZ25lZCBpbnQgdm9s
dGFnZVs0XTsKPj4gKwo+PiArwqDCoMKgIC8qKgo+PiArwqDCoMKgwqAgKiBAcHJlOgo+PiArwqDC
oMKgwqAgKgo+PiArwqDCoMKgwqAgKiBQcmUtZW1waGFzaXMgbGV2ZWxzLCBhcyBzcGVjaWZpZWQg
YnkgRGlzcGxheVBvcnQKPj4gc3BlY2lmaWNhdGlvbiwgdG8gYmUKPj4gK8KgwqDCoMKgICogdXNl
ZCBieSBwYXJ0aWN1bGFyIGxhbmVzLiBPbmUgdmFsdWUgcGVyIGxhbmUuCj4+ICvCoMKgwqDCoCAq
Cj4+ICvCoMKgwqDCoCAqIE1heGltdW0gdmFsdWU6IDMKPj4gK8KgwqDCoMKgICovCj4+ICvCoMKg
wqAgdW5zaWduZWQgaW50IHByZVs0XTsKPj4gKwo+PiArwqDCoMKgIC8qKgo+PiArwqDCoMKgwqAg
KiBAc3NjOgo+PiArwqDCoMKgwqAgKgo+PiArwqDCoMKgwqAgKiBGbGFnIGluZGljYXRpbmcsIHdo
ZXRoZXIgb3Igbm90IHRvIGVuYWJsZSBzcHJlYWQtc3BlY3RydW0KPj4gY2xvY2tpbmcuCj4+ICvC
oMKgwqDCoCAqCj4+ICvCoMKgwqDCoCAqLwo+PiArwqDCoMKgIHU4IHNzYyA6IDE7Cj4+ICsKPj4g
K8KgwqDCoCAvKioKPj4gK8KgwqDCoMKgICogQHNldF9yYXRlOgo+PiArwqDCoMKgwqAgKgo+PiAr
wqDCoMKgwqAgKiBGbGFnIGluZGljYXRpbmcsIHdoZXRoZXIgb3Igbm90IHJlY29uZmlndXJlIGxp
bmsgcmF0ZSBhbmQgU1NDIHRvCj4+ICvCoMKgwqDCoCAqIHJlcXVlc3RlZCB2YWx1ZXMuCj4+ICvC
oMKgwqDCoCAqCj4+ICvCoMKgwqDCoCAqLwo+PiArwqDCoMKgIHU4IHNldF9yYXRlIDogMTsKPj4g
Kwo+PiArwqDCoMKgIC8qKgo+PiArwqDCoMKgwqAgKiBAc2V0X2xhbmVzOgo+PiArwqDCoMKgwqAg
Kgo+PiArwqDCoMKgwqAgKiBGbGFnIGluZGljYXRpbmcsIHdoZXRoZXIgb3Igbm90IHJlY29uZmln
dXJlIGxhbmUgY291bnQgdG8KPj4gK8KgwqDCoMKgICogcmVxdWVzdGVkIHZhbHVlLgo+PiArwqDC
oMKgwqAgKgo+PiArwqDCoMKgwqAgKi8KPj4gK8KgwqDCoCB1OCBzZXRfbGFuZXMgOiAxOwo+PiAr
Cj4+ICvCoMKgwqAgLyoqCj4+ICvCoMKgwqDCoCAqIEBzZXRfdm9sdGFnZXM6Cj4+ICvCoMKgwqDC
oCAqCj4+ICvCoMKgwqDCoCAqIEZsYWcgaW5kaWNhdGluZywgd2hldGhlciBvciBub3QgcmVjb25m
aWd1cmUgdm9sdGFnZSBzd2luZwo+PiArwqDCoMKgwqAgKiBhbmQgcHJlLWVtcGhhc2lzIHRvIHJl
cXVlc3RlZCB2YWx1ZXMuIE9ubHkgbGFuZXMgc3BlY2lmaWVkCj4+ICvCoMKgwqDCoCAqIGJ5ICJs
YW5lcyIgcGFyYW1ldGVyIHdpbGwgYmUgYWZmZWN0ZWQuCj4+ICvCoMKgwqDCoCAqCj4+ICvCoMKg
wqDCoCAqLwo+PiArwqDCoMKgIHU4IHNldF92b2x0YWdlcyA6IDE7Cj4+ICt9Owo+PiArCj4+ICsj
ZW5kaWYgLyogX19QSFlfRFBfSF8gKi8KPj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvcGh5
L3BoeS5oIGIvaW5jbHVkZS9saW51eC9waHkvcGh5LmgKPj4gaW5kZXggMTUwMzJmMTQuLmJhMGFh
YjUgMTAwNjQ0Cj4+IC0tLSBhL2luY2x1ZGUvbGludXgvcGh5L3BoeS5oCj4+ICsrKyBiL2luY2x1
ZGUvbGludXgvcGh5L3BoeS5oCj4+IEBAIC0xNiw2ICsxNiw3IEBACj4+IMKgICNpbmNsdWRlIDxs
aW51eC9wbV9ydW50aW1lLmg+Cj4+IMKgICNpbmNsdWRlIDxsaW51eC9yZWd1bGF0b3IvY29uc3Vt
ZXIuaD4KPj4gwqAgKyNpbmNsdWRlIDxsaW51eC9waHkvcGh5LWRwLmg+Cj4+IMKgICNpbmNsdWRl
IDxsaW51eC9waHkvcGh5LW1pcGktZHBoeS5oPgo+PiDCoCDCoCBzdHJ1Y3QgcGh5Owo+PiBAQCAt
NDYsOSArNDcsMTIgQEAgZW51bSBwaHlfbW9kZSB7Cj4+IMKgwqAgKgo+PiDCoMKgICogQG1pcGlf
ZHBoeTrCoMKgwqAgQ29uZmlndXJhdGlvbiBzZXQgYXBwbGljYWJsZSBmb3IgcGh5cyBzdXBwb3J0
aW5nCj4+IMKgwqAgKsKgwqDCoMKgwqDCoMKgIHRoZSBNSVBJX0RQSFkgcGh5IG1vZGUuCj4+ICsg
KiBAZHA6wqDCoMKgwqDCoMKgwqAgQ29uZmlndXJhdGlvbiBzZXQgYXBwbGljYWJsZSBmb3IgcGh5
cyBzdXBwb3J0aW5nCj4+ICsgKsKgwqDCoMKgwqDCoMKgIHRoZSBEaXNwbGF5UG9ydCBwcm90b2Nv
bC4KPj4gwqDCoCAqLwo+PiDCoCB1bmlvbiBwaHlfY29uZmlndXJlX29wdHMgewo+PiDCoMKgwqDC
oMKgIHN0cnVjdCBwaHlfY29uZmlndXJlX29wdHNfbWlwaV9kcGh5wqDCoMKgIG1pcGlfZHBoeTsK
Pj4gK8KgwqDCoCBzdHJ1Y3QgcGh5X2NvbmZpZ3VyZV9vcHRzX2RwwqDCoMKgwqDCoMKgwqAgZHA7
Cj4+IMKgIH07Cj4+IMKgIMKgIC8qKgo+PgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
