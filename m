Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66AFC2AE1FE
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 22:46:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAA7289C6B;
	Tue, 10 Nov 2020 21:46:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA22989C6B
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 21:46:42 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201763] amdgpu: [powerplay] VBIOS did not find boot engine
 clock value in dependency table. Using Memory DPM level 0!
Date: Tue, 10 Nov 2020 21:46:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rbrito@ime.usp.br
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-201763-2300-34uoEWBcRB@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201763-2300@https.bugzilla.kernel.org/>
References: <bug-201763-2300@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDE3NjMKCi0tLSBD
b21tZW50ICMxMSBmcm9tIFJvZ8OpcmlvIEJyaXRvIChyYnJpdG9AaW1lLnVzcC5icikgLS0tCkRl
YXIgTWljaGVsIGFuZCBvdGhlciBwZW9wbGUsCgpTaW5jZSB0aGUgbGFzdCB0aW1lIHRoYXQgSSBy
ZXBvcnRlZCB0aGlzIGJ1ZywgdGhlIGxvY2sgdXBzIGhhdmUgbm90IGhhcHBlbmVkCmFueW1vcmUu
CgpPVE9ILCB0aGUgbWVzc2FnZXMgb24gdGhlIGRtZXNnIGxvZyBwZXJzaXN0LiBJIGNhbiBpbmNs
dWRlIG5ld2VyIGxvZ3MgKGJ1dCBJCmRvbid0IHRoaW5rIHRoYXQgbWFueSB0aGluZ3MgaGF2ZSBj
aGFuZ2VkIHNpbmNlIHRoZW4pLiBKdXN0IGFzIGEgcmVtaW5kZXIsIGhlcmUKaXMgd2hhdCBJJ20g
Z2V0dGluZzoKCi0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAt
IC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0KKC4uLikKWzQ2ODM0MS44MTUzMTJdIGFtZGdwdTog
Y2FuJ3QgZ2V0IHRoZSBtYWMgb2YgNQpbNDY4MzQxLjgxNjMyM10gYW1kZ3B1OiBWQklPUyBkaWQg
bm90IGZpbmQgYm9vdCBlbmdpbmUgY2xvY2sgdmFsdWUgaW4KZGVwZW5kZW5jeSB0YWJsZS4gVXNp
bmcgTWVtb3J5IERQTSBsZXZlbCAwIQpbNDY4MzQ3Ljc5MjMyNl0gYW1kZ3B1OiBWSSBzaG91bGQg
YWx3YXlzIGhhdmUgMiBwZXJmb3JtYW5jZSBsZXZlbHMKKC4uLikKLSAtIC0gLSAtIC0gLSAtIC0g
LSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLQoK
T2YgY291cnNlLCB0aGUgY2F1c2UgbWF5IGJlIGFub3RoZXIgdGhpbmcgZWFsaWVyIGluIHRoZSBs
b2dzLiBTaW5jZSB0aGUgZmlyc3QKdGltZSB0aGF0IEkgcmVwb3J0ZWQgdGhlIGlzc3VlLCBJIHVw
Z3JhZGVkIHRoZSBCSU9TL0Zpcm13YXJlIGZyb20gRGVsbCdzIHNpdGUsCmJ1dCBJJ20gZ3Vlc3Np
bmcgdGhhdCBpdCBpcyB2ZXJ5IGNvbnNlcnZhdGl2ZSBhbmQgb25seSBpbmNsdWRlcyBhbiAidXBk
YXRlZCIKKG5vdCBzbyBtdWNoKSBtaWNyb2NvZGUgZm9yIHRoZSBDUFUgdnVsbmVyYWJpbGl0aWVz
IG9mIGFsbCB0aGVzZSB5ZWFycy4KCkknbSBydW5uaW5nIGFuIHVwLXRvLWRhdGUgRGViaWFuIHRl
c3RpbmcgZGlzdHJpYnV0aW9uLCBidXQgSSBjYW4gcGVyZm9ybSBhbnkKKG5vbi1kZXN0cnVjdGl2
ZSA6LSkpIHRlc3RzIHRoYXQgeW91IHdhbnQgbWUgdG8uCgoKVGhhbmtzLAoKUm9nw6lyaW8gQnJp
dG8uCgotLSAKWW91IGFyZSByZWNlaXZpbmcgdGhpcyBtYWlsIGJlY2F1c2U6CllvdSBhcmUgd2F0
Y2hpbmcgdGhlIGFzc2lnbmVlIG9mIHRoZSBidWcuCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
