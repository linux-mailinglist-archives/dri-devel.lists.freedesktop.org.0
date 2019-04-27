Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4378B460
	for <lists+dri-devel@lfdr.de>; Sat, 27 Apr 2019 21:22:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2AF9891D1;
	Sat, 27 Apr 2019 19:22:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.wl.linuxfoundation.org (mail.wl.linuxfoundation.org
 [198.145.29.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F207D891D1
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Apr 2019 19:22:23 +0000 (UTC)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id A0C8C2888D
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Apr 2019 19:22:23 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id 95353288C3; Sat, 27 Apr 2019 19:22:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=ham version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201273] Fatal error during GPU init amdgpu RX560
Date: Sat, 27 Apr 2019 19:22:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: quirin.blaeser@freenet.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-201273-2300-pqwZZyVGjA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201273-2300@https.bugzilla.kernel.org/>
References: <bug-201273-2300@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDEyNzMKCi0tLSBD
b21tZW50ICM0NSBmcm9tIHF1aXJpbi5ibGFlc2VyQGZyZWVuZXQuZGUgLS0tCihJbiByZXBseSB0
byBxdWlyaW4uYmxhZXNlciBmcm9tIGNvbW1lbnQgIzQ0KQo+IChJbiByZXBseSB0byBBbGV4IERl
dWNoZXIgZnJvbSBjb21tZW50ICM0MykKPiA+IERvZXMgYm9vdGluZyB3aXRoIGFueSBvZiB0aGUg
Zm9sbG93aW5nIG9wdGlvbnMgb24gdGhlIGtlcm5lbCBjb21tYW5kIGxpbmUKPiBpbgo+ID4gZ3J1
YiBoZWxwPwo+ID4gYW1kX2lvbW11PW9mZgo+ID4gaWRsZT1ub213YWl0Cj4gPiBpb21tdT1wdAo+
ID4gcGNpPW5vYXRzCj4gPiBDYW4geW91IGFsc28gdHJ5IGRpZmZlcmVudCBJT01NVSBhbmQgU1ZN
IHNldHRpbmdzIGluIHRoZSBzYmlvcz8gIEUuZy4sCj4gPiBjaGFuZ2UgZnJvbSAiYXV0byIgdG8g
ImVuYWJsZWQiIG9yICJkaXNhYmxlZCIuCj4gCj4gScK0bGwgdHJ5IGlkbGU9bm9td2FpdCBpb21t
dT1wdCBwY2k9bm9hdHMgZm9yIG5vdwo+IGlvbW11IGFuZCBzdm0gYXJlIHN0aWxsIGVuYWJsZWQg
aW4gQklPUwoKQnVnIGlzIHN0aWxsIGFsaXZlLiB2NS4wLjkKTmV4dCBTdGVwOgppb21tdSBhbmQg
c3ZtIGRpc2FibGVkIGluIEJJT1MKY2hhbmdlZCBjbWRsaW5lIHRvIGFtZF9pb21tdT1vZmYKCi0t
IApZb3UgYXJlIHJlY2VpdmluZyB0aGlzIG1haWwgYmVjYXVzZToKWW91IGFyZSB3YXRjaGluZyB0
aGUgYXNzaWduZWUgb2YgdGhlIGJ1Zy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
