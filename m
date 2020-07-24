Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A226D22BF01
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jul 2020 09:24:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E2706E929;
	Fri, 24 Jul 2020 07:24:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59DA36E929
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jul 2020 07:24:08 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 207383] [Regression] 5.7 amdgpu/polaris11 gpf:
 amdgpu_atomic_commit_tail
Date: Fri, 24 Jul 2020 07:24:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: mnrzk@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-207383-2300-kJIv2H6WYM@https.bugzilla.kernel.org/>
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
b21tZW50ICM5MCBmcm9tIG1ucnprQHByb3Rvbm1haWwuY29tIC0tLQooSW4gcmVwbHkgdG8gQ2hy
aXN0aWFuIEvDtm5pZyBmcm9tIGNvbW1lbnQgIzg5KQo+IChJbiByZXBseSB0byBtbnJ6ayBmcm9t
IGNvbW1lbnQgIzg3KQo+ID4gR29vZCBuZXdzLCBJIHdyb3RlIGEgcGF0Y2ggdGhhdCBmaXhlZCB0
aGlzIGJ1ZyBvbiBteSBtYWNoaW5lIGFuZCBzdWJtaXR0ZWQKPiA+IGl0IHRvIHRoZSBMaW51eCBr
ZXJuZWwgbWFpbGluZyBsaXN0IFsxXS4KPiAKPiBZb3Ugc2hvdWxkIHByb2JhYmx5IHNlbmQgaXQg
dG8gdGhlIGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIG1haWxpbmcKPiBsaXN0IGFzIHdl
bGwgaWYgeW91IGhhdmVuJ3QgYWxyZWFkeSBkb25lIHNvLgo+IAo+IEknbSBub3QgYW4gZXhwZXJ0
IG9uIHRoZSBEQyBzdGF0ZSBzdHVmZiwgc28gSGFycnkgb3IgQWxleCBuZWVkIHRvIHZhbGlkYXRl
Cj4gdGhpcyBwYXRjaC4gQnV0IG9mIGhhbmQgaXQgbG9va3MgbGlrZSBhIG5pY2UgY2F0Y2ggdG8g
bWUuCj4gCj4gR29vZCB3b3JrIDopCgpBZnRlciBmdXJ0aGVyIHRlc3RpbmcsIGl0IHNlZW1zIHRo
YXQgaXQgb25seSBjYXVzZWQgdGhlIGlzc3VlIHRvIGJlIGRlbGF5ZWQuCkFuIGhvdXIgYW5kIGEg
aGFsZiBhZnRlciBJIHN1Ym1pdHRlZCB0aGUgcGF0Y2gsIG15IHN5c3RlbSBjcmFzaGVkLgoKSSBt
ZW50aW9uZWQgdGhpcyBvbiB0aGUgTEtNTCB0aHJlYWQgYnV0IEkgZm9yZ290IHRvIG1lbnRpb24g
aXQgaGVyZS4KCkkgaGF2ZSBhIHN1c3BpY2lvbiB0aGF0IHRoZSBzYW1lIHN0YXRlIGlzIGJlaW5n
IGNvbW1pdHRlZCB0d2ljZS4gSSdsbCBoYXZlCnRvIGludmVzdGlnYXRlIHRoaXMgZnVydGhlciB0
aG91Z2guIE9uY2UgSSBkZXRlcm1pbmUgaWYgaXQgaXMsIEknbGwgcmVwb3J0CmJhY2sgb24gaGVy
ZSBhbmQgcGVyaGFwcyB0aGF0IHdpbGwgaGVscCB3aXRoIGEgYnVnIGZpeC4KCi0tIApZb3UgYXJl
IHJlY2VpdmluZyB0aGlzIG1haWwgYmVjYXVzZToKWW91IGFyZSB3YXRjaGluZyB0aGUgYXNzaWdu
ZWUgb2YgdGhlIGJ1Zy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
