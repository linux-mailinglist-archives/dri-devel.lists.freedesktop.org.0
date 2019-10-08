Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA16CD00A8
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 20:23:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C245D6E889;
	Tue,  8 Oct 2019 18:23:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEC5E6E88D
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 18:23:24 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205089] amdgpu : drm:amdgpu_cs_ioctl : Failed to initialize
 parser -125
Date: Tue, 08 Oct 2019 18:23:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-205089-2300-vQSGHXKykt@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205089-2300@https.bugzilla.kernel.org/>
References: <bug-205089-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDUwODkKCi0tLSBD
b21tZW50ICMzIGZyb20gQWxleCBEZXVjaGVyIChhbGV4ZGV1Y2hlckBnbWFpbC5jb20pIC0tLQoo
SW4gcmVwbHkgdG8gQnJ1bm8gSmFjcXVldCBmcm9tIGNvbW1lbnQgIzIpCj4gSWYgSSB1bmRlcnN0
YW5kIHlvdSByaWdodCB0aGlzIG1lYW5zIHRoZXJlIGlzIHN0aWxsIGFub3RoZXIgaXNzdWUgdGhh
dAo+IGNhdXNlZCB0aGUgR1BVIHJlc2V0LiBBbmQgdGhpcyBpc3N1ZSBpbiBwYXJ0aWN1bGFyIGlz
IGp1c3QgYSBjb25zZXF1ZW5jZSBvZgo+IHRoZSByZXNldCBub3QgYmVpbmcgcHJvcGVybHkgaGFu
ZGxlZD8KClRoZSBHUFUgcmVzZXQgc3VjY2VlZGVkLiAgSG93ZXZlciwgc2luY2UgdGhlIEdQVSBo
YXMgYmVlbiByZXNldCwgdGhlIGNvbnRlbnRzCm9mIHRoZSBtZW1vcnkgKGUuZywgdnJhbSkgdGhh
dCB0aGUgYXBwbGljYXRpb24gd2FzIHVzaW5nIGlzIHVuZGVmaW5lZC4gIFNvIHRoZQphcHBsaWNh
dGlvbiBuZWVkcyB0byB1c2UgYW4gQVBJIGxldmVsIChlLmcuLCBPcGVuR0wgcm9idXN0bmVzcyBl
eHRlbnNpb25zIG9yCnZ1bGthbiBjb250ZXh0IGxvc3QpIGludGVyZmFjZSB0byBxdWVyeSB3aGV0
aGVyIHRoZSBHUFUgd2FzIHJlc2V0IGFuZApyZS1pbml0aWFsaXplIGl0J3MgYnVmZmVycyBpZiBz
by4KCi0tIApZb3UgYXJlIHJlY2VpdmluZyB0aGlzIG1haWwgYmVjYXVzZToKWW91IGFyZSB3YXRj
aGluZyB0aGUgYXNzaWduZWUgb2YgdGhlIGJ1Zy4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
