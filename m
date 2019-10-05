Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F55ECCA13
	for <lists+dri-devel@lfdr.de>; Sat,  5 Oct 2019 15:19:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 870106E21B;
	Sat,  5 Oct 2019 13:19:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B5E76E21B
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Oct 2019 13:19:09 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201539] AMDGPU R9 390 automatic fan speed control in Linux
 4.19/4.20/5.0
Date: Sat, 05 Oct 2019 13:19:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: artheg@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-201539-2300-mwW99sihBY@https.bugzilla.kernel.org/>
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
b21tZW50ICMyMCBmcm9tIGFydGhlZyAoYXJ0aGVnQGdtYWlsLmNvbSkgLS0tClRvIGFueW9uZSB3
aG8ncyBzdGlsbCBzdHJ1Z2dsaW5nIHdpdGggdGhpcywgcGVyaGFwcyB0aGlzIHdvdWxkIGJlIG9m
IGhlbHA6CkknbSB1c2luZyB0aGlzIHNjcmlwdCAoaHR0cHM6Ly9naXRodWIuY29tL2dybWF0L2Ft
ZGdwdS1mYW5jb250cm9sKSBhcyBhCnNlcnZpY2UsIHdpdGggdGhlc2UgcGFyYW1zOiAKClRFTVBT
PSggNjUwMDAgNzUwMDAgODAwMDAgOTAwMDAgKQpQV01TPSggICAgICAwICAgMTkwICAgMjAwICAg
MjU1ICkKClBlcmhhcHMgc29tZW9uZSBjb3VsZCB0d2VhayB0aGlzIGEgbGl0dGxlIGJpdCBiZXR0
ZXIsIGJ1dCB0aGlzIHdvcmtzIGZvciBtZS4KTXkgZ3B1IHN0aWxsIHNvdW5kcyBsaWtlIGFuIGFp
cnBsYW5lIHdoZW4gSSdtIHJ1bm5pbmcgYSBiZW5jaG1hcmsgbGlrZQpVbmlnaW5lLUhlYXZlbiwg
YnV0IGF0IGxlYXN0IGZhbnMgYXJlIHNwaW5uaW5nIG5vdy4KCi0tIApZb3UgYXJlIHJlY2Vpdmlu
ZyB0aGlzIG1haWwgYmVjYXVzZToKWW91IGFyZSB3YXRjaGluZyB0aGUgYXNzaWduZWUgb2YgdGhl
IGJ1Zy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
