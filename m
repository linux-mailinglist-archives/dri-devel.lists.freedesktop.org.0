Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B095D2356F9
	for <lists+dri-devel@lfdr.de>; Sun,  2 Aug 2020 15:06:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E767689FA5;
	Sun,  2 Aug 2020 13:06:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FB3689FA5
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Aug 2020 13:06:52 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 207383] [Regression] 5.7 amdgpu/polaris11 gpf:
 amdgpu_atomic_commit_tail
Date: Sun, 02 Aug 2020 13:06:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: jeremy@kescher.at
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-207383-2300-7mM8q7Waz3@https.bugzilla.kernel.org/>
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
b21tZW50ICMxMTQgZnJvbSBKZXJlbXkgS2VzY2hlciAoamVyZW15QGtlc2NoZXIuYXQpIC0tLQoo
SW4gcmVwbHkgdG8gRHVuY2FuIGZyb20gY29tbWVudCAjMTA4KQo+IChJbiByZXBseSB0byBQYXVs
IE1lbnplbCBmcm9tIGNvbW1lbnQgIzEwNykKPiA+IEV2ZXJ5b25lIHNlZWluZyB0aGlzLCBpdOKA
mWQgYmUgZ3JlYXQsIGlmIHlvdSB0ZXN0ZWQKPiA+IAo+ID4gICAgIFtQQVRDSF0gZHJtL2FtZC9k
aXNwbGF5OiBDbGVhciBkbV9zdGF0ZSBmb3IgZmFzdCB1cGRhdGVzCj4gCgoKSXQgZml4ZXMgdGhl
IGlzc3VlIGZvciBtZS4gTXkgc3lzdGVtIHdvdWxkLCB3aXRob3V0IGFueSBwYXRjaGVzLCBjcmFz
aCBpbiBhCm1hdHRlciBvZiBtaW51dGVzIChwZXJoYXBzIGEgbWl4IG9mIDE0NCBIeiBhbmQgNjAg
SHogbW9uaXRvcnMgY2F1c2VzIHRoaXMgY3Jhc2gKdG8gaGFwcGVuIGZhc3Rlcj8pLCBidXQgaXQg
aGFzIGJlZW4gcnVubmluZyBmb3IgbXVsdGlwbGUgaG91cnMgb24gaW50ZW5zZQp3b3JrbG9hZHMg
bm93LCB3aXRob3V0IGFueSBoaWNjdXBzIG9yIGFueXRoaW5nLgoKLS0gCllvdSBhcmUgcmVjZWl2
aW5nIHRoaXMgbWFpbCBiZWNhdXNlOgpZb3UgYXJlIHdhdGNoaW5nIHRoZSBhc3NpZ25lZSBvZiB0
aGUgYnVnLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
