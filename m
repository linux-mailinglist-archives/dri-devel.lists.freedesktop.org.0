Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6CC10D2A
	for <lists+dri-devel@lfdr.de>; Wed,  1 May 2019 21:25:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91CA6890ED;
	Wed,  1 May 2019 19:25:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.wl.linuxfoundation.org (mail.wl.linuxfoundation.org
 [198.145.29.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90B4A890ED
 for <dri-devel@lists.freedesktop.org>; Wed,  1 May 2019 19:25:51 +0000 (UTC)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id 6023728E2A
 for <dri-devel@lists.freedesktop.org>; Wed,  1 May 2019 19:25:51 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id 47A2928E46; Wed,  1 May 2019 19:25:51 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=ham version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201273] Fatal error during GPU init amdgpu RX560
Date: Wed, 01 May 2019 19:25:50 +0000
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
Message-ID: <bug-201273-2300-iElHfQBR5h@https.bugzilla.kernel.org/>
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
b21tZW50ICM0OSBmcm9tIEFsZXggRGV1Y2hlciAoYWxleGRldWNoZXJAZ21haWwuY29tKSAtLS0K
Q2FuIHlvdSBzdGlsbCBsb2cgaW4gcmVtb3RlbHkgdmlhIHNzaCBhbmQgZ2V0IGFuIHVwZGF0ZWQg
ZG1lc2c/ICBJZiBpdCdzIGEKYmxhbmsgc2NyZWVuLCBjYW4geW91IHRyeSBhbm90aGVyIGRpc3Bs
YXkgY29ubmVjdG9yIG9uIHRoZSBib2FyZD8gIFRoZQphbWRncHUuZGMgb3B0aW9uIHN3aXRjaGVz
IGJldHdlZW4gdGhlIG9sZCBzaW1wbGVyIGRpc3BsYXkgY29kZSAoZGM9MCkgYW5kIHRoZQpuZXdl
ciBkaXNwbGF5IGNvZGUgdGhhdCBzdXBwb3J0IG1vcmUgYWR2YW5jZWQgZmVhdHVyZXMgbGlrZSBh
dWRpbyBhbmQgRFAgTVNUCihkYz0xKS4gIFRoZXJlIGlzIG5vIGZpcm13YXJlIGluIHRoZSBkaXNw
bGF5IGVuZ2luZSBmb3IgdGhpcyBhc2ljLgoKLS0gCllvdSBhcmUgcmVjZWl2aW5nIHRoaXMgbWFp
bCBiZWNhdXNlOgpZb3UgYXJlIHdhdGNoaW5nIHRoZSBhc3NpZ25lZSBvZiB0aGUgYnVnLgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
