Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B50ED1AB
	for <lists+dri-devel@lfdr.de>; Sun,  3 Nov 2019 05:08:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85A416E598;
	Sun,  3 Nov 2019 04:08:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0877A6E598
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Nov 2019 04:08:51 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201539] AMDGPU R9 390 automatic fan speed control in Linux
 4.19/4.20/5.0
Date: Sun, 03 Nov 2019 04:08:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mastercatz@hotmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-201539-2300-JXy4XUni3k@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201539-2300@https.bugzilla.kernel.org/>
References: <bug-201539-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDE1MzkKCk1hc3Rl
ckNBVFogKG1hc3RlcmNhdHpAaG90bWFpbC5jb20pIGNoYW5nZWQ6CgogICAgICAgICAgIFdoYXQg
ICAgfFJlbW92ZWQgICAgICAgICAgICAgICAgICAgICB8QWRkZWQKLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQogICAgICAgICAgICAgICAgIENDfCAgICAgICAgICAgICAgICAgICAgICAgICAgICB8bWFzdGVy
Y2F0ekBob3RtYWlsLmNvbQoKLS0tIENvbW1lbnQgIzIxIGZyb20gTWFzdGVyQ0FUWiAobWFzdGVy
Y2F0ekBob3RtYWlsLmNvbSkgLS0tCkhhdmluZyBzaW11bGFyIGlzc3VlcyB3aXRoIDUuMy44LTA1
MDMwOC1nZW5lcmljIAoKd2hlbiBpdCBzdGFydHMgaGFwcGVuaW5nIHRoaXMgaXMgYmVpbmcgc3Bh
bW1lZCBpbiBkbWVzZwoKYW1kZ3B1OiBbcG93ZXJwbGF5XSAKICAgICAgICAgICAgICAgIGZhaWxl
ZCB0byBzZW5kIG1lc3NhZ2UgMjgyIHJldCBpcyAyNTQKCgpJIGxvb3NlIHdyaXRlIGFjZXNzIHRv
IAovc3lzL2NsYXNzL2RybS9jYXJkMS9kZXZpY2UvaHdtb24vaHdtb24xL3B3bTFfZW5hYmxlCgpp
dCBpcyBzdHVjayBvbiAyICwgYW5kIHJ1bnMgdGhlIGZhbnMgc3VwZXIgbG93IEAgMjAlIGNhdXNp
bmcgdGhlIEdQVSB0byByZWFjaAp0aGVybWFsbWVsdCBkb3duIDk2IGRlZyB3aGVuIHRoZSBmYW4g
d2lsbCBkbyBibGlwcyBvZiAxMDAlIApteSBiaW9zIHdhcyBtb2RkZWQgdG8gZXZlbiBoYXZlIGEg
bWluaW11bSBmYW4gc3BlZWQgb2YgNTAlIGFuZCBldmVuIHRoaXMgaXMKYmVpbmcgb3ZlciB3cml0
dGVuIAoKL3N5cy9jbGFzcy9kcm0vY2FyZDEvZGV2aWNlL2h3bW9uL2h3bW9uMS9wd20xCmFsc28g
Y2FuIG5vdCBhZGp1c3QgCgoKCkdSVUJfQ01ETElORV9MSU5VWF9ERUZBVUxUPSJhbWRncHUucHBm
ZWF0dXJlbWFzaz0weGZmZmZmZmZmIGFtZGdwdS5kYz0xCmFtZGdwdS5ncHVfcmVjb3Zlcnk9MSBh
bWRncHUuY2lrX3N1cHBvcnQ9MSBhbWRncHUuZHBtPTEgcmFkZW9uLmNpa19zdXBwb3J0PTAiCgoK
aWYgSSByZWJvb3QgaXQgd29ya3MgZm9yIGEgbGl0dGxlIHdoaWxlIGFsbG93aW5nIG1lIHRvIGNo
YW5nZSBHUFUgc3BlZWRzIGFuZApmYW4gc3BlZWRzIHRoZW4gLi4gSSBsb29zZSBmYW4gc3BlZWQg
Y29udHJvbCBhbmQgY2FuIG5vdCBnZXQgaXQgYmFjayBvZmYgYXV0byAsCndoaWNoIHNlZW1zIHRv
IGJlIHNldHVwIHdpdGggZmFucyBzcGVlZHMgd2F5IHRvbyBsb3cgCgoKIEdMX1JFTkRFUkVSOiAg
IEFNRCBSYWRlb24gUjkgMjAwIFNlcmllcyAoSEFXQUlJLCBEUk0gMy4zMy4wLAo1LjMuOC0wNTAz
MDgtZ2VuZXJpYywgTExWTSA5LjAuMCkKICAgIEdMX1ZFUlNJT046ICAgIDQuNSAoQ29tcGF0aWJp
bGl0eSBQcm9maWxlKSBNZXNhIDE5LjMuMC1kZXZlbCAoZ2l0LWZmNmUxNDgKMjAxOS0xMC0yOSBi
aW9uaWMtb2liYWYtcHBhKQoKCmlmIEkgZGlzYWJsZSBhbWRncHUuZHBtIEkgY2FuIGNvbnRyb2wg
dGhlIGZhbnMgYnV0IHRoZW4gSSBjYW4gbm90IGRvIEF1dG8gR1BVCnNwZWVkcyBhbmQgY2FuIG5v
dCBtYW51YWxseSBkbyBteSBzcGVlZHMgCgoKbXkgb25seSBndWVzcyBpcyB0aGUgZmlybXdhcmUg
YmVpbmcgbG9hZGVkIGJ5IGtlcm5lbCBpcyB0aGUgcGxhY2UgY29udGFpbmluZwp0aGUgaW5mbyBm
b3IgZmFuIHNwZWVkcyA/CgotLSAKWW91IGFyZSByZWNlaXZpbmcgdGhpcyBtYWlsIGJlY2F1c2U6
CllvdSBhcmUgd2F0Y2hpbmcgdGhlIGFzc2lnbmVlIG9mIHRoZSBidWcuCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
