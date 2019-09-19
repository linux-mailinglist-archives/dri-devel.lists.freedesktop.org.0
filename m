Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A678B831A
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 23:09:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 444106F552;
	Thu, 19 Sep 2019 21:09:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 765976F552
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 21:09:02 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204227] Visual artefacts and crash from suspend on amdgpu
Date: Thu, 19 Sep 2019 21:09:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: exa.exa@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204227-2300-hw6E5C6yjC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204227-2300@https.bugzilla.kernel.org/>
References: <bug-204227-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQyMjcKCi0tLSBD
b21tZW50ICMxMyBmcm9tIE1pcmVrIEtyYXRvY2h2aWwgKGV4YS5leGFAZ21haWwuY29tKSAtLS0K
QWZ0ZXIgdGhlIEJJT1MgdXBncmFkZSB0aGUga2VybmVsIHBhcmFtZXRlcnMgY2FuIGJlIHJlbW92
ZWQsIGJ1dCB0aGUga2VybmVsCig1LjIuMTYpIG5vdyBsb2NrcyB1cCB3aGVuIGVudGVyaW5nIFhG
Q0UgKGl0IHN1cnZpdmVzIGxpZ2h0ZG0gdGhvdWdoKS4gVGhlCmVycm9yIGlzIGFsbW9zdCBzYW1l
IGFzIGFzIGluIHRoZSBwb3N0ZWQgZG1lc2c7IEknbGwgYXR0YWNoIG1pbmUgd2l0aApiYWNrdHJh
Y2VzIGluIGEgZmV3IHNlY29uZHMuCgpIaWdobGlnaHRzOgoKVGhpcyBnZXRzIHByaW50ZWQgb3V0
IGJlZm9yZSBlYWNoIHdhcm5pbmc6ClsgICA2Ni4xNTkxNzVdIFtkcm1dIHBzdGF0ZSBURVNUX0RF
QlVHX0RBVEE6IDB4MzZGNjAwMDAKClIwOCBnZXRzIGluY3JlYXNlZCBieSBzb21lIHZhbHVlIGJl
dHdlZW4gNDkgYW5kIDU2IGFmdGVyIGVhY2ggbmV4dCB3YXJuaW5nICh0aGUKdmFsdWUgaXMgc29t
ZXRpbWVzIGluIFIxMCkKClVzZXJzcGFjZSBzZWVtcyB3b3JraW5nIG90aGVyd2lzZSAodGhlIGxv
Z3MgYXJlIGZyb20gc3lzbG9nKSwganVzdCB0aGUgZGlzcGxheQp3b24ndCBzaG93IGFueXRoaW5n
LgoKSSB3aWxsIHRyeSBhIGZldyBvdGhlciBrZXJuZWxzIGF2YWlsYWJsZSBmb3IgZGViaWFuIGFu
ZCBldmVudHVhbGx5IGJpc2VjdC4KCi0tIApZb3UgYXJlIHJlY2VpdmluZyB0aGlzIG1haWwgYmVj
YXVzZToKWW91IGFyZSB3YXRjaGluZyB0aGUgYXNzaWduZWUgb2YgdGhlIGJ1Zy4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
