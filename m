Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B859A10DE84
	for <lists+dri-devel@lfdr.de>; Sat, 30 Nov 2019 19:24:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 347916E158;
	Sat, 30 Nov 2019 18:24:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D9FD6E158
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2019 18:24:22 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204241] amdgpu fails to resume from suspend
Date: Sat, 30 Nov 2019 18:24:19 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: me@cschwarz.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204241-2300-6Ucvu7tdUF@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204241-2300@https.bugzilla.kernel.org/>
References: <bug-204241-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQyNDEKCi0tLSBD
b21tZW50ICMzOSBmcm9tIG1lQGNzY2h3YXJ6LmNvbSAtLS0KKEluIHJlcGx5IHRvIEFsZXggRGV1
Y2hlciBmcm9tIGNvbW1lbnQgIzMzKQo+IChJbiByZXBseSB0byBtZSBmcm9tIGNvbW1lbnQgIzMy
KQo+ID4gQEFsZXg6IERpZG4ndCBoYXZlIGEgY3Jhc2ggd2l0aCB0aGUgb2xkIHV2ZDYgcGF0Y2gg
KGF0dGFjaG1lbnQgMjg1NDczCj4gW2RldGFpbHNdCj4gPiBbZGV0YWlsc10pIHNvIGZhciwgYnV0
IGFwcGFyZW50bHkgSSBhbSBqdXN0IGx1Y2t5Lgo+ID4gCj4gPiBXaGljaCBwYXRjaCAoc2VyaWVz
Pykgc2hvdWxkIEkgdGVzdCBub3c/Cj4gCj4gUGxlYXNlIHRyeSBhdHRhY2htZW50IDI4NTUwNyBb
ZGV0YWlsc10uCgpDYW4gY29uZmlybSB0aGlzIHBhdGNoIHdvcmtzLCA0MCBkYXlzIHVwdGltZSwg
X21hbnlfIHN1c3BlbmQtcmVzdW1lIGN5Y2xlcywgbm8KcHJvYmxlbXMuCgotLSAKWW91IGFyZSBy
ZWNlaXZpbmcgdGhpcyBtYWlsIGJlY2F1c2U6CllvdSBhcmUgd2F0Y2hpbmcgdGhlIGFzc2lnbmVl
IG9mIHRoZSBidWcuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
