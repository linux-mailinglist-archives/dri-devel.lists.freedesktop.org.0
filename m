Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B1CAC50D
	for <lists+dri-devel@lfdr.de>; Sat,  7 Sep 2019 08:58:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C12CF89FC9;
	Sat,  7 Sep 2019 06:58:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EB5689FC9
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Sep 2019 06:58:36 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204559] amdgpu: kernel oops with constant gpu resets while
 using mpv
Date: Sat, 07 Sep 2019 06:58:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kode54@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204559-2300-kP3QUus3fr@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204559-2300@https.bugzilla.kernel.org/>
References: <bug-204559-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQ1NTkKCi0tLSBD
b21tZW50ICMxMSBmcm9tIENocmlzdG9waGVyIFNub3doaWxsIChrb2RlNTRAZ21haWwuY29tKSAt
LS0KT29wcywgSSBuZWdsZWN0ZWQgdG8gbWVudGlvbjogVGhlIHN5c3RlbSBpcyBub24tcmVzcG9u
c2l2ZSB0byBpbnB1dCBkZXZpY2VzLCBhcwp0aGUgVVNCIGlucHV0IGFwcGVhcnMgdG8gYWxsIGJl
IGNvbXBsZXRlbHkgcG93ZXJlZCBvZmYgYWZ0ZXIgdGhlIEdQVSBjcmFzaGVzLApidXQgdGhlIG5l
dHdvcmsgaW50ZXJmYWNlIGlzIHN0aWxsIHdvcmtpbmcsIGFzIGlzIHNvdW5kIG91dHB1dCwgYW5k
IEknbSBhYmxlIHRvCmxvZyBpbnRvIHRoZSBtYWNoaW5lIHZpYSBTU0guIEl0IGRvZXMsIGhvd2V2
ZXIsIGxvY2sgdXAgaWYgSSBhdHRlbXB0IHRvIHNvZnQKcmVib290IGl0LgoKVGhlIGZ1bGwgZG1l
c2cgZnJvbSB0aGUgc2Vzc2lvbiB0aGF0IGV2ZW50dWFsbHkgY3Jhc2hlZCBpcyBzdGlsbCBhdmFp
bGFibGUgaW4KdGhlIGpvdXJuYWwsIHVwIHRvIHdoZXJlIGl0IHdhcyBmbG9vZGluZyBzZG1hMCB0
aW1lb3V0cyBhbmQgZmFpbHVyZXMuCgotLSAKWW91IGFyZSByZWNlaXZpbmcgdGhpcyBtYWlsIGJl
Y2F1c2U6CllvdSBhcmUgd2F0Y2hpbmcgdGhlIGFzc2lnbmVlIG9mIHRoZSBidWcuCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
