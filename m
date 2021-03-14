Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7A333A8E7
	for <lists+dri-devel@lfdr.de>; Mon, 15 Mar 2021 00:44:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A31789CF6;
	Sun, 14 Mar 2021 23:44:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4672D89CF6
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Mar 2021 23:44:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 2BD1264E76
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Mar 2021 23:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615765479;
 bh=ivtnw8FzeV2lsrXc8YeeyFOEMdXwkmZvuey3K1dBtfE=;
 h=From:To:Subject:Date:From;
 b=gXi6Elj4UFXi3Zl4BIv1XkteyfqY83ZNFbzTJVzIE5terpGks24o6IGHjGIfXNcm2
 uNFyGv/nHqhWfEVc7IBPEvHaw7f7RZjhBzkD3afeNbYVbSHzQYzO3GhWQEy7wMwj+W
 4eG7soLe3ZFTdWvNWDUdHXPzWNKBhg3hiOTlsCxQH0zMlqe1+k4lkSomom81OSoCbd
 Jy0v8OjhQyjMlVI5H+76k5gJQ62uSaPqPnjDZRXBerZvdDpBlPI1MWOUIXYsg77bmd
 knpHjXlGbQcrmFtJdwSVkKTXwuEZ0ZkaFb+jbh6zr9fYTOxf8UUz3GE9F740HDJinv
 /Cn8w0SetGr9g==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 23166652F6; Sun, 14 Mar 2021 23:44:39 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: =?UTF-8?B?W0J1ZyAyMTIyNzldIE5ldzogQU1ER1BVIGRvZXNu4oCZdCBleHBv?=
 =?UTF-8?B?c2UgYW55IHdheSBvZiBzZXR0aW5nIHRoZSBmdWxsIFJHQiByYW5nZSBbcnl6?=
 =?UTF-8?B?ZW4rIG1vYmlsZV0=?=
Date: Sun, 14 Mar 2021 23:44:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: enhancement
X-Bugzilla-Who: ledufff@hotmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-212279-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMTIyNzkKCiAgICAg
ICAgICAgIEJ1ZyBJRDogMjEyMjc5CiAgICAgICAgICAgU3VtbWFyeTogQU1ER1BVIGRvZXNu4oCZ
dCBleHBvc2UgYW55IHdheSBvZiBzZXR0aW5nIHRoZSBmdWxsIFJHQgogICAgICAgICAgICAgICAg
ICAgIHJhbmdlIFtyeXplbisgbW9iaWxlXQogICAgICAgICAgIFByb2R1Y3Q6IERyaXZlcnMKICAg
ICAgICAgICBWZXJzaW9uOiAyLjUKICAgIEtlcm5lbCBWZXJzaW9uOiBhbGwKICAgICAgICAgIEhh
cmR3YXJlOiBBbGwKICAgICAgICAgICAgICAgIE9TOiBMaW51eAogICAgICAgICAgICAgIFRyZWU6
IE1haW5saW5lCiAgICAgICAgICAgIFN0YXR1czogTkVXCiAgICAgICAgICBTZXZlcml0eTogZW5o
YW5jZW1lbnQKICAgICAgICAgIFByaW9yaXR5OiBQMQogICAgICAgICBDb21wb25lbnQ6IFZpZGVv
KERSSSAtIG5vbiBJbnRlbCkKICAgICAgICAgIEFzc2lnbmVlOiBkcml2ZXJzX3ZpZGVvLWRyaUBr
ZXJuZWwtYnVncy5vc2RsLm9yZwogICAgICAgICAgUmVwb3J0ZXI6IGxlZHVmZmZAaG90bWFpbC5j
b20KICAgICAgICBSZWdyZXNzaW9uOiBObwoKSGVsbG8sICBJJ2QgbGlrZSB0byBhZGRyZXNzIHRo
YXQgdGhlcmUncyBubyB3YXkgdG8gc2V0IGZ1bGwgUkdCIHJhbmdlIHRvIEhETUkKZm9yIG15IFRo
aW5rcGFkIEU0OTUgKEFNRCBSeXplbiA1IDM1MDBVKS4gCkkgdHJpZWQgZWRpdGluZyB0aGUgZWRp
ZC5iaW4gd2l0aCB3eGVkaWQgYnV0IGhhZCBubyBsdWNrLgoKSXMgdGhlcmUgYSBwbGFuIHRvIGVu
YWJsZSB0aGlzIGluIHRoZSBuZWFyIGZ1dHVyZT8uIAoKVGhhbmtzLgoKLS0gCllvdSBtYXkgcmVw
bHkgdG8gdGhpcyBlbWFpbCB0byBhZGQgYSBjb21tZW50LgoKWW91IGFyZSByZWNlaXZpbmcgdGhp
cyBtYWlsIGJlY2F1c2U6CllvdSBhcmUgd2F0Y2hpbmcgdGhlIGFzc2lnbmVlIG9mIHRoZSBidWcu
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
