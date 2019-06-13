Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB03A4375F
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 16:52:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B5CE88FE1;
	Thu, 13 Jun 2019 14:52:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id C80DB88FE1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 14:52:23 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 79C2C367;
 Thu, 13 Jun 2019 07:52:23 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 59A693F718;
 Thu, 13 Jun 2019 07:52:23 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id 14B26682189; Thu, 13 Jun 2019 15:52:22 +0100 (BST)
Date: Thu, 13 Jun 2019 15:52:22 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] malidp: no need to check return value of debugfs_create
 functions
Message-ID: <20190613145221.GP4173@e110455-lin.cambridge.arm.com>
References: <20190613132829.GB4863@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190613132829.GB4863@kroah.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
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

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDM6Mjg6MjlQTSArMDIwMCwgR3JlZyBLcm9haC1IYXJ0
bWFuIHdyb3RlOgo+IFdoZW4gY2FsbGluZyBkZWJ1Z2ZzIGZ1bmN0aW9ucywgdGhlcmUgaXMgbm8g
bmVlZCB0byBldmVyIGNoZWNrIHRoZQo+IHJldHVybiB2YWx1ZS4gIFRoZSBmdW5jdGlvbiBjYW4g
d29yayBvciBub3QsIGJ1dCB0aGUgY29kZSBsb2dpYyBzaG91bGQKPiBuZXZlciBkbyBzb21ldGhp
bmcgZGlmZmVyZW50IGJhc2VkIG9uIHRoaXMuCgpJIHJlbWVtYmVyIHdoZW4gd3JpdGluZyB0aGlz
IGNvZGUgYW5kIHRlc3Rpbmcgbm90IGZ1bGx5IGNvbXBsZXRlIGNvZGUgdGhhdCBsZWZ0Cm5vZGVz
IGFyb3VuZCBvbiByZW1vdmluZyB0aGUgbW9kdWxlIHRoYXQgdGhlcmUgd2VyZSBlcnJvcnMgYmVp
bmcgcmV0dXJuZWQgYnkKZGVidWdmc19jcmVhdGVfZmlsZSgpLiBIYXMgdGhhdCBjaGFuZ2VkIHNp
bmNlIDIgeWVhcnMgYWdvPyA6KQoKPiAKPiBDYzogTGl2aXUgRHVkYXUgPGxpdml1LmR1ZGF1QGFy
bS5jb20+Cj4gQ2M6IEJyaWFuIFN0YXJrZXkgPGJyaWFuLnN0YXJrZXlAYXJtLmNvbT4KPiBDYzog
RGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5p
ZWxAZmZ3bGwuY2g+Cj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBTaWdu
ZWQtb2ZmLWJ5OiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3Jn
PgoKQWNrZWQtYnk6IExpdml1IER1ZGF1IDxsaXZpdS5kdWRhdUBhcm0uY29tPgoKSSdsbCBwdWxs
IGl0IGludG8gdGhlIG1hbGlkcCB0cmVlLgoKQmVzdCByZWdhcmRzLApMaXZpdQoKPiAtLS0KPiAg
ZHJpdmVycy9ncHUvZHJtL2FybS9tYWxpZHBfZHJ2LmMgfCAxMSArKy0tLS0tLS0tLQo+ICAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL21hbGlkcF9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
cm0vbWFsaWRwX2Rydi5jCj4gaW5kZXggMjE3MjVjOWI5ZjVlLi43ZDczMjQyM2Q3MGQgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9tYWxpZHBfZHJ2LmMKPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vYXJtL21hbGlkcF9kcnYuYwo+IEBAIC01NDIsMTkgKzU0MiwxMiBAQCBzdGF0aWMg
Y29uc3Qgc3RydWN0IGZpbGVfb3BlcmF0aW9ucyBtYWxpZHBfZGVidWdmc19mb3BzID0gewo+ICBz
dGF0aWMgaW50IG1hbGlkcF9kZWJ1Z2ZzX2luaXQoc3RydWN0IGRybV9taW5vciAqbWlub3IpCj4g
IHsKPiAgCXN0cnVjdCBtYWxpZHBfZHJtICptYWxpZHAgPSBtaW5vci0+ZGV2LT5kZXZfcHJpdmF0
ZTsKPiAtCXN0cnVjdCBkZW50cnkgKmRlbnRyeSA9IE5VTEw7Cj4gIAo+ICAJbWFsaWRwX2Vycm9y
X3N0YXRzX2luaXQoJm1hbGlkcC0+ZGVfZXJyb3JzKTsKPiAgCW1hbGlkcF9lcnJvcl9zdGF0c19p
bml0KCZtYWxpZHAtPnNlX2Vycm9ycyk7Cj4gIAlzcGluX2xvY2tfaW5pdCgmbWFsaWRwLT5lcnJv
cnNfbG9jayk7Cj4gLQlkZW50cnkgPSBkZWJ1Z2ZzX2NyZWF0ZV9maWxlKCJkZWJ1ZyIsCj4gLQkJ
CQkgICAgIFNfSVJVR08gfCBTX0lXVVNSLAo+IC0JCQkJICAgICBtaW5vci0+ZGVidWdmc19yb290
LCBtaW5vci0+ZGV2LAo+IC0JCQkJICAgICAmbWFsaWRwX2RlYnVnZnNfZm9wcyk7Cj4gLQlpZiAo
IWRlbnRyeSkgewo+IC0JCURSTV9FUlJPUigiQ2Fubm90IGNyZWF0ZSBkZWJ1ZyBmaWxlXG4iKTsK
PiAtCQlyZXR1cm4gLUVOT01FTTsKPiAtCX0KPiArCWRlYnVnZnNfY3JlYXRlX2ZpbGUoImRlYnVn
IiwgU19JUlVHTyB8IFNfSVdVU1IsIG1pbm9yLT5kZWJ1Z2ZzX3Jvb3QsCj4gKwkJCSAgICBtaW5v
ci0+ZGV2LCAmbWFsaWRwX2RlYnVnZnNfZm9wcyk7Cj4gIAlyZXR1cm4gMDsKPiAgfQo+ICAKPiAt
LSAKPiAyLjIyLjAKPiAKCi0tIAo9PT09PT09PT09PT09PT09PT09PQp8IEkgd291bGQgbGlrZSB0
byB8CnwgZml4IHRoZSB3b3JsZCwgIHwKfCBidXQgdGhleSdyZSBub3QgfAp8IGdpdmluZyBtZSB0
aGUgICB8CiBcIHNvdXJjZSBjb2RlISAgLwogIC0tLS0tLS0tLS0tLS0tLQogICAgwq9cXyjjg4Qp
Xy/CrwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
