Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 695E2FEC37
	for <lists+dri-devel@lfdr.de>; Sat, 16 Nov 2019 13:07:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C95489DA6;
	Sat, 16 Nov 2019 12:07:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6DBC89D63
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Nov 2019 12:07:35 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201539] AMDGPU R9 390 automatic fan speed control in Linux
 4.19/4.20/5.0
Date: Sat, 16 Nov 2019 12:07:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mastercatz@hotmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-201539-2300-ZgsOhUxzkS@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201539-2300@https.bugzilla.kernel.org/>
References: <bug-201539-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDE1MzkKCi0tLSBD
b21tZW50ICMyOSBmcm9tIE1hc3RlckNBVFogKG1hc3RlcmNhdHpAaG90bWFpbC5jb20pIC0tLQpm
cm9tIHdoYXQgSSBjYW4gd29yayBvdXQgdGhlIG9ubHkgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBr
ZXJuZWwgdmVyc2lvbnMgCndhcyB0aGV5IGFkZGVkIGV4dHJhIHRoZXJtYWwgcmVhZGluZ3MgdG8g
c3VwcG9ydCB0aGUgbmV3ZXIgY2FyZHMgd2l0aCB0aGVybWFsCmp1bmN0aW9uIHNlbnNvcnMgCgoK
ey0yNzMxNTAsICA5OTAwMH0sCnsgMTIwMDAwLCAxMjAwMDB9LAoKaGFzIGJlZW4gaW4gdGhlaXIg
c2luY2UgSmFuIDIwMTggLi4uIAoKbG9va3MgbGlrZSBpdHMgcmVhZGluZyB0aGUgbWF4IHRlbXAg
c2V0dGluZ3MgZnJvbSB0aGUgYmlvcyAKSSB3aWxsIGNvbmZpcm0gdGhpcyB0b21vcnJvdyBJIHdp
bGwgZmxhc2ggYSBjdXN0b20gYmlvcyAKCi90b3J2YWxkcy9saW51eC9ibG9iL21hc3Rlci9kcml2
ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvaHdtZ3IuaAoKCi8qIFRoZSB0ZW1wZXJhdHVy
ZSwgaW4gMC4wMSBjZW50aWdyYWRlcywgYmVsb3cgd2hpY2ggd2UganVzdCBydW4gYXQgYSBtaW5p
bWFsClBXTS4gKi8KCgpzbyBtYXliZSBpdCBpcyB0aGlua2luZyBpdCBjYW4gZG8gMTAwMEMgPyAK
Cgphbnlob3cgYXMgSSBkb24ndCB3YW50IHRvIHJ1biBhbiBhbHRlcmVkIGJpb3MgYXMgdGhhdCB3
b3VsZCBmb3JjZSBmYW4gMTAwJSBvbgpib290ICAsIHdoYXQgSSBkZWNpZGVkIHRvIGRvIHdhcyBy
aXAgb3V0IGFsbCBvZiBBTUQncyBuZXcgdGhlcm1hbCBjb2RlIC4uLgoKLS0gCllvdSBhcmUgcmVj
ZWl2aW5nIHRoaXMgbWFpbCBiZWNhdXNlOgpZb3UgYXJlIHdhdGNoaW5nIHRoZSBhc3NpZ25lZSBv
ZiB0aGUgYnVnLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
