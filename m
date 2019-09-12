Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2440AB0F1D
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 14:51:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 055166ED2A;
	Thu, 12 Sep 2019 12:51:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0AC86ED2A
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 12:51:13 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204683] amdgpu: ring sdma0 timeout
Date: Thu, 12 Sep 2019 12:51:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mh@familie-heinz.name
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204683-2300-vXi6whVIe8@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204683-2300@https.bugzilla.kernel.org/>
References: <bug-204683-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQ2ODMKCi0tLSBD
b21tZW50ICM5IGZyb20gTWF0dGhpYXMgSGVpbnogKG1oQGZhbWlsaWUtaGVpbnoubmFtZSkgLS0t
CkEgc21hbGwgdXBkYXRlLgoKSSBtYW5hZ2VkIHRvIGdvIGRvd24gZXZlbiBmdXJ0aGVyLiBJJ20g
Y3VycmVudGx5IGF0IGU2ZDI0MjEzNDNhNyBpbiBkcm0tbmV4dAphbmQgSSBzZWUgdGhlIGZvbGxv
d2luZyBlcnJvcjoKClNlcCAxMiAxNDozMjo0NCBlZ2FsaXRlIGtlcm5lbDogW2RybTpkcm1fYXRv
bWljX2hlbHBlcl93YWl0X2Zvcl9mbGlwX2RvbmUKW2RybV9rbXNfaGVscGVyXV0gKkVSUk9SKiBb
Q1JUQzo0NzpjcnRjLTBdIGZsaXBfZG9uZSB0aW1lZCBvdXQKU2VwIDEyIDE0OjMyOjQ0IGVnYWxp
dGUga2VybmVsOiBbZHJtOmFtZGdwdV9qb2JfdGltZWRvdXQgW2FtZGdwdV1dICpFUlJPUiogcmlu
ZwpnZnggdGltZW91dCwgc2lnbmFsZWQgc2VxPTEwMjMwNDIsIGVtaXR0ZWQgc2VxPTEwMjMwNDMK
U2VwIDEyIDE0OjMyOjQ0IGVnYWxpdGUga2VybmVsOiBbZHJtOmFtZGdwdV9qb2JfdGltZWRvdXQg
W2FtZGdwdV1dICpFUlJPUioKUHJvY2VzcyBpbmZvcm1hdGlvbjogcHJvY2VzcyA3RGF5c1RvRGll
Lng4Nl8gcGlkIDY2OTYgdGhyZWFkIDdEYXlzVG9EaWU6Y3MwIHBpZAo2Njk4CgpOb3cgaXQgbG9v
a3MgYSBsb3QgbGlrZSAjMjAxOTU3LCBidXQgSSBoYXZlIG5vIHByb2JsZW1zIHdpdGgga2VybmVs
cyBiZWZvcmUgYW5kCjUuMC4gSXQgc3RhcnRlZCB3aXRoIDUuMS4gU28gSSdtIG5vdCBzdXJlIGhv
dyBzaW1pbGFyIGl0IGlzLgoKCkkgaGF2ZSBvbmUgbGFzdCBpZGVhIHdoYXQgdG8gZG8uIFRoZSBj
b21taXQgYmVmb3JlIGU2ZDI0MjEzNDNhNyByZXN1bHRzIGluIGEKc2ltaWxhciBwcm9ibGVtLCBi
dXQgdGhlIGRpc3BsYXkgZG9lc24ndCBnbyBibGFuayBhbmQgdG8gc3RhbmRieS4gT25seSB0aGUK
cGljdHVyZSBmcmVlemVzIGFuZCB0aGF0J3MgaXQuCkkgd2lsbCB0cnkgdG8gZmluZCB0aGUgY29t
bWl0IHRoYXQgcmVzdWx0cyBpbiB0aGlzIGJ1ZyBhbmQgdGhlbiBzZWUsIGlmIHRoZQprZXJuZWwg
b2YgdGhlIGNvbW1pdCBiZWZvcmUgdGhhdCBvbmUgc3RpbGwgaGFzIG15IG1haW4gcHJvYmxlbSBp
biBpdC4gSWYgbm90CkknbGwgcG9zdCB0aGUgcmFuZ2UsIHByb2JhYmx5IHNvbWV3aGVyZSBpbmJl
dHdlZW4gaXMgdGhlIGVycm9yIGl0c2VsZiBoaWRkZW4uCk90aGVyd2lzZSB0ZXN0aW5nIGlzIG5v
dCBwb3NzaWJsZSwgc2luY2UgaXQgZnJlZXplcyBwcmV0dHkgZmFzdCBhbmQgdGhlIHJpbmcKdGlt
ZW91dCBidWcgdGFrZXMgdXAgdG8gNDUgbWludXRlcyB0byBhcHBlYXIuCgpTaW5jZSBJJ20gYXQg
dGhlIDQwdGgga2VybmVscyBzbyBmYXIsIGFueSBoZWxwIG9yIGV2ZW4gYSBoaW50IGlzIGhpZ2hs
eQphcHByZWNpYXRlZC4gKEkgY291bGQgdXNlIGEgZmFzdGVyIHRlc3Rpbmcgc29sdXRpb24uKQoK
LS0gCllvdSBhcmUgcmVjZWl2aW5nIHRoaXMgbWFpbCBiZWNhdXNlOgpZb3UgYXJlIHdhdGNoaW5n
IHRoZSBhc3NpZ25lZSBvZiB0aGUgYnVnLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
