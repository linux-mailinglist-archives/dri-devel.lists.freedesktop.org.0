Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE955C05B1
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2019 14:50:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 109986E0FA;
	Fri, 27 Sep 2019 12:50:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EFCF6E0FA
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2019 12:50:27 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204181] NULL pointer dereference regression in amdgpu
Date: Fri, 27 Sep 2019 12:50:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204181-2300-pqcc1JOSOW@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204181-2300@https.bugzilla.kernel.org/>
References: <bug-204181-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQxODEKCi0tLSBD
b21tZW50ICM1NCBmcm9tIEFsZXggRGV1Y2hlciAoYWxleGRldWNoZXJAZ21haWwuY29tKSAtLS0K
KEluIHJlcGx5IHRvIFNlcmdleSBLb25kYWtvdiBmcm9tIGNvbW1lbnQgIzUzKQo+IE9yIGFueSBv
ZiB0aGVzZSA/Cj4gb3B0aW9ucyBhbWRncHUgY2lrX3N1cHBvcnQ9MSBzaV9zdXBwb3J0PTEgbXNp
PTEgZGlzcF9wcmlvcml0eT0yIGRwbT0xCj4gcnVucG09MSBzY2hlZF9wb2xpY3k9MSBjb21wdXRl
X211bHRpcGlwZT0xIHZtX2ZyYWdtZW50X3NpemU9OSBnYXJ0c2l6ZT0xMDI0Cj4gbWF4X251bV9v
Zl9xdWV1ZXNfcGVyX2RldmljZT02NTUzNiBzY2hlZF9od19zdWJtaXNzaW9uPTMyIHNjaGVkX2pv
YnM9MTAyNAo+IGpvYl9oYW5nX2xpbWl0PTgwMDAgaGFsdF9pZl9od3NfaGFuZz0xIHZtX2ZhdWx0
X3N0b3A9MCB2bV91cGRhdGVfbW9kZT0wCj4gZGVlcF9jb2xvcj0xIGdwdV9yZWNvdmVyeT0xIGxv
Y2t1cF90aW1lb3V0PTI1MDAsNTAwMCw4MDAwLDEwMDAgcmFzX2VuYWJsZT0xCj4gbWNicD0xIHF1
ZXVlX3ByZWVtcHRpb25fdGltZW91dF9tcz00OCBtZXM9MSBod3NfZ3dzX3N1cHBvcnQ9MSBkaXNj
b3Zlcnk9MQoKcmVtb3ZlIGFsbCBvZiB0aG9zZS4gIFlvdSBzaG91bGQgdXNlIHRoZSBkZWZhdWx0
cyB1bmxlc3MgeW91IGFyZSBzcGVjaWZpY2FsbHkKZGVidWdnaW5nIHNvbWV0aGluZy4KCi0tIApZ
b3UgYXJlIHJlY2VpdmluZyB0aGlzIG1haWwgYmVjYXVzZToKWW91IGFyZSB3YXRjaGluZyB0aGUg
YXNzaWduZWUgb2YgdGhlIGJ1Zy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
