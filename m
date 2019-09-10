Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A77C2AEEBA
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2019 17:43:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEEC76E91F;
	Tue, 10 Sep 2019 15:43:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EC4C6E91F
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2019 15:43:24 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204805] New: BUG: kernel NULL pointer dereference, address:
 0000000000000200
Date: Tue, 10 Sep 2019 15:43:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: ilkka.prusi@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-204805-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQ4MDUKCiAgICAg
ICAgICAgIEJ1ZyBJRDogMjA0ODA1CiAgICAgICAgICAgU3VtbWFyeTogQlVHOiBrZXJuZWwgTlVM
TCBwb2ludGVyIGRlcmVmZXJlbmNlLCBhZGRyZXNzOgogICAgICAgICAgICAgICAgICAgIDAwMDAw
MDAwMDAwMDAyMDAKICAgICAgICAgICBQcm9kdWN0OiBEcml2ZXJzCiAgICAgICAgICAgVmVyc2lv
bjogMi41CiAgICBLZXJuZWwgVmVyc2lvbjogNS4yLjEyCiAgICAgICAgICBIYXJkd2FyZTogeDg2
LTY0CiAgICAgICAgICAgICAgICBPUzogTGludXgKICAgICAgICAgICAgICBUcmVlOiBNYWlubGlu
ZQogICAgICAgICAgICBTdGF0dXM6IE5FVwogICAgICAgICAgU2V2ZXJpdHk6IGhpZ2gKICAgICAg
ICAgIFByaW9yaXR5OiBQMQogICAgICAgICBDb21wb25lbnQ6IFZpZGVvKERSSSAtIG5vbiBJbnRl
bCkKICAgICAgICAgIEFzc2lnbmVlOiBkcml2ZXJzX3ZpZGVvLWRyaUBrZXJuZWwtYnVncy5vc2Rs
Lm9yZwogICAgICAgICAgUmVwb3J0ZXI6IGlsa2thLnBydXNpQGdtYWlsLmNvbQogICAgICAgIFJl
Z3Jlc3Npb246IE5vCgpDcmVhdGVkIGF0dGFjaG1lbnQgMjg0OTA5CiAgLS0+IGh0dHBzOi8vYnVn
emlsbGEua2VybmVsLm9yZy9hdHRhY2htZW50LmNnaT9pZD0yODQ5MDkmYWN0aW9uPWVkaXQKa2Vy
bi5sb2cKCkEgYnVnIHRoYXQgbG9va3MgbGlrZSBjYXVzZWQgYnkgYW1kZ3B1X2RybS4KCkhhcmQg
bG9ja3VwIG9mIHN5c3RlbSBhcy1pbiBub3QgcmVzcG9uZGluZyB0byBhbnkgaW5wdXRzLCBhZnRl
ciBmb3JjZWQgcmVzZXQKdGhlIGF0dGFjaGVkIGJ1ZyBpbmZvcm1hdGlvbiBpbiBrZXJuLmxvZwoK
LS0gCllvdSBhcmUgcmVjZWl2aW5nIHRoaXMgbWFpbCBiZWNhdXNlOgpZb3UgYXJlIHdhdGNoaW5n
IHRoZSBhc3NpZ25lZSBvZiB0aGUgYnVnLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
