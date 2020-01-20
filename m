Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5B9143842
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2020 09:32:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75E6B6EBDB;
	Tue, 21 Jan 2020 08:32:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A64B6EA45
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2020 17:56:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: ezequiel) with ESMTPSA id 1B3482909DB
Message-ID: <9387561825eb193625f8e04081e7814feb590a7e.camel@collabora.com>
Subject: Re: [PATCH] drm: shrinker: Add a prefix on purging logs
From: Ezequiel Garcia <ezequiel@collabora.com>
To: dri-devel@lists.freedesktop.org
Date: Mon, 20 Jan 2020 14:56:18 -0300
In-Reply-To: <20191214162049.10997-1-ezequiel@collabora.com>
References: <20191214162049.10997-1-ezequiel@collabora.com>
Organization: Collabora
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 21 Jan 2020 08:32:00 +0000
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
Cc: David Airlie <airlied@linux.ie>, kernel@collabora.com,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCAyMDE5LTEyLTE0IGF0IDEzOjIwIC0wMzAwLCBFemVxdWllbCBHYXJjaWEgd3JvdGU6
Cj4gSXQncyBub3QgZW50aXJlbHkgb2J2aW91cyB3aHkgdGhlc2UgbWVzc2FnZXMgaGF2ZQo+ICJp
bmZvIiBzZXZlcml0eS4gSW4gYW55IGNhc2UsIGFkZCBhIHByb3BlciBkcml2ZXIgcHJlZml4Cj4g
dG8gZ2l2ZSB0aGUgdXNlciBhIGJpdCBvZiBjb250ZXh0IG9mIHdoZXJlIHRoZXkgYXJlIGNvbWlu
ZyBmcm9tLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEV6ZXF1aWVsIEdhcmNpYSA8ZXplcXVpZWxAY29s
bGFib3JhLmNvbT4KCkdlbnRsZSBwaW5nLgoKVGhhbmtzLApFemVxdWllbAoKPiAtLS0KPiAgZHJp
dmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX3Nocmlua2VyLmMgICAgIHwgMiArKwo+ICBk
cml2ZXJzL2dwdS9kcm0vbXNtL21zbV9nZW1fc2hyaW5rZXIuYyAgICAgICAgICAgfCAyICsrCj4g
IGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9nZW1fc2hyaW5rZXIuYyB8IDIgKysK
PiAgMyBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX3Nocmlua2VyLmMgYi9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9nZW0vaTkxNV9nZW1fc2hyaW5rZXIuYwo+IGluZGV4IDNhOTI2YTg3NTVjNi4uY2Qw
MzcyYTFkOTM2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dl
bV9zaHJpbmtlci5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX3No
cmlua2VyLmMKPiBAQCAtNCw2ICs0LDggQEAKPiAgICogQ29weXJpZ2h0IMKpIDIwMDgtMjAxNSBJ
bnRlbCBDb3Jwb3JhdGlvbgo+ICAgKi8KPiAgCj4gKyNkZWZpbmUgcHJfZm10KGZtdCkgS0JVSUxE
X01PRE5BTUUgIjogIiBmbXQKPiArCj4gICNpbmNsdWRlIDxsaW51eC9vb20uaD4KPiAgI2luY2x1
ZGUgPGxpbnV4L3NjaGVkL21tLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9zaG1lbV9mcy5oPgo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9nZW1fc2hyaW5rZXIuYyBiL2RyaXZl
cnMvZ3B1L2RybS9tc20vbXNtX2dlbV9zaHJpbmtlci5jCj4gaW5kZXggNzIyZDYxNjY4YTk3Li4w
NjIwZDQ0MWEyY2MgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZ2VtX3No
cmlua2VyLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9nZW1fc2hyaW5rZXIuYwo+
IEBAIC00LDYgKzQsOCBAQAo+ICAgKiBBdXRob3I6IFJvYiBDbGFyayA8cm9iZGNsYXJrQGdtYWls
LmNvbT4KPiAgICovCj4gIAo+ICsjZGVmaW5lIHByX2ZtdChmbXQpIEtCVUlMRF9NT0ROQU1FICI6
ICIgZm10Cj4gKwo+ICAjaW5jbHVkZSAibXNtX2Rydi5oIgo+ICAjaW5jbHVkZSAibXNtX2dlbS5o
Igo+ICAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2dl
bV9zaHJpbmtlci5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2dlbV9zaHJp
bmtlci5jCj4gaW5kZXggNDU4ZjBmYTY4MTExLi5iOWQwZTgyMWMzZjYgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2dlbV9zaHJpbmtlci5jCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2dlbV9zaHJpbmtlci5jCj4gQEAgLTYs
NiArNiw4IEBACj4gICAqIEF1dGhvcjogUm9iIENsYXJrIDxyb2JkY2xhcmtAZ21haWwuY29tPgo+
ICAgKi8KPiAgCj4gKyNkZWZpbmUgcHJfZm10KGZtdCkgS0JVSUxEX01PRE5BTUUgIjogIiBmbXQK
PiArCj4gICNpbmNsdWRlIDxsaW51eC9saXN0Lmg+Cj4gIAo+ICAjaW5jbHVkZSA8ZHJtL2RybV9k
ZXZpY2UuaD4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
