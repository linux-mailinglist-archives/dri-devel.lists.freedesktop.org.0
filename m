Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC50A1FF493
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jun 2020 16:21:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23A356E1B6;
	Thu, 18 Jun 2020 14:21:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id A37796E1B6
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jun 2020 14:21:08 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0D4B2101E;
 Thu, 18 Jun 2020 07:21:08 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E1CDE3F6CF;
 Thu, 18 Jun 2020 07:21:07 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id AB6D7682B9C; Thu, 18 Jun 2020 15:21:06 +0100 (BST)
Date: Thu, 18 Jun 2020 15:21:06 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Colin Ian King <colin.king@canonical.com>
Subject: Re: [PATCH] drm/arm: fix unintentional integer overflow on left shift
Message-ID: <20200618142106.GK159988@e110455-lin.cambridge.arm.com>
References: <20200618100400.11464-1-colin.king@canonical.com>
 <20200618121405.GJ159988@e110455-lin.cambridge.arm.com>
 <5d08fbec-75d8-d9a9-af61-e6ab98e77c80@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5d08fbec-75d8-d9a9-af61-e6ab98e77c80@canonical.com>
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMTgsIDIwMjAgYXQgMDE6NTA6MzRQTSArMDEwMCwgQ29saW4gSWFuIEtpbmcg
d3JvdGU6Cj4gT24gMTgvMDYvMjAyMCAxMzoxNCwgTGl2aXUgRHVkYXUgd3JvdGU6Cj4gPiBPbiBU
aHUsIEp1biAxOCwgMjAyMCBhdCAxMTowNDowMEFNICswMTAwLCBDb2xpbiBLaW5nIHdyb3RlOgo+
ID4+IEZyb206IENvbGluIElhbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+Cj4gPiAK
PiA+IEhpIENvbGluLAo+ID4gCj4gPj4KPiA+PiBTaGlmdGluZyB0aGUgaW50ZWdlciB2YWx1ZSAx
IGlzIGV2YWx1YXRlZCB1c2luZyAzMi1iaXQgYXJpdGhtZXRpYwo+ID4+IGFuZCB0aGVuIHVzZWQg
aW4gYW4gZXhwcmVzc2lvbiB0aGF0IGV4cGVjdHMgYSBsb25nIHZhbHVlIGxlYWRzIHRvCj4gPj4g
YSBwb3RlbnRpYWwgaW50ZWdlciBvdmVyZmxvdy4KPiA+IAo+ID4gSSdtIGFmcmFpZCB0aGlzIGV4
cGxhbmF0aW9uIG1ha2VzIG5vIHNlbnNlIHRvIG1lLiBEbyB5b3UgY2FyZSB0byBleHBsYWluIGJl
dHRlciB3aGF0Cj4gPiB5b3UgdGhpbmsgdGhlIGlzc3VlIGlzPyBJZiB0aGUgc2hpZnQgaXMgZG9u
ZSBhcyAzMi1iaXQgYXJpdGhtZXRpYyBhbmQgdGhlbiBwcm9tb3RlZAo+ID4gdG8gbG9uZyBob3cg
ZG9lcyB0aGUgb3ZlcmZsb3cgaGFwcGVuPwo+IAo+IFRoZSBzaGlmdCBpcyBwZXJmb3JtZWQgdXNp
bmcgMzIgYml0IHNpZ25lZCBtYXRoIGFuZCB0aGVuIGFzc2lnbmVkIHRvIGFuCj4gdW5zaWduZWQg
NjQgYml0IGxvbmcuIFRoaXMgaWYgdGhlIHNoaWZ0IGlzIDMxIGJpdHMgdGhlbiB0aGUgc2lnbmVk
IGludAo+IGNvbnZlcnNpb24gb2YgMHg4MDAwMDAwMCB0byB1bnNpZ25lZCBsb25nIGJlY29tZXMg
MHhmZmZmZmZmZjgwMDAwMDAwLgo+IElmIHRoZSBzaGlmdCBpcyBtb3JlIHRoYW4gMzIgYml0cyB0
aGVuIHJlc3VsdCBvdmVyZmxvd3MgYW5kIGJlY29tZXMgMHgwLgoKWW91IGFyZSByaWdodCwgSSd2
ZSBtaXNzZWQgdGhlIGZhY3QgdGhhdCBpdCBpcyBzaWduZWQgbWF0aC4gTm90IHZlcnkgbGlrZWx5
IHRoYXQKd2UgYXJlIGdvaW5nIHRvIGV2ZXIgaGF2ZSAzMCBvciBtb3JlIENSVENzIGluIHRoZSBk
cml2ZXIsIGJ1dCBDb3Zlcml0eSBoYXMgbm8Kd2F5IG9mIGtub3dpbmcgdGhhdC4KCkFja2VkLWJ5
OiBMaXZpdSBEdWRhdSA8bGl2aXUuZHVkYXVAYXJtLmNvbT4KCkkgd2lsbCBwdWxsIHRoaXMgaW50
byBkcm0tbWlzYy1uZXh0IHRvZGF5LgoKQmVzdCByZWdhcmRzLApMaXZpdQoKPiAKPiBDb2xpbgo+
IAo+ID4gCj4gPiBCZXN0IHJlZ2FyZHMsCj4gPiBMaXZpdQo+ID4gCj4gPj4gRml4IHRoaXMgYnkg
dXNpbmcgdGhlIEJJVCBtYWNybyB0bwo+ID4+IHBlcmZvcm0gdGhlIHNoaWZ0IHRvIGF2b2lkIHRo
ZSBvdmVyZmxvdy4KPiA+Pgo+ID4+IEFkZHJlc3Nlcy1Db3Zlcml0eTogKCJVbmludGVudGlvbmFs
IGludGVnZXIgb3ZlcmZsb3ciKQo+ID4+IEZpeGVzOiBhZDQ5Zjg2MDJmZTggKCJkcm0vYXJtOiBB
ZGQgc3VwcG9ydCBmb3IgTWFsaSBEaXNwbGF5IFByb2Nlc3NvcnMiKQo+ID4+IFNpZ25lZC1vZmYt
Ynk6IENvbGluIElhbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+Cj4gPj4gLS0tCj4g
Pj4gIGRyaXZlcnMvZ3B1L2RybS9hcm0vbWFsaWRwX3BsYW5lcy5jIHwgMiArLQo+ID4+ICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+Pgo+ID4+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL21hbGlkcF9wbGFuZXMuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hcm0vbWFsaWRwX3BsYW5lcy5jCj4gPj4gaW5kZXggMzc3MTVjYzYwNjRlLi5hYjQ1YWM0
NDUwNDUgMTAwNjQ0Cj4gPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9tYWxpZHBfcGxhbmVz
LmMKPiA+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL21hbGlkcF9wbGFuZXMuYwo+ID4+IEBA
IC05MjgsNyArOTI4LDcgQEAgaW50IG1hbGlkcF9kZV9wbGFuZXNfaW5pdChzdHJ1Y3QgZHJtX2Rl
dmljZSAqZHJtKQo+ID4+ICAJY29uc3Qgc3RydWN0IG1hbGlkcF9od19yZWdtYXAgKm1hcCA9ICZt
YWxpZHAtPmRldi0+aHctPm1hcDsKPiA+PiAgCXN0cnVjdCBtYWxpZHBfcGxhbmUgKnBsYW5lID0g
TlVMTDsKPiA+PiAgCWVudW0gZHJtX3BsYW5lX3R5cGUgcGxhbmVfdHlwZTsKPiA+PiAtCXVuc2ln
bmVkIGxvbmcgY3J0Y3MgPSAxIDw8IGRybS0+bW9kZV9jb25maWcubnVtX2NydGM7Cj4gPj4gKwl1
bnNpZ25lZCBsb25nIGNydGNzID0gQklUKGRybS0+bW9kZV9jb25maWcubnVtX2NydGMpOwo+ID4+
ICAJdW5zaWduZWQgbG9uZyBmbGFncyA9IERSTV9NT0RFX1JPVEFURV8wIHwgRFJNX01PREVfUk9U
QVRFXzkwIHwgRFJNX01PREVfUk9UQVRFXzE4MCB8Cj4gPj4gIAkJCSAgICAgIERSTV9NT0RFX1JP
VEFURV8yNzAgfCBEUk1fTU9ERV9SRUZMRUNUX1ggfCBEUk1fTU9ERV9SRUZMRUNUX1k7Cj4gPj4g
IAl1bnNpZ25lZCBpbnQgYmxlbmRfY2FwcyA9IEJJVChEUk1fTU9ERV9CTEVORF9QSVhFTF9OT05F
KSB8Cj4gPj4gLS0gCj4gPj4gMi4yNy4wLnJjMAo+ID4+Cj4gPiAKPiAKPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKCi0tIAo9PT09PT09PT09PT09
PT09PT09PQp8IEkgd291bGQgbGlrZSB0byB8CnwgZml4IHRoZSB3b3JsZCwgIHwKfCBidXQgdGhl
eSdyZSBub3QgfAp8IGdpdmluZyBtZSB0aGUgICB8CiBcIHNvdXJjZSBjb2RlISAgLwogIC0tLS0t
LS0tLS0tLS0tLQogICAgwq9cXyjjg4QpXy/CrwpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
