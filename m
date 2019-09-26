Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B89FDBED4A
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2019 10:22:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 875A46EE60;
	Thu, 26 Sep 2019 08:22:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A0E16EE60
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 08:22:06 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204987] general protection fault in
 amdgpu_dm_atomic_commit_tail (Vega64)
Date: Thu, 26 Sep 2019 08:22:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: steinex@nognu.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204987-2300-1sgy032l6N@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204987-2300@https.bugzilla.kernel.org/>
References: <bug-204987-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQ5ODcKCi0tLSBD
b21tZW50ICMxIGZyb20gRnJhbmsgU3RlaW5ib3JuIChzdGVpbmV4QG5vZ251LmRlKSAtLS0KSSBj
YW4gcmVwcm9kdWNlIHRoaXMgcmVsaWFibHkgd2l0aCBydW5uaW5nIGNvbXB0b24gaW4gY29tYmlu
YXRpb24gd2l0aApyZWRzaGlmdC4gQXMgc29vbiBhcyBjb21wdG9uIGlzIHJ1bm5pbmcgYW5kIHJl
ZHNoaWZ0cyBzdGFydHMgdG8gc2hpZnQgdGhlCnNjcmVlbiwgdGhlIGZhaWxlZCBjb21taXRzIHN0
YXJ0IHRvIHNob3cgdXAuCgpSdW5uaW5nIFVuaWdpbmUgSGVhdmVuIHdoaWxlIHJlZHNoaWZ0IGlz
IHJ1bm5pbmcgYnV0IG5vdCBzaGlmdGluZyB0cmlnZ2VycyBpdAp0b28gYXMgaXQgcmVzZXRzIHRo
ZSByZWRzaGlmdCBnYW1tYSBhbmQgcmVkc2hpZnQgdHJpZXMgdG8gc2hpZnQgaXQgYmFjay4KClRo
ZSBidWcgaXMgbm90IHRyaWdnZXJlZCB3aGVuIGNvbXB0b24gdXNlcyB4cmVuZGVyIGFzIGJhY2tl
bmQgaW5zdGVhZCBvZiBHTFgsCndoaWNoIGlzIHNvbWV3aGF0IGV4cGVjdGVkIEkgZ3Vlc3MuCgot
LSAKWW91IGFyZSByZWNlaXZpbmcgdGhpcyBtYWlsIGJlY2F1c2U6CllvdSBhcmUgd2F0Y2hpbmcg
dGhlIGFzc2lnbmVlIG9mIHRoZSBidWcuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
