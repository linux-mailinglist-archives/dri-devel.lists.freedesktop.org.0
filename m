Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3B21BCA4F
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 20:50:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76D586E9DD;
	Tue, 28 Apr 2020 18:50:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50CE36E9DD
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 18:50:20 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 207483] New: PowerColor AMD RX580 much higher power usage on
 idle than Windows 10
Date: Tue, 28 Apr 2020 18:50:19 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: andrea.somaini00@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-207483-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDc0ODMKCiAgICAg
ICAgICAgIEJ1ZyBJRDogMjA3NDgzCiAgICAgICAgICAgU3VtbWFyeTogUG93ZXJDb2xvciBBTUQg
Ulg1ODAgbXVjaCBoaWdoZXIgcG93ZXIgdXNhZ2Ugb24gaWRsZQogICAgICAgICAgICAgICAgICAg
IHRoYW4gV2luZG93cyAxMAogICAgICAgICAgIFByb2R1Y3Q6IERyaXZlcnMKICAgICAgICAgICBW
ZXJzaW9uOiAyLjUKICAgIEtlcm5lbCBWZXJzaW9uOiA1LjUuMi0wNTA1MDItZ2VuZXJpYwogICAg
ICAgICAgSGFyZHdhcmU6IEludGVsCiAgICAgICAgICAgICAgICBPUzogTGludXgKICAgICAgICAg
ICAgICBUcmVlOiBNYWlubGluZQogICAgICAgICAgICBTdGF0dXM6IE5FVwogICAgICAgICAgU2V2
ZXJpdHk6IGxvdwogICAgICAgICAgUHJpb3JpdHk6IFAxCiAgICAgICAgIENvbXBvbmVudDogVmlk
ZW8oRFJJIC0gbm9uIEludGVsKQogICAgICAgICAgQXNzaWduZWU6IGRyaXZlcnNfdmlkZW8tZHJp
QGtlcm5lbC1idWdzLm9zZGwub3JnCiAgICAgICAgICBSZXBvcnRlcjogYW5kcmVhLnNvbWFpbmkw
MEBnbWFpbC5jb20KICAgICAgICBSZWdyZXNzaW9uOiBObwoKSSBoYXZlIHRoaXMgR1BVIGluc3Rh
bGxlZCBvbiBteSBzeXN0ZW06Cmh0dHBzOi8vd3d3LnBvd2VyY29sb3IuY29tL3Byb2R1Y3Q/aWQ9
MTQ5MzA4NDMwNAoKVGhlIHByb2JsZW0gaXMgdGhhdCB0aGUgcG93ZXIgdXNhZ2Ugd2hpbGUgdXNp
bmcgTGludXggYW5kIGp1c3QgbG9va2luZyBhdCB0aGUKZGVza3RvcCBpcyBtdWNoIGhpZ2hlciB0
aGFuIG9uIFdpbmRvd3MsIGluIHBhcnRpY3VsYXI6Cgp+NywyIFdhdHQgV2luZG93cyAxMAp+MzEs
MiBXYXR0IExpbnV4IChYb3JnLCBXYXlsYW5kLCB0dHkgb25seSBldGMpCgpJdCBpcyBtb3JlIHRo
YW4gNCB0aW1lcyBhcyBtdWNoIHBvd2VyIQoKSW5kZWVkLCBhZnRlciBhIHdoaWxlIGRvaW5nIGxp
Z2h0IHdlYiBicm93c2luZywgdGhlIHRlbXBlcmF0dXJlcyBhcmUgZGlmZmVyZW50CmluIHRoZSAy
IHN5c3RlbXMgd2l0aCB0aGUgR1BVIGZhbnMgdHVybmVkIG9mZiwgaW4gcGFydGljdWxhcjoKCn4z
Ny4wwrBDIG9uIFdpbmRvd3MgMTAKQmV0d2VlbiA0My4wwrBDIGFuZCA1MC4wwrBDIG9uIExpbnV4
CgotLSAKWW91IGFyZSByZWNlaXZpbmcgdGhpcyBtYWlsIGJlY2F1c2U6CllvdSBhcmUgd2F0Y2hp
bmcgdGhlIGFzc2lnbmVlIG9mIHRoZSBidWcuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
