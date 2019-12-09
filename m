Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F86116A0A
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 10:47:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F3E56E394;
	Mon,  9 Dec 2019 09:47:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1A7E6E330
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 08:49:48 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB98niEs035031;
 Mon, 9 Dec 2019 02:49:44 -0600
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xB98niRZ013825
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 9 Dec 2019 02:49:44 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 9 Dec
 2019 02:49:44 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 9 Dec 2019 02:49:44 -0600
Received: from [10.24.69.159] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB98ndsw122806;
 Mon, 9 Dec 2019 02:49:40 -0600
Subject: Re: [PATCH v1 02/15] dt-bindings:phy: Convert Cadence MHDP PHY
 bindings to YAML.
To: Yuti Amonkar <yamonkar@cadence.com>, <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>
References: <1575368005-29797-1-git-send-email-yamonkar@cadence.com>
 <1575368005-29797-3-git-send-email-yamonkar@cadence.com>
From: Kishon Vijay Abraham I <kishon@ti.com>
Message-ID: <637267ec-bff6-032a-e2f8-9fecb7d565be@ti.com>
Date: Mon, 9 Dec 2019 14:20:52 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <1575368005-29797-3-git-send-email-yamonkar@cadence.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Mon, 09 Dec 2019 09:46:36 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1575881384;
 bh=fePJQLkfXfSHSd9rhwp99Bt9ByU0sbUlPb86fE+gDuk=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=C3g7mG1DwwO3ZgNw4hW6QqLnTULQhJgtFd8jyXU0Gq/APS+zZdGbdLnkpAMP2mh5b
 UXnijAjNIJMHmdBuy/4MJv3nKOY/jQa9SAEVWpShrANVwMfmUUoZPonMbeamoVxFp9
 UBEjVxt54T1fDHqvkueo2cKzIPw8WwSTJ2gRbkSs=
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
Cc: mparab@cadence.com, praneeth@ti.com, dkangude@cadence.com, jsarha@ti.com,
 tomi.valkeinen@ti.com, sjakhade@cadence.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

K1JvYgoKSGksCgpPbiAwMy8xMi8xOSAzOjQzIHBtLCBZdXRpIEFtb25rYXIgd3JvdGU6Cj4gLSBD
b252ZXJ0IHRoZSBNSERQIFBIWSBkZXZpY2V0cmVlIGJpbmRpbmdzIHRvIHlhbWwgc2NoZW1hcy4K
PiAtIFJlbmFtZSBEUCBQSFkgdG8gaGF2ZSBnZW5lcmljIFRvcnJlbnQgUEhZIG5vbXJuY2xhdHVy
ZS4KPiAtIFJlbmFtZSBjb21wYXRpYmxlIHN0cmluZyBmcm9tICJjZG5zLGRwLXBoeSIgdG8gImNk
bnMsdG9ycmVudC1waHkiLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFl1dGkgQW1vbmthciA8eWFtb25r
YXJAY2FkZW5jZS5jb20+Cj4gLS0tCj4gICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9waHkvcGh5
LWNhZGVuY2UtZHAudHh0ICAgICB8IDMwIC0tLS0tLS0tLS0tLS0KPiAgIC4uLi9iaW5kaW5ncy9w
aHkvcGh5LWNhZGVuY2UtdG9ycmVudC55YW1sICAgICAgICAgIHwgNTIgKysrKysrKysrKysrKysr
KysrKysrKwo+ICAgMiBmaWxlcyBjaGFuZ2VkLCA1MiBpbnNlcnRpb25zKCspLCAzMCBkZWxldGlv
bnMoLSkKPiAgIGRlbGV0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvcGh5L3BoeS1jYWRlbmNlLWRwLnR4dAo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waHkvcGh5LWNhZGVuY2UtdG9ycmVudC55YW1s
Cj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waHkv
cGh5LWNhZGVuY2UtZHAudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Bo
eS9waHktY2FkZW5jZS1kcC50eHQKPiBkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCA3
ZjQ5ZmQ1NGUuLjAwMDAwMDAKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvcGh5L3BoeS1jYWRlbmNlLWRwLnR4dAo+ICsrKyAvZGV2L251bGwKPiBAQCAtMSwzMCArMCww
IEBACj4gLUNhZGVuY2UgTUhEUCBEaXNwbGF5UG9ydCBTRDA4MDEgUEhZIGJpbmRpbmcKPiAtPT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+IC0KPiAtVGhpcyBiaW5k
aW5nIGRlc2NyaWJlcyB0aGUgQ2FkZW5jZSBTRDA4MDEgUEhZIGhhcmR3YXJlIGluY2x1ZGVkIHdp
dGgKPiAtdGhlIENhZGVuY2UgTUhEUCBEaXNwbGF5UG9ydCBjb250cm9sbGVyLgo+IC0KPiAtLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQo+IC1SZXF1aXJlZCBwcm9wZXJ0aWVzIChjb250cm9sbGVyIChw
YXJlbnQpIG5vZGUpOgo+IC0tIGNvbXBhdGlibGUJOiBTaG91bGQgYmUgImNkbnMsZHAtcGh5Igo+
IC0tIHJlZwkJOiBEZWZpbmVzIHRoZSBmb2xsb3dpbmcgc2V0cyBvZiByZWdpc3RlcnMgaW4gdGhl
IHBhcmVudAo+IC0JCSAgbWhkcCBkZXZpY2U6Cj4gLQkJCS0gT2Zmc2V0IG9mIHRoZSBEUFRYIFBI
WSBjb25maWd1cmF0aW9uIHJlZ2lzdGVycwo+IC0JCQktIE9mZnNldCBvZiB0aGUgU0QwODAxIFBI
WSBjb25maWd1cmF0aW9uIHJlZ2lzdGVycwo+IC0tICNwaHktY2VsbHMJOiBmcm9tIHRoZSBnZW5l
cmljIFBIWSBiaW5kaW5ncywgbXVzdCBiZSAwLgo+IC0KPiAtT3B0aW9uYWwgcHJvcGVydGllczoK
PiAtLSBudW1fbGFuZXMJOiBOdW1iZXIgb2YgRGlzcGxheVBvcnQgbGFuZXMgdG8gdXNlICgxLCAy
IG9yIDQpCj4gLS0gbWF4X2JpdF9yYXRlCTogTWF4aW11bSBEaXNwbGF5UG9ydCBsaW5rIGJpdCBy
YXRlIHRvIHVzZSwgaW4gTWJwcyAoMjE2MCwKPiAtCQkgIDI0MzAsIDI3MDAsIDMyNDAsIDQzMjAs
IDU0MDAgb3IgODEwMCkKPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IC0KPiAtRXhhbXBsZToK
PiAtCWRwX3BoeTogcGh5QGYwZmIwMzBhMDAgewo+IC0JCWNvbXBhdGlibGUgPSAiY2RucyxkcC1w
aHkiOwo+IC0JCXJlZyA9IDwweGYwIDB4ZmIwMzBhMDAgMHgwIDB4MDAwMDAwNDA+LAo+IC0JCSAg
ICAgIDwweGYwIDB4ZmI1MDAwMDAgMHgwIDB4MDAxMDAwMDA+Owo+IC0JCW51bV9sYW5lcyA9IDw0
PjsKPiAtCQltYXhfYml0X3JhdGUgPSA8ODEwMD47Cj4gLQkJI3BoeS1jZWxscyA9IDwwPjsKPiAt
CX07Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waHkv
cGh5LWNhZGVuY2UtdG9ycmVudC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3BoeS9waHktY2FkZW5jZS10b3JyZW50LnlhbWwKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+
IGluZGV4IDAwMDAwMDAuLmQwMDM3YmMKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BoeS9waHktY2FkZW5jZS10b3JyZW50LnlhbWwKPiBA
QCAtMCwwICsxLDUyIEBACj4gKyVZQU1MIDEuMgo+ICstLS0KPiArJGlkOiAiaHR0cDovL2Rldmlj
ZXRyZWUub3JnL3NjaGVtYXMvcGh5L3BoeS1jYWRlbmNlLXRvcnJlbnQueWFtbCMiCj4gKyRzY2hl
bWE6ICJodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMiCj4gKwo+
ICt0aXRsZTogQ2FkZW5jZSBUb3JyZW50IFNEMDgwMSBQSFkgYmluZGluZyBmb3IgRGlzcGxheVBv
cnQKPiArCj4gK2Rlc2NyaXB0aW9uOgo+ICsgIFRoaXMgYmluZGluZyBkZXNjcmliZXMgdGhlIENh
ZGVuY2UgU0QwODAxIFBIWSBoYXJkd2FyZSBpbmNsdWRlZCB3aXRoCj4gKyAgdGhlIENhZGVuY2Ug
TUhEUCBEaXNwbGF5UG9ydCBjb250cm9sbGVyLgo+ICsKPiArbWFpbnRhaW5lcnM6Cj4gKyAgLSBL
aXNob24gVmlqYXkgQWJyYWhhbSBJIDxraXNob25AdGkuY29tPgoKTm8sIFRoaXMgc2hvdWxkbid0
IGJlIG1lLgo+ICsKPiArcHJvcGVydGllczoKPiArICBjb21wYXRpYmxlOgo+ICsgICAgY29uc3Q6
IGNkbnMsdG9ycmVudC1waHkKPiArCj4gKyAgcmVnOgo+ICsgICAgaXRlbXM6Cj4gKyAgICAgIC0g
ZGVzY3JpcHRpb246IE9mZnNldCBvZiB0aGUgRFBUWCBQSFkgY29uZmlndXJhdGlvbiByZWdpc3Rl
cnMuCj4gKyAgICAgIC0gZGVzY3JpcHRpb246IE9mZnNldCBvZiB0aGUgU0QwODAxIFBIWSBjb25m
aWd1cmF0aW9uIHJlZ2lzdGVycy4KPiArCj4gKyAgIiNwaHktY2VsbHMiOgo+ICsgICAgY29uc3Q6
IDAKPiArCj4gKyAgbnVtX2xhbmVzOgo+ICsgICAgbWF4SXRlbXM6IDEKPiArICAgIGRlc2NyaXB0
aW9uOgo+ICsgICAgICBOdW1iZXIgb2YgRGlzcGxheVBvcnQgbGFuZXMgdG8gdXNlICgxLCAyIG9y
IDQpCgpJZiB0aGlzIGlzIGEgZHQgcHJvcGVydHksIHdoeSBpcyBpdCBhbHNvIHBhcnQgb2Ygc3Ry
dWN0IApwaHlfY29uZmlndXJlX29wdHNfZHA/Cj4gKwo+ICsgIG1heF9iaXRfcmF0ZToKPiArICAg
IG1heEl0ZW1zOiAxCj4gKyAgICBkZXNjcmlwdGlvbjoKPiArICAgICAgTWF4aW11bSBEaXNwbGF5
UG9ydCBsaW5rIGJpdCByYXRlIHRvIHVzZSwgaW4gTWJwcyAoMjE2MCwgMjQzMCwgMjcwMCwgMzI0
MCwgNDMyMCwgNTQwMCBvciA4MTAwKQoKQ2FuJ3QgImVudW0iIGJlIHVzZWQgaGVyZSB0byBkZWZp
bmUgdGhlIGFsbG93ZWQgYml0IHJhdGVzPwoKVGhhbmtzCktpc2hvbgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
