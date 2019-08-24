Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D28A29BCC7
	for <lists+dri-devel@lfdr.de>; Sat, 24 Aug 2019 11:28:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8AB36E09F;
	Sat, 24 Aug 2019 09:28:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB6C26E09F
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Aug 2019 09:28:32 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204683] New: amdgpu: ring sdma0 timeout
Date: Sat, 24 Aug 2019 09:28:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mh@familie-heinz.name
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-204683-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQ2ODMKCiAgICAg
ICAgICAgIEJ1ZyBJRDogMjA0NjgzCiAgICAgICAgICAgU3VtbWFyeTogYW1kZ3B1OiByaW5nIHNk
bWEwIHRpbWVvdXQKICAgICAgICAgICBQcm9kdWN0OiBEcml2ZXJzCiAgICAgICAgICAgVmVyc2lv
bjogMi41CiAgICBLZXJuZWwgVmVyc2lvbjogNS4zLjAtcmM1CiAgICAgICAgICBIYXJkd2FyZTog
eDg2LTY0CiAgICAgICAgICAgICAgICBPUzogTGludXgKICAgICAgICAgICAgICBUcmVlOiBNYWlu
bGluZQogICAgICAgICAgICBTdGF0dXM6IE5FVwogICAgICAgICAgU2V2ZXJpdHk6IG5vcm1hbAog
ICAgICAgICAgUHJpb3JpdHk6IFAxCiAgICAgICAgIENvbXBvbmVudDogVmlkZW8oRFJJIC0gbm9u
IEludGVsKQogICAgICAgICAgQXNzaWduZWU6IGRyaXZlcnNfdmlkZW8tZHJpQGtlcm5lbC1idWdz
Lm9zZGwub3JnCiAgICAgICAgICBSZXBvcnRlcjogbWhAZmFtaWxpZS1oZWluei5uYW1lCiAgICAg
ICAgUmVncmVzc2lvbjogTm8KCkhpLAoKd2hlbiBwbGF5aW5nIHNvbWUgZ2FtZXMgSSByYW5kb21s
eSAoc29tZXRpbWVzIGFmdGVyIDUgbWludXRlcywgc29tZXRpbWVzIGFmdGVyCjIgaG91cnMpIGdl
dCBhIGJsYW5rIHNjcmVlbiwgc29tZXRpbWVzIGF1ZGlvIHN0aWxsIHdvcmtzLCBzb21ldGltZXMg
dGhlIHdob2xlCnN5c3RlbSBsb2NrcyB1cC4gSSd2ZSBzZWVuIHRoaXMgd2l0aCBSaXNlIG9mIHRo
ZSBUb21iIFJhaWRlciBhbmQgNyBEYXlzIHRvIERpZQpzbyBmYXIuCgpJIGZpbmFsbHkgbWFuYWdl
ZCB0byBzeW5jIHRoZSBsb2cgZmlsZXMgdG8gZGlzayB0byBnZXQgYW4gZXJyb3IsIGJlZm9yZSB3
aG9sZQp0aGluZyBsb2NrZWQgdXA6CgpBdWcgMjQgMTE6MTM6MzMgZWdhbGl0ZSBrZXJuZWw6IFtk
cm06YW1kZ3B1X2pvYl90aW1lZG91dCBbYW1kZ3B1XV0gKkVSUk9SKiByaW5nCnNkbWEwIHRpbWVv
dXQsIHNpZ25hbGVkIHNlcT0zNjgwNTYsIGVtaXR0ZWQgc2VxPTM2ODA1NwpBdWcgMjQgMTE6MTM6
MzMgZWdhbGl0ZSBrZXJuZWw6IFtkcm06ZHJtX2F0b21pY19oZWxwZXJfd2FpdF9mb3JfZmxpcF9k
b25lCltkcm1fa21zX2hlbHBlcl1dICpFUlJPUiogW0NSVEM6NDc6Y3J0Yy0wXSBmbGlwX2RvbmUg
dGltZWQgb3V0CkF1ZyAyNCAxMToxMzozMyBlZ2FsaXRlIGtlcm5lbDogW2RybTphbWRncHVfam9i
X3RpbWVkb3V0IFthbWRncHVdXSAqRVJST1IqClByb2Nlc3MgaW5mb3JtYXRpb246IHByb2Nlc3Mg
N0RheXNUb0RpZS54ODZfIHBpZCA4MTA4IHRocmVhZCA3RGF5c1RvRGllOmNzMApBdWcgMjQgMTE6
MTM6MzMgZWdhbGl0ZSBrZXJuZWw6IGFtZGdwdSAwMDAwOjBjOjAwLjA6IEdQVSByZXNldCBiZWdp
biEKQXVnIDI0IDExOjEzOjMzIGVnYWxpdGUga2VybmVsOiBbZHJtOmFtZGdwdV9qb2JfdGltZWRv
dXQgW2FtZGdwdV1dICpFUlJPUiogcmluZwpnZnggdGltZW91dCwgYnV0IHNvZnQgcmVjb3ZlcmVk
CgpPbmx5IGEgaGFyZCByZXNldCBtYWRlIG1lIHJlY292ZXIgZnJvbSB0aGF0LgoKClRoaXMgaXMg
d2l0aCBhIHNlbGYtYnVpbHQga2VybmVsIDUuMy4wLXJjNS4gQWxzbyBoYXBwZW5zIHdpdGggNS4y
LjEuCk1lc2E6IDE5LjEuNC0xCkdQVTogVmVnYSA1NgoKQmVzdApNYXR0aGlhcwoKLS0gCllvdSBh
cmUgcmVjZWl2aW5nIHRoaXMgbWFpbCBiZWNhdXNlOgpZb3UgYXJlIHdhdGNoaW5nIHRoZSBhc3Np
Z25lZSBvZiB0aGUgYnVnLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
