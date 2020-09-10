Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87EE7263BD6
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 06:19:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83A8689FED;
	Thu, 10 Sep 2020 04:19:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 685DE89FED
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 04:19:29 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 209163] amdgpu: The CS has been cancelled because the context
 is lost
Date: Thu, 10 Sep 2020 04:19:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Memory Management
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: satish.in@outlook.in
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-209163-2300-ER9faHZ4nE@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209163-2300@https.bugzilla.kernel.org/>
References: <bug-209163-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDkxNjMKCi0tLSBD
b21tZW50ICM4IGZyb20gU2F0aXNoIHBhdGVsIChzYXRpc2guaW5Ab3V0bG9vay5pbikgLS0tCihJ
biByZXBseSB0byBDaHJpc3RpYW4gS8O2bmlnIGZyb20gY29tbWVudCAjNikKPiBZb3UgYXJlIHJ1
bm5pbmcgb3V0IG9mIFZSQU0sIG5vdCBzeXN0ZW0gbWVtb3J5Lgo+IAo+IENhbiB5b3UgdGVzdCB0
aGlzIG9uIGFuIHVwIHRvIGRhdGUga2VybmVsIGFzIHdlbGw/CgpJcyB0aGVyZSBhbnkgd2F5IHRv
IHJlc3RyaWN0IG5vdCB1dGlsaXplIGZ1bGwgVlJBTSBieSBBTURHUFUgbW9kdWxlIHBhcmFtZXRl
cgpzZXR0aW5ncyA/IHNhbWUgYXBwbGljYXRpb24gcnVubmluZyB3aXRoIG9uIHNhbWUgaGFyZHdh
cmUgaW4gR25vbWUgZGVza3RvcCAKKENlbnRvcyA3KSB3aXRoIGtlcm5lbCAzLjEwLnh4LjExMjcg
LiAKCkkgYW0gZ2V0dGluZyBlcnJvciB3aGVuIFV0aWxpemUgc2FtZSBhcHBsaWNhdGlvbiBpbiBY
IFdpbmRvd3MgYW5kIGdldHRpbmcgZXJyb3IKYWZ0ZXIgMTkgaG91cnMuICB3aGVyZSBzYW1lIGFw
cGxpY2F0aW9uIHJ1bm5pbmcgbW9yZSB0aGFuIDcgZGF5cyB3aXRoIGFib3ZlCk9wZXJhdGluZyBz
eXN0ZW0gYW5kIGtlcm5lbCB2ZXJzaW9uLgoKLS0gCllvdSBhcmUgcmVjZWl2aW5nIHRoaXMgbWFp
bCBiZWNhdXNlOgpZb3UgYXJlIHdhdGNoaW5nIHRoZSBhc3NpZ25lZSBvZiB0aGUgYnVnLgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
