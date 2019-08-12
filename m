Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEEA28A43B
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2019 19:26:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16F8B6E58A;
	Mon, 12 Aug 2019 17:26:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.wl.linuxfoundation.org (mail.wl.linuxfoundation.org
 [198.145.29.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 383B56E58A
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 17:26:32 +0000 (UTC)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id 1001E28581
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 17:26:32 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id 00BE42857E; Mon, 12 Aug 2019 17:26:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=unavailable version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204559] amdgpu: kernel oops with constant gpu resets while
 using mpv
Date: Mon, 12 Aug 2019 17:26:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: shoegaze@tutanota.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204559-2300-OeEyPpdV28@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204559-2300@https.bugzilla.kernel.org/>
References: <bug-204559-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQ1NTkKCi0tLSBD
b21tZW50ICM5IGZyb20gTWF4aW0gU2hldmlha292IChzaG9lZ2F6ZUB0dXRhbm90YS5jb20pIC0t
LQpUaGFua3MgZm9yIHlvdXIgZXhwbGFuYXRpb24uIEJ5IHRoZSB3YXksIGRpc2FibGluZyBydW5w
bSBhbHNvIHNlZW1zIHRvIGZpeCB0aGUKb3RoZXIgaXNzdWUgd2l0aCBkaXNhYmxpbmcgdGhlIGRp
c3BsYXkgYWZ0ZXIgYWN0aXZhdGluZyB0aGUgbG9ja3NjcmVlbiBhcyBhCnBvd2Vyc2F2aW5nIG1l
YXN1cmUuCklzIHRoZXJlIGFueXRoaW5nIGVsc2UgSSBjYW4gZG8gdG8gaGVscCB3aXRoIHRoaXMg
b25lPyBUaGUgd2hvbGUgdGhpbmcgc2VlbXMgdG8KYmUgYW4gaXNzdWUgc29tZXdoZXJlIGluIHRo
ZSBkeW5hbWljIHN3aXRjaGluZyBtZWNoYW5pc20sIHdoaWNoIHdvcmtzIC0gYnV0IGlzCm5vdCBy
ZWFsbHkgc3RhYmxlIHdpdGggYWxsIHRoZXNlIGhhbmdzIGF0IGNlcnRhaW4gY29uZGl0aW9ucy4K
Ci0tIApZb3UgYXJlIHJlY2VpdmluZyB0aGlzIG1haWwgYmVjYXVzZToKWW91IGFyZSB3YXRjaGlu
ZyB0aGUgYXNzaWduZWUgb2YgdGhlIGJ1Zy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
