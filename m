Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB7110AFD4
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2019 13:59:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 939286E12F;
	Wed, 27 Nov 2019 12:59:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67AF96E12F
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2019 12:59:11 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xARCx5GJ024611;
 Wed, 27 Nov 2019 06:59:05 -0600
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xARCx5nB097483
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 27 Nov 2019 06:59:05 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 27
 Nov 2019 06:59:04 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 27 Nov 2019 06:59:04 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xARCx3Tq091368;
 Wed, 27 Nov 2019 06:59:03 -0600
Subject: Re: [PATCH 0/3] drm/omap: fix am4 evm lcd
To: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>, Thierry
 Reding <thierry.reding@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20191114093950.4101-1-tomi.valkeinen@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <52608d4e-dd67-1232-41e7-e6d0cba58783@ti.com>
Date: Wed, 27 Nov 2019 14:59:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191114093950.4101-1-tomi.valkeinen@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1574859545;
 bh=iCv+FpLY5azFIjwajI6mzFeKp4CF72P6A71DV238Hr4=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=sHVpMsya4RVGOZmXe5wMdKzpgtuzSoDiWsuk4tqUt5z7QFia0wY27Ob/jDLMuVzel
 xPJKdz4Kpkpkzv2BXd3mmVeInPSZ5VAbURuz/1i0MPaF4CRprxXhlhjlNvxR+hDG9Z
 lH2gc1+flH7oWjywL0pjNYCqoo0U6vQboMDmiPYY=
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
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>, Jyri Sarha <jsarha@ti.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVG9ueSwgVGhpZXJyeSwgTGF1cmVudCwKCkFueSB0aG91Z2h0cyBvbiB0aGUgYmVsb3cgcG9p
bnRzPwoKSSB0aGluayB5ZXQgYW5vdGhlciBvcHRpb24gaXMgdG8gd3JpdGUgc29tZSBvbWFwIGJv
b3QgdGltZSBxdWlya3MgY29kZSwgd2hpY2ggbG9va3MgYXQgdGhlIERUIGRhdGEsIAphbmQgY2hh
bmdlcyB0aGUgcGFuZWwgY29tcGF0aWJsZSBzdHJpbmcgKGZvciAxKSwgYW5kIHJlbW92ZXMgdGhl
IHRpbWluZ3Mgbm9kZSAoZm9yIDIpLgoKICBUb21pCgpPbiAxNC8xMS8yMDE5IDExOjM5LCBUb21p
IFZhbGtlaW5lbiB3cm90ZToKPiBIaSBUb255LCBUaGllcnJ5LCBMYXVyZW50LAo+IAo+IEFmdGVy
IHRoZSByZWNlbnQgY2hhbmdlIG9mIG1vdmluZyBmcm9tIG9tYXBkcm0gc3BlY2lmaWMgcGFuZWwt
ZHBpIGRyaXZlcgo+IHRvIHRoZSBEUk0gc2ltcGxlIHBhbmVsLCBBTTQgRVZNL2VQT1MncyBwYW5l
bCBpcyBub3Qgd29ya2luZyBxdWl0ZQo+IHJpZ2h0LiBUaGlzIHNlcmllcyBoYXMgZml4ZXMgZm9y
IGl0LCBidXQgSSdtIG5vdCBzdXJlIGlmIHRoZXNlIGFyZSB0aGUKPiByaWdodCB3YXlzIHRvIGZp
eCB0aGUgaXNzdWVzLCBzbyBjb21tZW50cyB3ZWxjb21lLgo+IAo+IDEpIFBhbmVsIGRyaXZlciBp
cyBub3QgcHJvYmVkLiBXaXRoIG9tYXBkcm0ncyBwYW5lbC1kcGksIHRoZSBtYXRjaAo+IGhhcHBl
bmVkIHdpdGggInBhbmVsLWRwaSIgY29tcGF0aWJsZSBzdHJpbmcuIE5vdyB3aXRoIHBhbmVsLXNp
bXBsZSwgdGhlCj4gbWF0Y2ggc2hvdWxkIGhhcHBlbiB3aXRoIHRoZSBwYW5lbCBtb2RlbCBjb21w
YXRpYmxlIHN0cmluZywgd2hpY2ggaXMKPiAib3NkZGlzcGxheXMsb3NkMDU3VDA1NTktMzR0cyIg
aW4gdGhlIERUIGZpbGUuIEhvd2V2ZXIsIG5vIHN1Y2gKPiBjb21wYXRpYmxlIGV4aXN0cyBpbiBw
YW5lbC1zaW1wbGUuCj4gCj4gSW50ZXJlc3RpbmdseSwgdGhlIGFjdHVhbCBwYW5lbCBhdCBsZWFz
dCBvbiBteSBFVk1zIGFuZCBlUE9TZXMgaXMgbm90Cj4gb3NkMDU3VDA1NTktMzR0cywgYnV0IG9z
ZDA3MHQxNzE4LTE5dHMuIEFsc28sIEkgd2FzIHVuYWJsZSB0byBmaW5kIGFueQo+IGluZm9ybWF0
aW9uIGFib3V0IG9zZDA1N1QwNTU5LTM0dHMuIEkgZG9uJ3Qga25vdyB0aGUgaGlzdG9yeSB3aXRo
IHRoaXMsCj4gc28gaXQgaXMgcG9zc2libGUgdGhhdCB0aGUgZWFybHkgdmVyc2lvbnMgb2YgdGhl
IGJvYXJkcyBkaWQgaGF2ZQo+IG9zZDA1N1QwNTU5LTM0dHMsIGJ1dCB3YXMgbGF0ZXIgY2hhbmdl
ZCB0byBvc2QwNzB0MTcxOC0xOXRzLgo+IAo+IEFzIG9zZDA3MHQxNzE4LTE5dHMgaXMgc3VwcG9y
dGVkIGJ5IHBhbmVsLXNpbXBsZSwgY2hhbmdpbmcgdGhlCj4gY29tcGF0aWJsZSBzdHJpbmcgdG8g
b3NkMDcwdDE3MTgtMTl0cyBpbiB0aGUgRFQgZmlsZSBzb2x2ZXMgdGhpcyBvbmUuCj4gCj4gMikg
VGltaW5ncyBpbiBEVCBmaWxlIGNhdXNlIGEga2VybmVsIHdhcm5pbmcuIE9tYXBkcm0ncyBwYW5l
bC1kcGkgdXNlZAo+IHZpZGVvIHRpbWluZ3MgZnJvbSB0aGUgRFQgZmlsZSwgc28gdGhleSBhcmUg
cHJlc2VudCBpbiBhbGwgdGhlIERUIGZpbGVzLgo+IHBhbmVsLXNpbXBsZSB1c2VzIHRpbWluZ3Mg
ZnJvbSBhIHRhYmxlIGluIHRoZSBwYW5lbC1zaW1wbGUgZHJpdmVyLCBidXQKPiBnaXZlcyBhIGtl
cm5lbCB3YXJuaW5nIGlmIHRoZSBEVCBmaWxlIGNvbnRhaW5zIHRpbWluZ3MuCj4gCj4gVGhpcyBj
YW4gYmUgc29sdmVkIGJ5IHJlbW92aW5nIHRoZSB0aW1pbmdzIGZyb20gdGhlIERUIGZpbGUuCj4g
Cj4gMykgU3luYyBkcml2ZSBlZGdlIGlzIG5vdCByaWdodC4gVGhpcyBvbmUgbWlnaHQgaGF2ZSBi
ZWVuIHByZXNlbnQgYWxzbwo+IHdpdGggcGFuZWwtZHBpLCBJIGRpZG4ndCB2ZXJpZnkuIFRoZSBw
cm9ibGVtIGlzIHRoYXQgdGhlIHBhbmVsLXNpbXBsZQo+IGRhdGEgZm9yIG9zZGRpc3BsYXlzX29z
ZDA3MHQxNzE4XzE5dHMgZGVmaW5lcyBidXNfZmxhZ3MgZm9yIERFIHBvbGFyaXR5Cj4gYW5kIHBp
eGRhdGEgZWRnZSwgYnV0IG5vdCBmb3Igc3luYyBlZGdlLgo+IAo+IFRoZSBkYXRhc2hlZXQgZm9y
IHRoZSBwYW5lbCBkb2VzIG5vdCBnaXZlIGFueSBoaW50IG9uIHdoYXQgdGhlIGVkZ2UKPiBzaG91
bGQgYmUuICBPbWFwZHJtIGRlZmF1bHRzIHRvIGRyaXZpbmcgc3luY3Mgb24gZmFsbGluZyBlZGdl
LCB3aGljaAo+IGNhdXNlZCB0aGUgaW1hZ2UgdG8gYmUgc2hpZnRlZCBvbmUgcGl4ZWwgdG8gdGhl
IHJpZ2h0Lgo+IAo+IEFkZGluZyBEUk1fQlVTX0ZMQUdfU1lOQ19EUklWRV9QT1NFREdFIGJ1c19m
bGFnIHNvbHZlcyB0aGUgcHJvYmxlbS4gQU01Cj4gRVZNIGFsc28gaGFzIHRoZSBzYW1lIHBhbmVs
IHdpdGggdGhlIHNhbWUgYmVoYXZpb3IuCj4gCj4gPT09PQo+IAo+IFRoZSByZWFzb24gSSdtIG5v
dCBzdXJlIGlmIHRoZSAxKSBhbmQgMikgZml4ZXMgYXJlIGNvcnJlY3QgaXMgdGhhdAo+IHRoZXkn
cmUgYnJlYWtpbmcgRFQgY29tcGF0aWJpbGl0eS4gU2hvdWxkIHdlIGluc3RlYWQgbWFrZSBjaGFu
Z2VzIHRvCj4gcGFuZWwtc2ltcGxlIHRvIGtlZXAgdGhlIHNhbWUgRFQgZmlsZXMgd29ya2luZz8K
PiAKPiBUaGlzIHdvdWxkIG1lYW4gYWRkaW5nIGEgbmV3IGVudHJ5IGZvciB0aGUgb3NkMDU3VDA1
NTktMzR0cyBwYW5lbCwgYnV0Cj4gYXMgd2UgZG9uJ3QgaGF2ZSBkYXRhc2hlZXQgZm9yIGl0LCBJ
IHRoaW5rIHdlIGNvdWxkIGp1c3QgYXBwZW5kIHRoZQo+IGNvbXBhdGlibGUgc3RyaW5nIHRvIG9z
ZDA3MHQxNzE4LTE5dCdzIGRhdGEuCj4gCj4gSXQgd291bGQgYWxzbyBtZWFuIGRvaW5nIHNvbWUg
Y2hhbmdlIHRvIHRoZSBwYW5lbC1zaW1wbGUgY29kZSB0aGF0IGdpdmVzCj4gdGhlIHdhcm5pbmcg
YWJvdXQgdGltaW5ncyBpbiBEVCBkYXRhLiBUaGlzIG1pZ2h0IG1ha2Ugc2Vuc2UsIGFzIEkgdGhp
bmsKPiB3ZSBoYXZlIG90aGVyIERUIGZpbGVzIHdpdGggdmlkZW8gdGltaW5ncyB0b28uCj4gCj4g
Rm9yIDMpLCBJIHRoaW5rIHRoZSBwYXRjaCBpcyBmaW5lLCBidXQgSSdtIG5vdCBzdXJlIGlmIHRo
ZSBkaXNwbGF5Cj4gY29udHJvbGxlciBkcml2ZXIgc2hvdWxkIGJlIGFibGUgdG8gZGVkdWNlIHRo
ZSBzeW5jIGRyaXZlIGVkZ2UgZnJvbSB0aGUKPiBwaXhkYXRhIGRyaXZlIGVkZ2UuIEFyZSB0aGV5
IHVzdWFsbHkgdGhlIHNhbWU/IEkgaGF2ZSBubyBpZGVhLi4uCj4gCj4gICBUb21pCj4gCj4gVG9t
aSBWYWxrZWluZW4gKDMpOgo+ICAgIEFSTTogZHRzOiBhbTQzN3gtZ3AvZXBvcy1ldm06IGZpeCBw
YW5lbCBjb21wYXRpYmxlCj4gICAgQVJNOiBkdHM6IGFtNDM3eC1ncC9lcG9zLWV2bTogZHJvcCB1
bnVzZWQgcGFuZWwgdGltaW5ncwo+ICAgIGRybS9wYW5lbDogc2ltcGxlOiBmaXggb3NkMDcwdDE3
MThfMTl0cyBzeW5jIGRyaXZlIGVkZ2UKPiAKPiAgIGFyY2gvYXJtL2Jvb3QvZHRzL2FtNDM3eC1n
cC1ldm0uZHRzICB8IDE4ICstLS0tLS0tLS0tLS0tLS0tLQo+ICAgYXJjaC9hcm0vYm9vdC9kdHMv
YW00M3gtZXBvcy1ldm0uZHRzIHwgMTggKy0tLS0tLS0tLS0tLS0tLS0tCj4gICBkcml2ZXJzL2dw
dS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMgfCAgMyArKy0KPiAgIDMgZmlsZXMgY2hhbmdlZCwg
NCBpbnNlcnRpb25zKCspLCAzNSBkZWxldGlvbnMoLSkKPiAKPiAtLQo+IFRleGFzIEluc3RydW1l
bnRzIEZpbmxhbmQgT3ksIFBvcmtrYWxhbmthdHUgMjIsIDAwMTgwIEhlbHNpbmtpLgo+IFktdHVu
bnVzL0J1c2luZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhlbHNpbmtp
Cj4gCgotLSAKVGV4YXMgSW5zdHJ1bWVudHMgRmlubGFuZCBPeSwgUG9ya2thbGFua2F0dSAyMiwg
MDAxODAgSGVsc2lua2kuClktdHVubnVzL0J1c2luZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlwYWlr
a2EvRG9taWNpbGU6IEhlbHNpbmtpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
