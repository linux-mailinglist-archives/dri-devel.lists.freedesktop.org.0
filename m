Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 005B011645C
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 01:33:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C2536E055;
	Mon,  9 Dec 2019 00:33:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73CE56E055
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 00:33:13 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201539] AMDGPU R9 390 automatic fan speed control in Linux
 4.19/4.20/5.0
Date: Mon, 09 Dec 2019 00:33:12 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-201539-2300-n8xDqstkdN@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDE1MzkKCi0tLSBD
b21tZW50ICM1MCBmcm9tIE1hc3RlckNBVFogKG1hc3RlcmNhdHpAaG90bWFpbC5jb20pIC0tLQpU
aGFua3MgZm9yIGNvcnJlY3Rpb24sIEkgd2FzIHVuc3VyZSBpZiAkSFdNT04ga25ldyB0byBnbyB0
byBod21vbjEKCndvcmtzIHVudGlsIEdQVSBoaXRzIDcwIGRlZyB0aGVuIHNvbWV0aGluZyBmb3Jj
ZXMgInB3bTFfZW5hYmxlIiB0byBhdXRvIGFuZApzdGFydHMgcmFtcGluZyB0aGUgZmFuIHNwZWVk
IGRvd24gdW50aWwgaXRzIDIwJSBAIDkwKyBkZWcgYW5kIGJsaXBpbmcgMTAwJSBAIDk1CmRlZyAK
CgoKZm9yIG5vdyBhbGwgSSBjYW4gZG8gaXMgcnVuIGN1c3RvbSBiaW9zIHdpdGggODAwIG1lbW9y
eSBzcGVlZCBhbmQgODUwIGNvcmUgYW5kCmtlZXAgdG9nZ2xpbmcgYmV0d2VlbiBzdGFuZGFyZCBh
bmQgcGVyZm9ybWFuY2UgbW9kZSBvbiB0byByZXNldCBmYW4gc3BlZWQgdG8KMTAwJSBhbmQgcmVk
byB0aGF0IGV2ZXJ5IHRpbWUgaXRzIGRyb3BzIGJhY2sgYmVsb3cgNDAlIGFuZCBzZXQKL3N5cy9j
bGFzcy9kcm0vY2FyZDEvZGV2aWNlL2h3bW9uL2h3bW9uMS9wb3dlcjFfY2FwIHRvIHVuZGVyIDE0
MHcgc28gdGhlIEdQVQpkb2VzIG5vdCBjb29rIAoKc28gdW5sZXNzIGl0cyAiUmFkZW9uIFByb2Zp
bGUiIGRvaW5nIHNvbWV0aGluZyB0byBnZXQgbG9ja2VkIG91dCBJIGhhdmUgbm8gaWRlYSAKCml0
cyBmYW4gcHJvZmlsZSBzaG91bGQgYmUgCm92ZXIgNzAgZGVnIDE6MSByYXRpbyAKdW5kZXIgNjAg
ZGVnIDUwJQp1bmRlciA1MCBkZWcgMTAlCnVuZGVyIDQwIGRlZyA1JQp1bmRlciAyMCBkZWcgMCUK
CmFueSB3YXkgdG8gZmluZCBvdXQgd2hhdCBpcyBhY2Nlc3NpbmcgcHdtMV9lbmFibGUgPwoKLS0g
CllvdSBhcmUgcmVjZWl2aW5nIHRoaXMgbWFpbCBiZWNhdXNlOgpZb3UgYXJlIHdhdGNoaW5nIHRo
ZSBhc3NpZ25lZSBvZiB0aGUgYnVnLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
