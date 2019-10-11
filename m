Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C69D47BF
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 20:37:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 021D56EC84;
	Fri, 11 Oct 2019 18:37:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EF926EC8A
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2019 18:37:48 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204241] amdgpu fails to resume from suspend
Date: Fri, 11 Oct 2019 18:37:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: Ahzo@tutanota.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-204241-2300-Gd03PqTb8p@https.bugzilla.kernel.org/>
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
b21tZW50ICMyMSBmcm9tIEFoem9AdHV0YW5vdGEuY29tIC0tLQpDcmVhdGVkIGF0dGFjaG1lbnQg
Mjg1NDcxCiAgLS0+IGh0dHBzOi8vYnVnemlsbGEua2VybmVsLm9yZy9hdHRhY2htZW50LmNnaT9p
ZD0yODU0NzEmYWN0aW9uPWVkaXQKUGF0Y2ggdG8gcHJldmVudCBrZXJuZWwgTlVMTCBwb2ludGVy
IGRlcmVmZXJlbmNlcwoKQnkgdGhlIHdheSwgc29tZSBvZiB0aGUga2VybmVsIE5VTEwgcG9pbnRl
ciBkZXJlZmVyZW5jZXMsIHRoYXQgY2FuIGhhcHBlbiBhZnRlcgphIHJlc3VtZSBmYWlsdXJlLCBh
bHNvIGhhcHBlbiBhbHdheXMgb24gc2h1dGRvd246ClJJUDogMDAxMDpidWlsZF9hdWRpb19vdXRw
dXQuaXNyYS4wKzB4OTcvMHgxMTAgW2FtZGdwdV0KUklQOiAwMDEwOmVuYWJsZV9saW5rX2RwKzB4
MTg2LzB4MzAwIFthbWRncHVdCgpBdHRhY2hlZCBwYXRjaCBwcmV2ZW50cyB0aGVtLgoKTm90ZSB0
aGF0IHRoZXNlIG9vcHNlcyBhcmUgZGlmZmljdWx0IHRvIG5vdGljZSBvbiBzaHV0ZG93biwgYmVj
YXVzZSB0aGV5IG9ubHkKbGVhdmUgdHJhY2VzIGluIC9zeXMvZnMvcHN0b3JlLCBub3Qgb24gdGhl
IGRpc2ssIGFzIHRoZXkgaGFwcGVuIGFmdGVyCnVubW91bnRpbmcuCgotLSAKWW91IGFyZSByZWNl
aXZpbmcgdGhpcyBtYWlsIGJlY2F1c2U6CllvdSBhcmUgd2F0Y2hpbmcgdGhlIGFzc2lnbmVlIG9m
IHRoZSBidWcuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
