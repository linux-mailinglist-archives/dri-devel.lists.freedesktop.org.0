Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1711BBA4F
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 11:49:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 721F86E25D;
	Tue, 28 Apr 2020 09:49:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A42F06E258
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 09:49:40 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03S9nVvV082105;
 Tue, 28 Apr 2020 04:49:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1588067371;
 bh=vi0lak+PESiDwZ0/mkWQsOclkMxH3g4XyeOihRduJy0=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=BV2Zxe4iPkNu9gqmZtuR65pMPOlIdfT97ro6vS3YbgPm2ft2TJUXz7uNUjFjrMRQC
 bsuhpdiehprVO7oAn7t1LvTtcfkfzR6Ob62FFWFZes+xUeE2O97t3nlCpHbVi83wMH
 HblNblvH7SfOJO0jzx3pMKO4p0Wu6nP+1TWjcxLc=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03S9nVL8026251
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 28 Apr 2020 04:49:31 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 28
 Apr 2020 04:49:31 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 28 Apr 2020 04:49:31 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03S9nS0F037890;
 Tue, 28 Apr 2020 04:49:29 -0500
Subject: Re: [RFC PATCH] dt-bindings: display: ti,tfp410.txt: convert to yaml
To: =?UTF-8?Q?Ricardo_Ca=c3=b1uelo?= <ricardo.canuelo@collabora.com>,
 <robh+dt@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
References: <20200428092048.14939-1-ricardo.canuelo@collabora.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <3e377c73-25a3-a7b3-0604-41c54d70039e@ti.com>
Date: Tue, 28 Apr 2020 12:49:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200428092048.14939-1-ricardo.canuelo@collabora.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: devicetree@vger.kernel.org, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 jason@lakedaemon.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjgvMDQvMjAyMCAxMjoyMCwgUmljYXJkbyBDYcOxdWVsbyB3cm90ZToKCj4gMikgVGhlIGRl
ZmluaXRpb24gb2YgdGksZGVza2V3IGluIHRoZSBvcmlnaW5hbCBiaW5kaW5nIHNlZW1zIHRvIGJl
Cj4gdGFpbG9yZWQgdG8gdGhlIGN1cnJlbnQgZHJpdmVyIGFuZCB0aGUgd2F5IGl0J3MgZGVmaW5l
ZCBtYXkgbm90IGJlIHZlcnkKPiBEVC1mcmllbmRseS4KPiAKPiAgICBUaGlzIHBhcmFtZXRlciBt
YXBzIHRvIGEgMy1iaXQgZmllbGQgaW4gYSBoYXJkd2FyZSByZWdpc3RlciB0aGF0IHRha2VzCj4g
ICAgYSB2YWx1ZSBmcm9tIDAgdG8gNywgc28gdGhlIFstNCwgM10gcmFuZ2UgZGVzY3JpYmVkIGZv
ciB0aGlzIHdvdWxkIG1hcAo+ICAgIHRvIFswMDAsIDExMV06IC00IC0+IDAwMCwgLTMgLT4gMDAx
LCAtMiAtPiAwMTAsIC4uLiAzIC0+IDExMS4KPiAKPiAgICBUaGVuLCB0aGUgZHJpdmVyIHBhcnNl
cyB0aGUgcGFyYW1ldGVyICh1bnNpZ25lZCkgYW5kIGNhc3RzIGl0IHRvIGEKPiAgICBzaWduZWQg
aW50ZWdlciB0byBnZXQgYSBudW1iZXIgaW4gdGhlIFstNCwgM10gcmFuZ2UuCgpJbnRlcmVzdGlu
Z2x5IHRoZSBjdXJyZW50IGV4YW1wbGUgaGFzIHRpLGRlc2tldyA9IDw0Pi4uLgoKPiAgICBBIHZl
bmRvci1zcGVjaWZpYyBwcm9wZXJ0eSBtdXN0IGhhdmUgYSB0eXBlIGRlZmluaXRpb24gaW4ganNv
bi1zY2hlbWEsCj4gICAgc28gaWYgSSB0cmFuc2xhdGUgdGhlIG9yaWdpbmFsIGJpbmRpbmdzIHNl
bWFudGljcyBkaXJlY3RseSwgSSBzaG91bGQKPiAgICBkZWZpbmUgdGksZGVza2V3IGFzIGFuIGlu
dDMyLCBidXQgdGhpcyBtYWtlcyBkdF9iaW5kaW5nX2NoZWNrIGZhaWwgaWYKPiAgICB0aGUgcHJv
cGVydHkgaGFzIGEgbmVnYXRpdmUgdmFsdWUgaW4gdGhlIGV4YW1wbGUgYmVjYXVzZSBvZiB0aGUK
PiAgICBpbnRlcm5hbCByZXByZXNlbnRhdGlvbiBvZiBjZWxscyBhcyB1bnNpZ25lZCBpbnRlZ2Vy
czoKPiAKPiAgICAgICB0aSxkZXNrZXc6MDowOiA0Mjk0OTY3MjkzIGlzIGdyZWF0ZXIgdGhhbiB0
aGUgbWF4aW11bSBvZiAyMTQ3NDgzNjQ3CgpJIGRvbid0IHF1aXRlIHVuZGVyc3RhbmQgdGhpcy4g
V2UgY2Fubm90IGhhdmUgbmVnYXRpdmUgbnVtYmVycyBpbiBkdHMgZmlsZXM/IE9yIHdlIGNhbiwg
YnV0IApkdF9iaW5kaW5nX2NoZWNrIGRvZXNuJ3QgaGFuZGxlIHRoZW0gY29ycmVjdGx5PyBPciB0
aGF0IGludDMyIGlzIG5vdCBzdXBwb3J0ZWQgaW4geWFtbCBiaW5kaW5ncz8KCj4gICAgU28gSSBj
YW4gdGhpbmsgb2YgdHdvIHNvbHV0aW9ucyB0byB0aGlzOgo+IAo+ICAgIGEpIEtlZXAgdGhlIHRp
LGRlc2tldyBwcm9wZXJ0eSBhcyBhbiB1aW50MzIgYW5kIGRvY3VtZW50IHRoZSB2YWxpZAo+ICAg
IHJhbmdlIChbLTQsIDNdKSBpbiB0aGUgcHJvcGVydHkgZGVzY3JpcHRpb24gKHRoaXMgaXMgd2hh
dCB0aGlzIHBhdGNoCj4gICAgZG9lcyBjdXJyZW50bHkpLgo+IAo+ICAgIGIpIFJlZGVmaW5lIHRo
aXMgcHJvcGVydHkgdG8gYmUgY2xvc2VyIHRvIHRoZSBkYXRhc2hlZXQgZGVzY3JpcHRpb24KPiAg
ICAoaWUuIHVuc2lnbmVkIGludGVnZXJzIGZyb20gMCB0byA3KSBhbmQgYWRhcHQgdGhlIGRyaXZl
ciBhY2NvcmRpbmdseS4KPiAgICBUaGlzIHdvdWxkIGFsc28gbGV0IHVzIGRlZmluZSBpdHMgcmFu
Z2UgcHJvcGVybHkgdXNpbmcgbWluaW11bSBhbmQKPiAgICBtYXhpbXVtIHByb3BlcnRpZXMgZm9y
IGl0Lgo+IAo+ICAgIEkgdGhpbmsgKGIpIGlzIHRoZSByaWdodCB0aGluZyB0byBkbyBidXQgSSB3
YW50IHRvIGtub3cgeW91cgo+ICAgIG9waW5pb24uIEJlc2lkZXMsIEkgZG9uJ3QgaGF2ZSB0aGlz
IGhhcmR3YXJlIGF0IGhhbmQgYW5kIGlmIEkgdXBkYXRlZAo+ICAgIHRoZSBkcml2ZXIgSSB3b3Vs
ZG4ndCBiZSBhYmxlIHRvIHRlc3QgaXQuCgpJIGRvbid0IHRoaW5rIGFueW9uZSBoYXMgdXNlZCBk
ZXNrZXcgcHJvcGVydHksIHNvIEkgZ3Vlc3MgY2hhbmdpbmcgaXQgaXMgbm90IG91dCBvZiB0aGUg
cXVlc3Rpb24uCgpMYXVyZW50LCBkaWQgeW91IGhhdmUgYSBib2FyZCB0aGF0IG5lZWRzIGRlc2tl
dyB3aGVuIHlvdSBhZGRlZCBpdCB0byB0ZnA0MTA/CgogIFRvbWkKCi0tIApUZXhhcyBJbnN0cnVt
ZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxzaW5raS4KWS10dW5u
dXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4gS290aXBhaWtrYS9Eb21pY2lsZTogSGVsc2lua2kK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
