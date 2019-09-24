Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A05DFBD36B
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 22:18:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA9956EAF5;
	Tue, 24 Sep 2019 20:18:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06A396EAF5
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2019 20:18:12 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204987] New: general protection fault in
 amdgpu_dm_atomic_commit_tail (Vega64)
Date: Tue, 24 Sep 2019 20:18:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: steinex@nognu.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-204987-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQ5ODcKCiAgICAg
ICAgICAgIEJ1ZyBJRDogMjA0OTg3CiAgICAgICAgICAgU3VtbWFyeTogZ2VuZXJhbCBwcm90ZWN0
aW9uIGZhdWx0IGluCiAgICAgICAgICAgICAgICAgICAgYW1kZ3B1X2RtX2F0b21pY19jb21taXRf
dGFpbCAoVmVnYTY0KQogICAgICAgICAgIFByb2R1Y3Q6IERyaXZlcnMKICAgICAgICAgICBWZXJz
aW9uOiAyLjUKICAgIEtlcm5lbCBWZXJzaW9uOiA1LjMuMQogICAgICAgICAgSGFyZHdhcmU6IHg4
Ni02NAogICAgICAgICAgICAgICAgT1M6IExpbnV4CiAgICAgICAgICAgICAgVHJlZTogTWFpbmxp
bmUKICAgICAgICAgICAgU3RhdHVzOiBORVcKICAgICAgICAgIFNldmVyaXR5OiBoaWdoCiAgICAg
ICAgICBQcmlvcml0eTogUDEKICAgICAgICAgQ29tcG9uZW50OiBWaWRlbyhEUkkgLSBub24gSW50
ZWwpCiAgICAgICAgICBBc3NpZ25lZTogZHJpdmVyc192aWRlby1kcmlAa2VybmVsLWJ1Z3Mub3Nk
bC5vcmcKICAgICAgICAgIFJlcG9ydGVyOiBzdGVpbmV4QG5vZ251LmRlCiAgICAgICAgUmVncmVz
c2lvbjogTm8KCmRybS5kZWJ1Zz0weDU0IGxvZyB1cGxvYWRlZCBoZXJlIGR1ZSB0byBhdHRhY2ht
ZW50IHNpemUgbGltaXQ6Cmh0dHBzOi8vbm9nbnUuZGUvcC8xNTY5MzU1NjUwCgpUaGlzIGlzIG9u
IDUuMy4xIHdpdGggdGhpcyBwYXRjaCBzZXJpZXMgYXBwbGllZDoKaHR0cHM6Ly9wYXRjaHdvcmsu
ZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy82NDUwNS8KCkl0IGhhcHBlbnMgYmV0d2VlbiB+NSBhbmQg
fjQ1IG1pbnV0ZXMgYWZ0ZXIgdGhlIHN5c3RlbSBpcyBib290ZWQgaW50byBYLiBUaGVyZQppcyBu
byBvYnZpb3VzIHBhdHRlcm4gd2hhdCB0cmlnZ2VycyBpdC4KCi0tIApZb3UgYXJlIHJlY2Vpdmlu
ZyB0aGlzIG1haWwgYmVjYXVzZToKWW91IGFyZSB3YXRjaGluZyB0aGUgYXNzaWduZWUgb2YgdGhl
IGJ1Zy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
