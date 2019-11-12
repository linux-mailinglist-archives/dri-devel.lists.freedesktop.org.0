Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C498F87C3
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 06:20:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D1B96E34E;
	Tue, 12 Nov 2019 05:20:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82CAD6E34E
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 05:20:27 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205497] New: Attempt to read amd gpu id causes a freeze
Date: Tue, 12 Nov 2019 05:20:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: luya@fedoraproject.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-205497-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDU0OTcKCiAgICAg
ICAgICAgIEJ1ZyBJRDogMjA1NDk3CiAgICAgICAgICAgU3VtbWFyeTogQXR0ZW1wdCB0byByZWFk
IGFtZCBncHUgaWQgY2F1c2VzIGEgZnJlZXplCiAgICAgICAgICAgUHJvZHVjdDogRHJpdmVycwog
ICAgICAgICAgIFZlcnNpb246IDIuNQogICAgS2VybmVsIFZlcnNpb246IDUuMy45CiAgICAgICAg
ICBIYXJkd2FyZTogQWxsCiAgICAgICAgICAgICAgICBPUzogTGludXgKICAgICAgICAgICAgICBU
cmVlOiBNYWlubGluZQogICAgICAgICAgICBTdGF0dXM6IE5FVwogICAgICAgICAgU2V2ZXJpdHk6
IG5vcm1hbAogICAgICAgICAgUHJpb3JpdHk6IFAxCiAgICAgICAgIENvbXBvbmVudDogVmlkZW8o
RFJJIC0gbm9uIEludGVsKQogICAgICAgICAgQXNzaWduZWU6IGRyaXZlcnNfdmlkZW8tZHJpQGtl
cm5lbC1idWdzLm9zZGwub3JnCiAgICAgICAgICBSZXBvcnRlcjogbHV5YUBmZWRvcmFwcm9qZWN0
Lm9yZwogICAgICAgIFJlZ3Jlc3Npb246IE5vCgpDcmVhdGVkIGF0dGFjaG1lbnQgMjg1ODcxCiAg
LS0+IGh0dHBzOi8vYnVnemlsbGEua2VybmVsLm9yZy9hdHRhY2htZW50LmNnaT9pZD0yODU4NzEm
YWN0aW9uPWVkaXQKU2NyaXB0IGZyb20gcmFkZW9udG9wIHRvIHJlYWQgQU1EIGdwdSBpZHMKClJ1
bm5pbmcgYW4gdXRpbGl0eSBuYW1lZCByYWRlb250b3Agb24gYW4gQU1EIEFQVSBjYXVzZXMgYSBm
cmVlemUgd2hpbGUKYXR0ZW1wdGluZyB0byByZWFkIGFtZGdwdSBpZHMuIEF0dGFjaGVkIGlzIHRo
ZSBzY3JpcHQuIApJdCB3aWxsIGJlIG5pY2UgdG8gcHJvdmlkZSBhIGJldHRlciBtZXRob2QgdG8g
cmVhZCBBTUQgR1BVIGNhcmRzLgoKLS0gCllvdSBhcmUgcmVjZWl2aW5nIHRoaXMgbWFpbCBiZWNh
dXNlOgpZb3UgYXJlIHdhdGNoaW5nIHRoZSBhc3NpZ25lZSBvZiB0aGUgYnVnLgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
