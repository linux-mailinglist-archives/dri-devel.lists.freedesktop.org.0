Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE68229217
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jul 2020 09:27:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EC436E5D4;
	Wed, 22 Jul 2020 07:27:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FD2D6E5D4
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jul 2020 07:27:19 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 207383] [Regression] 5.7 amdgpu/polaris11 gpf:
 amdgpu_atomic_commit_tail
Date: Wed, 22 Jul 2020 07:27:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: christian.koenig@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-207383-2300-x14dfrxGWa@https.bugzilla.kernel.org/>
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
b21tZW50ICM4MyBmcm9tIENocmlzdGlhbiBLw7ZuaWcgKGNocmlzdGlhbi5rb2VuaWdAYW1kLmNv
bSkgLS0tCkluc3RlYWQgb2Ygd29ya2luZyBhcm91bmQgdGhlIGJ1ZyBJIHRoaW5rIHdlIHNob3Vs
ZCBjb25jZW50cmF0ZSBvbiBuYWlsaW5nIHRoZQpyb290IGNhdXNlLgoKSSBzdWdnZXN0IHRvIGlu
c2VydCBhbiB1c2UgYWZ0ZXIgZnJlZSBjaGVjayBpbnRvIGp1c3QgdGhhdCBzdHJ1Y3R1cmUuIElu
IG90aGVyCndvcmRzIGFkZCBhIGZpZWxkICJtYWdpY19udW1iZXIiIHdpbGwgaXQgd2l0aCAweGRl
YWRiZWVmIG9uIGFsbG9jYXRpb24gYW5kIHNldAppdCB0byB6ZXJvIGJlZm9yZSB0aGUga2ZyZWUo
KS4KCkEgc2ltcGxlIEJVR19PTihwdHItPm1hZ2ljX251bWJlciAhPSAweGRlYWRiZWVmKSBzaG91
bGQgeWllbGQgcmVzdWx0cyByYXRoZXIKcXVpY2tseS4KClRoZW4ganVzdCBhZGQgcHJpbnRrKClz
IGJlZm9yZSB0aGUga2ZyZWUoKSB0byBmaWd1cmUgb3V0IHdoeSB3ZSBoYXZlIHRoaXMgdXNlCmFm
dGVyIGZyZWUgcmFjZS4KCi0tIApZb3UgYXJlIHJlY2VpdmluZyB0aGlzIG1haWwgYmVjYXVzZToK
WW91IGFyZSB3YXRjaGluZyB0aGUgYXNzaWduZWUgb2YgdGhlIGJ1Zy4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
