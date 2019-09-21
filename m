Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32048BA26A
	for <lists+dri-devel@lfdr.de>; Sun, 22 Sep 2019 14:07:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EEB089FDE;
	Sun, 22 Sep 2019 12:04:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2574F6E075
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Sep 2019 18:31:38 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204241] amdgpu fails to resume from suspend
Date: Sat, 21 Sep 2019 18:31:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andreas.jackisch@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-204241-2300-DjuC3p9ddC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204241-2300@https.bugzilla.kernel.org/>
References: <bug-204241-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQyNDEKCi0tLSBD
b21tZW50ICMxMyBmcm9tIEFuZHJlYXMgSmFja2lzY2ggKGFuZHJlYXMuamFja2lzY2hAZ21haWwu
Y29tKSAtLS0KQ3JlYXRlZCBhdHRhY2htZW50IDI4NTA3OQogIC0tPiBodHRwczovL2J1Z3ppbGxh
Lmtlcm5lbC5vcmcvYXR0YWNobWVudC5jZ2k/aWQ9Mjg1MDc5JmFjdGlvbj1lZGl0Ci92YXIvbG9n
L21lc3NhZ2VzIHcvIGtlcm5lbCA1LjMuMC1nZW50b28KCkFzIHRoZXJlIHdhcyBubyBzdWNjZXNz
IHcvIDUuMi54IGF0IGFsbCBJIHRlc3RlZCA1LjMuMC4gSG93ZXZlciwgdGhlIHN5c3RlbSBkaWQK
bm90IHJlc3VtZSBhZnRlciB0aGUgMm5kIGF0dGVtcHQgd2l0aCBhIGNvbXBhcmFibGUgZmFpbHVy
ZSBtZXNzYWdlLgoKYW1kZ3B1IDAwMDA6MDY6MDAuMDogW2RybTphbWRncHVfcmluZ190ZXN0X2hl
bHBlcl0gKkVSUk9SKiByaW5nIHNkbWEwIHRlc3QKZmFpbGVkICgtMTEwKQoKVGhpcyBpcyBzbGln
aHRseSBkaWZmZXJlbnQgZnJvbSA1LjIueCB3aGVyZSBpdCB3YXMgCgphbWRncHUgMDAwMDowNjow
MC4wOiBbZHJtOmFtZGdwdV9yaW5nX3Rlc3RfaGVscGVyXSAqRVJST1IqIHJpbmcgZ2Z4IHRlc3Qg
ZmFpbGVkCigtMTEwKQoKYnV0IHRoZSByZXN1bHQgc2VlbXMgdG8gYmUgdGhlIHNhbWUuCgpJJ20g
bm90IHN1cmUgd2hldGhlciBhbnlib2R5IGlzIHdvcmtpbmcgb24gdGhpcyBvciB0aGUgYnVnLW9w
ZW5lciBzdGlsbCBzZWVzCnRoZSBpc3N1ZS4gQXMgbGF0ZXN0IGtlcm5lbCBzZXJpZXMgNS4xLngg
aXMgc29tZWhvdyBvdXRkYXRlZCBub3cgSSB3aWxsIHJldmVydAp0byA0LjE5LnggTFRTLgpJZiB0
aGVyZSBpcyBhbnkgaGludCBvciBhZHZpc2Ugd2hhdCBJIGNhbiBkbyB0byBoZWxwIHBsZWFzZSBs
ZXQgbWUga25vdy4KCi0tIApZb3UgYXJlIHJlY2VpdmluZyB0aGlzIG1haWwgYmVjYXVzZToKWW91
IGFyZSB3YXRjaGluZyB0aGUgYXNzaWduZWUgb2YgdGhlIGJ1Zy4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
