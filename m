Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD47CFE9F7
	for <lists+dri-devel@lfdr.de>; Sat, 16 Nov 2019 01:57:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61C2E6E15D;
	Sat, 16 Nov 2019 00:57:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 121B06E15D
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Nov 2019 00:57:35 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201539] AMDGPU R9 390 automatic fan speed control in Linux
 4.19/4.20/5.0
Date: Sat, 16 Nov 2019 00:57:34 +0000
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
Message-ID: <bug-201539-2300-zepZnxlNyJ@https.bugzilla.kernel.org/>
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
b21tZW50ICMyOCBmcm9tIE1hc3RlckNBVFogKG1hc3RlcmNhdHpAaG90bWFpbC5jb20pIC0tLQpo
bW0gbWF5YmUgbm90IAppdCBsZXRzIG1lIGJyaWVmbHkgYWNjZXNzIG1hbnVhbCAKCgpGb3VuZCB0
aGUgZm9sbG93aW5nIFBXTSBjb250cm9sczoKICAgaHdtb24xL3B3bTEgICAgICAgICAgIGN1cnJl
bnQgdmFsdWU6IDY4Cmh3bW9uMS9wd20xIGlzIGN1cnJlbnRseSBzZXR1cCBmb3IgYXV0b21hdGlj
IHNwZWVkIGNvbnRyb2wuCkluIGdlbmVyYWwsIGF1dG9tYXRpYyBtb2RlIGlzIHByZWZlcnJlZCBv
dmVyIG1hbnVhbCBtb2RlLCBhcwppdCBpcyBtb3JlIGVmZmljaWVudCBhbmQgaXQgcmVhY3RzIGZh
c3Rlci4gQXJlIHlvdSBzdXJlIHRoYXQKeW91IHdhbnQgdG8gc2V0dXAgdGhpcyBvdXRwdXQgZm9y
IG1hbnVhbCBjb250cm9sPyAobikgeQpod21vbjEvcHdtMV9lbmFibGUgc3R1Y2sgdG8gMgpNYW51
YWwgY29udHJvbCBtb2RlIG5vdCBzdXBwb3J0ZWQsIHNraXBwaW5nIGh3bW9uMS9wd20xLgoKd2lz
aCBJIGtuZXcgd2hhdCB0aGUgaGVjayBrZWVwcyBsb2NraW5nIHB3bTFfZW5hYmxlIHRvIGF1dG8g
QCBsb3cgc3BlZWRzIDpACgotLSAKWW91IGFyZSByZWNlaXZpbmcgdGhpcyBtYWlsIGJlY2F1c2U6
CllvdSBhcmUgd2F0Y2hpbmcgdGhlIGFzc2lnbmVlIG9mIHRoZSBidWcuCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
