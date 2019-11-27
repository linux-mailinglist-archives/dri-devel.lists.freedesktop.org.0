Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A967D10A938
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2019 04:47:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2620B895C8;
	Wed, 27 Nov 2019 03:47:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D785C89453
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2019 03:47:41 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205675] New: Display locks up. AMDGPU timeout
Date: Wed, 27 Nov 2019 03:47:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: freddyreimer@comcast.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-205675-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDU2NzUKCiAgICAg
ICAgICAgIEJ1ZyBJRDogMjA1Njc1CiAgICAgICAgICAgU3VtbWFyeTogRGlzcGxheSBsb2NrcyB1
cC4gQU1ER1BVIHRpbWVvdXQKICAgICAgICAgICBQcm9kdWN0OiBEcml2ZXJzCiAgICAgICAgICAg
VmVyc2lvbjogMi41CiAgICBLZXJuZWwgVmVyc2lvbjogNS40LjAKICAgICAgICAgIEhhcmR3YXJl
OiB4ODYtNjQKICAgICAgICAgICAgICAgIE9TOiBMaW51eAogICAgICAgICAgICAgIFRyZWU6IE1h
aW5saW5lCiAgICAgICAgICAgIFN0YXR1czogTkVXCiAgICAgICAgICBTZXZlcml0eTogaGlnaAog
ICAgICAgICAgUHJpb3JpdHk6IFAxCiAgICAgICAgIENvbXBvbmVudDogVmlkZW8oRFJJIC0gbm9u
IEludGVsKQogICAgICAgICAgQXNzaWduZWU6IGRyaXZlcnNfdmlkZW8tZHJpQGtlcm5lbC1idWdz
Lm9zZGwub3JnCiAgICAgICAgICBSZXBvcnRlcjogZnJlZGR5cmVpbWVyQGNvbWNhc3QubmV0CiAg
ICAgICAgUmVncmVzc2lvbjogTm8KCkNyZWF0ZWQgYXR0YWNobWVudCAyODYwNzkKICAtLT4gaHR0
cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL2F0dGFjaG1lbnQuY2dpP2lkPTI4NjA3OSZhY3Rpb249
ZWRpdApkbWVzZyB0YWlsIGZyb20gaW1tZWRpYXRlbHkgYWZ0ZXIgYSBsb2NrdXAKCkkgaGF2ZSBi
ZWVuIGVuY291bnRlcmluZyBpc3N1ZXMgdGhlIEFNREdQVSBkcml2ZXIgY29tcGxldGVseSBmYWls
aW5nIHdoZW4KbG9hZGluZyBnYW1lcy4gV2hlbiBsb2FkaW5nIGludG8gYSBnYW1lIGFuZCBhZnRl
ciBtYWtpbmcgb25lIGNsaWNrIG9yIG1vdmluZwp0aGUgbW91c2UsIHRoZSBkaXNwbGF5IHdpbGwg
Y29tcGxldGVseSBmcmVlemUuIENhbid0IHRhYiBvdXQgb3IgZ28gdG8gYSBUVFkgYXQKYWxsLiBJ
IGNhbiBTU0ggaW50byB0aGUgYm94IGFuZCBkbyBzdHVmZiwgc3VjaCBhcyBnZXR0aW5nIHRoZSBh
dHRhY2hlZCBkbWVzZwp0YWlsLCBidXQgZXZlbiBraWxsaW5nIHRoZSBwcm9jZXNzIGRvZXNuJ3Qg
dW5mcmVlemUgdGhlIGRpc3BsYXksIHdoaWNoIGhhcyB0aGUKc3RpbGwgaW1hZ2Ugb2YgdGhlIGdh
bWUuIE9ubHkgcmVib290aW5nIHVubG9ja3MgaXQuIAoKQmFzaWNhbGx5IGl0IGp1c3Qgc2VlbXMg
dG8gdGltZW91dCBhbmQgdGhlbiBjYW4ndCByZWNvdmVyLCBhbmQgdGhpcyBoYXBwZW5zIGFsbAp0
aGUgdGltZSBvbiBjZXJ0YWluIGdhbWVzLCBidXQgaW5jb25zaXN0ZW50IGFzIHRvIHdoYXQgZW52
aXJvbm1lbnQgaXQgaGFwcGVucy4KU29tZSBsb2NrIGl0IHVwIG9uIFhvcmcgYnV0IHdvcmsgZmlu
ZSBvbiBXYXlsYW5kLiBTb21lIHdvcmsgZmluZSBvbiBXYXlsYW5kIGJ1dApicmVhayBvbiBYb3Jn
LiBTb21lIG5ldmVyIHdvcmsgYXQgYWxsLiBNeSBHcmFwaGljcyBjYXJkIGlzIGEgTmF2aTEwLCBS
WDU3MDAuCkknbSBvbiB0aGUgNS40IGtlcm5lbCwgYnV0IHRoaXMgd2FzIGhhcHBlbmluZyBvbiA1
LjMgYXMgd2VsbC4KCi0tIApZb3UgYXJlIHJlY2VpdmluZyB0aGlzIG1haWwgYmVjYXVzZToKWW91
IGFyZSB3YXRjaGluZyB0aGUgYXNzaWduZWUgb2YgdGhlIGJ1Zy4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
