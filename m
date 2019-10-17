Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC79DA8D9
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 11:44:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C7A66EA2D;
	Thu, 17 Oct 2019 09:44:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 796EA6EA2D
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 09:44:26 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205147] Unable to shut down - radeon_drv.c - radeon_suspend_kms()
Date: Thu, 17 Oct 2019 09:44:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: 10dmar10@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-205147-2300-hajIgJW12u@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205147-2300@https.bugzilla.kernel.org/>
References: <bug-205147-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDUxNDcKCnd3YSAo
MTBkbWFyMTBAZ21haWwuY29tKSBjaGFuZ2VkOgoKICAgICAgICAgICBXaGF0ICAgIHxSZW1vdmVk
ICAgICAgICAgICAgICAgICAgICAgfEFkZGVkCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KICAgICAgICAg
ICAgICAgICBDQ3wgICAgICAgICAgICAgICAgICAgICAgICAgICAgfDEwZG1hcjEwQGdtYWlsLmNv
bQoKLS0tIENvbW1lbnQgIzIgZnJvbSB3d2EgKDEwZG1hcjEwQGdtYWlsLmNvbSkgLS0tCkhpLAoK
SSBhbHNvIGhhdmUgc2FtZSBwcm9ibGVtIGFuZCAKY2FuIGNvbmZpcm0gdGhhdCByZXZlcnRpbmcg
Y29tbWl0IDZmN2ZlOWE5M2U2YzA5YmY5ODhjNTA1OTQwM2Y1Zjg4ZTE3ZTIxZTYKZml4ZXMgaXQu
CgpteSBoYXJkd2FyZToKMDE6MDAuMCBWR0EgY29tcGF0aWJsZSBjb250cm9sbGVyOiBBZHZhbmNl
ZCBNaWNybyBEZXZpY2VzLCBJbmMuIFtBTUQvQVRJXQpKdW5pcGVyIFhUIFtSYWRlb24gSEQgNTc3
MF0sIFBDSS1FLApvbiBhIE1JQ1JPLVNUQVIgSU5URVJOQVRJT05BTCBDTy4sTFREIE1TLTc1OTkv
NzcwLUM0NSAoTVMtNzU5OSksIEJJT1MgVjEuMTUKMDMvMDQvMjAxMQoKKHRoaXMgYnVnIGtpbmQg
b2YgcmVtaW5kcyBtZSBvZgpodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNn
aT9pZD05OTUyNCkKCi0tIApZb3UgYXJlIHJlY2VpdmluZyB0aGlzIG1haWwgYmVjYXVzZToKWW91
IGFyZSB3YXRjaGluZyB0aGUgYXNzaWduZWUgb2YgdGhlIGJ1Zy4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
