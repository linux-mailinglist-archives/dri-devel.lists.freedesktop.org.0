Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D5A30B9B3
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 09:27:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 959CD6E8E8;
	Tue,  2 Feb 2021 08:27:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BA1D89C19
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Feb 2021 04:46:56 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4DVC2j6qsXz9tjx;
 Tue,  2 Feb 2021 15:46:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1612241214; bh=vRDOvL4of/Oeu9QXEMbQYJHdwg+PyqoJY0e1Wu5OGCM=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=oR6iXsBgaRYY+BNPiqtgy6g6SMZZPbqAfupBNijMUu5jYcewGR5RejzgnnQYPaoTR
 8Ihjcex28jr1Qkq5LEJM4CaIHyxraYnJKBNAcx5Xaf/6fv37bnmfadzlc+j3mfKurA
 jpVa9/6CsbmTGgPP5QfCn5dgJpDWGdor/c/eZ0JevetzegsysCaGt7P09DEkar/rDv
 /gSd7NA59yP3QfhNIvm2Cwam9kBlwY8JRx9xE4NMaoUZTTjJ8UioaEKKwK64EtIUkF
 r6v7a+Mpmf6ss9ItRQgkEWk6WQUp+SePJjpebO3sEF7xdT49rmB5gk8OHaaxqLi9E3
 yw5yqz9YBZ0Ww==
Message-ID: <21b49b6a6303bf8c188929bb2cb328ecea33520f.camel@ozlabs.org>
Subject: Re: [PATCH 2/2] drm/aspeed: Use dt matching for default register
 values
From: Jeremy Kerr <jk@ozlabs.org>
To: Joel Stanley <joel@jms.id.au>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, Andrew Jeffery <andrew@aj.id.au>
Date: Tue, 02 Feb 2021 12:46:52 +0800
In-Reply-To: <20210111044638.290909-3-joel@jms.id.au>
References: <20210111044638.290909-1-joel@jms.id.au>
 <20210111044638.290909-3-joel@jms.id.au>
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 02 Feb 2021 08:27:00 +0000
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
Cc: linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSm9lbCwKCj4gVGhlcmUgYXJlIG1pbm9yIGRpZmZlcmVuY2VzIGluIHRoZSB2YWx1ZXMgZm9y
IHRoZSB0aHJlc2hvbGQgdmFsdWUgYW5kCj4gdGhlIHNjYW4gbGluZSBzaXplIGJldHdlZW4gZmFt
aWxpZXMgb2YgQVNQRUVEIFNvQy4gQWRkaXRpb25hbGx5IHRoZQo+IFNDVSByZWdpc3RlciBmb3Ig
dGhlIG91dHB1dCBjb250cm9sIGRpZmZlcnMgYmV0d2VlbiBmYW1pbGllcy4KPiAKPiBUaGlzIGFk
ZHMgZGV2aWNlIHRyZWUgbWF0Y2hpbmcgdG8gcGFyYW1ldGVyaXNlIHRoZXNlIHZhbHVlcywgYWxs
b3dpbmcKPiB1cyB0byBhZGQgc3VwcG9ydCBmb3IgdGhlIEFTVDI0MDAgbm93LCBhbmQgaW4gdGhl
IGZ1dHVyZSB0aGUgQVNUMjYwMC4KCkxvb2tzIGdvb2QgdG8gbWUuIFR3byBzdXBlciBtaW5vciB0
aGluZ3M6Cgo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hc3BlZWQvYXNwZWVkX2dmeF9jcnRjLmMK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXNwZWVkL2FzcGVlZF9nZnhfY3J0Yy5jCj4gQEAgLTYw
LDcgKzYwLDggQEAgc3RhdGljIHZvaWQgYXNwZWVkX2dmeF9lbmFibGVfY29udHJvbGxlcihzdHJ1
Y3QKPiBhc3BlZWRfZ2Z4ICpwcml2KQo+IMKgwqDCoMKgwqDCoMKgwqB1MzIgY3RybDIgPSByZWFk
bChwcml2LT5iYXNlICsgQ1JUX0NUUkwyKTsKPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqAvKiBTQ1Uy
Qzogc2V0IERBQyBzb3VyY2UgZm9yIGRpc3BsYXkgb3V0cHV0IHRvIEdyYXBoaWNzIENSVCAoR0ZY
KSAqLwo+IC3CoMKgwqDCoMKgwqDCoHJlZ21hcF91cGRhdGVfYml0cyhwcml2LT5zY3UsIDB4MmMs
IEJJVCgxNiksIEJJVCgxNikpOwo+ICvCoMKgwqDCoMKgwqDCoHJlZ21hcF91cGRhdGVfYml0cyhw
cml2LT5zY3UsIHByaXYtPmRhY19yZWcsIEJJVCgxNiksIEJJVCgxNikpOwoKVGhlIGNvbW1lbnQg
cmVmZXJlbmNlcyBTQ1UyQzsgYnV0IHlvdSd2ZSBpbXBsaWVkIHRoYXQgdGhpcyB3aWxsCmNoYW5n
ZS4uLgoKPiBAQCAtMjI4LDcgKzI1OCw3IEBAIHN0YXRpYyBzc2l6ZV90IGRhY19tdXhfc3RvcmUo
c3RydWN0IGRldmljZSAqZGV2LAo+IHN0cnVjdCBkZXZpY2VfYXR0cmlidXRlICphdHRyLAo+IMKg
wqDCoMKgwqDCoMKgwqBpZiAodmFsID4gMykKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoHJldHVybiAtRUlOVkFMOwo+IMKgCj4gLcKgwqDCoMKgwqDCoMKgcmMgPSByZWdtYXBfdXBk
YXRlX2JpdHMocHJpdi0+c2N1LCBBU1BFRURfU0NVX01JU0NfQ1RSTCwgMHgzMDAwMCwgdmFsIDw8
IDE2KTsKPiArwqDCoMKgwqDCoMKgwqByYyA9IHJlZ21hcF91cGRhdGVfYml0cyhwcml2LT5zY3Us
IHByaXYtPmRhY19yZWcsIDB4MzAwMDAsIHZhbCA8PCAxNik7Cj4gwqDCoMKgwqDCoMKgwqDCoGlm
IChyYyA8IDApCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gMDsKPiDC
oAo+IEBAIC0yNDEsNyArMjcxLDcgQEAgc3RhdGljIHNzaXplX3QgZGFjX211eF9zaG93KHN0cnVj
dCBkZXZpY2UgKmRldiwKPiBzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSAqYXR0ciwgYwo+IMKgwqDC
oMKgwqDCoMKgwqB1MzIgcmVnOwo+IMKgwqDCoMKgwqDCoMKgwqBpbnQgcmM7Cj4gwqAKPiAtwqDC
oMKgwqDCoMKgwqByYyA9IHJlZ21hcF9yZWFkKHByaXYtPnNjdSwgQVNQRUVEX1NDVV9NSVNDX0NU
UkwsICZyZWcpOwo+ICvCoMKgwqDCoMKgwqDCoHJjID0gcmVnbWFwX3JlYWQocHJpdi0+c2N1LCBw
cml2LT5kYWNfcmVnLCAmcmVnKTsKPiDCoMKgwqDCoMKgwqDCoMKgaWYgKHJjKQo+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIHJjOwoKWW91J3ZlIHJlbW92ZWQgdGhlIG9u
bHkgdXNlcyBvZiBBU1BFRURfU0NVX01JU0NfQ1RSTCBoZXJlLCBtYXliZSBkcm9wCnRoZSAjZGVm
aW5lIHRvbz8KClJlZ2FyZGxlc3M6CgpSZXZpZXdlZC1ieTogSmVyZW15IEtlcnIgPGprQG96bGFi
cy5vcmc+CgpDaGVlcnMsCgoKSmVyZW15CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
