Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FE2F39A4
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 21:39:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 213E66F7A8;
	Thu,  7 Nov 2019 20:39:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E4556F7A8
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 20:39:08 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205393] [amdgpu powerplay] vega10: custom pp_table, AVFS
 accidentally reenabled after display powersave
Date: Thu, 07 Nov 2019 20:39:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: trivial
X-Bugzilla-Severity: normal
X-Bugzilla-Who: haro41@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-205393-2300-6pqiye1ZLG@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205393-2300@https.bugzilla.kernel.org/>
References: <bug-205393-2300@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: mail.kernel.org; dkim=permerror (bad
 message/signature format)
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDUzOTMKCi0tLSBD
b21tZW50ICM2IGZyb20gaGFybzQxQGdteC5kZSAtLS0KKEluIHJlcGx5IHRvIEFsZXggRGV1Y2hl
ciBmcm9tIGNvbW1lbnQgIzUpCj4gKEluIHJlcGx5IHRvIGhhcm80MSBmcm9tIGNvbW1lbnQgIzQp
Cj4gPiBZZXMsIHlvdXIgcGF0Y2ggd29ya3MgYW5kIGhhcyB0aGUgc2FtZSBlZmZlY3QsIGFwcGFy
ZW50bHkuCj4gPiAKPiA+IFdoYXQgY29uZnVzZWQgbWUgYW5kIHRoZSByZWFzb24gd2h5IGkgcHJl
ZmVyZWQgdG8gbGVhdmUgdGhlCj4gPiB2ZWdhMTBfdXBkYXRlX2F2ZnMoKSBjYWxsIGJlZm9yZSB0
aGUgZmxhZyBtb2RpZmljYXRpb24sIHdhcyB0aGUgY29kZSBpbnNpZGUKPiA+IHZlZ2ExMF91cGRh
dGVfYXZmcygpOgo+ID4gCj4gPiBzdGF0aWMgaW50IHZlZ2ExMF91cGRhdGVfYXZmcyhzdHJ1Y3Qg
cHBfaHdtZ3IgKmh3bWdyKQo+ID4gewo+ID4gICAgICAgc3RydWN0IHZlZ2ExMF9od21nciAqZGF0
YSA9IGh3bWdyLT5iYWNrZW5kOwo+ID4gCj4gPiAgICAgICBpZiAoZGF0YS0+bmVlZF91cGRhdGVf
ZHBtX3RhYmxlICYgRFBNVEFCTEVfT0RfVVBEQVRFX1ZEREMpIHsKPiA+ICAgICAgICAgICAgICAg
dmVnYTEwX2F2ZnNfZW5hYmxlKGh3bWdyLCBmYWxzZSk7Cj4gPiAgICAgICB9IGVsc2UgaWYgKGRh
dGEtPm5lZWRfdXBkYXRlX2RwbV90YWJsZSkgewo+ID4gICAgICAgICAgICAgICB2ZWdhMTBfYXZm
c19lbmFibGUoaHdtZ3IsIGZhbHNlKTsKPiA+ICAgICAgICAgICAgICAgdmVnYTEwX2F2ZnNfZW5h
YmxlKGh3bWdyLCB0cnVlKTsKPiA+ICAgICAgIH0gZWxzZSB7Cj4gPiAgICAgICAgICAgICAgIHZl
Z2ExMF9hdmZzX2VuYWJsZShod21nciwgdHJ1ZSk7Cj4gPiAgICAgICB9Cj4gPiAKPiA+ICAgICAg
IHJldHVybiAwOwo+ID4gfQo+ID4gCj4gPiBIZXJlIGlzIGEgZGlzYWJsZS9lbmFibGUgc2VxdWVu
Y2UgaW5zZXJ0ZWQsIHBlcmhhcHMgZm9yIGEgcmVhc29uPwo+IAo+IEl0J3MgbmVlZGVkIHRvIGRp
c2FibGUgdGhlIGN1cnJlbnQgQUZWUyBzZXR0aW5ncyBiZWZvcmUgcmVhcHBseWluZyB0aGUgbmV3
Cj4gb25lcy4gIFRoYXQgc2hvdWxkbid0IGJlIG5lY2Vzc2FyeSB3aXRoIHRoZSBEUE1UQUJMRV9P
RF9VUERBVEVfVkREQyBmbGFnIHNldAo+IGJlY2F1c2UgaW4gdGhhdCBjYXNlLCB3ZSBqdXN0IGRp
c2FibGUgQVZGUy4KCk9rLCB0aGF0IG1ha2VzIHNlbnNlLiBUaGFua3MgZm9yIGNsYXJpZmljYXRp
b24gYW5kIGZvciBhcHBseWluZyB0aGUgZml4LgoKLS0gCllvdSBhcmUgcmVjZWl2aW5nIHRoaXMg
bWFpbCBiZWNhdXNlOgpZb3UgYXJlIHdhdGNoaW5nIHRoZSBhc3NpZ25lZSBvZiB0aGUgYnVnLgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
