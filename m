Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D24FF78DB1
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2019 16:21:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EBBC89B01;
	Mon, 29 Jul 2019 14:21:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.wl.linuxfoundation.org (mail.wl.linuxfoundation.org
 [198.145.29.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0353989B01
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2019 14:21:22 +0000 (UTC)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id C57D628856
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2019 14:21:22 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id B9FC3286BE; Mon, 29 Jul 2019 14:21:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=unavailable version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204365] New: amdgpu crashes when using parameter
 "drm.edid_firmware"
Date: Mon, 29 Jul 2019 14:21:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: felixhaedicke@web.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-204365-2300@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQzNjUKCiAgICAg
ICAgICAgIEJ1ZyBJRDogMjA0MzY1CiAgICAgICAgICAgU3VtbWFyeTogYW1kZ3B1IGNyYXNoZXMg
d2hlbiB1c2luZyBwYXJhbWV0ZXIKICAgICAgICAgICAgICAgICAgICAiZHJtLmVkaWRfZmlybXdh
cmUiCiAgICAgICAgICAgUHJvZHVjdDogRHJpdmVycwogICAgICAgICAgIFZlcnNpb246IDIuNQog
ICAgS2VybmVsIFZlcnNpb246IDUuMi40CiAgICAgICAgICBIYXJkd2FyZTogQWxsCiAgICAgICAg
ICAgICAgICBPUzogTGludXgKICAgICAgICAgICAgICBUcmVlOiBNYWlubGluZQogICAgICAgICAg
ICBTdGF0dXM6IE5FVwogICAgICAgICAgU2V2ZXJpdHk6IG5vcm1hbAogICAgICAgICAgUHJpb3Jp
dHk6IFAxCiAgICAgICAgIENvbXBvbmVudDogVmlkZW8oRFJJIC0gbm9uIEludGVsKQogICAgICAg
ICAgQXNzaWduZWU6IGRyaXZlcnNfdmlkZW8tZHJpQGtlcm5lbC1idWdzLm9zZGwub3JnCiAgICAg
ICAgICBSZXBvcnRlcjogZmVsaXhoYWVkaWNrZUB3ZWIuZGUKICAgICAgICBSZWdyZXNzaW9uOiBO
bwoKQ3JlYXRlZCBhdHRhY2htZW50IDI4NDAyNwogIC0tPiBodHRwczovL2J1Z3ppbGxhLmtlcm5l
bC5vcmcvYXR0YWNobWVudC5jZ2k/aWQ9Mjg0MDI3JmFjdGlvbj1lZGl0CmRtZXNnIGxvZyB3aXRo
IGFtZGdwdSBjcmFzaAoKQXMgYSB3b3JrYXJvdW5kIGZvciB0aGUgcHJvYmxlbSBkZXNjcmliZWQg
aW4gYnVnIDIwNDM2MywgSSBhbSB1c2luZyB0aGUKcGFyYW1ldGVyICJkcm0uZWRpZF9maXJtd2Fy
ZSIgcGFyYW1ldGVyIHRvIG92ZXJyaWRlIHRoZSBFRElELgoKVGhpcyBFRElEIHNlZW1zIHRvIHdv
cmsgZmluZSwgaWYgSSBsb2cgaW4gdG8gbXkgZGVza3RvcCAoR05PTUUgMy4zMiB1bnRlcgpYLm9y
ZykgYmVmb3JlIHBsdWdnaW5nIGluIHRoZSBIRE1JIGNhYmxlIHRvIHRoZSBwcm9qZWN0b3IuIEJ1
dCB3aGVuIHRoZSBIRE1JCmNhYmxlIGlzIHBsdWdnZWQgaW4gZHVyaW5nIGJvb3QsIG9yIHdoZW4g
bGF1bmNoaW5nIFdheWxhbmQgb3IgWC5vcmcgd2hlbiB0aGUKY2FibGUgaXMgcGx1Z2dlZCBpbiwg
dGhlIGdyYXBoaWNzIGRyaXZlciBjcmFzaGVzIHdpdGggdGhlIGZvbGxvd2luZyBlcnJvcgptZXNz
YWdlOgoKa2VybmVsIEJVRyBhdCBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5
L2FtZGdwdV9kbS9hbWRncHVfZG0uYzo2MjY0IQoKRnVsbCBkbWVzZyBsb2cgYXR0YWNoZWQuCgot
LSAKWW91IGFyZSByZWNlaXZpbmcgdGhpcyBtYWlsIGJlY2F1c2U6CllvdSBhcmUgd2F0Y2hpbmcg
dGhlIGFzc2lnbmVlIG9mIHRoZSBidWcuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
