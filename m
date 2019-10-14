Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A182D5D88
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 10:32:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 013B46E140;
	Mon, 14 Oct 2019 08:32:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C33C6E13D
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 08:32:35 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205185] New: amdgpu compile failure
Date: Mon, 14 Oct 2019 08:32:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: stijn+bugs@linux-ipv6.be
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-205185-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDUxODUKCiAgICAg
ICAgICAgIEJ1ZyBJRDogMjA1MTg1CiAgICAgICAgICAgU3VtbWFyeTogYW1kZ3B1IGNvbXBpbGUg
ZmFpbHVyZQogICAgICAgICAgIFByb2R1Y3Q6IERyaXZlcnMKICAgICAgICAgICBWZXJzaW9uOiAy
LjUKICAgIEtlcm5lbCBWZXJzaW9uOiA1LjMuNSAtIDUuMy42CiAgICAgICAgICBIYXJkd2FyZTog
QWxsCiAgICAgICAgICAgICAgICBPUzogTGludXgKICAgICAgICAgICAgICBUcmVlOiBNYWlubGlu
ZQogICAgICAgICAgICBTdGF0dXM6IE5FVwogICAgICAgICAgU2V2ZXJpdHk6IGJsb2NraW5nCiAg
ICAgICAgICBQcmlvcml0eTogUDEKICAgICAgICAgQ29tcG9uZW50OiBWaWRlbyhEUkkgLSBub24g
SW50ZWwpCiAgICAgICAgICBBc3NpZ25lZTogZHJpdmVyc192aWRlby1kcmlAa2VybmVsLWJ1Z3Mu
b3NkbC5vcmcKICAgICAgICAgIFJlcG9ydGVyOiBzdGlqbitidWdzQGxpbnV4LWlwdjYuYmUKICAg
ICAgICBSZWdyZXNzaW9uOiBObwoKNS4zLjUgYW5kIDUuMy42IGRvIG5vdCBjb21waWxlOgoKZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY24yMC9kY24yMF9kcHAuYzog
SW4gZnVuY3Rpb24K4oCYZHBwMl9jbnZfc2V0dXDigJk6CmRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1Ly4uL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfZHBwLmM6OTQ6MzA6IG5vdGU6IGJ5cmVmCnZh
cmlhYmxlIHdpbGwgYmUgZm9yY2libHkgaW5pdGlhbGl6ZWQKICBzdHJ1Y3Qgb3V0X2NzY19jb2xv
cl9tYXRyaXggdGJsX2VudHJ5OwogICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+
fn4KICBDQyBbTV0gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZGNu
MjAvZGNuMjBfaHViYnViLm8KZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9k
Yy9kY24yMC9kY24yMF9od3NlcS5jOiBJbiBmdW5jdGlvbgrigJhkY24yMF9pbml0X2h34oCZOgpk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h3c2Vx
LmM6NTg5OjM3OiBlcnJvcjoK4oCYY29uc3Qgc3RydWN0IHJlc291cmNlX2NhcHPigJkgaGFzIG5v
IG1lbWJlciBuYW1lZCDigJhudW1fZHNj4oCZOyBkaWQgeW91IG1lYW4K4oCYbnVtX2RkY+KAmT8K
ICBmb3IgKGkgPSAwOyBpIDwgcmVzX3Bvb2wtPnJlc19jYXAtPm51bV9kc2M7IGkrKykKICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn4KICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIG51bV9kZGMKZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4v
ZGlzcGxheS9kYy9kY24yMC9kY24yMF9od3NlcS5jOjU5MDozOiBlcnJvcjoKaW1wbGljaXQgZGVj
bGFyYXRpb24gb2YgZnVuY3Rpb24g4oCYZGNuMjBfZHNjX3BnX2NvbnRyb2zigJk7IGRpZCB5b3Ug
bWVhbgrigJhkY24yMF9kcHBfcGdfY29udHJvbOKAmT8gWy1XZXJyb3I9aW1wbGljaXQtZnVuY3Rp
b24tZGVjbGFyYXRpb25dCiAgIGRjbjIwX2RzY19wZ19jb250cm9sKGh3cywgcmVzX3Bvb2wtPmRz
Y3NbaV0tPmluc3QsIGZhbHNlKTsKICAgXn5+fn5+fn5+fn5+fn5+fn5+fn4KICAgZGNuMjBfZHBw
X3BnX2NvbnRyb2wKZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY24y
MC9kY24yMF9od3NlcS5jOjU5MDozOTogZXJyb3I6CuKAmHN0cnVjdCByZXNvdXJjZV9wb29s4oCZ
IGhhcyBubyBtZW1iZXIgbmFtZWQg4oCYZHNjc+KAmTsgZGlkIHlvdSBtZWFuIOKAmGRwcHPigJk/
CiAgIGRjbjIwX2RzY19wZ19jb250cm9sKGh3cywgcmVzX3Bvb2wtPmRzY3NbaV0tPmluc3QsIGZh
bHNlKTsKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fgogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkcHBzCgotLSAKWW91IGFyZSByZWNlaXZp
bmcgdGhpcyBtYWlsIGJlY2F1c2U6CllvdSBhcmUgd2F0Y2hpbmcgdGhlIGFzc2lnbmVlIG9mIHRo
ZSBidWcuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
