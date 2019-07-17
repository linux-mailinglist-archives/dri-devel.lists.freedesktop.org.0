Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A156BF8C
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 18:20:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A27C6E0F7;
	Wed, 17 Jul 2019 16:20:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 870CB6E0F7
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 16:20:24 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:57266
 helo=[192.168.10.173])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <noralf@tronnes.org>)
 id 1hnmfG-0005XC-IC; Wed, 17 Jul 2019 18:20:22 +0200
Subject: Re: [PATCH 06/10] drm/tinydrm: Move tinydrm_spi_transfer()
To: Sam Ravnborg <sam@ravnborg.org>
References: <20190717115817.30110-1-noralf@tronnes.org>
 <20190717115817.30110-7-noralf@tronnes.org>
 <20190717131533.GB4852@ravnborg.org>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <5a8de093-0eb9-c348-b1a0-f543de67004a@tronnes.org>
Date: Wed, 17 Jul 2019 18:20:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190717131533.GB4852@ravnborg.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=qord1D4OPF+Cl/nKlxCAZGGXh2if1Uoy8SDgjehBLVA=; 
 b=CFVQvYFmVLk0MGF2A6VdV+BgbubytPzKn7ptALA2mo9cOvRWchGSFe3/PaKdXMx8eh+L8SMhQHHIrJuNL6CzumHUfrlC/u3+W1KbYTabbEjRoDDsa7HcI0FJhJTnC4gG9re9PzB9E/1ba0wn5DlpU5avoobSgyhiDLvp2cf1slKremL6ImYm1TC5zdZM1rnco27vXvGUeRoTMalJpvmQdomWTLHt53nnBNXulcPQSw3hVMRLf+ExpOx6G7qQZktlkp1uZ4XdYfJ5n9ei90cU+3cKlmq4L6RxnmPxlOQDfJ4EoL2u7cTBBlPC6HqlArp7CccGwWBz2yKYs7eNE3gwFg==;
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
Cc: david@lechnology.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMTcuMDcuMjAxOSAxNS4xNSwgc2tyZXYgU2FtIFJhdm5ib3JnOgo+IEhpIE5vcmFsZi4K
PiAKPiBPbiBXZWQsIEp1bCAxNywgMjAxOSBhdCAwMTo1ODoxM1BNICswMjAwLCBOb3JhbGYgVHLD
uG5uZXMgd3JvdGU6Cj4+IFRoaXMgaXMgb25seSB1c2VkIGJ5IG1pcGktZGJpIGRyaXZlcnMgc28g
bW92ZSBpdCB0aGVyZS4KPj4KPj4gVGhlIHJlYXNvbiB0aGlzIGlzbid0IG1vdmVkIHRvIHRoZSBT
UEkgc3Vic3lzdGVtIGlzIHRoYXQgaXQgd2lsbCBpbiBhCj4+IGxhdGVyIHBhdGNoIHBhc3MgYSBk
dW1teSByeCBidWZmZXIgZm9yIFNQSSBjb250cm9sbGVycyB0aGF0IG5lZWQgdGhpcy4KPj4gTG93
IG1lbW9yeSBib2FyZHMgKDY0TUIpIGNhbiBydW4gaW50byBhIHByb2JsZW0gYWxsb2NhdGluZyBz
dWNoIGEgImxhcmdlIgo+PiBjb250aWd1b3VzIGJ1ZmZlciBvbiBldmVyeSB0cmFuc2ZlciBhZnRl
ciBhIGxvbmcgdXAgdGltZS4KPj4gVGhpcyBsZWF2ZXMgYSB2ZXJ5IHNwZWNpZmljIHVzZSBjYXNl
LCBzbyB3ZSdsbCBrZWVwIHRoZSBmdW5jdGlvbiBoZXJlLgo+PiBtaXBpLWRiaSB3aWxsIGZpcnN0
IGdvIHRocm91Z2ggYSByZWZhY3RvcmluZyB0aG91Z2gsIGJlZm9yZSB0aGlzIHdpbGwKPj4gYmUg
ZG9uZS4KPj4KPj4gUmVtb3ZlIFNQSSB0b2RvIGVudHJ5IG5vdyB0aGF0IHdlJ3JlIGRvbmUgd2l0
aCB0aGUgdGlueWRybS5rbyBTUEkgY29kZS4KPj4KPj4gQWRkaXRpb25hbGx5IG1vdmUgdGhlIG1p
cGlfZGJpX3NwaV9pbml0KCkgZGVjbGFyYXRpb24gdG8gdGhlIG90aGVyIFNQSQo+PiBmdW5jdGlv
bnMuCj4+Cj4+IENjOiBEYXZpZCBMZWNobmVyIDxkYXZpZEBsZWNobm9sb2d5LmNvbT4KPj4gU2ln
bmVkLW9mZi1ieTogTm9yYWxmIFRyw7hubmVzIDxub3JhbGZAdHJvbm5lcy5vcmc+Cj4gV2l0aCB0
aGUgZmV3IG5pdHBpY3MgY29uc2lkZXJlZDoKPiBSZXZpZXdlZC1ieTogU2FtIFJhdm5ib3JnIDxz
YW1AcmF2bmJvcmcub3JnPgo+IAo+IAo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vdGlueWRy
bS9taXBpLWRiaS5oIGIvaW5jbHVkZS9kcm0vdGlueWRybS9taXBpLWRiaS5oCj4+IGluZGV4IDUx
ZmM2NjdiZWVmNy4uNTc2ZTlhNzM0OWFiIDEwMDY0NAo+PiAtLS0gYS9pbmNsdWRlL2RybS90aW55
ZHJtL21pcGktZGJpLmgKPj4gKysrIGIvaW5jbHVkZS9kcm0vdGlueWRybS9taXBpLWRiaS5oCj4+
IEBAIC02Nyw4ICs2Nyw2IEBAIHN0YXRpYyBpbmxpbmUgc3RydWN0IG1pcGlfZGJpICpkcm1fdG9f
bWlwaV9kYmkoc3RydWN0IGRybV9kZXZpY2UgKmRybSkKPj4gIAlyZXR1cm4gY29udGFpbmVyX29m
KGRybSwgc3RydWN0IG1pcGlfZGJpLCBkcm0pOwo+PiAgfQo+PiAgCj4+IC1pbnQgbWlwaV9kYmlf
c3BpX2luaXQoc3RydWN0IHNwaV9kZXZpY2UgKnNwaSwgc3RydWN0IG1pcGlfZGJpICptaXBpLAo+
PiAtCQkgICAgICBzdHJ1Y3QgZ3Bpb19kZXNjICpkYyk7Cj4gTW92aW5nIHRoaXMgcHJvdG90eXBl
IGxvb2tzIGxpa2UgaXQgYmVsb25ncyBpbiBhbm90aGVyIHBhdGNoPwo+IAoKU3RyaWN0bHkgc3Bl
YWtpbmcgaXQgZG9lcywgaWYgeW91IGRvbid0IGxpa2UgSSdsbCBqdXN0IGRyb3AgaXQuCgpOb3Jh
bGYuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
