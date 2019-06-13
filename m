Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5409B43740
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 16:36:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F4D289AB2;
	Thu, 13 Jun 2019 14:36:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A74889AB2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 14:36:09 +0000 (UTC)
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:53006)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1hbQpd-0003b0-Cx; Thu, 13 Jun 2019 15:36:01 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.89)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1hbQpc-0001Ia-Ez; Thu, 13 Jun 2019 15:36:00 +0100
Date: Thu, 13 Jun 2019 15:36:00 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] armada: no need to check return value of debugfs_create
 functions
Message-ID: <20190613143600.ldcqfw4s3t2pxh2y@shell.armlinux.org.uk>
References: <20190613132850.GC4863@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190613132850.GC4863@kroah.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ReoT/ErO4qSLKJ/0iGpYNZoasTma5fmaOb9/vv/qVdU=; b=Xp2ec39HET/LyMc2r+M8K14L1
 5gnzLkHlYB5/6l8zDonMW4P94MXnUYXRak6s+T33nj1s0B2fta3SV0tmzqWRbYvP+bY07DRd8OlNi
 RgvHEsTM7SvhSo0SwTrLe+uvLv6qjb2PuPk8VFXgGiiH5n/ZbbtCqviPa7/z5O3wPDSsXiRdeFKCc
 PYDuy5eJqaYHrkMG/lcu57kQhKFWIK8Ah4Dnmf2BM+gvGPYzoS6BAvI+R8qZzmPXF8pMb11g/MauJ
 iFYMPoEdTKpft5q5g3LycjGyGO92TveWE90fe42kn+smFyvKsaqndmVX8hTYNJChvjYEX8aojv7vM
 r7QkNeaCQ==;
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDM6Mjg6NTBQTSArMDIwMCwgR3JlZyBLcm9haC1IYXJ0
bWFuIHdyb3RlOgo+IFdoZW4gY2FsbGluZyBkZWJ1Z2ZzIGZ1bmN0aW9ucywgdGhlcmUgaXMgbm8g
bmVlZCB0byBldmVyIGNoZWNrIHRoZQo+IHJldHVybiB2YWx1ZS4gIFRoZSBmdW5jdGlvbiBjYW4g
d29yayBvciBub3QsIGJ1dCB0aGUgY29kZSBsb2dpYyBzaG91bGQKPiBuZXZlciBkbyBzb21ldGhp
bmcgZGlmZmVyZW50IGJhc2VkIG9uIHRoaXMuCgpQbGVhc2UgZG9uJ3QgbWVyZ2UgdGhpcyBwYXRj
aCAtIEkgaGF2ZSBhIGNoYW5nZSB0aGF0IGNvbmZsaWN0cyB3aXRoIHRoaXMKd2hpY2ggc3dpdGNo
ZXMgdXMgb3ZlciB0byB1c2luZyBkcm1fZGVidWdmc19jcmVhdGVfZmlsZXMoKSwgdGhlcmVieQpl
bGltaW5hdGluZyB0aGlzIGNvZGUuCgo+IAo+IENjOiBSdXNzZWxsIEtpbmcgPGxpbnV4QGFybWxp
bnV4Lm9yZy51az4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+IENjOiBE
YW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBs
aW51eGZvdW5kYXRpb24ub3JnPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYXJtYWRhL2FybWFk
YV9kZWJ1Z2ZzLmMgfCAxNCArKysrLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FybWFkYS9hcm1hZGFfZGVidWdmcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FybWFkYS9hcm1h
ZGFfZGVidWdmcy5jCj4gaW5kZXggNjc1OGMzYTgzZGUyLi5hZWMxZTczNzIzNzEgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybWFkYS9hcm1hZGFfZGVidWdmcy5jCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FybWFkYS9hcm1hZGFfZGVidWdmcy5jCj4gQEAgLTEwOSw3ICsxMDksNiBA
QCBzdGF0aWMgc3RydWN0IGRybV9pbmZvX2xpc3QgYXJtYWRhX2RlYnVnZnNfbGlzdFtdID0gewo+
ICAKPiAgaW50IGFybWFkYV9kcm1fZGVidWdmc19pbml0KHN0cnVjdCBkcm1fbWlub3IgKm1pbm9y
KQo+ICB7Cj4gLQlzdHJ1Y3QgZGVudHJ5ICpkZTsKPiAgCWludCByZXQ7Cj4gIAo+ICAJcmV0ID0g
ZHJtX2RlYnVnZnNfY3JlYXRlX2ZpbGVzKGFybWFkYV9kZWJ1Z2ZzX2xpc3QsCj4gQEAgLTExOCwx
NSArMTE3LDEwIEBAIGludCBhcm1hZGFfZHJtX2RlYnVnZnNfaW5pdChzdHJ1Y3QgZHJtX21pbm9y
ICptaW5vcikKPiAgCWlmIChyZXQpCj4gIAkJcmV0dXJuIHJldDsKPiAgCj4gLQlkZSA9IGRlYnVn
ZnNfY3JlYXRlX2ZpbGUoInJlZyIsIFNfSUZSRUcgfCBTX0lSVVNSLAo+IC0JCQkJIG1pbm9yLT5k
ZWJ1Z2ZzX3Jvb3QsIG1pbm9yLT5kZXYsICZmb3BzX3JlZ19yKTsKPiAtCWlmICghZGUpCj4gLQkJ
cmV0dXJuIC1FTk9NRU07Cj4gLQo+IC0JZGUgPSBkZWJ1Z2ZzX2NyZWF0ZV9maWxlKCJyZWdfd3Ii
LCBTX0lGUkVHIHwgU19JV1VTUiwKPiAtCQkJCSBtaW5vci0+ZGVidWdmc19yb290LCBtaW5vci0+
ZGV2LCAmZm9wc19yZWdfdyk7Cj4gLQlpZiAoIWRlKQo+IC0JCXJldHVybiAtRU5PTUVNOwo+ICsJ
ZGVidWdmc19jcmVhdGVfZmlsZSgicmVnIiwgU19JRlJFRyB8IFNfSVJVU1IsIG1pbm9yLT5kZWJ1
Z2ZzX3Jvb3QsCj4gKwkJCSAgICBtaW5vci0+ZGV2LCAmZm9wc19yZWdfcik7Cj4gKwlkZWJ1Z2Zz
X2NyZWF0ZV9maWxlKCJyZWdfd3IiLCBTX0lGUkVHIHwgU19JV1VTUiwgbWlub3ItPmRlYnVnZnNf
cm9vdCwKPiArCQkJICAgIG1pbm9yLT5kZXYsICZmb3BzX3JlZ193KTsKPiAgCj4gIAlyZXR1cm4g
MDsKPiAgfQo+IC0tIAo+IDIuMjIuMAo+IAo+IAoKLS0gClJNSydzIFBhdGNoIHN5c3RlbTogaHR0
cHM6Ly93d3cuYXJtbGludXgub3JnLnVrL2RldmVsb3Blci9wYXRjaGVzLwpGVFRDIGJyb2FkYmFu
ZCBmb3IgMC44bWlsZSBsaW5lIGluIHN1YnVyYmlhOiBzeW5jIGF0IDEyLjFNYnBzIGRvd24gNjIy
a2JwcyB1cApBY2NvcmRpbmcgdG8gc3BlZWR0ZXN0Lm5ldDogMTEuOU1icHMgZG93biA1MDBrYnBz
IHVwCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
