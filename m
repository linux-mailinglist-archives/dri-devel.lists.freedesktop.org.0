Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D196CC9BC
	for <lists+dri-devel@lfdr.de>; Sat,  5 Oct 2019 13:48:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF7726E22D;
	Sat,  5 Oct 2019 11:48:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CF676E22D
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Oct 2019 11:48:19 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205089] New: amdgpu : drm:amdgpu_cs_ioctl : Failed to
 initialize parser -125
Date: Sat, 05 Oct 2019 11:48:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: maxijac@free.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-205089-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDUwODkKCiAgICAg
ICAgICAgIEJ1ZyBJRDogMjA1MDg5CiAgICAgICAgICAgU3VtbWFyeTogYW1kZ3B1IDogZHJtOmFt
ZGdwdV9jc19pb2N0bCA6IEZhaWxlZCB0byBpbml0aWFsaXplCiAgICAgICAgICAgICAgICAgICAg
cGFyc2VyIC0xMjUKICAgICAgICAgICBQcm9kdWN0OiBEcml2ZXJzCiAgICAgICAgICAgVmVyc2lv
bjogMi41CiAgICBLZXJuZWwgVmVyc2lvbjogNS4zLjIKICAgICAgICAgIEhhcmR3YXJlOiBBbGwK
ICAgICAgICAgICAgICAgIE9TOiBMaW51eAogICAgICAgICAgICAgIFRyZWU6IE1haW5saW5lCiAg
ICAgICAgICAgIFN0YXR1czogTkVXCiAgICAgICAgICBTZXZlcml0eTogbm9ybWFsCiAgICAgICAg
ICBQcmlvcml0eTogUDEKICAgICAgICAgQ29tcG9uZW50OiBWaWRlbyhEUkkgLSBub24gSW50ZWwp
CiAgICAgICAgICBBc3NpZ25lZTogZHJpdmVyc192aWRlby1kcmlAa2VybmVsLWJ1Z3Mub3NkbC5v
cmcKICAgICAgICAgIFJlcG9ydGVyOiBtYXhpamFjQGZyZWUuZnIKICAgICAgICBSZWdyZXNzaW9u
OiBObwoKSGVsbG8sCgpJIGFtIGV4cGVyaWVuY2luZyBmcmVlemVzIHdpdGgga2VybmVsIDUuMy4y
IGFuZCBhbWRncHUgb24gYSBWZWdhIDY0IGNhcmQuCgpUaGlzIGhhcHBlbnMgZHVyaW5nIGdhbWVz
IChJIGV4cGVyaWVuY2UgaXQgb24gQ1M6R08pIGJ1dCBpdCBpcyBhIGJpdCByYW5kb20gYW5kCnRh
a2VzIHRpbWUgdG8gZXZlbnR1YWxseSB0cmlnZ2VyLgpPbmNlIGl0IHRyaWdnZXJzIG15IGRtZXNn
IGlzIGZpbGxlZCB3aXRoIGVycm9yczoKCgpbIDkxNTYuNTM3NTI0XSBbZHJtOmFtZGdwdV9jc19p
b2N0bCBbYW1kZ3B1XV0gKkVSUk9SKiBGYWlsZWQgdG8gaW5pdGlhbGl6ZQpwYXJzZXIgLTEyNSEK
WyA5MTU2Ljc0NzE3Nl0gW2RybTphbWRncHVfY3NfaW9jdGwgW2FtZGdwdV1dICpFUlJPUiogRmFp
bGVkIHRvIGluaXRpYWxpemUKcGFyc2VyIC0xMjUhClsgOTE1Ni43NDcyMjRdIFtkcm06YW1kZ3B1
X2NzX2lvY3RsIFthbWRncHVdXSAqRVJST1IqIEZhaWxlZCB0byBpbml0aWFsaXplCnBhcnNlciAt
MTI1IQpbIDkxNTYuODgzMjIwXSBbZHJtOmFtZGdwdV9jc19pb2N0bCBbYW1kZ3B1XV0gKkVSUk9S
KiBGYWlsZWQgdG8gaW5pdGlhbGl6ZQpwYXJzZXIgLTEyNSEKWyA5MTU2Ljg4MzI4NV0gW2RybTph
bWRncHVfY3NfaW9jdGwgW2FtZGdwdV1dICpFUlJPUiogRmFpbGVkIHRvIGluaXRpYWxpemUKcGFy
c2VyIC0xMjUhCgpXaGVuIGl0IGhhcHBlbnMsIHRoZSBpbWFnZSBoYW5ncyBhbmQgUEMgaXMgdW5y
ZXNwb25zaXZlLiBTb21ldGltZXMgSSBtYW5hZ2UgdG8Kc3dpdGNoIHRvIGEgVFRZLCBidXQgdGhl
biB0aGUgc2NyZWVuIGlzIGNvcnJ1cHRlZC4KCkhXOgotIEFNRCBSeXplbiAyNzAwWCBDUFUKLSBB
TUQgUlggdmVnYSA2NAoKU1c6Ci0gS2VybmVsIDUuMy4yCi0gTWVzYSAxOS4yLjAKCi0tIApZb3Ug
YXJlIHJlY2VpdmluZyB0aGlzIG1haWwgYmVjYXVzZToKWW91IGFyZSB3YXRjaGluZyB0aGUgYXNz
aWduZWUgb2YgdGhlIGJ1Zy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
