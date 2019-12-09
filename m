Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6BE117030
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 16:19:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E9196E49C;
	Mon,  9 Dec 2019 15:18:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0DFD6E49C
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 15:18:57 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205815] New: When playing a wine game, got black screen then
 screen flickers, game crashes and back to normal
Date: Mon, 09 Dec 2019 15:18:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ramaspaceship@free.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-205815-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDU4MTUKCiAgICAg
ICAgICAgIEJ1ZyBJRDogMjA1ODE1CiAgICAgICAgICAgU3VtbWFyeTogV2hlbiBwbGF5aW5nIGEg
d2luZSBnYW1lLCBnb3QgYmxhY2sgc2NyZWVuIHRoZW4gc2NyZWVuCiAgICAgICAgICAgICAgICAg
ICAgZmxpY2tlcnMsIGdhbWUgY3Jhc2hlcyBhbmQgYmFjayB0byBub3JtYWwKICAgICAgICAgICBQ
cm9kdWN0OiBEcml2ZXJzCiAgICAgICAgICAgVmVyc2lvbjogMi41CiAgICBLZXJuZWwgVmVyc2lv
bjogNS40LjItMX5leHAxIChEZWJpYW4gZXhwZXJpbWVudGFsKQogICAgICAgICAgSGFyZHdhcmU6
IHg4Ni02NAogICAgICAgICAgICAgICAgT1M6IExpbnV4CiAgICAgICAgICAgICAgVHJlZTogTWFp
bmxpbmUKICAgICAgICAgICAgU3RhdHVzOiBORVcKICAgICAgICAgIFNldmVyaXR5OiBub3JtYWwK
ICAgICAgICAgIFByaW9yaXR5OiBQMQogICAgICAgICBDb21wb25lbnQ6IFZpZGVvKERSSSAtIG5v
biBJbnRlbCkKICAgICAgICAgIEFzc2lnbmVlOiBkcml2ZXJzX3ZpZGVvLWRyaUBrZXJuZWwtYnVn
cy5vc2RsLm9yZwogICAgICAgICAgUmVwb3J0ZXI6IHJhbWFzcGFjZXNoaXBAZnJlZS5mcgogICAg
ICAgIFJlZ3Jlc3Npb246IE5vCgpDcmVhdGVkIGF0dGFjaG1lbnQgMjg2MjM1CiAgLS0+IGh0dHBz
Oi8vYnVnemlsbGEua2VybmVsLm9yZy9hdHRhY2htZW50LmNnaT9pZD0yODYyMzUmYWN0aW9uPWVk
aXQKU3lzdGVtIGpvdXJuYWwKClNpbmNlIEkgdXNlIGEgUnl6ZW4gNSAzNDAwRyBJIGhhdmUgdHJv
dWJsZSBwbGF5aW5nIHRoZSBXaW5lIGdhbWUgSSB1c2UgdG8gcGxheS4KSSBoYXZlIHRyaWVkIHNl
dmVyYWwga2VybmVscywgYW5kIHNlZW4gYSBsb3Qgb2YgcHJvZ3Jlc3MgZnJvbSA0LjE5IHRvIDUu
NC4KQnV0IGl0IHN0aWxsIGZhaWxzIGFmdGVyIGEgd2hpbGUuIEkgdXNlIERlYmlhbiBCdXN0ZXIg
d2l0aCB0aGUgbGF0ZXN0IERlYmlhbgpleHBlcmltZW50YWwga2VybmVsICg1LjQuMiksIFhvcmcg
YW5kIE1lc2EgYXJlIGZyb20gU2lkLgoKSSBhdHRhY2hlZCB0aGUgc3lzdGVtIGpvdXJuYWwgb2Yg
dGhlIGxhc3QgdHJ5IChhbmQgZmFpbHVyZSkuCgotLSAKWW91IGFyZSByZWNlaXZpbmcgdGhpcyBt
YWlsIGJlY2F1c2U6CllvdSBhcmUgd2F0Y2hpbmcgdGhlIGFzc2lnbmVlIG9mIHRoZSBidWcuCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
