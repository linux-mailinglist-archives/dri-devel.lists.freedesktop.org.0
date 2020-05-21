Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 954571DD1E5
	for <lists+dri-devel@lfdr.de>; Thu, 21 May 2020 17:31:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0493E6E93D;
	Thu, 21 May 2020 15:31:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 431C76E93D
 for <dri-devel@lists.freedesktop.org>; Thu, 21 May 2020 15:31:25 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201539] AMDGPU R9 390 automatic fan speed control in Linux
 4.19/4.20/5.0
Date: Thu, 21 May 2020 15:31:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lkbugs@deegan.id.au
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-201539-2300-45aSLIIxxg@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201539-2300@https.bugzilla.kernel.org/>
References: <bug-201539-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDE1MzkKCi0tLSBD
b21tZW50ICM1NCBmcm9tIG1pY2hhZWwgKGxrYnVnc0BkZWVnYW4uaWQuYXUpIC0tLQpJdCBzZWVt
cyB0aGF0IHNpbmNlIGtlcm5lbCA1LjYgKG9yIGF0IGxlYXN0IERlYmlhbidzIHZlcnNpb24gdGhl
cmVvZiksIEkgbm8KbG9uZ2VyIG5lZWQgdG8gZmlkZGxlIHdpdGgKL3N5cy9jbGFzcy9kcm0vY2Fy
ZDAvZGV2aWNlL2h3bW9uL2h3bW9uMy9wd20xX2VuYWJsZS4gVGhlIGRlZmF1bHQgdmFsdWUgKDEp
CnNlZW1zIHRvIGRvIHRoZSByaWdodCB0aGluZyBub3cuIFByb2dyZXNzIQoKTWluZCB5b3UsIGxt
c2Vuc29ycyBpcyBzdGlsbCB1bmFibGUgdG8gcmVwb3J0IGZhbiBzcGVlZCwgYW5kIGdpdmVzIG5v
bnNlbnNpY2FsCnZhbHVlcyBmb3IgY3JpdC9oeXN0IHRlbXBlcmF0dXJlcy4gSSBoYXZlIGEgZmVl
bGluZyB0aGF0IGZ1cnRoZXIgaW1wcm92ZW1lbnRzCnRvIHBvd2VyIG1hbmFnZW1lbnQgbWF5IGJl
IHBvc3NpYmxlIHRvby4KCmFtZGdwdS1wY2ktMDEwMApBZGFwdGVyOiBQQ0kgYWRhcHRlcgp2ZGRn
Zng6ICAgICAgICsxLjAwIFYgIApmYW4xOiAgICAgICAgICAgICBOL0EgIChtaW4gPSAgICAwIFJQ
TSwgbWF4ID0gICAgMCBSUE0pCmVkZ2U6ICAgICAgICAgKzczLjDCsEMgIChjcml0ID0gKzEwNDAw
MC4wwrBDLCBoeXN0ID0gLTI3My4xwrBDKQpwb3dlcjE6ICAgICAgIDU4LjIxIFcgIChjYXAgPSAy
MDguMDAgVykKCi0tIApZb3UgYXJlIHJlY2VpdmluZyB0aGlzIG1haWwgYmVjYXVzZToKWW91IGFy
ZSB3YXRjaGluZyB0aGUgYXNzaWduZWUgb2YgdGhlIGJ1Zy4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
