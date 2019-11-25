Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D177108B1A
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2019 10:43:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AF4C6E0BF;
	Mon, 25 Nov 2019 09:43:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CAB36E0BF
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2019 09:43:47 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201957] amdgpu: ring gfx timeout
Date: Mon, 25 Nov 2019 09:43:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: mh@familie-heinz.name
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-201957-2300-DCXkgoLIy0@https.bugzilla.kernel.org/>
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
b21tZW50ICMxOCBmcm9tIE1hdHRoaWFzIEhlaW56IChtaEBmYW1pbGllLWhlaW56Lm5hbWUpIC0t
LQpIaSwKCkkgcmVjZW50bHkgYnVpbHQgYSA1LjQuMC1yYzcgZnJvbSBkcm0tbmV4dCAobXkgSEVB
RCB3YXMKMTdlZWU2NjhiM2NhZDQyM2E0N2MwOTBmZTIyNzU3MzNjNTVkYjkxMCkgYW5kIGFsc28g
dXBkYXRlZCBNZXNhIHRvIDE5LjMuMC1SQzEuCgpTaW5jZSB0aGVuIEkgZGlkbid0IGdldCBhbnkg
Y3Jhc2hlcy4gSSBoYXZlIHRlc3RlZCB0aGlzIGZvciBhIGZldyBob3VycyBub3csCmJ1dCBpdCdz
IGVudGlyZWx5IHBvc3NpYmxlIHRoYXQgSSBqdXN0IGRpZG4ndCBydW4gaW50byB0aGUgYnVnIGZv
ciBzb21lIHJlYXNvbiwKYWx0aG91Z2ggaXQgdXN1YWxseSBhcHBlYXJlZCBhZnRlciBoYWxmIGFu
IGhvdXIuCgpJZiBwb3NzaWJsZSBwbGVhc2UgdHJ5IHRoaXMgc2V0dXAgYW5kIHNlZSBpZiBpdCBp
cyBmaXhlZC4KCi0tIApZb3UgYXJlIHJlY2VpdmluZyB0aGlzIG1haWwgYmVjYXVzZToKWW91IGFy
ZSB3YXRjaGluZyB0aGUgYXNzaWduZWUgb2YgdGhlIGJ1Zy4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
