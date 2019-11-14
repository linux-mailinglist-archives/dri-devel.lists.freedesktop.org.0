Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E3EFCB34
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 17:58:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC75E6E3A8;
	Thu, 14 Nov 2019 16:58:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2095B6E3A8
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2019 16:58:16 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205521] 5.3.11 update broke AMDGPU Raven Ridge
Date: Thu, 14 Nov 2019 16:58:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: luya@fedoraproject.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_file_loc cf_tree
Message-ID: <bug-205521-2300-1XTup9c05g@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205521-2300@https.bugzilla.kernel.org/>
References: <bug-205521-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDU1MjEKCkx1eWEg
VHNoaW1iYWxhbmdhIChsdXlhQGZlZG9yYXByb2plY3Qub3JnKSBjaGFuZ2VkOgoKICAgICAgICAg
ICBXaGF0ICAgIHxSZW1vdmVkICAgICAgICAgICAgICAgICAgICAgfEFkZGVkCi0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KICAgICAgICAgICAgICAgIFVSTHxodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Aub3Ig
fGh0dHBzOi8vYnVnemlsbGEucmVkaGF0LmNvbQogICAgICAgICAgICAgICAgICAgfGcvc2hvd19i
dWcuY2dpP2lkPTEwOTIwNiAgICB8L3Nob3dfYnVnLmNnaT9pZD0xNzcyMzEzCiAgICAgICAgICAg
ICAgIFRyZWV8TWFpbmxpbmUgICAgICAgICAgICAgICAgICAgIHxGZWRvcmEKCi0tLSBDb21tZW50
ICM0IGZyb20gTHV5YSBUc2hpbWJhbGFuZ2EgKGx1eWFAZmVkb3JhcHJvamVjdC5vcmcpIC0tLQoo
SW4gcmVwbHkgdG8gQWxleCBEZXVjaGVyIGZyb20gY29tbWVudCAjMykKPiAoSW4gcmVwbHkgdG8g
THV5YSBUc2hpbWJhbGFuZ2EgZnJvbSBjb21tZW50ICMwKQo+ID4gCj4gPiBub3YgMTMgMTM6NTM6
NTUga2VybmVsOiBhbWRncHUgMDAwMDowMzowMC4wOiBEaXJlY3QgZmlybXdhcmUgbG9hZCBmb3IK
PiA+IGFtZGdwdS9yYXZlbl9ncHVfaW5mby5iaW4gZmFpbGVkIHdpdGggZXJyb3IgLTIKPiA+IG5v
diAxMyAxMzo1Mzo1NSBrZXJuZWw6IGFtZGdwdSAwMDAwOjAzOjAwLjA6IEZhaWxlZCB0byBsb2Fk
IGdwdV9pbmZvCj4gPiBmaXJtd2FyZSAiYW1kZ3B1L3JhdmVuX2dwdV9pbmZvLmJpbiIKPiA+IG5v
diAxMyAxMzo1Mzo1NSBrZXJuZWw6IGFtZGdwdSAwMDAwOjAzOjAwLjA6IEZhdGFsIGVycm9yIGR1
cmluZyBHUFUgaW5pdAo+IAo+IFRoZSBrZXJuZWwgaXMgbm90IGFibGUgdG8gZmluZCB0aGUgZmly
bXdhcmUgaW1hZ2UuICBJZiB5b3UgYXJlIHVzaW5nIGFuCj4gaW5pdHJkLCBwbGVhc2UgbWFrZSBz
dXJlIHRvIGluY2x1ZGVzIHRoZSBmaXJtd2FyZXMgaW4gdGhlIGluaXRyZC4gIElmIHlvdQo+IGFy
ZSBidWlsZGluZyB0aGUgZGl2ZXIgaW50byB0aGUga2VybmVsLCB5b3UgbmVlZCB0byBidWlsZCB0
aGUgZmlybXdhcmUgaW50bwo+IHRoZSBrZXJuZWwgYXMgd2VsbC4KCkl0IGlzIGEgRmVkb3JhIGtl
cm5lbC4gSSBkb24ndCBrbm93IGhvdyB0aGF0IGhhcHBlbmVkIHdpdGggYSBzaW1wbGUgdXBkYXRl
IGFuZApJIGluY2x1ZGVkIHRoZSBkbWVzZyBmb3IgaW52ZXN0aWdhdGlvbi4gSSBsaW5rZWQgdGhl
IEZlZG9yYSBidWcgcmVwb3J0IGFzIHdlbGwKZm9yIHJlZmVyZW5jZS4KCi0tIApZb3UgYXJlIHJl
Y2VpdmluZyB0aGlzIG1haWwgYmVjYXVzZToKWW91IGFyZSB3YXRjaGluZyB0aGUgYXNzaWduZWUg
b2YgdGhlIGJ1Zy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
