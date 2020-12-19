Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 154EE2DEDF1
	for <lists+dri-devel@lfdr.de>; Sat, 19 Dec 2020 10:20:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FC02894E0;
	Sat, 19 Dec 2020 09:20:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D10D7894E0
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Dec 2020 09:20:01 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 210787] New: amdgpu fan NA on multi gpu R9 nano
Date: Sat, 19 Dec 2020 09:20:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: janpieter.sollie@edpnet.be
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-210787-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMTA3ODcKCiAgICAg
ICAgICAgIEJ1ZyBJRDogMjEwNzg3CiAgICAgICAgICAgU3VtbWFyeTogYW1kZ3B1IGZhbiBOQSBv
biBtdWx0aSBncHUgUjkgbmFubwogICAgICAgICAgIFByb2R1Y3Q6IERyaXZlcnMKICAgICAgICAg
ICBWZXJzaW9uOiAyLjUKICAgIEtlcm5lbCBWZXJzaW9uOiA1LjkuMTItNS4xMC4xCiAgICAgICAg
ICBIYXJkd2FyZTogeDg2LTY0CiAgICAgICAgICAgICAgICBPUzogTGludXgKICAgICAgICAgICAg
ICBUcmVlOiBNYWlubGluZQogICAgICAgICAgICBTdGF0dXM6IE5FVwogICAgICAgICAgU2V2ZXJp
dHk6IG5vcm1hbAogICAgICAgICAgUHJpb3JpdHk6IFAxCiAgICAgICAgIENvbXBvbmVudDogVmlk
ZW8oRFJJIC0gbm9uIEludGVsKQogICAgICAgICAgQXNzaWduZWU6IGRyaXZlcnNfdmlkZW8tZHJp
QGtlcm5lbC1idWdzLm9zZGwub3JnCiAgICAgICAgICBSZXBvcnRlcjogamFucGlldGVyLnNvbGxp
ZUBlZHBuZXQuYmUKICAgICAgICBSZWdyZXNzaW9uOiBObwoKQ3JlYXRlZCBhdHRhY2htZW50IDI5
NDIyOQogIC0tPiBodHRwczovL2J1Z3ppbGxhLmtlcm5lbC5vcmcvYXR0YWNobWVudC5jZ2k/aWQ9
Mjk0MjI5JmFjdGlvbj1lZGl0CmRtZXNnIHdpdGggbWFudWFsIEdQVSBsb2FkaW5nCgp3aGVuIHJ1
bm5pbmcgc2Vuc29ycywgdGhlIDFzdCBHUFUgZmFuICh0aGlzIEdQVSBoYXMgdGhlIGRpc3BsYXkg
YXR0YWNoZWQpIGlzCnVuYXZhaWxhYmxlOgo+IGFtZGdwdS1wY2ktMDcwMAo+IEFkYXB0ZXI6IFBD
SSBhZGFwdGVyCj4gdmRkZ2Z4OiAgICAgIDkwMC4wMCBtVgo+IGZhbjE6ICAgICAgICAgICAgIE4v
QSAgKG1pbiA9IDEwMDAgUlBNLCBtYXggPSA0MjAwIFJQTSkKPiBlZGdlOiAgICAgICAgICsyMy4w
wrBDICAoY3JpdCA9ICs4OS4wwrBDLCBoeXN0ID0gLTI3My4xwrBDKQo+IHBvd2VyMTogICAgICAg
MTAuMjMgVyAgKGNhcCA9IDE1MC4wMCBXKQo+Cj4gYW1kZ3B1LXBjaS00MzAwCj4gQWRhcHRlcjog
UENJIGFkYXB0ZXIKPiB2ZGRnZng6ICAgICAgODUwLjAwIG1WCj4gZmFuMTogICAgICAgIDE1NDQg
UlBNICAobWluID0gMTAwMCBSUE0sIG1heCA9IDQyMDAgUlBNKQo+IGVkZ2U6ICAgICAgICAgKzI2
LjDCsEMgIChjcml0ID0gKzg5LjDCsEMsIGh5c3QgPSAtMjczLjHCsEMpCj4gcG93ZXIxOiAgICAg
ICAxMC4wOCBXICAoY2FwID0gMTUwLjAwIFcpCmJsYWNrbGlzdGluZyBhbWRncHUgZGlkIG5vdCBo
ZWxwLCBidXQgd2hlbiBicmVha2luZyB0aGUgY29uZmlnIChzcGVjaWZ5aW5nIGFuCmludmFsaWQg
cGFyYW1ldGVyIGluIC9ldGMvbW9kcHJvYmUuZC9hbWRncHUuY29uZiksIGFuZCBsb2FkaW5nIGl0
IG1hbnVhbGx5IHdpdGgKY29ycmVjdCBwYXJhbWV0ZXJzLCBpdCB3b3Jrcy4KCldlJ3JlIHRhbGtp
bmcgYWJvdXQgYSByeXplbiAxOTUweCBzZXR1cCBoZXJlIHdpdGggMnggcjkgbmFubyBHUFVzCgot
LSAKWW91IG1heSByZXBseSB0byB0aGlzIGVtYWlsIHRvIGFkZCBhIGNvbW1lbnQuCgpZb3UgYXJl
IHJlY2VpdmluZyB0aGlzIG1haWwgYmVjYXVzZToKWW91IGFyZSB3YXRjaGluZyB0aGUgYXNzaWdu
ZWUgb2YgdGhlIGJ1Zy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
