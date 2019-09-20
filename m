Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 366FBB8F0C
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 13:37:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5426E6E02A;
	Fri, 20 Sep 2019 11:37:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AFA76E02A
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2019 11:37:08 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201957] amdgpu: ring gfx timeout
Date: Fri, 20 Sep 2019 11:37:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: anode.dev@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-201957-2300-VY1VbOY7Rw@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201957-2300@https.bugzilla.kernel.org/>
References: <bug-201957-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDE5NTcKCi0tLSBD
b21tZW50ICMxMCBmcm9tIERldiBCYXppbGlvIChhbm9kZS5kZXZAZ21haWwuY29tKSAtLS0KKElu
IHJlcGx5IHRvIFVuZ3VyZWFudSBBbGV4YW5kcnUgZnJvbSBjb21tZW50ICM5KQo+IEp1c3QgZ290
IHNvbWV0aGluZyBzaW1pbGFyIHdoaWxlIHBsYXlpbmcgTGVmdCA0IERlYWQuIFRoZSBzeXN0ZW0g
c2ltcGx5Cj4gZnJvemUgd2l0aCBhbHRlcmVkIGNvbG9ycyBvbiB0aGUgc2NyZWVuIGFuZCB0aGUg
c291bmQganVzdCBsb29waW5nIG92ZXIgdGhlCj4gbGFzdCBzZWNvbmQgb3Igc28uIENhbm5vdCBj
b25maXJtIFNTSCBhY2Nlc3MuCgo+IEtlcm5lbDogNS4wLjAtMjctZ2VuZXJpYwo+IEdQVTogUmFk
ZW9uIFJYNTgwCj4gQ1BVOiBSeXplbiA1IDE2MDB4Cgo1LjAgaXMgdmVyeSBvdXRkYXRlZCBrZXJu
ZWwsIHVzZSBsYXRlc3QgZnJvbSBrZXJuZWwub3JnCgphcyBmb3IgbWUgYWxsIHdvcmtzIHBlcmZl
Y3RseSBpbiA1LjMgKENoaXAgcG9sYXJpcyBSWDU0MCkKZmluYWxseSBJIGhhdmUgbm8gbW9yZSBh
bnkgZXJyb3JzIGxpa2UgdGhlc2Ugb25lczoKLSBFUlJPUiogcmVzdW1lIG9mIElQIGJsb2NrIDx1
dmRfdjZfMD4gZmFpbGVkIC0xMTAKLSBbZHJtXSBGZW5jZSBmYWxsYmFjayB0aW1lciBleHBpcmVk
IG9uIHJpbmcgc2RtYTAKLSBsYXN0IG1lc3NhZ2Ugd2FzIGZhaWxlZCByZXQgaXMgKioKLSBbZHJt
OmFtZGdwdV9qb2JfdGltZWRvdXQgW2FtZGdwdV1dICpFUlJPUiogcmluZyBzZG1hMCB0aW1lb3V0
LCBzaWduYWxlZApzZXEuLi4KLSBJUCBibG9jazpzZG1hX3YzXzAgaXMgaHVuZyEKLSBUaW1lb3V0
LCBidXQgbm8gaGFyZHdhcmUgaGFuZyBkZXRlY3RlZC4KClRlc3RlZCBvbiB5b3V0dWJlIHdpdGgg
SFcgYWNjZWxlcmF0ZWQgdmlkZW8gYW5kIGluIHNldmVyYWwgZ2FtZXMKVGhhbmsgeW91IGd1eXMg
ZnJvbSBBTUQgYSBsb3QsIEkgaGFkIHRvIHdhaXQgMXkrIHRvIGdldCB0aGVzZSBidWdzIGZpeGVk
CgotLSAKWW91IGFyZSByZWNlaXZpbmcgdGhpcyBtYWlsIGJlY2F1c2U6CllvdSBhcmUgd2F0Y2hp
bmcgdGhlIGFzc2lnbmVlIG9mIHRoZSBidWcuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
