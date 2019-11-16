Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A80FEC73
	for <lists+dri-devel@lfdr.de>; Sat, 16 Nov 2019 14:36:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 831696E111;
	Sat, 16 Nov 2019 13:36:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE84F6E111
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Nov 2019 13:36:01 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201539] AMDGPU R9 390 automatic fan speed control in Linux
 4.19/4.20/5.0
Date: Sat, 16 Nov 2019 13:36:01 +0000
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
Message-ID: <bug-201539-2300-QlsoUQWjbI@https.bugzilla.kernel.org/>
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
b21tZW50ICMzMCBmcm9tIE1hc3RlckNBVFogKG1hc3RlcmNhdHpAaG90bWFpbC5jb20pIC0tLQpm
b3VuZCB0aGVtIGhhcmQgY29kZWQgaGVyZSBmb3IgdGhlIFI5IDI5MCBoYXdhaWkgLyBTZWEgSXNs
YW5kcyBjaGlwIHNldHMgCgpzbyB0aGF0IHdpbGwgYmUgYSBkaXJ0eSB3YXkgdG8gZ2V0IGl0IHRv
IGdvIDEwMCUgdGhyb3R0bGUgc29vbmVyIEknbGwgc2V0IG1pbmUKdG8gODUwMDAgYW5kIHNlZSBo
b3cgaXQgZ29lcyAsIGhvcGVmdWxseSB0aGUgcmVzdCBmb2xsb3dzICAKCgpsaW51eC9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9jaV9kcG0uYwoKCmlmIChhZGV2LT5hc2ljX3R5cGUgPT0gQ0hJ
UF9IQVdBSUkpIHsKICAgICAgICAgICAgICAgIHBpLT50aGVybWFsX3RlbXBfc2V0dGluZy50ZW1w
ZXJhdHVyZV9sb3cgPSA5NDUwMDsKICAgICAgICAgICAgICAgIHBpLT50aGVybWFsX3RlbXBfc2V0
dGluZy50ZW1wZXJhdHVyZV9oaWdoID0gOTUwMDA7CiAgICAgICAgICAgICAgICBwaS0+dGhlcm1h
bF90ZW1wX3NldHRpbmcudGVtcGVyYXR1cmVfc2h1dGRvd24gPSAxMDQwMDA7CiAgICAgICAgfSBl
bHNlIHsKICAgICAgICAgICAgICAgIHBpLT50aGVybWFsX3RlbXBfc2V0dGluZy50ZW1wZXJhdHVy
ZV9sb3cgPSA5OTUwMDsKICAgICAgICAgICAgICAgIHBpLT50aGVybWFsX3RlbXBfc2V0dGluZy50
ZW1wZXJhdHVyZV9oaWdoID0gMTAwMDAwOwogICAgICAgICAgICAgICAgcGktPnRoZXJtYWxfdGVt
cF9zZXR0aW5nLnRlbXBlcmF0dXJlX3NodXRkb3duID0gMTA0MDAwOwogICAgICAgIH0KCi0tIApZ
b3UgYXJlIHJlY2VpdmluZyB0aGlzIG1haWwgYmVjYXVzZToKWW91IGFyZSB3YXRjaGluZyB0aGUg
YXNzaWduZWUgb2YgdGhlIGJ1Zy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
