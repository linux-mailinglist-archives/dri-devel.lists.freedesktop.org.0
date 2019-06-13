Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF23D43756
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 16:48:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1869E89AB7;
	Thu, 13 Jun 2019 14:48:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 940BE89AB9
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 14:48:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 270C0367;
 Thu, 13 Jun 2019 07:48:48 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 06D423F718;
 Thu, 13 Jun 2019 07:48:48 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id BBAAF682189; Thu, 13 Jun 2019 15:48:46 +0100 (BST)
Date: Thu, 13 Jun 2019 15:48:46 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] komeda: no need to check return value of debugfs_create
 functions
Message-ID: <20190613144846.GO4173@e110455-lin.cambridge.arm.com>
References: <20190613132806.GA4863@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190613132806.GA4863@kroah.com>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDM6Mjg6MDZQTSArMDIwMCwgR3JlZyBLcm9haC1IYXJ0
bWFuIHdyb3RlOgo+IFdoZW4gY2FsbGluZyBkZWJ1Z2ZzIGZ1bmN0aW9ucywgdGhlcmUgaXMgbm8g
bmVlZCB0byBldmVyIGNoZWNrIHRoZQo+IHJldHVybiB2YWx1ZS4gIFRoZSBmdW5jdGlvbiBjYW4g
d29yayBvciBub3QsIGJ1dCB0aGUgY29kZSBsb2dpYyBzaG91bGQKPiBuZXZlciBkbyBzb21ldGhp
bmcgZGlmZmVyZW50IGJhc2VkIG9uIHRoaXMuCj4gCj4gQ2M6ICJKYW1lcyAoUWlhbikgV2FuZyIg
PGphbWVzLnFpYW4ud2FuZ0Bhcm0uY29tPgo+IENjOiBMaXZpdSBEdWRhdSA8bGl2aXUuZHVkYXVA
YXJtLmNvbT4KPiBDYzogQnJpYW4gU3RhcmtleSA8YnJpYW4uc3RhcmtleUBhcm0uY29tPgo+IENj
OiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRh
bmllbEBmZndsbC5jaD4KPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IFNp
Z25lZC1vZmYtYnk6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5v
cmc+CgpSZXZpZXdlZC1ieTogTGl2aXUgRHVkYXUgPGxpdml1LmR1ZGF1QGFybS5jb20+CgpUaGFu
a3MgZm9yIHRoZSBwYXRjaCwgSSdsbCBwdWxsIGl0IGludG8gbWFsaWRwIHRyZWUgKHNoYXJlZCB3
aXRoIGtvbWVkYSkuCgpCZXN0IHJlZ2FyZHMsCkxpdml1Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9k
cm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuYyB8IDMgLS0tCj4gIDEgZmlsZSBjaGFu
Z2VkLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJt
L2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxh
eS9rb21lZGEva29tZWRhX2Rldi5jCj4gaW5kZXggY2EzNTk5ZTRhNGQzLi41ODEwMGVkZjU4ZmEg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFf
ZGV2LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9k
ZXYuYwo+IEBAIC01MSw5ICs1MSw2IEBAIHN0YXRpYyB2b2lkIGtvbWVkYV9kZWJ1Z2ZzX2luaXQo
c3RydWN0IGtvbWVkYV9kZXYgKm1kZXYpCj4gIAkJcmV0dXJuOwo+ICAKPiAgCW1kZXYtPmRlYnVn
ZnNfcm9vdCA9IGRlYnVnZnNfY3JlYXRlX2Rpcigia29tZWRhIiwgTlVMTCk7Cj4gLQlpZiAoSVNf
RVJSX09SX05VTEwobWRldi0+ZGVidWdmc19yb290KSkKPiAtCQlyZXR1cm47Cj4gLQo+ICAJZGVi
dWdmc19jcmVhdGVfZmlsZSgicmVnaXN0ZXIiLCAwNDQ0LCBtZGV2LT5kZWJ1Z2ZzX3Jvb3QsCj4g
IAkJCSAgICBtZGV2LCAma29tZWRhX3JlZ2lzdGVyX2ZvcHMpOwo+ICB9Cj4gLS0gCj4gMi4yMi4w
Cj4gCgotLSAKPT09PT09PT09PT09PT09PT09PT0KfCBJIHdvdWxkIGxpa2UgdG8gfAp8IGZpeCB0
aGUgd29ybGQsICB8CnwgYnV0IHRoZXkncmUgbm90IHwKfCBnaXZpbmcgbWUgdGhlICAgfAogXCBz
b3VyY2UgY29kZSEgIC8KICAtLS0tLS0tLS0tLS0tLS0KICAgIMKvXF8o44OEKV8vwq8KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
