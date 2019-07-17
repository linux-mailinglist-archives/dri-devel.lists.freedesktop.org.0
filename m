Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6016C154
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 21:12:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 869B66E178;
	Wed, 17 Jul 2019 19:12:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.wl.linuxfoundation.org (mail.wl.linuxfoundation.org
 [198.145.29.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D920A6E178
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 19:12:40 +0000 (UTC)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id A7B76283C9
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 19:12:40 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id 99E2328779; Wed, 17 Jul 2019 19:12:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=unavailable version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204145] amdgpu video playback causes host to hard reset
 (checkstop) on POWER9 with RX 580
Date: Wed, 17 Jul 2019 19:12:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: shawn@anastas.io
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-204145-2300-3w6JF7Sql0@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204145-2300@https.bugzilla.kernel.org/>
References: <bug-204145-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQxNDUKCi0tLSBD
b21tZW50ICMxNiBmcm9tIFNoYXduIEFuYXN0YXNpbyAoc2hhd25AYW5hc3Rhcy5pbykgLS0tCkNy
ZWF0ZWQgYXR0YWNobWVudCAyODM3OTkKICAtLT4gaHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3Jn
L2F0dGFjaG1lbnQuY2dpP2lkPTI4Mzc5OSZhY3Rpb249ZWRpdAp0ZXN0IHBhdGNoICMxCgpUaG91
Z2ggSSdtIG5vdCBmYW1pbGlhciB3aXRoIHRoaXMgY29kZSwgYSBxdWljayBzcG90IGNoZWNrIHNo
b3dzIHdoYXQgSSBiZWxpZXZlIAp0byBiZSBhbiBpbmNvbnNpc3RlbmN5IHdpdGggdGhlIGNvbW1p
dCdzIGNsYWltIG9mIGZ1bmN0aW9uYWwgaWRlbnRpY2FsaXR5LiAKTmFtZWx5LCB0aGUgcHJldmlv
dXMgY2FsbGVyIG9mIF9fZG1hX2dldF9jb2hlcmVudF9wZm4gKG5vdyAKYXJjaF9kbWFfY29oZXJl
bnRfdG9fcGZuKSB3b3VsZCBleHBsaWNpdGx5IG1vZGlmeSB0aGUgdm1fYXJlYSB0byBtYXJrIGl0
IGFzIAp1bmNhY2hlYWJsZSBpbiB0aGUgIWNvaGVyZW50IGNhc2UuIEl0IHNlZW1zIHRoZSBuZXcg
Y2FsbGVyIChkbWFfY29tbW9uX21tYXApCmRvZXMgbm90IGRvIHRoaXMuIEkgaGF2ZSB3cml0dGVu
IGEgc21hbGwgcGF0Y2ggdG8gcmVzdG9yZSB0aGUgcHJldmlvdXMgCmJlaGF2aW9yIChJIHRoaW5r
KS4gTm90ZSB0aGF0IHRoaXMgcHJvYmFibHkgaXNuJ3QgdXBzdHJlYW1hYmxlIHNpbmNlIHRoaXMg
Zml4IApzaG91bGQgcHJvYmFibHkgZ28gc29tZXdoZXJlIGluIHRoZSBwb3dlcnBjIGFyY2ggY29k
ZSByYXRoZXIgdGhhbiB0aGUgZG1hIGNvcmUuCgpUaW0sIHNpbmNlIHlvdSdyZSB0aGUgb25seSBv
bmUgd2hvIGNhbiBlYXNpbHkgcmVwcm9kdWNlIHRoaXMsCndvdWxkIHlvdSBtaW5kIGdpdmluZyB0
aGlzIHBhdGNoIGEgc2hvdD8KCi0tIApZb3UgYXJlIHJlY2VpdmluZyB0aGlzIG1haWwgYmVjYXVz
ZToKWW91IGFyZSB3YXRjaGluZyB0aGUgYXNzaWduZWUgb2YgdGhlIGJ1Zy4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
