Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99445FC01C
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 07:15:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BC536E12D;
	Thu, 14 Nov 2019 06:15:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13A766E12D
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2019 06:15:29 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205521] New: 5.3.11 update broke AMDGPU Raven Ridge
Date: Thu, 14 Nov 2019 06:15:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: luya@fedoraproject.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-205521-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDU1MjEKCiAgICAg
ICAgICAgIEJ1ZyBJRDogMjA1NTIxCiAgICAgICAgICAgU3VtbWFyeTogNS4zLjExIHVwZGF0ZSBi
cm9rZSBBTURHUFUgUmF2ZW4gUmlkZ2UKICAgICAgICAgICBQcm9kdWN0OiBEcml2ZXJzCiAgICAg
ICAgICAgVmVyc2lvbjogMi41CiAgICBLZXJuZWwgVmVyc2lvbjogNS4zLjExIGFuZCB1cAogICAg
ICAgICAgSGFyZHdhcmU6IHg4Ni02NAogICAgICAgICAgICAgICAgT1M6IExpbnV4CiAgICAgICAg
ICAgICAgVHJlZTogTWFpbmxpbmUKICAgICAgICAgICAgU3RhdHVzOiBORVcKICAgICAgICAgIFNl
dmVyaXR5OiBibG9ja2luZwogICAgICAgICAgUHJpb3JpdHk6IFAxCiAgICAgICAgIENvbXBvbmVu
dDogVmlkZW8oRFJJIC0gbm9uIEludGVsKQogICAgICAgICAgQXNzaWduZWU6IGRyaXZlcnNfdmlk
ZW8tZHJpQGtlcm5lbC1idWdzLm9zZGwub3JnCiAgICAgICAgICBSZXBvcnRlcjogbHV5YUBmZWRv
cmFwcm9qZWN0Lm9yZwogICAgICAgIFJlZ3Jlc3Npb246IE5vCgpDcmVhdGVkIGF0dGFjaG1lbnQg
Mjg1OTAzCiAgLS0+IGh0dHBzOi8vYnVnemlsbGEua2VybmVsLm9yZy9hdHRhY2htZW50LmNnaT9p
ZD0yODU5MDMmYWN0aW9uPWVkaXQKZG1lc2cgcmVwb3J0aW5nIGJyb2tlbiBhbWQgcmF2ZW4gcmlk
Z2UgZmlybXdhcmUKCkFNRCBSYXZlbiBSaWRnZSBmaXJ3YXJlIGlzIGN1cnJlbnRseSBicm9rZW4g
d2l0aCB0aGUgcmVjZW50IHN0YWJsZSBrZXJuZWwKcmVsZWFzZSByZXN1bHRpbmcgYSBibGFuayBz
Y3JlZW4gb24gYm9vdCBhbmQgcHJldmVudGluZyBib290aW5nIG9uIHRoZSBsb2dpbgpzY3JlZW4g
ZWl0aGVyIGdyYXBoaWNhbCBhbmQgdGV4dCBtb2RlLgoKRXh0cmFjdCBmcm9tIGJvb3Q6Cgpub3Yg
MTMgMTM6NTM6NTUga2VybmVsOiBhbWRncHUgMDAwMDowMzowMC4wOiBEaXJlY3QgZmlybXdhcmUg
bG9hZCBmb3IKYW1kZ3B1L3JhdmVuX2dwdV9pbmZvLmJpbiBmYWlsZWQgd2l0aCBlcnJvciAtMgpu
b3YgMTMgMTM6NTM6NTUga2VybmVsOiBhbWRncHUgMDAwMDowMzowMC4wOiBGYWlsZWQgdG8gbG9h
ZCBncHVfaW5mbyBmaXJtd2FyZQoiYW1kZ3B1L3JhdmVuX2dwdV9pbmZvLmJpbiIKbm92IDEzIDEz
OjUzOjU1IGtlcm5lbDogYW1kZ3B1IDAwMDA6MDM6MDAuMDogRmF0YWwgZXJyb3IgZHVyaW5nIEdQ
VSBpbml0CgotLSAKWW91IGFyZSByZWNlaXZpbmcgdGhpcyBtYWlsIGJlY2F1c2U6CllvdSBhcmUg
d2F0Y2hpbmcgdGhlIGFzc2lnbmVlIG9mIHRoZSBidWcuCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
