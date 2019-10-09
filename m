Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F901D1750
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 20:07:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F40CF6EA2F;
	Wed,  9 Oct 2019 18:07:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D1B66EA2F
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 18:07:13 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205147] New: Unable to shut down - radeon_drv.c -
 radeon_suspend_kms()
Date: Wed, 09 Oct 2019 18:07:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rherbert@sympatico.ca
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-205147-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDUxNDcKCiAgICAg
ICAgICAgIEJ1ZyBJRDogMjA1MTQ3CiAgICAgICAgICAgU3VtbWFyeTogVW5hYmxlIHRvIHNodXQg
ZG93biAtIHJhZGVvbl9kcnYuYyAtCiAgICAgICAgICAgICAgICAgICAgcmFkZW9uX3N1c3BlbmRf
a21zKCkKICAgICAgICAgICBQcm9kdWN0OiBEcml2ZXJzCiAgICAgICAgICAgVmVyc2lvbjogMi41
CiAgICBLZXJuZWwgVmVyc2lvbjogNS4zLjUKICAgICAgICAgIEhhcmR3YXJlOiB4ODYtNjQKICAg
ICAgICAgICAgICAgIE9TOiBMaW51eAogICAgICAgICAgICAgIFRyZWU6IE1haW5saW5lCiAgICAg
ICAgICAgIFN0YXR1czogTkVXCiAgICAgICAgICBTZXZlcml0eTogbm9ybWFsCiAgICAgICAgICBQ
cmlvcml0eTogUDEKICAgICAgICAgQ29tcG9uZW50OiBWaWRlbyhEUkkgLSBub24gSW50ZWwpCiAg
ICAgICAgICBBc3NpZ25lZTogZHJpdmVyc192aWRlby1kcmlAa2VybmVsLWJ1Z3Mub3NkbC5vcmcK
ICAgICAgICAgIFJlcG9ydGVyOiByaGVyYmVydEBzeW1wYXRpY28uY2EKICAgICAgICBSZWdyZXNz
aW9uOiBObwoKRnJvbSB0aGUgNS4zLjUgY2hhbmdlbG9nOgoKIGRybS9yYWRlb246IEZpeCBFRUgg
ZHVyaW5nIGtleGVjCgogICAgWyBVcHN0cmVhbSBjb21taXQgNmY3ZmU5YTkzZTZjMDliZjk4OGM1
MDU5NDAzZjVmODhlMTdlMjFlNiBdCgogICAgRHVyaW5nIGtleGVjIHNvbWUgYWRhcHRlcnMgaGl0
IGFuIEVFSCBzaW5jZSB0aGV5IGFyZSBub3QgcHJvcGVybHkKICAgIHNodXQgZG93biBpbiB0aGUg
cmFkZW9uX3BjaV9zaHV0ZG93bigpIGZ1bmN0aW9uLiBBZGRpbmcKICAgIHJhZGVvbl9zdXNwZW5k
X2ttcygpIGZpeGVzIHRoaXMgaXNzdWUuCgpUaGlzIGNvbW1pdCBjcmVhdGVzIGEgcHJvYmxlbSB3
aGVyZSBJIGNhbid0IHNodXQgZG93biBvciByZXN0YXJ0IG15IHN5c3RlbQp3aXRob3V0IHByZXNz
aW5nIHRoZSBSZXN0IGJ1dHRvbi4gIFRoZSBwcm9ibGVtIGlzIHNvbHZlZCBieSBjb21tZW50aW5n
IG91dCB0aGUKY2FsbCB0byByYWRlb25fc3VzcGVuZF9rbXMoKSBpbiByYWRlb25fcGNpX3NodXRk
b3duLgoKVGhlIGdwdSBoYXJkd2FyZSBpcyBhbiBBVEkgUmFkZW9uIEhENTc3MCBpbiBhIFBDSS1F
IHNsb3Qgb24gYW4gSW50ZWwgREc0MVJRIE1CLgoKLS0gCllvdSBhcmUgcmVjZWl2aW5nIHRoaXMg
bWFpbCBiZWNhdXNlOgpZb3UgYXJlIHdhdGNoaW5nIHRoZSBhc3NpZ25lZSBvZiB0aGUgYnVnLgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
