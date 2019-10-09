Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CADD1B03
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 23:35:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E12389D02;
	Wed,  9 Oct 2019 21:35:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 416B689D02
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 21:35:54 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 91F6C4FF;
 Wed,  9 Oct 2019 23:35:52 +0200 (CEST)
Date: Thu, 10 Oct 2019 00:35:51 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: zhengbin <zhengbin13@huawei.com>
Subject: Re: [PATCH 2/4] drm/omap: Remove set but not used variable
 'tclk_trail'
Message-ID: <20191009213551.GS22998@pendragon.ideasonboard.com>
References: <1570518949-47574-1-git-send-email-zhengbin13@huawei.com>
 <1570518949-47574-3-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1570518949-47574-3-git-send-email-zhengbin13@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1570656952;
 bh=GQQrq+eSe5tBe98ZlkrdRAmmEANHs/CS92FG2OTZ2bg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X3HYw421ASr6PL1xDFB8npIi5PgolblEvf83Idv8bXFuEQVuIIwG2i7mNba+Nyz3e
 F0kFxoyuQKY3P/b4OJ0KA8EenMzwRjXI+XOqKhuhbZdHoPr3WykpZZBJjaYo/73roh
 Qdf0mEkw0NQqUPYgQEZaGVnebVGWLCvr9M8A80Dg=
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
Cc: airlied@linux.ie, tomi.valkeinen@ti.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgWmhlbmdiaW4sCgpUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4KCk9uIFR1ZSwgT2N0IDA4LCAy
MDE5IGF0IDAzOjE1OjQ3UE0gKzA4MDAsIHpoZW5nYmluIHdyb3RlOgo+IEZpeGVzIGdjYyAnLVd1
bnVzZWQtYnV0LXNldC12YXJpYWJsZScgd2FybmluZzoKPiAKPiBkcml2ZXJzL2dwdS9kcm0vb21h
cGRybS9kc3MvZHNpLmM6IEluIGZ1bmN0aW9uIGRzaV9wcm90b190aW1pbmdzOgo+IGRyaXZlcnMv
Z3B1L2RybS9vbWFwZHJtL2Rzcy9kc2kuYzozNTYyOjQ2OiB3YXJuaW5nOiB2YXJpYWJsZSB0Y2xr
X3RyYWlsIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCj4gCj4g
SXQgaXMgbm90IHVzZWQgc2luY2UgY29tbWl0IDk5NjBhYTdjYjU4YyAoImRybS9vbWFwOgo+IG1v
dmUgb21hcGRzcyAmIGRpc3BsYXlzIHVuZGVyIG9tYXBkcm0iKQo+IAo+IFJlcG9ydGVkLWJ5OiBI
dWxrIFJvYm90IDxodWxrY2lAaHVhd2VpLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiB6aGVuZ2JpbiA8
emhlbmdiaW4xM0BodWF3ZWkuY29tPgoKUmV2aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxh
dXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9vbWFwZHJtL2Rzcy9kc2kuYyB8IDMgKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL29t
YXBkcm0vZHNzL2RzaS5jIGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2RzaS5jCj4gaW5k
ZXggYjMwZmNhYS4uZGExNmVhMCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRy
bS9kc3MvZHNpLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvZHNpLmMKPiBA
QCAtMzU0OCw3ICszNTQ4LDcgQEAgc3RhdGljIGludCBkc2lfcHJvdG9fY29uZmlnKHN0cnVjdCBk
c2lfZGF0YSAqZHNpKQo+IAo+ICBzdGF0aWMgdm9pZCBkc2lfcHJvdG9fdGltaW5ncyhzdHJ1Y3Qg
ZHNpX2RhdGEgKmRzaSkKPiAgewo+IC0JdW5zaWduZWQgaW50IHRscHgsIHRjbGtfemVybywgdGNs
a19wcmVwYXJlLCB0Y2xrX3RyYWlsOwo+ICsJdW5zaWduZWQgaW50IHRscHgsIHRjbGtfemVybywg
dGNsa19wcmVwYXJlOwo+ICAJdW5zaWduZWQgaW50IHRjbGtfcHJlLCB0Y2xrX3Bvc3Q7Cj4gIAl1
bnNpZ25lZCBpbnQgdGhzX3ByZXBhcmUsIHRoc19wcmVwYXJlX3Roc196ZXJvLCB0aHNfemVybzsK
PiAgCXVuc2lnbmVkIGludCB0aHNfdHJhaWwsIHRoc19leGl0Owo+IEBAIC0zNTY3LDcgKzM1Njcs
NiBAQCBzdGF0aWMgdm9pZCBkc2lfcHJvdG9fdGltaW5ncyhzdHJ1Y3QgZHNpX2RhdGEgKmRzaSkK
PiAKPiAgCXIgPSBkc2lfcmVhZF9yZWcoZHNpLCBEU0lfRFNJUEhZX0NGRzEpOwo+ICAJdGxweCA9
IEZMRF9HRVQociwgMjAsIDE2KSAqIDI7Cj4gLQl0Y2xrX3RyYWlsID0gRkxEX0dFVChyLCAxNSwg
OCk7Cj4gIAl0Y2xrX3plcm8gPSBGTERfR0VUKHIsIDcsIDApOwo+IAo+ICAJciA9IGRzaV9yZWFk
X3JlZyhkc2ksIERTSV9EU0lQSFlfQ0ZHMik7Cj4gLS0KPiAyLjcuNAo+IAoKLS0gClJlZ2FyZHMs
CgpMYXVyZW50IFBpbmNoYXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
