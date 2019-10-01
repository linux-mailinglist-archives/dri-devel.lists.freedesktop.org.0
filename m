Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC3EC4846
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 09:19:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52AA26E8D7;
	Wed,  2 Oct 2019 07:18:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A7DA6E829
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2019 15:04:26 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x91F4IEd018422;
 Tue, 1 Oct 2019 10:04:18 -0500
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x91F4IdV065095
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 1 Oct 2019 10:04:18 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 1 Oct
 2019 10:04:08 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 1 Oct 2019 10:04:07 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x91F4HJh112978;
 Tue, 1 Oct 2019 10:04:17 -0500
Subject: Re: [PATCH V6 2/8] backlight: qcom-wled: restructure the qcom-wled
 bindings
To: Kiran Gunda <kgunda@codeaurora.org>, <bjorn.andersson@linaro.org>,
 <jingoohan1@gmail.com>, <lee.jones@linaro.org>,
 <b.zolnierkie@samsung.com>, <dri-devel@lists.freedesktop.org>,
 <daniel.thompson@linaro.org>, <jacek.anaszewski@gmail.com>,
 <pavel@ucw.cz>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
 <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
References: <1569825553-26039-1-git-send-email-kgunda@codeaurora.org>
 <1569825553-26039-3-git-send-email-kgunda@codeaurora.org>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <19926a9f-d5d3-02e2-b7d1-ee7cd918f57d@ti.com>
Date: Tue, 1 Oct 2019 10:04:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1569825553-26039-3-git-send-email-kgunda@codeaurora.org>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Wed, 02 Oct 2019 07:18:31 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1569942258;
 bh=LXCupkasMNvhfCAMtaSmWJHpvLL+kS4ze7rHxPE7RWs=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=hVKLXwGqOEWC0Hj5v31jIjLnX7ONzTRcOEQMzqZvtwJoC4ucoHGns9lktQPlX7qrO
 ZhNMo5KBYpzW+Qe458j8s6jd7GpcofWWTVwTlYFhXKVcyD4o8C/oHaJ7KrBumccTkf
 YaY91aSooTZznLi+gD7qCR5gGivbvNXjr6IGIKH0=
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
Cc: linux-arm-msm@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

S2lyYW4KCk9uIDkvMzAvMTkgMTozOSBBTSwgS2lyYW4gR3VuZGEgd3JvdGU6Cj4gUmVzdHJ1Y3R1
cmUgdGhlIHFjb20td2xlZCBiaW5kaW5ncyBmb3IgdGhlIGJldHRlciByZWFkYWJpbGl0eS4KPgo+
IFNpZ25lZC1vZmYtYnk6IEtpcmFuIEd1bmRhIDxrZ3VuZGFAY29kZWF1cm9yYS5vcmc+Cj4gUmV2
aWV3ZWQtYnk6IEJqb3JuIEFuZGVyc3NvbiA8Ympvcm4uYW5kZXJzc29uQGxpbmFyby5vcmc+Cj4g
UmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4gQWNrZWQtYnk6IERh
bmllbCBUaG9tcHNvbiA8ZGFuaWVsLnRob21wc29uQGxpbmFyby5vcmc+Cj4gQWNrZWQtYnk6IFBh
dmVsIE1hY2hlayA8cGF2ZWxAdWN3LmN6Pgo+IC0tLQo+ICAgLi4uL2JpbmRpbmdzL2xlZHMvYmFj
a2xpZ2h0L3Fjb20td2xlZC50eHQgICAgICAgICAgfCAxMTAgKysrKysrKysrKysrKysrKy0tLS0t
CgpTaW5jZSB5b3UgYXJlIHJlc3RydWN0dXJpbmcgd291bGQgaXQgbm90IGJlIGJldHRlciB0byBj
b252ZXJ0IHRoaXMgdG8gCnRoZSB5YW1sIGZvcm1hdD8KCkl0IGxvb2tzIHlhbWxpc2ggc28gdGhl
IGZpbGUgZXh0ZW5zaW9uIHNob3VsZCBiZSAueWFtbC4KCkRhbgoKPiAgIDEgZmlsZSBjaGFuZ2Vk
LCA4NSBpbnNlcnRpb25zKCspLCAyNSBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbGVkcy9iYWNrbGlnaHQvcWNvbS13bGVkLnR4
dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzL2JhY2tsaWdodC9xY29t
LXdsZWQudHh0Cj4gaW5kZXggZmIzOWUzMi4uMTRmMjhmMiAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbGVkcy9iYWNrbGlnaHQvcWNvbS13bGVkLnR4dAo+
ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzL2JhY2tsaWdodC9x
Y29tLXdsZWQudHh0Cj4gQEAgLTEsMzAgKzEsOTAgQEAKPiAgIEJpbmRpbmcgZm9yIFF1YWxjb21t
IFRlY2hub2xvZ2llcywgSW5jLiBXTEVEIGRyaXZlcgo+ICAgCj4gLVJlcXVpcmVkIHByb3BlcnRp
ZXM6Cj4gLS0gY29tcGF0aWJsZTogc2hvdWxkIGJlICJxY29tLHBtODk0MS13bGVkIgo+IC0tIHJl
Zzogc2xhdmUgYWRkcmVzcwo+IC0KPiAtT3B0aW9uYWwgcHJvcGVydGllczoKPiAtLSBkZWZhdWx0
LWJyaWdodG5lc3M6IGJyaWdodG5lc3MgdmFsdWUgb24gYm9vdCwgdmFsdWUgZnJvbTogMC00MDk1
Cj4gLQlkZWZhdWx0OiAyMDQ4Cj4gLS0gbGFiZWw6IFRoZSBuYW1lIG9mIHRoZSBiYWNrbGlnaHQg
ZGV2aWNlCj4gLS0gcWNvbSxjcy1vdXQ6IGJvb2w7IGVuYWJsZSBjdXJyZW50IHNpbmsgb3V0cHV0
Cj4gLS0gcWNvbSxjYWJjOiBib29sOyBlbmFibGUgY29udGVudCBhZGFwdGl2ZSBiYWNrbGlnaHQg
Y29udHJvbAo+IC0tIHFjb20sZXh0LWdlbjogYm9vbDsgdXNlIGV4dGVybmFsbHkgZ2VuZXJhdGVk
IG1vZHVsYXRvciBzaWduYWwgdG8gZGltCj4gLS0gcWNvbSxjdXJyZW50LWxpbWl0OiBtQTsgcGVy
LXN0cmluZyBjdXJyZW50IGxpbWl0OyB2YWx1ZSBmcm9tIDAgdG8gMjUKPiAtCWRlZmF1bHQ6IDIw
bUEKPiAtLSBxY29tLGN1cnJlbnQtYm9vc3QtbGltaXQ6IG1BOyBib29zdCBjdXJyZW50IGxpbWl0
OyBvbmUgb2Y6Cj4gLQkxMDUsIDM4NSwgNTI1LCA4MDUsIDk4MCwgMTI2MCwgMTQwMCwgMTY4MAo+
IC0JZGVmYXVsdDogODA1bUEKPiAtLSBxY29tLHN3aXRjaGluZy1mcmVxOiBrSHo7IHN3aXRjaGlu
ZyBmcmVxdWVuY3k7IG9uZSBvZjoKPiAtCTYwMCwgNjQwLCA2ODUsIDczOCwgODAwLCA4NzIsIDk2
MCwgMTA2NiwgMTIwMCwgMTM3MSwKPiAtCTE2MDAsIDE5MjAsIDI0MDAsIDMyMDAsIDQ4MDAsIDk2
MDAsCj4gLQlkZWZhdWx0OiAxNjAwa0h6Cj4gLS0gcWNvbSxvdnA6IFY7IE92ZXItdm9sdGFnZSBw
cm90ZWN0aW9uIGxpbWl0OyBvbmUgb2Y6Cj4gLQkyNywgMjksIDMyLCAzNQo+IC0JZGVmYXVsdDog
MjlWCj4gLS0gcWNvbSxudW0tc3RyaW5nczogIzsgbnVtYmVyIG9mIGxlZCBzdHJpbmdzIGF0dGFj
aGVkOyB2YWx1ZSBmcm9tIDEgdG8gMwo+IC0JZGVmYXVsdDogMgo+ICtXTEVEIChXaGl0ZSBMaWdo
dCBFbWl0dGluZyBEaW9kZSkgZHJpdmVyIGlzIHVzZWQgZm9yIGNvbnRyb2xsaW5nIGRpc3BsYXkK
PiArYmFja2xpZ2h0IHRoYXQgaXMgcGFydCBvZiBQTUlDIG9uIFF1YWxjb21tIFRlY2hub2xvZ2ll
cywgSW5jLiByZWZlcmVuY2UKPiArcGxhdGZvcm1zLiBUaGUgUE1JQyBpcyBjb25uZWN0ZWQgdG8g
dGhlIGhvc3QgcHJvY2Vzc29yIHZpYSBTUE1JIGJ1cy4KPiArCj4gKy0gY29tcGF0aWJsZQo+ICsJ
VXNhZ2U6ICAgICAgICByZXF1aXJlZAo+ICsJVmFsdWUgdHlwZTogICA8c3RyaW5nPgo+ICsJRGVm
aW5pdGlvbjogICBzaG91bGQgYmUgb25lIG9mOgo+ICsJCQkicWNvbSxwbTg5NDEtd2xlZCIKPiAr
CQkJInFjb20scG1pODk5OC13bGVkIgo+ICsJCQkicWNvbSxwbTY2MGwtd2xlZCIKPiArCj4gKy0g
cmVnCj4gKwlVc2FnZTogICAgICAgIHJlcXVpcmVkCj4gKwlWYWx1ZSB0eXBlOiAgIDxwcm9wIGVu
Y29kZWQgYXJyYXk+Cj4gKwlEZWZpbml0aW9uOiAgIEJhc2UgYWRkcmVzcyBvZiB0aGUgV0xFRCBt
b2R1bGVzLgo+ICsKPiArLSBkZWZhdWx0LWJyaWdodG5lc3MKPiArCVVzYWdlOiAgICAgICAgb3B0
aW9uYWwKPiArCVZhbHVlIHR5cGU6ICAgPHUzMj4KPiArCURlZmluaXRpb246ICAgYnJpZ2h0bmVz
cyB2YWx1ZSBvbiBib290LCB2YWx1ZSBmcm9tOiAwLTQwOTUKPiArCQkgICAgICBEZWZhdWx0OiAy
MDQ4Cj4gKwo+ICstIGxhYmVsCj4gKwlVc2FnZTogICAgICAgIHJlcXVpcmVkCj4gKwlWYWx1ZSB0
eXBlOiAgIDxzdHJpbmc+Cj4gKwlEZWZpbml0aW9uOiAgIFRoZSBuYW1lIG9mIHRoZSBiYWNrbGln
aHQgZGV2aWNlCj4gKwo+ICstIHFjb20sY3Mtb3V0Cj4gKwlVc2FnZTogICAgICAgIG9wdGlvbmFs
Cj4gKwlWYWx1ZSB0eXBlOiAgIDxib29sPgo+ICsJRGVmaW5pdGlvbjogICBlbmFibGUgY3VycmVu
dCBzaW5rIG91dHB1dC4KPiArCQkgICAgICBUaGlzIHByb3BlcnR5IGlzIHN1cHBvcnRlZCBvbmx5
IGZvciBQTTg5NDEuCj4gKwo+ICstIHFjb20sY2FiYwo+ICsJVXNhZ2U6ICAgICAgICBvcHRpb25h
bAo+ICsJVmFsdWUgdHlwZTogICA8Ym9vbD4KPiArCURlZmluaXRpb246ICAgZW5hYmxlIGNvbnRl
bnQgYWRhcHRpdmUgYmFja2xpZ2h0IGNvbnRyb2wuCj4gKwo+ICstIHFjb20sZXh0LWdlbgo+ICsJ
VXNhZ2U6ICAgICAgICBvcHRpb25hbAo+ICsJVmFsdWUgdHlwZTogICA8Ym9vbD4KPiArCURlZmlu
aXRpb246ICAgdXNlIGV4dGVybmFsbHkgZ2VuZXJhdGVkIG1vZHVsYXRvciBzaWduYWwgdG8gZGlt
Lgo+ICsJCSAgICAgIFRoaXMgcHJvcGVydHkgaXMgc3VwcG9ydGVkIG9ubHkgZm9yIFBNODk0MS4K
PiArCj4gKy0gcWNvbSxjdXJyZW50LWxpbWl0Cj4gKwlVc2FnZTogICAgICAgIG9wdGlvbmFsCj4g
KwlWYWx1ZSB0eXBlOiAgIDx1MzI+Cj4gKwlEZWZpbml0aW9uOiAgIG1BOyBwZXItc3RyaW5nIGN1
cnJlbnQgbGltaXQKPiArCQkgICAgICB2YWx1ZTogRm9yIHBtODk0MTogZnJvbSAwIHRvIDI1IHdp
dGggNSBtQSBzdGVwCj4gKwkJCSAgICAgRGVmYXVsdCAyMCBtQS4KPiArCQkJICAgICBGb3IgcG1p
ODk5ODogZnJvbSAwIHRvIDMwIHdpdGggNSBtQSBzdGVwCj4gKwkJCSAgICAgRGVmYXVsdCAyNSBt
QS4KPiArCj4gKy0gcWNvbSxjdXJyZW50LWJvb3N0LWxpbWl0Cj4gKwlVc2FnZTogICAgICAgIG9w
dGlvbmFsCj4gKwlWYWx1ZSB0eXBlOiAgIDx1MzI+Cj4gKwlEZWZpbml0aW9uOiAgIG1BOyBib29z
dCBjdXJyZW50IGxpbWl0Lgo+ICsJCSAgICAgIEZvciBwbTg5NDE6IG9uZSBvZjogMTA1LCAzODUs
IDUyNSwgODA1LCA5ODAsIDEyNjAsIDE0MDAsCj4gKwkJICAgICAgMTY4MC4gRGVmYXVsdDogODA1
IG1BCj4gKwkJICAgICAgRm9yIHBtaTg5OTg6IG9uZSBvZjogMTA1LCAyODAsIDQ1MCwgNjIwLCA5
NzAsIDExNTAsIDEzMDAsCj4gKwkJICAgICAgMTUwMC4gRGVmYXVsdDogOTcwIG1BCj4gKwo+ICst
IHFjb20sc3dpdGNoaW5nLWZyZXEKPiArCVVzYWdlOiAgICAgICAgb3B0aW9uYWwKPiArCVZhbHVl
IHR5cGU6ICAgPHUzMj4KPiArCSBEZWZpbml0aW9uOiAgIGtIejsgc3dpdGNoaW5nIGZyZXF1ZW5j
eTsgb25lIG9mOiA2MDAsIDY0MCwgNjg1LCA3MzgsCj4gKwkJICAgICAgIDgwMCwgODcyLCA5NjAs
IDEwNjYsIDEyMDAsIDEzNzEsIDE2MDAsIDE5MjAsIDI0MDAsIDMyMDAsCj4gKwkJICAgICAgIDQ4
MDAsIDk2MDAuCj4gKwkJICAgICAgIERlZmF1bHQ6IGZvciBwbTg5NDE6IDE2MDAga0h6Cj4gKwkJ
CQlmb3IgcG1pODk5ODogODAwIGtIego+ICsKPiArLSBxY29tLG92cAo+ICsJVXNhZ2U6ICAgICAg
ICBvcHRpb25hbAo+ICsJVmFsdWUgdHlwZTogICA8dTMyPgo+ICsJRGVmaW5pdGlvbjogICBWOyBP
dmVyLXZvbHRhZ2UgcHJvdGVjdGlvbiBsaW1pdDsgb25lIG9mOgo+ICsJCSAgICAgIDI3LCAyOSwg
MzIsIDM1LiBkZWZhdWx0OiAyOVYKPiArCQkgICAgICBUaGlzIHByb3BlcnR5IGlzIHN1cHBvcnRl
ZCBvbmx5IGZvciBQTTg5NDEuCj4gKwo+ICstIHFjb20sbnVtLXN0cmluZ3MKPiArCVVzYWdlOiAg
ICAgICAgb3B0aW9uYWwKPiArCVZhbHVlIHR5cGU6ICAgPHUzMj4KPiArCURlZmluaXRpb246ICAg
IzsgbnVtYmVyIG9mIGxlZCBzdHJpbmdzIGF0dGFjaGVkOwo+ICsJCSAgICAgIHZhbHVlIGZyb20g
MSB0byAzLiBkZWZhdWx0OiAyCj4gKwkJICAgICAgVGhpcyBwcm9wZXJ0eSBpcyBzdXBwb3J0ZWQg
b25seSBmb3IgUE04OTQxLgo+ICAgCj4gICBFeGFtcGxlOgo+ICAgCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
