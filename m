Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A70212EE2
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 15:17:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3878889FA6;
	Fri,  3 May 2019 13:17:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFBA189FA6
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 13:17:48 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x43DHjEu105981;
 Fri, 3 May 2019 08:17:45 -0500
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x43DHjmF046701
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 3 May 2019 08:17:45 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 3 May
 2019 08:17:44 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 3 May 2019 08:17:44 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x43DHf1m006159;
 Fri, 3 May 2019 08:17:42 -0500
Subject: Re: [PATCHv2 03/22] drm/bridge: tc358767: fix ansi 8b10b use
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20190326103146.24795-1-tomi.valkeinen@ti.com>
 <20190326103146.24795-4-tomi.valkeinen@ti.com>
 <20190420211353.GF4964@pendragon.ideasonboard.com>
 <CAFmnZc3hHt62TPa5_Fq7rbuynFAEhy3QcFHzqxzP_ac9eatygg@mail.gmail.com>
 <20190423145632.GC16111@pendragon.ideasonboard.com>
 <85c349f3-c96d-7db3-5446-5c0d9539580e@ti.com>
 <20190503124825.GF4912@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <c9de8795-fce6-bf0b-08c6-120537272573@ti.com>
Date: Fri, 3 May 2019 16:17:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190503124825.GF4912@pendragon.ideasonboard.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1556889465;
 bh=u1G8D/bdtcyTF1U4HR81Y3Er5sHO/Gzt6GorziJk6SM=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=VupBT+Ghvk9Uupk6UcQHN6Ra5QD7Yw63umZoepFSxvoXFX6cCyHFakBx/iFG5LW2U
 uSGaednDSoUoz8F6VTIPhJUOa+nuF0eVxNN5tpe3Gfo+OeqwNuwgi/GPfwhGIeT1I6
 ngZ9Rh3E8nkL4tAC3m0Dx9rYL7JUmxaOwmLwP764=
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 dri-devel@lists.freedesktop.org, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Jyri Sarha <jsarha@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDMvMDUvMjAxOSAxNTo0OCwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToKPiBIaSBUb21pLAo+
IAo+IE9uIEZyaSwgTWF5IDAzLCAyMDE5IGF0IDAyOjQzOjUxUE0gKzAzMDAsIFRvbWkgVmFsa2Vp
bmVuIHdyb3RlOgo+PiBPbiAyMy8wNC8yMDE5IDE3OjU2LCBMYXVyZW50IFBpbmNoYXJ0IHdyb3Rl
Ogo+Pgo+Pj4+IER1cmluZyBpbml0aWFsIGRyaXZlciBkZXZlbG9wbWVudCBJIGhhZCBvbmUgZURQ
IGRpc3BsYXkgdGhhdCByZXBvcnRzIDAgaW4gQml0IDAKPj4+PiAoQU5TSSA4Qi8xMEIpIG9mIERQ
Q0QgcmVnIDB4MDAwNiAoTUFJTl9MSU5LX0NIQU5ORUxfQ09ESU5HKS4KPj4+PiBBbHNvIGl0IGRv
ZXMgbm90IHJlYWN0IG9uIHNldHRpbmcgQml0IDAgKFNFVF9BTlNJIDhCMTBCKSBpbiAweDAxMDgK
Pj4+PiAoTUFJTl9MSU5LX0NIQU5ORUxfQ09ESU5HX1NFVCkgLSBhZnRlciByZWFkaW5nIGJhY2sg
aXQgd2FzIDAgYWdhaW4uCj4+Pj4gU28gSSBoYWQgdG8gZGlzYWJsZSA4QjEwIGVuY29kaW5nIG9u
IHRjMzU4NzY3IHNpZGUgdG8gbWFrZSB0aGlzIGRpc3BsYXkKPj4+PiB3b3JrLgo+Pj4KPj4+IE91
dCBvZiBjdXJpb3NpdHksIGhvdyBkb2VzIHRoZSBlRFAgZGlzcGxheSByZWNvdmVyIHRoZSBjbG9j
ayB3aXRob3V0Cj4+PiA4Qi8xMEIgZW5jb2RpbmcgPwo+Pj4KPj4+PiBPbiBvdGhlciBoYW5kIGlm
IHRoZXJlIGFyZSBkaXNwbGF5cyB0aGF0IHJlcG9ydCB6ZXJvIGJpdCAwIGluCj4+Pj4gTUFJTl9M
SU5LX0NIQU5ORUxfQ09ESU5HIHdoaWxlIG5lZWRpbmcgOGIxMGIgdGhlbiB0aGlzIHBhdGNoIGxv
b2tzCj4+Pj4gcmVhc29uYWJsZS4KPj4+Pgo+Pj4+IE1heSBiZSBkcml2ZXIgc2hvdWxkIHJlYWQg
YmFjayBNQUlOX0xJTktfQ0hBTk5FTF9DT0RJTkdfU0VUCj4+Pj4gcmVnaXN0ZXIgYWZ0ZXIgc2V0
dGluZyBpdCBhbmQgY2hlY2sgaWYgOGIxMGIgYWN0dWFsbHkgZW5hYmxlZD8KPj4+Cj4+PiBUaGlz
IHNvdW5kcyBsaWtlIGEgcmVhc29uYWJsZSB0aGluZyB0byB0cnkuIFRvbWksIGRvIHlvdSBzdGls
bCBoYXZlCj4+PiBhY2Nlc3NzIHRvIHRob3NlIGZhdWx0eSBtb25pdG9ycyA/Cj4+Cj4+IE9uIG15
IG1vbml0b3IgaXQgZG9lcyBub3Qgc2VlbSB0byBtYXR0ZXIgd2hldGhlciBJIHdyaXRlIDAgb3Ig
MSB0bwo+PiBNQUlOX0xJTktfQ0hBTk5FTF9DT0RJTkdfU0VULCBhcyBsb25nIGFzIEkgaGF2ZSA4
YjEwYiBlbmFibGVkIG9uCj4+IFRDMzU4NzY3IHNpZGUuIFRoZSB3cml0ZXMgZG8gZ28gdGhyb3Vn
aCwgYW5kIEkgY2FuIHJlYWQgdGhlIHdyaXR0ZW4gYml0Cj4+IGJhY2suCj4+Cj4+IFNvLi4uIEkg
Z3Vlc3Mgd2hlbiB3ZSB0YWxrIGFib3V0IGVEUCBwYW5lbHMsIHRoZXJlIG1heSBiZSBhbGwga2lu
ZHMgb2YKPj4gb2RkaXRpZXMsIGFzIHRoZXkncmUgdXN1YWxseSBtZWFudCB0byBiZSB1c2VkIHdp
dGggYSBjZXJ0YWluIGNvbmZpZ3VyYXRpb24uCj4+Cj4+IEJ1dCBpZiBldmVyeW9uZSBhZ3JlZXMg
dGhhdCA4QjEwQiBpcyBhIG5vcm1hbCwgcmVxdWlyZWQgZmVhdHVyZSBvZiBEUCwKPj4gYW5kIHRo
ZXJlIGlzIGFuIGVEUCBwYW5lbCB0aGF0IG5lZWRzIDhCMTBCIGRpc2FibGVkLCBtYXliZSB0aGF0
IHBhbmVsCj4+IGhhcyB0byBiZSBoYW5kbGVkIHNlcGFyYXRlbHkgYXMgYSBzcGVjaWFsIGNhc2U/
IEEgZHRzIGVudHJ5IHRvIGRpc2FibGUKPj4gOEIxMEI/IE9yIHNvbWV0aGluZy4gQnV0IGl0IGRv
ZXMgbm90IHNvdW5kIGxpa2UgYSBnb29kIGlkZWEgZm9yIHRoZQo+PiBkcml2ZXIgdG8gdHJ5IHRv
IGd1ZXNzIHRoaXMuCj4gCj4gQXMgcmVwb3J0ZWQgYnkgQW5kcmV5LCB0aGVyZSBpcyBhdCBsZWFz
dCBvbmUgcGFuZWwgdGhhdCB3b3VsZCBicmVhayB3aXRoCj4gdGhpcyBwYXRjaC4gSSBhZ3JlZSA4
YjEwYiBzaG91bGQgYmUgdGhlIGRlZmF1bHQsIGJ1dCBpZiB0aGUgYWJvdmUKPiBwcm9jZWR1cmUg
d29ya3MgZm9yIGFsbCB0aGUgcGFuZWxzIHdlIGtub3cgYWJvdXQsIGlzIHRoZXJlIGFuIGlzc3Vl
Cj4gaW1wbGVtZW50aW5nIGl0ID8KCldlbGwsIHdlIGRvbid0IGhhdmUgZGF0YSBmb3IgYSBiaWcg
c2V0IG9mIHBhbmVscy4gSSdtIHdvcnJpZWQgdGhhdCBzdWNoCmEgY2hhbmdlLCB3aGljaCwgaW4g
bXkgb3BpbmlvbiwgbWFrZXMgdGhlIGRyaXZlciBndWVzcyB3aGV0aGVyIHRvIGVuYWJsZQpvciBk
aXNhYmxlIDhiMTBiLCBjYW4gYnJlYWsgb3RoZXIgcGFuZWxzIG9yIG1vbml0b3JzIGlmIHRoZSBn
dWVzcwpkb2Vzbid0IGdvIHJpZ2h0LiBFc3BlY2lhbGx5IGFzIGRpc2FibGluZyA4YjEwYiBkb2Vz
IG5vdCBzb3VuZCBsaWtlIGEKdmFsaWQgc2V0dXAgIm9mZmljaWFsbHkiLgoKSSBhZ3JlZSB0aGF0
IGlmIHRoZSBwYW5lbCBBbmRyZXkgbWVudGlvbmVkIGlzIHN0aWxsIHVzZWQsIHdlIG5lZWQgdG8K
aGFuZGxlIGl0IHNvbWVob3cuIEJ1dCBJIHRoaW5rIGV4cGxpY2l0bHkgaGFuZGxpbmcgc3VjaCBh
IGNhc2UgaXMgYmV0dGVyCnRoYW4gZ3Vlc3NpbmcuCgpBbmQgaXNuJ3QgdGhpcyBzb21ldGhpbmcg
dGhhdCdzIG5vdCByZWFsbHkgVEMzNTg3Njcgc3BlY2lmaWM/IElmIHRoYXQKcGFuZWwgaXMgdXNl
ZCB3aXRoIG90aGVyIGJyaWRnZXMsIHdlIG5lZWQgdG8gZGVhbCB3aXRoIHRoaXMgY2FzZSB3aXRo
CnRob3NlIGJyaWRnZXMgdG9vPyBPciBpcyBUQzM1ODc2NyB0aGUgb25seSBicmlkZ2UgdGhhdCBh
bGxvd3MgZGlzYWJsaW5nCjhiMTBiPwoKIFRvbWkKCi0tIApUZXhhcyBJbnN0cnVtZW50cyBGaW5s
YW5kIE95LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxzaW5raS4KWS10dW5udXMvQnVzaW5l
c3MgSUQ6IDA2MTU1MjEtNC4gS290aXBhaWtrYS9Eb21pY2lsZTogSGVsc2lua2kKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
