Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4882F114BBB
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2019 05:45:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B39C6E171;
	Fri,  6 Dec 2019 04:45:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F4B86E171
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2019 04:45:47 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201539] AMDGPU R9 390 automatic fan speed control in Linux
 4.19/4.20/5.0
Date: Fri, 06 Dec 2019 04:45:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mastercatz@hotmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-201539-2300-yhdGqSL2Ru@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201539-2300@https.bugzilla.kernel.org/>
References: <bug-201539-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDE1MzkKCi0tLSBD
b21tZW50ICM0MSBmcm9tIE1hc3RlckNBVFogKG1hc3RlcmNhdHpAaG90bWFpbC5jb20pIC0tLQph
aW9AYWlvOi91c3IvbG9jYWwvYmluJCBzdWRvIHN5c3RlbWN0bCBzdGF0dXMgYW1kZ3B1LWZhbmNv
bnRyb2wK4pePIGFtZGdwdS1mYW5jb250cm9sLnNlcnZpY2UgLSBhbWRncHUtZmFuY29udHJvbAog
ICBMb2FkZWQ6IGxvYWRlZCAoL2V0Yy9zeXN0ZW1kL3N5c3RlbS9hbWRncHUtZmFuY29udHJvbC5z
ZXJ2aWNlOyBlbmFibGVkOwp2ZW5kb3IgcHJlc2V0OiBlbmFibGVkKQogICBBY3RpdmU6IGFjdGl2
ZSAocnVubmluZykgc2luY2UgRnJpIDIwMTktMTItMDYgMTQ6NDU6MDcgQUVTVDsgM3MgYWdvCiBN
YWluIFBJRDogMjM5MjIgKGFtZGdwdS1mYW5jb250cikKICAgIFRhc2tzOiAyIChsaW1pdDogNDkx
NSkKICAgTWVtb3J5OiAzLjNNCiAgIENHcm91cDogL3N5c3RlbS5zbGljZS9hbWRncHUtZmFuY29u
dHJvbC5zZXJ2aWNlCiAgICAgICAgICAg4pSc4pSAMjM5MjIgL2Jpbi9iYXNoIC91c3IvbG9jYWwv
YmluL2FtZGdwdS1mYW5jb250cm9sCiAgICAgICAgICAg4pSU4pSAMjM5Nzkgc2xlZXAgMQoKRGVj
IDA2IDE0OjQ1OjA4IGFpbyBhbWRncHUtZmFuY29udHJvbFsyMzkyMl06IGNoYW5naW5nIHB3bSB0
byAxNzUKRGVjIDA2IDE0OjQ1OjA4IGFpbyBhbWRncHUtZmFuY29udHJvbFsyMzkyMl06IC91c3Iv
bG9jYWwvYmluL2FtZGdwdS1mYW5jb250cm9sOgpsaW5lIDY1OiBlY2hvOiB3cml0ZSBlcnJvcjog
SW52YWxpZCBhcmd1bWVudApEZWMgMDYgMTQ6NDU6MDkgYWlvIGFtZGdwdS1mYW5jb250cm9sWzIz
OTIyXTogY3VycmVudCB0ZW1wOiA2MjAwMApEZWMgMDYgMTQ6NDU6MDkgYWlvIGFtZGdwdS1mYW5j
b250cm9sWzIzOTIyXTogaW50ZXJwb2xhdGVkIHB3bSB2YWx1ZSBmb3IKdGVtcGVyYXR1cmUgNjIw
MDAgaXM6IDE3NQpEZWMgMDYgMTQ6NDU6MDkgYWlvIGFtZGdwdS1mYW5jb250cm9sWzIzOTIyXTog
Y3VycmVudCBwd206IDEwNCwgcmVxdWVzdGVkIHRvCnNldCBwd20gdG8gMTc1CkRlYyAwNiAxNDo0
NTowOSBhaW8gYW1kZ3B1LWZhbmNvbnRyb2xbMjM5MjJdOiBGYW5tb2RlIG5vdCBzZXQgdG8gbWFu
dWFsLgpEZWMgMDYgMTQ6NDU6MDkgYWlvIGFtZGdwdS1mYW5jb250cm9sWzIzOTIyXTogc2V0dGlu
ZyBmYW4gbW9kZSB0byAxCkRlYyAwNiAxNDo0NTowOSBhaW8gYW1kZ3B1LWZhbmNvbnRyb2xbMjM5
MjJdOiB0ZW1wIGF0IGxhc3QgY2hhbmdlIHdhcyA2MjAwMApEZWMgMDYgMTQ6NDU6MDkgYWlvIGFt
ZGdwdS1mYW5jb250cm9sWzIzOTIyXTogY2hhbmdpbmcgcHdtIHRvIDE3NQpEZWMgMDYgMTQ6NDU6
MDkgYWlvIGFtZGdwdS1mYW5jb250cm9sWzIzOTIyXTogL3Vzci9sb2NhbC9iaW4vYW1kZ3B1LWZh
bmNvbnRyb2w6CmxpbmUgNjU6IGVjaG86IHdyaXRlIGVycm9yOiBJbnZhbGlkIGFyZ3VtZW50Cgot
LSAKWW91IGFyZSByZWNlaXZpbmcgdGhpcyBtYWlsIGJlY2F1c2U6CllvdSBhcmUgd2F0Y2hpbmcg
dGhlIGFzc2lnbmVlIG9mIHRoZSBidWcuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
