Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CED93F396A
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 21:17:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 667476E13F;
	Thu,  7 Nov 2019 20:17:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A12796E13F
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 20:17:50 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205393] [amdgpu powerplay] vega10: custom pp_table, AVFS
 accidentally reenabled after display powersave
Date: Thu, 07 Nov 2019 20:17:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: trivial
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-205393-2300-PRRqP53Dt0@https.bugzilla.kernel.org/>
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
b21tZW50ICM1IGZyb20gQWxleCBEZXVjaGVyIChhbGV4ZGV1Y2hlckBnbWFpbC5jb20pIC0tLQoo
SW4gcmVwbHkgdG8gaGFybzQxIGZyb20gY29tbWVudCAjNCkKPiBZZXMsIHlvdXIgcGF0Y2ggd29y
a3MgYW5kIGhhcyB0aGUgc2FtZSBlZmZlY3QsIGFwcGFyZW50bHkuCj4gCj4gV2hhdCBjb25mdXNl
ZCBtZSBhbmQgdGhlIHJlYXNvbiB3aHkgaSBwcmVmZXJlZCB0byBsZWF2ZSB0aGUKPiB2ZWdhMTBf
dXBkYXRlX2F2ZnMoKSBjYWxsIGJlZm9yZSB0aGUgZmxhZyBtb2RpZmljYXRpb24sIHdhcyB0aGUg
Y29kZSBpbnNpZGUKPiB2ZWdhMTBfdXBkYXRlX2F2ZnMoKToKPiAKPiBzdGF0aWMgaW50IHZlZ2Ex
MF91cGRhdGVfYXZmcyhzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyKQo+IHsKPiAgICAgICBzdHJ1Y3Qg
dmVnYTEwX2h3bWdyICpkYXRhID0gaHdtZ3ItPmJhY2tlbmQ7Cj4gCj4gICAgICAgaWYgKGRhdGEt
Pm5lZWRfdXBkYXRlX2RwbV90YWJsZSAmIERQTVRBQkxFX09EX1VQREFURV9WRERDKSB7Cj4gICAg
ICAgICAgICAgICB2ZWdhMTBfYXZmc19lbmFibGUoaHdtZ3IsIGZhbHNlKTsKPiAgICAgICB9IGVs
c2UgaWYgKGRhdGEtPm5lZWRfdXBkYXRlX2RwbV90YWJsZSkgewo+ICAgICAgICAgICAgICAgdmVn
YTEwX2F2ZnNfZW5hYmxlKGh3bWdyLCBmYWxzZSk7Cj4gICAgICAgICAgICAgICB2ZWdhMTBfYXZm
c19lbmFibGUoaHdtZ3IsIHRydWUpOwo+ICAgICAgIH0gZWxzZSB7Cj4gICAgICAgICAgICAgICB2
ZWdhMTBfYXZmc19lbmFibGUoaHdtZ3IsIHRydWUpOwo+ICAgICAgIH0KPiAKPiAgICAgICByZXR1
cm4gMDsKPiB9Cj4gCj4gSGVyZSBpcyBhIGRpc2FibGUvZW5hYmxlIHNlcXVlbmNlIGluc2VydGVk
LCBwZXJoYXBzIGZvciBhIHJlYXNvbj8KCkl0J3MgbmVlZGVkIHRvIGRpc2FibGUgdGhlIGN1cnJl
bnQgQUZWUyBzZXR0aW5ncyBiZWZvcmUgcmVhcHBseWluZyB0aGUgbmV3Cm9uZXMuICBUaGF0IHNo
b3VsZG4ndCBiZSBuZWNlc3Nhcnkgd2l0aCB0aGUgRFBNVEFCTEVfT0RfVVBEQVRFX1ZEREMgZmxh
ZyBzZXQKYmVjYXVzZSBpbiB0aGF0IGNhc2UsIHdlIGp1c3QgZGlzYWJsZSBBVkZTLgoKLS0gCllv
dSBhcmUgcmVjZWl2aW5nIHRoaXMgbWFpbCBiZWNhdXNlOgpZb3UgYXJlIHdhdGNoaW5nIHRoZSBh
c3NpZ25lZSBvZiB0aGUgYnVnLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
