Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2848C5F489
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 10:25:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 497D76E2EC;
	Thu,  4 Jul 2019 08:25:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF0C66E2EC
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2019 08:25:38 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x648PTtb121299;
 Thu, 4 Jul 2019 03:25:29 -0500
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x648PTYb091087
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 4 Jul 2019 03:25:29 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 4 Jul
 2019 03:25:29 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 4 Jul 2019 03:25:29 -0500
Received: from [10.1.3.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x648PPvh044715;
 Thu, 4 Jul 2019 03:25:26 -0500
Subject: Re: [PATCH 2/3] dt-bindings: display: sii902x: Change audio mclk
 binding
To: Olivier Moysan <olivier.moysan@st.com>, <a.hajda@samsung.com>,
 <narmstrong@baylibre.com>, <Laurent.pinchart@ideasonboard.com>,
 <jonas@kwiboo.se>, <jernej.skrabec@siol.net>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <benjamin.gaignard@st.com>,
 <alexandre.torgue@st.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <robh+dt@kernel.org>,
 <mark.rutland@arm.com>, <devicetree@vger.kernel.org>
References: <1562082426-14876-1-git-send-email-olivier.moysan@st.com>
 <1562082426-14876-3-git-send-email-olivier.moysan@st.com>
From: Jyri Sarha <jsarha@ti.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jsarha@ti.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <85c5d6a8-95d9-d4c0-fb33-4a774caf0b5e@ti.com>
Date: Thu, 4 Jul 2019 11:25:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <1562082426-14876-3-git-send-email-olivier.moysan@st.com>
Content-Language: en-GB
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1562228729;
 bh=fNPkwALi8NkKv8UqT4FQ103MHuhzRMQlVjnGvrouozA=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=Loj7VX+R0UeS8xCOs6Ab4egqHhFPCdSYwDp+D1InOC2TbUgLR4W3UHMBtczjqnVs2
 HlNgI//b7NUXG5JBG8SXY4YztgUnV2waT1THN+5XDGs44KTP4NhOnCRWNLJNKEs/nv
 iEO/b7h8sTwKkcOfV1sCistcU2h/v/078+0391Zg=
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

T24gMDIvMDcvMjAxOSAxODo0NywgT2xpdmllciBNb3lzYW4gd3JvdGU6Cj4gQXMgc3RhdGVkIGlu
IFNpTDkwMjIvMjQgZGF0YXNoZWV0LCBtYXN0ZXIgY2xvY2sgaXMgbm90IHJlcXVpcmVkIGZvciBJ
MlMuCj4gTWFrZSBtY2xrIHByb3BlcnR5IG9wdGlvbmFsIGluIERUIGJpbmRpbmdzLgo+IAo+IEZp
eGVzOiAzZjE4MDIxZjQzYTMgKCJkdC1iaW5kaW5nczogZGlzcGxheTogc2lpOTAyeDogQWRkIEhE
TUkgYXVkaW8gYmluZGluZ3MiKQo+IAo+IFNpZ25lZC1vZmYtYnk6IE9saXZpZXIgTW95c2FuIDxv
bGl2aWVyLm1veXNhbkBzdC5jb20+CgpMb29raW5nIHRoZSBzcGVjcyBhZ2FpbiBpdCBsb29rcyBs
aWtlIHRoZSBtY2xrIGlzIHJlcXVyZWQgZm9yIHNpaTkwMjAsCmJ1dCBub3QgZm9yIHNpaTkwMjIg
YW5kIHNpaTkwMjQuCgpTbyBJIGd1ZXNzIGl0IGlzIGZpbmUgdG8gYWNjZXB0IHRoZSBjb25maWd1
cmF0aW9ucyB3aXRob3V0IHRoZSBtY2xrLgoKUmV2aWV3ZWQtYnk6IEp5cmkgU2FyaGEgPGpzYXJo
YUB0aS5jb20+Cgo+IC0tLQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9icmlkZ2Uvc2lpOTAyeC50eHQgfCA1ICsrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9zaWk5MDJ4LnR4dCBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9zaWk5MDJ4LnR4dAo+
IGluZGV4IDJkZjQ0YjdkMzgyMS4uNmUxNGUwODdjMGQwIDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9zaWk5MDJ4LnR4dAo+ICsr
KyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9zaWk5
MDJ4LnR4dAo+IEBAIC0yNiw5ICsyNiw4IEBAIE9wdGlvbmFsIHByb3BlcnRpZXM6Cj4gIAktIGNs
b2NrczogcGhhbmRsZSBhbmQgY2xvY2sgc3BlY2lmaWVyIGZvciBlYWNoIGNsb2NrIGxpc3RlZCBp
bgo+ICAgICAgICAgICAgIHRoZSBjbG9jay1uYW1lcyBwcm9wZXJ0eQo+ICAJLSBjbG9jay1uYW1l
czogIm1jbGsiCj4gLQkgICBEZXNjcmliZXMgU0lJOTAyeCBNQ0xLIGlucHV0LiBNQ0xLIGlzIHVz
ZWQgdG8gcHJvZHVjZQo+IC0JICAgSERNSSBhdWRpbyBDVFMgdmFsdWVzLiBUaGlzIHByb3BlcnR5
IGlzIHJlcXVpcmVkIGlmCj4gLQkgICAiI3NvdW5kLWRhaS1jZWxscyItcHJvcGVydHkgaXMgcHJl
c2VudC4gVGhpcyBwcm9wZXJ0eSBmb2xsb3dzCj4gKwkgICBEZXNjcmliZXMgU0lJOTAyeCBNQ0xL
IGlucHV0LiBNQ0xLIGNhbiBiZSB1c2VkIHRvIHByb2R1Y2UKPiArCSAgIEhETUkgYXVkaW8gQ1RT
IHZhbHVlcy4gVGhpcyBwcm9wZXJ0eSBmb2xsb3dzCj4gIAkgICBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvY2xvY2svY2xvY2stYmluZGluZ3MudHh0Cj4gIAkgICBjb25zdW1lciBi
aW5kaW5nLgo+ICAKPiAKCgotLSAKVGV4YXMgSW5zdHJ1bWVudHMgRmlubGFuZCBPeSwgUG9ya2th
bGFua2F0dSAyMiwgMDAxODAgSGVsc2lua2kuClktdHVubnVzL0J1c2luZXNzIElEOiAwNjE1NTIx
LTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhlbHNpbmtpCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
