Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F56E1071AE
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2019 12:45:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12AA96F538;
	Fri, 22 Nov 2019 11:45:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p00-ob.smtp.rzone.de (mo6-p00-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5300::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A74A6F538
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2019 11:45:34 +0000 (UTC)
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8fxIc6p"
X-RZG-CLASS-ID: mo00
Received: from gerhold.net by smtp.strato.de (RZmta 44.29.0 DYNA|AUTH)
 with ESMTPSA id e07688vAMBiF4D2
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Fri, 22 Nov 2019 12:44:15 +0100 (CET)
Date: Fri, 22 Nov 2019 12:44:08 +0100
From: Stephan Gerhold <stephan@gerhold.net>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] drm/mcde: Reuse global DSI command defs
Message-ID: <20191122114408.GA1195@gerhold.net>
References: <20191122072457.25619-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191122072457.25619-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1574423132; 
 s=strato-dkim-0002; d=gerhold.net;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=KUzkDrxqXdw3nrhVEp7f4tzQQ+TrmNkZxVmR920PI6w=;
 b=UmkLoYJpYr4Msp9fTxfjxs/A0yL1eum4Yr+VA3juXNiVnfj0wO53W8WbkBTVBphH8e
 ZtTsD1Q42jB0YVfbznC5zkYPKjNFQaXUh1gpJVOiBtU19puX9tR8ToTTQGv3PsGOiMnJ
 KMyd5tGcl9vnf4kB+tBcrgt4UDZHfBZi77QSwo8n4xKrceNlxtCMmlG37fbQbKG9vQ+X
 uPtAu272Mrxeenul1xb6V2bwlogMw6Xo7KrTSsA6pu+FqZf0UddIrWyuKAaZCnCurRI8
 cSmiPC9zdmwnB2pRSqb96UobXAyM7DcQ09LvuqgP8WjT+ETzX5elIGbWtcUTxzBxxf9o
 u+sg==
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMjIsIDIwMTkgYXQgMDg6MjQ6NTdBTSArMDEwMCwgTGludXMgV2FsbGVpaiB3
cm90ZToKPiBUaGUgTUNERSBEU0kgaW5jbHVkZSBmaWxlIHJlZGVmaW5lcyBzb21lIGNvbW1hbmRz
IHRoYXQKPiBhbHJlYWR5IGV4aXN0IGluIHRoZSBjb21tb24gPHZpZGVvL21pcGlfZGlzcGxheS5o
PiBoZWFkZXIuCj4gCj4gQ2M6IFN0ZXBoYW4gR2VyaG9sZCA8c3RlcGhhbkBnZXJob2xkLm5ldD4K
PiBTaWduZWQtb2ZmLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+
CgpSZXZpZXdlZC1ieTogU3RlcGhhbiBHZXJob2xkIDxzdGVwaGFuQGdlcmhvbGQubmV0PgoKPiAt
LS0KPiAgZHJpdmVycy9ncHUvZHJtL21jZGUvbWNkZV9kc2kuYyAgICAgIHwgIDIgKy0KPiAgZHJp
dmVycy9ncHUvZHJtL21jZGUvbWNkZV9kc2lfcmVncy5oIHwgMTEgLS0tLS0tLS0tLS0KPiAgMiBm
aWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMTIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tY2RlL21jZGVfZHNpLmMgYi9kcml2ZXJzL2dwdS9kcm0v
bWNkZS9tY2RlX2RzaS5jCj4gaW5kZXggZDRhMTJmZTdmZjAxLi5kYzA3YjUzNGYwMWYgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21jZGUvbWNkZV9kc2kuYwo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9tY2RlL21jZGVfZHNpLmMKPiBAQCAtMzUwLDcgKzM1MCw3IEBAIHZvaWQgbWNkZV9k
c2lfdGVfcmVxdWVzdChzdHJ1Y3QgbWlwaV9kc2lfZGV2aWNlICptZHNpKQo+ICAJdmFsIHw9IDAg
PDwgRFNJX0RJUkVDVF9DTURfTUFJTl9TRVRUSU5HU19DTURfSURfU0hJRlQ7Cj4gIAl2YWwgfD0g
MiA8PCBEU0lfRElSRUNUX0NNRF9NQUlOX1NFVFRJTkdTX0NNRF9TSVpFX1NISUZUOwo+ICAJdmFs
IHw9IERTSV9ESVJFQ1RfQ01EX01BSU5fU0VUVElOR1NfQ01EX0xQX0VOOwo+IC0JdmFsIHw9IERT
SV9ESVJFQ1RfQ01EX01BSU5fU0VUVElOR1NfQ01EX0hFQURfRENTX1NIT1JUX1dSSVRFXzEgPDwK
PiArCXZhbCB8PSBNSVBJX0RTSV9HRU5FUklDX1NIT1JUX1dSSVRFXzFfUEFSQU0gPDwKPiAgCQlE
U0lfRElSRUNUX0NNRF9NQUlOX1NFVFRJTkdTX0NNRF9IRUFEX1NISUZUOwo+ICAJd3JpdGVsKHZh
bCwgZC0+cmVncyArIERTSV9ESVJFQ1RfQ01EX01BSU5fU0VUVElOR1MpOwo+ICAKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL21jZGUvbWNkZV9kc2lfcmVncy5oIGIvZHJpdmVycy9ncHUv
ZHJtL21jZGUvbWNkZV9kc2lfcmVncy5oCj4gaW5kZXggYjAzYTMzNmMyMzVmLi44MDg5ZGI4MDVj
NTcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21jZGUvbWNkZV9kc2lfcmVncy5oCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL21jZGUvbWNkZV9kc2lfcmVncy5oCj4gQEAgLTEyMywxNyAr
MTIzLDYgQEAKPiAgI2RlZmluZSBEU0lfRElSRUNUX0NNRF9NQUlOX1NFVFRJTkdTX0NNRF9MT05H
Tk9UU0hPUlQgQklUKDMpCj4gICNkZWZpbmUgRFNJX0RJUkVDVF9DTURfTUFJTl9TRVRUSU5HU19D
TURfSEVBRF9TSElGVCA4Cj4gICNkZWZpbmUgRFNJX0RJUkVDVF9DTURfTUFJTl9TRVRUSU5HU19D
TURfSEVBRF9NQVNLIDB4MDAwMDNGMDAKPiAtI2RlZmluZSBEU0lfRElSRUNUX0NNRF9NQUlOX1NF
VFRJTkdTX0NNRF9IRUFEX1RVUk5fT05fUEVSSVBIRVJBTCA1MAo+IC0jZGVmaW5lIERTSV9ESVJF
Q1RfQ01EX01BSU5fU0VUVElOR1NfQ01EX0hFQURfU0hVVF9ET1dOX1BFUklQSEVSQUwgMzQKPiAt
I2RlZmluZSBEU0lfRElSRUNUX0NNRF9NQUlOX1NFVFRJTkdTX0NNRF9IRUFEX0dFTkVSSUNfU0hP
UlRfV1JJVEVfMCAzCj4gLSNkZWZpbmUgRFNJX0RJUkVDVF9DTURfTUFJTl9TRVRUSU5HU19DTURf
SEVBRF9HRU5FUklDX1NIT1JUX1dSSVRFXzEgMTkKPiAtI2RlZmluZSBEU0lfRElSRUNUX0NNRF9N
QUlOX1NFVFRJTkdTX0NNRF9IRUFEX0dFTkVSSUNfU0hPUlRfV1JJVEVfMiAzNQo+IC0jZGVmaW5l
IERTSV9ESVJFQ1RfQ01EX01BSU5fU0VUVElOR1NfQ01EX0hFQURfR0VORVJJQ19MT05HX1dSSVRF
IDQxCj4gLSNkZWZpbmUgRFNJX0RJUkVDVF9DTURfTUFJTl9TRVRUSU5HU19DTURfSEVBRF9EQ1Nf
U0hPUlRfV1JJVEVfMCA1Cj4gLSNkZWZpbmUgRFNJX0RJUkVDVF9DTURfTUFJTl9TRVRUSU5HU19D
TURfSEVBRF9EQ1NfU0hPUlRfV1JJVEVfMSAyMQo+IC0jZGVmaW5lIERTSV9ESVJFQ1RfQ01EX01B
SU5fU0VUVElOR1NfQ01EX0hFQURfRENTX0xPTkdfV1JJVEUgNTcKPiAtI2RlZmluZSBEU0lfRElS
RUNUX0NNRF9NQUlOX1NFVFRJTkdTX0NNRF9IRUFEX0RDU19SRUFEIDYKPiAtI2RlZmluZSBEU0lf
RElSRUNUX0NNRF9NQUlOX1NFVFRJTkdTX0NNRF9IRUFEX1NFVF9NQVhfUEtUX1NJWkUgNTUKPiAg
I2RlZmluZSBEU0lfRElSRUNUX0NNRF9NQUlOX1NFVFRJTkdTX0NNRF9JRF9TSElGVCAxNAo+ICAj
ZGVmaW5lIERTSV9ESVJFQ1RfQ01EX01BSU5fU0VUVElOR1NfQ01EX1NJWkVfU0hJRlQgMTYKPiAg
I2RlZmluZSBEU0lfRElSRUNUX0NNRF9NQUlOX1NFVFRJTkdTX0NNRF9MUF9FTiBCSVQoMjEpCj4g
LS0gCj4gMi4yMS4wCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
