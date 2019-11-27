Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD5310B563
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2019 19:18:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F8FE6E44B;
	Wed, 27 Nov 2019 18:18:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5BB76E44B
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2019 18:17:59 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205675] Display locks up. AMDGPU timeout
Date: Wed, 27 Nov 2019 18:17:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: freddyreimer@comcast.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-205675-2300-ixEEzGowgM@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205675-2300@https.bugzilla.kernel.org/>
References: <bug-205675-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDU2NzUKCi0tLSBD
b21tZW50ICMyIGZyb20gZnJlZGR5cmVpbWVyQGNvbWNhc3QubmV0IC0tLQpIZWxsbyEgR2xhZCB0
byBzZWUgdGhlcmUncyBvdGhlcnMgbG9va2luZyBhdCB0aGlzLiBNeSBtZXNhIGlzIG9uIDE5LjMu
MF9yYzQsCmJ1dCB0aGUgaXNzdWUgaXMgc3RpbGwgaGFwcGVuaW5nLiBUaGF0IHJlbGF0ZWQgYnVn
IGluIHlvdXIgc2Vjb25kIGxpbmsgdGFsa3MKYWJvdXQgNS40IGtlcm5lbCBiZWluZyBvdXQgYnV0
IG5vdCBoYXZpbmcgdGhlIGZpeC4gSXMgdGhpcyBzb21ldGhpbmcgdGhhdCBtaWdodApzaG93IHVw
IGluIDUuNC4xPyAKCkkgbWlnaHQgdHJ5IGdvaW5nIHRvIG1lc2EgMTkuMi41IG9yIDE5LjIuNiBz
cGVjaWZpY2FsbHkgbGF0ZXIgdGhvdWdoLCBpbiBjYXNlCnRoZSBtZXNhLXNpZGUgZGlzYWJsZSBp
c24ndCBpbiByYzQgZm9yIHNvbWUgcmVhc29uLiBTZWVtcyBsaWtlIGl0IG1pZ2h0IGJlIGEKa2Vy
bmVsIGlzc3VlIHRob3VnaC4KCi0tIApZb3UgYXJlIHJlY2VpdmluZyB0aGlzIG1haWwgYmVjYXVz
ZToKWW91IGFyZSB3YXRjaGluZyB0aGUgYXNzaWduZWUgb2YgdGhlIGJ1Zy4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
