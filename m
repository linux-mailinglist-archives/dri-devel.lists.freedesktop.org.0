Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D8ACFA68
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 14:52:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F25D26E7AC;
	Tue,  8 Oct 2019 12:52:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F5636E7A0
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 12:51:59 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x98CpsTx127468;
 Tue, 8 Oct 2019 07:51:54 -0500
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x98Cps5I098014;
 Tue, 8 Oct 2019 07:51:54 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 8 Oct
 2019 07:51:51 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 8 Oct 2019 07:51:54 -0500
Received: from [10.250.99.146] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x98CppEv035995;
 Tue, 8 Oct 2019 07:51:52 -0500
Subject: Re: [PATCH v9 4/5] dt-bindings: backlight: Add led-backlight binding
To: Rob Herring <robh+dt@kernel.org>
References: <20191007124437.20367-1-jjhiblot@ti.com>
 <20191007124437.20367-5-jjhiblot@ti.com>
 <CAL_JsqLTqnKpU4PB8Zt9SSPSia5mkFcUgoA8ZyX_1E_HfdFyxg@mail.gmail.com>
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
Message-ID: <30fcd898-aa50-bac2-b316-0d9bf2429369@ti.com>
Date: Tue, 8 Oct 2019 14:51:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqLTqnKpU4PB8Zt9SSPSia5mkFcUgoA8ZyX_1E_HfdFyxg@mail.gmail.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1570539114;
 bh=Dokst5718CmAxTwYuW21IP+idbHKHbrxtnp594hXaJM=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=C3xkjpdKNFvvVV5BeRFI8KcgEAItARKGaiuyV4mEnboJjXpRgN69MGEXr6CgzjrXC
 JYKg5yB8mooAGhQKTnUhJtAx3YVXflHlPeweDoOVAW3BiNe2bst+tquOegdWIyiPnt
 9oBIqblHQLu0wS2LUufgyFsR1TGGWEPxLrGFitZ0=
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Sebastian Reichel <sre@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee.jones@linaro.org>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>, Dan Murphy <dmurphy@ti.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iLAoKT24gMDcvMTAvMjAxOSAxODoxNSwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gUGxlYXNl
IHNlbmQgRFQgYmluZGluZ3MgdG8gRFQgbGlzdCBvciBpdCdzIG5ldmVyIGluIG15IHF1ZXVlLiBJ
T1csCj4gc2VuZCBwYXRjaGVzIHRvIHRoZSBsaXN0cyB0aGF0IGdldF9tYWludGFpbmVycy5wbCB0
ZWxscyB5b3UgdG8uCj4KPiBPbiBNb24sIE9jdCA3LCAyMDE5IGF0IDc6NDUgQU0gSmVhbi1KYWNx
dWVzIEhpYmxvdCA8ampoaWJsb3RAdGkuY29tPiB3cm90ZToKPj4gQWRkIERUIGJpbmRpbmcgZm9y
IGxlZC1iYWNrbGlnaHQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEplYW4tSmFjcXVlcyBIaWJsb3Qg
PGpqaGlibG90QHRpLmNvbT4KPj4gUmV2aWV3ZWQtYnk6IERhbmllbCBUaG9tcHNvbiA8ZGFuaWVs
LnRob21wc29uQGxpbmFyby5vcmc+Cj4+IFJldmlld2VkLWJ5OiBTZWJhc3RpYW4gUmVpY2hlbCA8
c2ViYXN0aWFuLnJlaWNoZWxAY29sbGFib3JhLmNvbT4KPj4gLS0tCj4+ICAgLi4uL2JpbmRpbmdz
L2xlZHMvYmFja2xpZ2h0L2xlZC1iYWNrbGlnaHQudHh0IHwgMjggKysrKysrKysrKysrKysrKysr
Kwo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspCj4+ICAgY3JlYXRlIG1vZGUg
MTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzL2JhY2tsaWdodC9s
ZWQtYmFja2xpZ2h0LnR4dAo+IFBsZWFzZSBtYWtlIHRoaXMgYSBEVCBzY2hlbWEuCgpPSy4KCkJU
VyBJIHVzZWQgIm1ha2UgZHRfYmluZGluZ19jaGVjayIgYnV0IGhhZCB0byBmaXggYSBjb3VwbGUg
b2YgWUFNTHMgZmlsZSAKdG8gZ2V0IGl0IHRvIHdvcmsuIERvIHlvdSBoYXZlIGEga2VybmVsIHRy
ZWUgd2l0aCBhbHJlYWR5IGFsbCB0aGUgWUFNTCAKZmlsZXMgaW4gZ29vZCBzaGFwZSA/IE9yIGRv
IHlvdSB3YW50IG1lIHRvIHBvc3QgdGhlIGNoYW5nZXMgdG8gCmRldmljZXRyZWVAdmdlci5rZXJu
ZWwub3JnID8KCgo+Cj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbGVkcy9iYWNrbGlnaHQvbGVkLWJhY2tsaWdodC50eHQgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbGVkcy9iYWNrbGlnaHQvbGVkLWJhY2tsaWdodC50eHQKPj4gbmV3
IGZpbGUgbW9kZSAxMDA2NDQKPj4gaW5kZXggMDAwMDAwMDAwMDAwLi40YzdkZmJlN2Y2N2EKPj4g
LS0tIC9kZXYvbnVsbAo+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bGVkcy9iYWNrbGlnaHQvbGVkLWJhY2tsaWdodC50eHQKPj4gQEAgLTAsMCArMSwyOCBAQAo+PiAr
bGVkLWJhY2tsaWdodCBiaW5kaW5ncwo+PiArCj4+ICtUaGlzIGJpbmRpbmcgaXMgdXNlZCB0byBk
ZXNjcmliZSBhIGJhc2ljIGJhY2tsaWdodCBkZXZpY2UgbWFkZSBvZiBMRURzLgo+PiArSXQgY2Fu
IGFsc28gYmUgdXNlZCB0byBkZXNjcmliZSBhIGJhY2tsaWdodCBkZXZpY2UgY29udHJvbGxlZCBi
eSB0aGUgb3V0cHV0IG9mCj4+ICthIExFRCBkcml2ZXIuCj4+ICsKPj4gK1JlcXVpcmVkIHByb3Bl
cnRpZXM6Cj4+ICsgIC0gY29tcGF0aWJsZTogImxlZC1iYWNrbGlnaHQiCj4+ICsgIC0gbGVkczog
YSBsaXN0IG9mIExFRHMKPiAnbGVkcycgaXMgYWxyZWFkeSB1c2VkIGFzIGEgbm9kZSBuYW1lIGFu
ZCBtaXhpbmcgaXMgbm90IGlkZWFsLgo+Cj4gV2UgYWxyZWFkeSBoYXZlICdmbGFzaC1sZWRzJyBp
biB1c2UgYW5kIHdpdGggdGhlIHNhbWUgZGVmaW5pdGlvbiwgc28KPiBsZXRzIGNvbnRpbnVlIHRo
YXQgYW5kIHVzZSAnYmFja2xpZ2h0LWxlZHMnLgpPSwo+Cj4+ICsKPj4gK09wdGlvbmFsIHByb3Bl
cnRpZXM6Cj4+ICsgIC0gYnJpZ2h0bmVzcy1sZXZlbHM6IEFycmF5IG9mIGRpc3RpbmN0IGJyaWdo
dG5lc3MgbGV2ZWxzLiBUaGUgbGV2ZWxzIG11c3QgYmUKPj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgaW4gdGhlIHJhbmdlIGFjY2VwdGVkIGJ5IHRoZSB1bmRlcmx5aW5nIExFRCBkZXZpY2VzLgo+
PiArICAgICAgICAgICAgICAgICAgICAgICBUaGlzIGlzIHVzZWQgdG8gdHJhbnNsYXRlIGEgYmFj
a2xpZ2h0IGJyaWdodG5lc3MgbGV2ZWwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgaW50byBh
IExFRCBicmlnaHRuZXNzIGxldmVsLiBJZiBpdCBpcyBub3QgcHJvdmlkZWQsIHRoZQo+PiArICAg
ICAgICAgICAgICAgICAgICAgICBpZGVudGl0eSBtYXBwaW5nIGlzIHVzZWQuCj4+ICsKPj4gKyAg
LSBkZWZhdWx0LWJyaWdodG5lc3MtbGV2ZWw6IFRoZSBkZWZhdWx0IGJyaWdodG5lc3MgbGV2ZWwu
Cj4gWW91IGNhbiBqdXN0IGFzc3VtZSB0aGVzZSAyIGdldCBhIGNvbW1vbiBzY2hlbWEgYXQgc29t
ZSBwb2ludC4gU28ganVzdAo+IG5lZWQgdG8gZGVmaW5lIGFueSBhZGRpdGlvbmFsIGNvbnN0cmFp
bnRzIGlmIHBvc3NpYmxlLgoKTWF5YmUgd2Ugc2hvdWxkIGtlZXAgdGhlbSB1bnRpbCBzdWNoIGEg
Y29tbW9uIHNjaGVtYSBpcyB3cml0dGVuID8KCkpKCgo+Cj4gUm9iCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
