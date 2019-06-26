Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98AEA57CD6
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 09:12:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BD606E7E5;
	Thu, 27 Jun 2019 07:11:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79A8C6E394
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 11:44:31 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5QBiSZ6051879;
 Wed, 26 Jun 2019 06:44:28 -0500
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5QBiSMm023834
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 26 Jun 2019 06:44:28 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 26
 Jun 2019 06:44:28 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 26 Jun 2019 06:44:28 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5QBiRIs042717;
 Wed, 26 Jun 2019 06:44:28 -0500
Subject: Re: [PATCH 1/2] dt-bindings: backlight: fix vendor prefix for
 ArcticSand arcxcnn driver bindings
To: Daniel Thompson <daniel.thompson@linaro.org>, Brian Dodge
 <bdodge09@gmail.com>
References: <1561435529-7835-1-git-send-email-bdodge09@gmail.com>
 <1561435529-7835-2-git-send-email-bdodge09@gmail.com>
 <20190625085534.xf2ullyju3ewbgik@holly.lan>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <905cf517-0fae-cc52-d0ef-5b1dbe1c5864@ti.com>
Date: Wed, 26 Jun 2019 06:44:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190625085534.xf2ullyju3ewbgik@holly.lan>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Thu, 27 Jun 2019 07:11:26 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1561549469;
 bh=mKtXv03ZcxrF8K2N0kwvFVNwU8jLpeFN2jb6+ZaJNTQ=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=yaH2jeymL9cb8gnfj+a3JYqPlL2Xsx3ExKigv3J4BYGEQvtFxycDlgBQub+25SD97
 l9BoznDqDM3l+Z13q71VQM3dgOJwsDx+IVP56G3fQlYOygUUieFEhvyeW57ksbcf5D
 E4DDsX7Y5XnxoGE0n31XXe3zfTXGP60CLJV9OneY=
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
Cc: devicetree@vger.kernel.org, jingoohan1@gmail.com,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 jacek.anaszewski@gmail.com, pavel@ucw.cz, pbacon@psemi.com,
 lee.jones@linaro.org, linux-leds@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8KCk9uIDYvMjUvMTkgMzo1NSBBTSwgRGFuaWVsIFRob21wc29uIHdyb3RlOgo+IE9uIFR1
ZSwgSnVuIDI1LCAyMDE5IGF0IDEyOjA1OjI4QU0gLTA0MDAsIEJyaWFuIERvZGdlIHdyb3RlOgo+
PiAgICAgIFRoZSB2ZW5kb3ItcHJlZml4ZXMudHh0IGZpbGUgcHJvcGVybHkgcmVmZXJzIHRvIEFy
Y3RpY1NhbmQKPj4gICAgICBhcyBhcmN0aWMgYnV0IHRoZSBkcml2ZXIgYmluZGluZ3MgaW1wcm9w
ZXJseSBhYmJyZXZpYXRlZCB0aGUKPj4gICAgICBwcmVmaXggdG8gYXJjLiBUaGlzIHdhcyBhIG1p
c3Rha2UgaW4gdGhlIG9yaWdpbmFsIHBhdGNoCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEJyaWFuIERv
ZGdlIDxiZG9kZ2UwOUBnbWFpbC5jb20+Cj4+IC0tLQo+PiAgIC4uLi9iaW5kaW5ncy9sZWRzL2Jh
Y2tsaWdodC9hcmN4Y25uX2JsLnR4dCAgICAgICAgIHwgMjQgKysrKysrKysrKysrKy0tLS0tLS0t
LQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkK
Pj4KPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRz
L2JhY2tsaWdodC9hcmN4Y25uX2JsLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9sZWRzL2JhY2tsaWdodC9hcmN4Y25uX2JsLnR4dAo+PiBpbmRleCAyMzBhYmRlLi45Y2Y0
YzQ0IDEwMDY0NAo+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbGVk
cy9iYWNrbGlnaHQvYXJjeGNubl9ibC50eHQKPj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2xlZHMvYmFja2xpZ2h0L2FyY3hjbm5fYmwudHh0Cj4+IEBAIC0xLDggKzEs
MTIgQEAKPj4gLUJpbmRpbmcgZm9yIEFyY3RpY1NhbmQgYXJjMmMwNjA4IExFRCBkcml2ZXIKPj4g
K0JpbmRpbmcgZm9yIEFyY3RpY1NhbmQgYXJjIGZhbWlseSBMRUQgZHJpdmVycwo+PiAgIAo+PiAg
IFJlcXVpcmVkIHByb3BlcnRpZXM6Cj4+IC0tIGNvbXBhdGlibGU6CQlzaG91bGQgYmUgImFyYyxh
cmMyYzA2MDgiCj4+IC0tIHJlZzoJCQlzbGF2ZSBhZGRyZXNzCj4+ICstIGNvbXBhdGlibGU6IG9u
ZSBvZgo+PiArCSJhcmN0aWMsYXJjMWMwNjA4Igo+PiArCSJhcmN0aWMsYXJjMmMwNjA4Igo+PiAr
CSJhcmN0aWMsYXJjM2MwODQ1Igo+IFRoaXMgaXMgbW9yZSBhIHF1ZXN0aW9uIGZvciB0aGUgRFQg
Zm9sa3MgdGhhbiBmb3IgQnJpYW4gYnV0Li4uCj4KPiBBRkFJQ1QgdGhpcyBwYXRjaCBpcyBmaXhp
bmcgdGhlIGJpbmRpbmcgZm9yIHRoZSBBcmN0aWNTYW5kIGRldmljZXMgdG8KPiB1c2UgdGhlIGNv
cnJlY3QgdmFsdWUgZnJvbSB2ZW5kb3ItcHJlZml4ZXMueWFtbCBhbmQgaGFzIGJlZW4gcHJldmlv
dXNseQo+IGRpc2N1c3NlZCBoZXJlOgo+IGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDE4LzkvMjUv
NzI2Cj4KPiBDdXJyZW50bHkgdGhpcyBwYXRjaCBzZXJpZXMganVzdCB1cGRhdGVzIHRoZSBEVCBi
aW5kaW5ncyBidXQgdGhlCj4gaW1wbGVtZW50YXRpb24gYWxzbyBob25vdXJzIHRoZSBvbGQgdmFs
dWVzIChzaW5jZSB0aGVyZSBpcyBhIENocm9tZWJvb2sKPiBpbiB0aGUgd2lsZCB0aGF0IHVzZXMg
dGhlIGN1cnJlbnQgYmluZGluZ3MpLgo+Cj4gSGVuY2UgSSdtIG5vdCBjbGVhciB3aGV0aGVyIHRo
ZSBiaW5kaW5ncyBzaG91bGQgZG9jdW1lbnQgdGhlIGRlcHJlY2F0ZWQKPiBvcHRpb25zIHRvbyAo
ZS5nLiBtYWtlIGl0IGVhc2llciB0byBmaW5kIHRoZSBiaW5kaW5ncyBkb2Mgd2l0aCBnaXQgZ3Jl
cAo+IGFuZCBmcmllbmRzKS4KPgo+Cj4gRGFuaWVsLgo+Cj4KPj4gKwo+PiArLSByZWc6CQlzbGF2
ZSBhZGRyZXNzCj4+ICAgCj4+ICAgT3B0aW9uYWwgcHJvcGVydGllczoKPj4gICAtIGRlZmF1bHQt
YnJpZ2h0bmVzczoJYnJpZ2h0bmVzcyB2YWx1ZSBvbiBib290LCB2YWx1ZSBmcm9tOiAwLTQwOTUK
Pj4gQEAgLTExLDE5ICsxNSwxOSBAQCBPcHRpb25hbCBwcm9wZXJ0aWVzOgo+PiAgIC0gbGVkLXNv
dXJjZXM6CQlMaXN0IG9mIGVuYWJsZWQgY2hhbm5lbHMgZnJvbSAwIHRvIDUuCj4+ICAgCQkJU2Vl
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzL2NvbW1vbi50eHQKPj4gICAK
Pj4gLS0gYXJjLGxlZC1jb25maWctMDoJc2V0dGluZyBmb3IgcmVnaXN0ZXIgSUxFRF9DT05GSUdf
MAo+PiAtLSBhcmMsbGVkLWNvbmZpZy0xOglzZXR0aW5nIGZvciByZWdpc3RlciBJTEVEX0NPTkZJ
R18xCj4+IC0tIGFyYyxkaW0tZnJlcToJCVBXTSBtb2RlIGZyZXF1ZW5jZSBzZXR0aW5nIChiaXRz
IFszOjBdIHVzZWQpCj4+IC0tIGFyYyxjb21wLWNvbmZpZzoJc2V0dGluZyBmb3IgcmVnaXN0ZXIg
Q09ORklHX0NPTVAKPj4gLS0gYXJjLGZpbHRlci1jb25maWc6CXNldHRpbmcgZm9yIHJlZ2lzdGVy
IEZJTFRFUl9DT05GSUcKPj4gLS0gYXJjLHRyaW0tY29uZmlnOglzZXR0aW5nIGZvciByZWdpc3Rl
ciBJTUFYVFVORQoKSU1PIEkgd291bGQgcHJlZmVyIHRvIGtlZXAgdGhlc2UgYW5kIG1hcmsgdGhl
bSBhcyBkZXByZWNhdGVkIHNpbmNlIHRoZSAKZHJpdmVyIHdpbGwgc3RpbGwKCmhvbm9yIHRoZXNl
IHByb3BlcnRpZXMuCgpNYXliZSBpbiBhIE9wdGlvbmFsIERlcHJlY2F0ZWQgUHJvcGVydGllcyBz
ZWN0aW9uIGluIHRoZSBEVCBiaW5kaW5nLgoKRGFuCgoKPj4gKy0gYXJjdGljLGxlZC1jb25maWct
MDoJc2V0dGluZyBmb3IgcmVnaXN0ZXIgSUxFRF9DT05GSUdfMAo+PiArLSBhcmN0aWMsbGVkLWNv
bmZpZy0xOglzZXR0aW5nIGZvciByZWdpc3RlciBJTEVEX0NPTkZJR18xCj4+ICstIGFyY3RpYyxk
aW0tZnJlcToJCVBXTSBtb2RlIGZyZXF1ZW5jZSBzZXR0aW5nIChiaXRzIFszOjBdIHVzZWQpCj4+
ICstIGFyY3RpYyxjb21wLWNvbmZpZzoJc2V0dGluZyBmb3IgcmVnaXN0ZXIgQ09ORklHX0NPTVAK
Pj4gKy0gYXJjdGljLGZpbHRlci1jb25maWc6CXNldHRpbmcgZm9yIHJlZ2lzdGVyIEZJTFRFUl9D
T05GSUcKPj4gKy0gYXJjdGljLHRyaW0tY29uZmlnOglzZXR0aW5nIGZvciByZWdpc3RlciBJTUFY
VFVORQo+PiAgIAo+PiAgIE5vdGU6IE9wdGlvbmFsIHByb3BlcnRpZXMgbm90IHNwZWNpZmllZCB3
aWxsIGRlZmF1bHQgdG8gdmFsdWVzIGluIElDIEVQUk9NCj4+ICAgCj4+ICAgRXhhbXBsZToKPj4g
ICAKPj4gICBhcmMyYzA2MDhAMzAgewo+PiAtCWNvbXBhdGlibGUgPSAiYXJjLGFyYzJjMDYwOCI7
Cj4+ICsJY29tcGF0aWJsZSA9ICJhcmN0aWMsYXJjMmMwNjA4IjsKPj4gICAJcmVnID0gPDB4MzA+
Owo+PiAgIAlkZWZhdWx0LWJyaWdodG5lc3MgPSA8NTAwPjsKPj4gICAJbGFiZWwgPSAibGNkLWJh
Y2tsaWdodCI7Cj4+IC0tIAo+PiAyLjcuNAo+PgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
