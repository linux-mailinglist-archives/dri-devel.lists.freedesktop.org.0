Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E3CCCD58
	for <lists+dri-devel@lfdr.de>; Sun,  6 Oct 2019 02:01:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CDAD6E0BF;
	Sun,  6 Oct 2019 00:01:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 989E36E042
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Oct 2019 00:01:47 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205093] New: [amdgpu] resume of IP block <gfx_v8_0> failed -110
Date: Sun, 06 Oct 2019 00:01:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kat.zygfryd@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-205093-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDUwOTMKCiAgICAg
ICAgICAgIEJ1ZyBJRDogMjA1MDkzCiAgICAgICAgICAgU3VtbWFyeTogW2FtZGdwdV0gcmVzdW1l
IG9mIElQIGJsb2NrIDxnZnhfdjhfMD4gZmFpbGVkIC0xMTAKICAgICAgICAgICBQcm9kdWN0OiBE
cml2ZXJzCiAgICAgICAgICAgVmVyc2lvbjogMi41CiAgICBLZXJuZWwgVmVyc2lvbjogNS4yLjEz
CiAgICAgICAgICBIYXJkd2FyZTogeDg2LTY0CiAgICAgICAgICAgICAgICBPUzogTGludXgKICAg
ICAgICAgICAgICBUcmVlOiBNYWlubGluZQogICAgICAgICAgICBTdGF0dXM6IE5FVwogICAgICAg
ICAgU2V2ZXJpdHk6IG5vcm1hbAogICAgICAgICAgUHJpb3JpdHk6IFAxCiAgICAgICAgIENvbXBv
bmVudDogVmlkZW8oRFJJIC0gbm9uIEludGVsKQogICAgICAgICAgQXNzaWduZWU6IGRyaXZlcnNf
dmlkZW8tZHJpQGtlcm5lbC1idWdzLm9zZGwub3JnCiAgICAgICAgICBSZXBvcnRlcjoga2F0Lnp5
Z2ZyeWRAZ21haWwuY29tCiAgICAgICAgUmVncmVzc2lvbjogTm8KCkNyZWF0ZWQgYXR0YWNobWVu
dCAyODUzNTkKICAtLT4gaHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL2F0dGFjaG1lbnQuY2dp
P2lkPTI4NTM1OSZhY3Rpb249ZWRpdApGdWxsIGRtZXNnIG9uIDUuMi4xMwoKT25jZSBpbiBhIHdo
aWxlIGltbWVkaWF0ZWx5IGFmdGVyIHJlc3VtaW5nIGZyb20gc3VzcGVuZCB0aGUgc2NyZWVuIGZy
ZWV6ZXMgZm9yCmEgbW9tZW50IGFuZCB0aGVuIEkgbG9zZSBhbGwgdmlkZW8gc2lnbmFscy4gU3lz
dGVtIGlzIGFibGUgdG8gYmUgcmVib290ZWQgd2l0aApzeXNycS4KCkhhcmR3YXJlOgoKKiBSYWRl
b24gUlggNDcwCiogUnl6ZW4gMjcwMAoqIDY0R0IgRUNDIFJBTQoKTm8gc2lnbmlmaWNhbnQgbG9h
ZCBpcyBwdXQgb24gdGhlIEdQVSwgYmVjYXVzZSB0aGUgc3lzdGVtIGlzIG9ubHkgdXNlZCBmb3IK
d29yaywgYnJvd3NpbmcgYW5kIHBsYXlpbmcgdmlkZW8uCgpZb3UgY2FuIGFsc28gc2VlIGJ1ZyAy
MDI4OTEgKF9fbnZtZV9kaXNhYmxlX2lvX3F1ZXVlcyB0cmlnZ2VycyBXQVJOSU5HIGluCmtlcm5l
bC9pcnEvY2hpcC5jOjIxMCkgaW4gYm90aCBsb2dzLCBidXQgdGhhdCBvbmUgaGFwcGVucyBmYXIg
bW9yZSBvZnRlbgp3aXRob3V0IHRoaXMgYnVnIGNvbWFuaWZlc3RpbmcuCgotLSAKWW91IGFyZSBy
ZWNlaXZpbmcgdGhpcyBtYWlsIGJlY2F1c2U6CllvdSBhcmUgd2F0Y2hpbmcgdGhlIGFzc2lnbmVl
IG9mIHRoZSBidWcuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
