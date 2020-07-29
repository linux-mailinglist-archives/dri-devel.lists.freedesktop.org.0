Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCFC232214
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jul 2020 18:02:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D3236E12C;
	Wed, 29 Jul 2020 16:02:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 684786E12C
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 16:02:56 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 207383] [Regression] 5.7 amdgpu/polaris11 gpf:
 amdgpu_atomic_commit_tail
Date: Wed, 29 Jul 2020 16:02:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: 1i5t5.duncan@cox.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-207383-2300-mGuS40OMPo@https.bugzilla.kernel.org/>
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
b21tZW50ICMxMDggZnJvbSBEdW5jYW4gKDFpNXQ1LmR1bmNhbkBjb3gubmV0KSAtLS0KKEluIHJl
cGx5IHRvIFBhdWwgTWVuemVsIGZyb20gY29tbWVudCAjMTA3KQo+IEV2ZXJ5b25lIHNlZWluZyB0
aGlzLCBpdOKAmWQgYmUgZ3JlYXQsIGlmIHlvdSB0ZXN0ZWQKPiAKPiAgICAgW1BBVENIXSBkcm0v
YW1kL2Rpc3BsYXk6IENsZWFyIGRtX3N0YXRlIGZvciBmYXN0IHVwZGF0ZXMKCkkndmUgYmVlbiB0
ZXN0aW5nIGl0IGZvci4uLiB+MTIgaG91cnMgbm93IGFuZCBzbyBmYXIuLi4gbm90aGluZyB1bnVz
dWFsIHRvCnJlcG9ydC4gPTpeKQoKRXZlcnl0aGluZyBzZWVtcyB0byBiZSB3b3JraW5nIG5vcm1h
bGx5IGluY2x1ZGluZyA0ayB2aWRlbyBhbmQgdXBkYXRlIGJ1aWxkcy4gClRoZSBvbmx5IHR3byBj
YXZlYXRzIGFyZSB0aGF0IHRoZXJlIHdhc24ndCBhbnl0aGluZyAvdG9vLyBoZWF2eSBpbiB0aGUg
dXBkYXRlCnBpcGVsaW5lIHRvIGJ1aWxkLCBhbmQgaXQgaGFzIG9ubHkgYmVlbiAxMiBob3Vycywg
d2hpbGUgc29tZXRpbWVzIHRoaXMgYnVnIHRvb2sKdHdvIGRheXMgdG8gYml0ZSBvbiBteSBzZXR1
cC4gIEJ1dCBzbyBmYXIsIHNvIGdvb2QsIGFuZCBub3cgdGhhdCBJJ20gcG9zdGluZwp0aGlzLCBp
ZiB0aGUgYnVnJ3MgZ29pbmcgdG8gYml0ZSBpdCdzIGxpa2VseSB0byBiZSByaWdodCBhZnRlciBJ
IGhpdCBzdWJtaXQsIHNvCmxldCdzIHNlZSEgPTpeKQoKLS0gCllvdSBhcmUgcmVjZWl2aW5nIHRo
aXMgbWFpbCBiZWNhdXNlOgpZb3UgYXJlIHdhdGNoaW5nIHRoZSBhc3NpZ25lZSBvZiB0aGUgYnVn
LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
