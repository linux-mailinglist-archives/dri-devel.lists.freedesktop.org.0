Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 805FD87979
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 14:11:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E4826EDF0;
	Fri,  9 Aug 2019 12:11:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CCBD6EDF0
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2019 12:11:34 +0000 (UTC)
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1hw3k5-0006WI-1q; Fri, 09 Aug 2019 14:11:33 +0200
Message-ID: <1565352692.2323.63.camel@pengutronix.de>
Subject: Re: [PATCH] etnaviv: perfmon: fix total and idle HI cyleces readout
From: Lucas Stach <l.stach@pengutronix.de>
To: Christian Gmeiner <christian.gmeiner@gmail.com>, 
 dri-devel@lists.freedesktop.org
Date: Fri, 09 Aug 2019 14:11:32 +0200
In-Reply-To: <20190731213034.3984-1-christian.gmeiner@gmail.com>
References: <20190731213034.3984-1-christian.gmeiner@gmail.com>
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::2a
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: etnaviv@lists.freedesktop.org, cphealy@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gTWl0dHdvY2gsIGRlbiAzMS4wNy4yMDE5LCAyMzozMCArMDIwMCBzY2hyaWViIENocmlzdGlh
biBHbWVpbmVyOgo+IEFzIHNlZW4gYXQgQ29kZUF1cm9yYSdzIGxpbnV4LWlteCBnaXQgcmVwbyBp
biBpbXhfNC4xOS4zNV8xLjAuMAo+IGJyYW5jaC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3Rp
YW4gR21laW5lciA8Y2hyaXN0aWFuLmdtZWluZXJAZ21haWwuY29tPgoKVGhhbmtzLCBhcHBsaWVk
LgoKUmVnYXJkcywKTHVjYXMKCj4gLS0tCj4gwqBkcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5h
dml2X3BlcmZtb24uYyB8IDQ0ICsrKysrKysrKysrKysrKysrLS0KPiAtLS0tCj4gwqAxIGZpbGUg
Y2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfcGVyZm1vbi5jCj4gYi9kcml2ZXJz
L2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X3BlcmZtb24uYwo+IGluZGV4IDA2ZTZkM2VlMWMzNC4u
M2M3NGIxMjczZWE5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2
aXZfcGVyZm1vbi5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9wZXJm
bW9uLmMKPiBAQCAtNCw2ICs0LDcgQEAKPiDCoCAqIENvcHlyaWdodCAoQykgMjAxNyBab2RpYWMg
SW5mbGlnaHQgSW5ub3ZhdGlvbnMKPiDCoCAqLwo+IMKgCj4gKyNpbmNsdWRlICJjb21tb24ueG1s
LmgiCj4gwqAjaW5jbHVkZSAiZXRuYXZpdl9ncHUuaCIKPiDCoCNpbmNsdWRlICJldG5hdml2X3Bl
cmZtb24uaCIKPiDCoCNpbmNsdWRlICJzdGF0ZV9oaS54bWwuaCIKPiBAQCAtMzUsMTMgKzM2LDYg
QEAgc3RydWN0IGV0bmF2aXZfcG1fZG9tYWluX21ldGEgewo+IMKgCXUzMiBucl9kb21haW5zOwo+
IMKgfTsKPiDCoAo+IC1zdGF0aWMgdTMyIHNpbXBsZV9yZWdfcmVhZChzdHJ1Y3QgZXRuYXZpdl9n
cHUgKmdwdSwKPiAtCWNvbnN0IHN0cnVjdCBldG5hdml2X3BtX2RvbWFpbiAqZG9tYWluLAo+IC0J
Y29uc3Qgc3RydWN0IGV0bmF2aXZfcG1fc2lnbmFsICpzaWduYWwpCj4gLXsKPiAtCXJldHVybiBn
cHVfcmVhZChncHUsIHNpZ25hbC0+ZGF0YSk7Cj4gLX0KPiAtCj4gwqBzdGF0aWMgdTMyIHBlcmZf
cmVnX3JlYWQoc3RydWN0IGV0bmF2aXZfZ3B1ICpncHUsCj4gwqAJY29uc3Qgc3RydWN0IGV0bmF2
aXZfcG1fZG9tYWluICpkb21haW4sCj4gwqAJY29uc3Qgc3RydWN0IGV0bmF2aXZfcG1fc2lnbmFs
ICpzaWduYWwpCj4gQEAgLTc1LDYgKzY5LDM0IEBAIHN0YXRpYyB1MzIgcGlwZV9yZWdfcmVhZChz
dHJ1Y3QgZXRuYXZpdl9ncHUgKmdwdSwKPiDCoAlyZXR1cm4gdmFsdWU7Cj4gwqB9Cj4gwqAKPiAr
c3RhdGljIHUzMiBoaV90b3RhbF9jeWNsZV9yZWFkKHN0cnVjdCBldG5hdml2X2dwdSAqZ3B1LAo+
ICsJY29uc3Qgc3RydWN0IGV0bmF2aXZfcG1fZG9tYWluICpkb21haW4sCj4gKwljb25zdCBzdHJ1
Y3QgZXRuYXZpdl9wbV9zaWduYWwgKnNpZ25hbCkKPiArewo+ICsJdTMyIHJlZyA9IFZJVlNfSElf
UFJPRklMRV9UT1RBTF9DWUNMRVM7Cj4gKwo+ICsJaWYgKGdwdS0+aWRlbnRpdHkubW9kZWwgPT0g
Y2hpcE1vZGVsX0dDODgwIHx8Cj4gKwkJZ3B1LT5pZGVudGl0eS5tb2RlbCA9PSBjaGlwTW9kZWxf
R0MyMDAwIHx8Cj4gKwkJZ3B1LT5pZGVudGl0eS5tb2RlbCA9PSBjaGlwTW9kZWxfR0MyMTAwKQo+
ICsJCXJlZyA9IFZJVlNfTUNfUFJPRklMRV9DWUNMRV9DT1VOVEVSOwo+ICsKPiArCXJldHVybiBn
cHVfcmVhZChncHUsIHJlZyk7Cj4gK30KPiArCj4gK3N0YXRpYyB1MzIgaGlfdG90YWxfaWRsZV9j
eWNsZV9yZWFkKHN0cnVjdCBldG5hdml2X2dwdSAqZ3B1LAo+ICsJY29uc3Qgc3RydWN0IGV0bmF2
aXZfcG1fZG9tYWluICpkb21haW4sCj4gKwljb25zdCBzdHJ1Y3QgZXRuYXZpdl9wbV9zaWduYWwg
KnNpZ25hbCkKPiArewo+ICsJdTMyIHJlZyA9IFZJVlNfSElfUFJPRklMRV9JRExFX0NZQ0xFUzsK
PiArCj4gKwlpZiAoZ3B1LT5pZGVudGl0eS5tb2RlbCA9PSBjaGlwTW9kZWxfR0M4ODAgfHwKPiAr
CQlncHUtPmlkZW50aXR5Lm1vZGVsID09IGNoaXBNb2RlbF9HQzIwMDAgfHwKPiArCQlncHUtPmlk
ZW50aXR5Lm1vZGVsID09IGNoaXBNb2RlbF9HQzIxMDApCj4gKwkJcmVnID0gVklWU19ISV9QUk9G
SUxFX1RPVEFMX0NZQ0xFUzsKPiArCj4gKwlyZXR1cm4gZ3B1X3JlYWQoZ3B1LCByZWcpOwo+ICt9
Cj4gKwo+IMKgc3RhdGljIGNvbnN0IHN0cnVjdCBldG5hdml2X3BtX2RvbWFpbiBkb21zXzNkW10g
PSB7Cj4gwqAJewo+IMKgCQkubmFtZSA9ICJISSIsCj4gQEAgLTg0LDEzICsxMDYsMTMgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBldG5hdml2X3BtX2RvbWFpbiBkb21zXzNkW10KPiA9IHsKPiDCoAkJ
LnNpZ25hbCA9IChjb25zdCBzdHJ1Y3QgZXRuYXZpdl9wbV9zaWduYWxbXSkgewo+IMKgCQkJewo+
IMKgCQkJCSJUT1RBTF9DWUNMRVMiLAo+IC0JCQkJVklWU19ISV9QUk9GSUxFX1RPVEFMX0NZQ0xF
UywKPiAtCQkJCSZzaW1wbGVfcmVnX3JlYWQKPiArCQkJCTAsCj4gKwkJCQkmaGlfdG90YWxfY3lj
bGVfcmVhZAo+IMKgCQkJfSwKPiDCoAkJCXsKPiDCoAkJCQkiSURMRV9DWUNMRVMiLAo+IC0JCQkJ
VklWU19ISV9QUk9GSUxFX0lETEVfQ1lDTEVTLAo+IC0JCQkJJnNpbXBsZV9yZWdfcmVhZAo+ICsJ
CQkJMCwKPiArCQkJCSZoaV90b3RhbF9pZGxlX2N5Y2xlX3JlYWQKPiDCoAkJCX0sCj4gwqAJCQl7
Cj4gwqAJCQkJIkFYSV9DWUNMRVNfUkVBRF9SRVFVRVNUX1NUQUxMRUQiLApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
