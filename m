Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E74E372A0
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 13:18:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C069896E7;
	Thu,  6 Jun 2019 11:18:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.wl.linuxfoundation.org (mail.wl.linuxfoundation.org
 [198.145.29.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FD37896E7
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 11:18:22 +0000 (UTC)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id 12B95288B7
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 11:18:22 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id 0268E288ED; Thu,  6 Jun 2019 11:18:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=unavailable version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201539] AMDGPU R9 390 automatic fan speed control in Linux
 4.19/4.20/5.0
Date: Thu, 06 Jun 2019 11:18:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: steffen.klee@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-201539-2300-FbqoSOfXZm@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201539-2300@https.bugzilla.kernel.org/>
References: <bug-201539-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDE1MzkKCi0tLSBD
b21tZW50ICMxNCBmcm9tIFN0ZWZmZW4gS2xlZSAoc3RlZmZlbi5rbGVlQGdtYWlsLmNvbSkgLS0t
ClJlcHJvZHVjaWJsZSBvbiBhbiBSOSAzOTAgd2l0aCBrZXJuZWwgNS4xLjYtYXJjaDEtMS1BUkNI
IHVzaW5nIGFtZGdwdSBkcml2ZXIuClNldHRpbmcgYW1kZ3B1LmRwbT0xIG9yIGNoYW5naW5nIGFt
ZGdwdS5kYyBkb2VzIG5vdCBoYXZlIGFueSBlZmZlY3QuCgpBbHNvLCBzZW5zb3JzIGRvZXMgbm90
IHJlcG9ydCB0aGUgY3VycmVudCBmYW4gUlBNOgphbWRncHUtcGNpLTFkMDAKQWRhcHRlcjogUENJ
IGFkYXB0ZXIKdmRkZ2Z4OiAgICAgICArMS4wMCBWICAKZmFuMTogICAgICAgICAgICAgTi9BICAo
bWluID0gICAgMCBSUE0sIG1heCA9ICAgIDAgUlBNKQp0ZW1wMTogICAgICAgICs1OS4wwrBDICAo
Y3JpdCA9ICsxMDQwMDAuMMKwQywgaHlzdCA9IC0yNzMuMcKwQykKcG93ZXIxOiAgICAgICA0Ny4y
NCBXICAoY2FwID0gMjMwLjAwIFcpCgotLSAKWW91IGFyZSByZWNlaXZpbmcgdGhpcyBtYWlsIGJl
Y2F1c2U6CllvdSBhcmUgd2F0Y2hpbmcgdGhlIGFzc2lnbmVlIG9mIHRoZSBidWcuCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
