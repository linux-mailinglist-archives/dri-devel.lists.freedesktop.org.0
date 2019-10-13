Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BD3D5588
	for <lists+dri-devel@lfdr.de>; Sun, 13 Oct 2019 11:43:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C549E6E0C6;
	Sun, 13 Oct 2019 09:43:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26F8D6E0C6
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Oct 2019 09:43:38 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205169] AMDGPU driver with Navi card hangs Xorg in fullscreen
 only.
Date: Sun, 13 Oct 2019 09:43:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: drjoms@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-205169-2300-XTWvqHlB1s@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205169-2300@https.bugzilla.kernel.org/>
References: <bug-205169-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDUxNjkKCi0tLSBD
b21tZW50ICM4IGZyb20gRG1pdHJpIFNlbGV0c2tpIChkcmpvbXNAZ21haWwuY29tKSAtLS0KKElu
IHJlcGx5IHRvIFBpZXJyZS1FcmljIFBlbGxvdXgtUHJheWVyIGZyb20gY29tbWVudCAjNykKPiAo
SW4gcmVwbHkgdG8gRG1pdHJpIFNlbGV0c2tpIGZyb20gY29tbWVudCAjMCkKPiA+IEkgaGF2ZSBh
bm90aGVyIHByb2JsZW0gbG9nZ2VkIHdpdGggTmF2aSArIEFNREdQVSBkcml2ZXJzLiBJdCdzIHRy
aWdnZXJlZAo+ID4gaW5kZXBlbmRlbnRseSBhbmQgcmVsaWFibGUuCj4gPiBodHRwczovL2J1Z3pp
bGxhLmtlcm5lbC5vcmcvc2hvd19idWcuY2dpP2lkPTIwNDcyNQo+ID4gCj4gPiBXaXRoIHRoYXQg
c2FpZCwgc3RhcnRpbmcgc3RyaWN0bHkgYW5kIHNwZWNpZmljYWxseSB3aXRoIGtlcm5lbCB2ZXJz
aW9uCj4gPiA1LjQuMCogSSBoYXZlIG5ldyBwcm9ibGVtLgo+ID4gCj4gCj4gV2hhdCBrZXJuZWwg
dmVyc2lvbiB3ZXJlIHlvdSB1c2luZyBiZWZvcmUgdGhhdCBkaWRuJ3QgaGF2ZSB0aGUgcHJvYmxl
bT8KCkl0IHdhcyA1LjMuKiB3aGVuIEkgY291bGQgb3BlbiBhbmQgdXNlIE9wZW5HTCBhbmQgVnVs
a2FuIGFwcHMgZnVsbCBzY3JlZW4gYW5kCml0IHdvdWxkbid0IGNyYXNoLiBUaGlzIGlzIGxpc3Qg
b2Yga2VybmVscyBJIHVzZWQgZnJvbSA1LjMuKgoKbHMgL2Jvb3QvIHxncmVwIHZtbGludXotNS4z
LiAKdm1saW51ei01LjMuMCsKdm1saW51ei01LjMuMC1uZXh0LTIwMTkwOTIwCnZtbGludXotNS4z
LjArLm9sZAp2bWxpbnV6LTUuMy4wLXJjNgp2bWxpbnV6LTUuMy4wLXJjNisKdm1saW51ei01LjMu
MC1yYzYrLm9sZAp2bWxpbnV6LTUuMy4wLXJjOAp2bWxpbnV6LTUuMy4wLXJjOC5vbGQKCi0tIApZ
b3UgYXJlIHJlY2VpdmluZyB0aGlzIG1haWwgYmVjYXVzZToKWW91IGFyZSB3YXRjaGluZyB0aGUg
YXNzaWduZWUgb2YgdGhlIGJ1Zy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
