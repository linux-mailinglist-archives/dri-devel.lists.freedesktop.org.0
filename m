Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8717C4550
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 03:13:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE64F6E570;
	Wed,  2 Oct 2019 01:13:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26F886E570
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2019 01:13:06 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204611] amdgpu error scheduling IBs when waking from sleep
Date: Wed, 02 Oct 2019 01:13:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tones111@hotmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204611-2300-1Pbl1dgaTi@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204611-2300@https.bugzilla.kernel.org/>
References: <bug-204611-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQ2MTEKCi0tLSBD
b21tZW50ICM0IGZyb20gdG9uZXMxMTFAaG90bWFpbC5jb20gLS0tCkkndmUgYmVlbiBhYmxlIHRv
IG5hcnJvdyB0aGUgcHJvYmxlbSBkb3duIGEgYml0LgoKVGhlIGZpcnN0IGNvbW1pdCB3aGVyZSBJ
IGdldCB0aGUgc2Nyb2xsaW5nIGFtZGdwdSBlcnJvcnMgaXMKNGY4YjQ5MDkyYzM3Y2YwYzg3YzQz
YmIyNjk4ZDQzYzcxY2YwZTRlNQoKVW5mb3J0dW5hdGVseSB0aGF0J3MgYSBtZXJnZSBjb21taXQu
Ck9uZSBvZiB0aGUgcGFyZW50cyBhcHBlYXJzIHRvIGJlIGdvb2QKY2VhY2JjMGUxNDVlM2IyN2Q4
YjEyZWVjYjg4MWY5ZDg3NzAyNzY1YQoKVGhlIG90aGVyIHBhcmVudAo1ZGQ2YzQ5MzM5MTI2YzJj
OGRmMjE3OTA0MTM3MzIyMjM2MmQ2ZTQ5CmNhdXNlcyBsb2NrdXBzIHRoYXQgZG9uJ3QgaGF2ZSBh
bnkgam91cm5hbCBtZXNzYWdlcyBhZnRlciBnb2luZyB0byBzbGVlcC4gIEkndmUKdHJpZWQgYmlz
ZWN0aW5nIHRoaXMgYmFjayB0byB2NS4xLXJjMSAoZ29vZCkgYnV0IHRoZSBsb2NrdXBzIGJlY29t
ZSBtdWNoIGxlc3MKY29uc2lzdGVudC4KCi0tIApZb3UgYXJlIHJlY2VpdmluZyB0aGlzIG1haWwg
YmVjYXVzZToKWW91IGFyZSB3YXRjaGluZyB0aGUgYXNzaWduZWUgb2YgdGhlIGJ1Zy4KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
