Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB69221B106
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 10:10:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18511890CE;
	Fri, 10 Jul 2020 08:10:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF694890CE
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 08:10:11 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 207383] [Regression] 5.7 amdgpu/polaris11 gpf:
 amdgpu_atomic_commit_tail
Date: Fri, 10 Jul 2020 08:10:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: strzol@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-207383-2300-xCu7oYgnPB@https.bugzilla.kernel.org/>
In-Reply-To: <bug-207383-2300@https.bugzilla.kernel.org/>
References: <bug-207383-2300@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDczODMKCi0tLSBD
b21tZW50ICM1NSBmcm9tIFN0cmF0b3MgWm9sb3RhcyAoc3Ryem9sQGdtYWlsLmNvbSkgLS0tCihJ
biByZXBseSB0byBQYXVsIE1lbnplbCBmcm9tIGNvbW1lbnQgIzU0KQoKPiBUaGFuayB5b3UgZm9y
IHlvdXIgcmVwb3J0LiBIb3cgcXVpY2tseSBjYW4geW91IHJlcHJvZHVjZSBpdD8gSWYgeW91IGNv
dWxkCj4gYmlzZWN0IHRoZSBpc3N1ZSB0byBwaW5wb2ludCB0aGUgY3VscHJpdCBjb21taXQgYmV0
d2VlbiA1LjcuNSBhbmQgNS43LjcsCj4gdGhhdOKAmWQgYmUgZ3JlYXQuIE1heWJlIG9wZW4gZXZl
biBhIHNlcGFyYXRlIGJ1ZyByZXBvcnQsIGluIGNhc2UgdGhleSBhcmUKPiB1bnJlbGF0ZWQuIFRo
ZXkgY2FuIGFsd2F5cyBiZSBtYXJrZWQgYXMgZHVwbGljYXRlcyBsYXRlci4KCklmIHlvdSBndWlk
ZSBtZSBvbiB3aGF0IHRvIGRvIEkgY2FuIHJlcG9ydCBiYWNrIGluIHNvbWUgaG91cnMgKG5vdCBv
biB0aGF0CnN5c3RlbSBub3cpLiBJIGhhZCA0IGNyYXNoZXMgeWVzdGVyZGF5IHdpdGgga2VybmVs
IDUuNy43IGluIDMgaG91cnMgZG9pbmcgZGFpbHkKc3R1ZmYgKG5vdCBnYW1pbmcgb3Igc29tZXRo
aW5nIGxpa2UgdGhhdCkuIFN5c3RlbSB3YXMgdW5yZXNwb25zaXZlLCBzc2ggdG8gdGhlCmJveCB3
b3JrZWQgYnV0IHJlYm9vdCBmcm9tIGNvbnNvbGUgaGFuZ3MgYWxzbywgb25seSBBTFQrU3lzUnEr
QiByZWJvb3RzIHRoZQpzeXN0ZW0uIEkgYm9vdGVkIHdpdGggdGhlIHByZXZpb3VzIGtlcm5lbCAo
NS43LjUpIGFuZCB3YXMgc3RhYmxlIGZvciBvdmVyIDYtNwpob3Vycy4KCi0tIApZb3UgYXJlIHJl
Y2VpdmluZyB0aGlzIG1haWwgYmVjYXVzZToKWW91IGFyZSB3YXRjaGluZyB0aGUgYXNzaWduZWUg
b2YgdGhlIGJ1Zy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
