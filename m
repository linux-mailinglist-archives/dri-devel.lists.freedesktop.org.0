Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EBC22A3D9
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jul 2020 02:49:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30E5289337;
	Thu, 23 Jul 2020 00:48:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BD7589337
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jul 2020 00:48:58 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 207383] [Regression] 5.7 amdgpu/polaris11 gpf:
 amdgpu_atomic_commit_tail
Date: Thu, 23 Jul 2020 00:48:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: mnrzk@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-207383-2300-6JpptNX7JW@https.bugzilla.kernel.org/>
In-Reply-To: <bug-207383-2300@https.bugzilla.kernel.org/>
References: <bug-207383-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDczODMKCi0tLSBD
b21tZW50ICM4NSBmcm9tIG1ucnprQHByb3Rvbm1haWwuY29tIC0tLQooSW4gcmVwbHkgdG8gQ2hy
aXN0aWFuIEvDtm5pZyBmcm9tIGNvbW1lbnQgIzgzKQo+IEluc3RlYWQgb2Ygd29ya2luZyBhcm91
bmQgdGhlIGJ1ZyBJIHRoaW5rIHdlIHNob3VsZCBjb25jZW50cmF0ZSBvbiBuYWlsaW5nCj4gdGhl
IHJvb3QgY2F1c2UuCj4gCj4gSSBzdWdnZXN0IHRvIGluc2VydCBhbiB1c2UgYWZ0ZXIgZnJlZSBj
aGVjayBpbnRvIGp1c3QgdGhhdCBzdHJ1Y3R1cmUuIEluCj4gb3RoZXIgd29yZHMgYWRkIGEgZmll
bGQgIm1hZ2ljX251bWJlciIgd2lsbCBpdCB3aXRoIDB4ZGVhZGJlZWYgb24gYWxsb2NhdGlvbgo+
IGFuZCBzZXQgaXQgdG8gemVybyBiZWZvcmUgdGhlIGtmcmVlKCkuCj4gCj4gQSBzaW1wbGUgQlVH
X09OKHB0ci0+bWFnaWNfbnVtYmVyICE9IDB4ZGVhZGJlZWYpIHNob3VsZCB5aWVsZCByZXN1bHRz
IHJhdGhlcgo+IHF1aWNrbHkuCj4gCj4gVGhlbiBqdXN0IGFkZCBwcmludGsoKXMgYmVmb3JlIHRo
ZSBrZnJlZSgpIHRvIGZpZ3VyZSBvdXQgd2h5IHdlIGhhdmUgdGhpcwo+IHVzZSBhZnRlciBmcmVl
IHJhY2UuCgpGYWlyIHBvaW50LCBJIHdhcyBqdXN0IHRyeWluZyB0byBjb25maXJtIG15IGh5cG90
aGVzaXMuCgpJIHJlYWxpc2VkIHdoeSB0aGUgdGVzdCBmYWlsZWQsIGFkZGluZyA4IGJ5dGVzIG9m
IHBhZGRpbmcgdG8gdGhlIG1pZGRsZQptYWRlIHRoZSBzdHJ1Y3Qgc2l6ZSAyNCBieXRlcy4gU2lu
Y2UgdGhlIGZyZWVsaXN0IHBvaW50ZXIgaXMgYmVpbmcgYWRkZWQKdG8gdGhlIG1pZGRsZSAoMTIg
Ynl0ZXMpIGFuZCB0aGF0J3MgYWxpZ25lZCB0byB0aGUgbmVhcmVzdCA4IGJ5dGVzLCB0aGUKcG9p
bnRlciBlbmRlZCB1cCBiZWluZyBwbGFjZWQgYXQgYW4gb2Zmc2V0IG9mIDE2IGJ5dGVzIChjb250
ZXh0KS4KCkFmdGVyIG1ha2luZyB0aGUgcGFkZGluZyBhbiBhcnJheSBvZiAyIHZvaWQqIGFuZCBp
bml0aWFsaXNpbmcgaXQgdG8KezB4REVBREJFRUZDQUZFRjAwRCwgMHgxQkFERjAwRDFCQURDMERF
fSwgdGhlIHBhZGRpbmcgd2FzIGV2ZW50dWFsbHkKY29ycnVwdGVkIHdpdGggdGhlIGNvbnRleHQg
YmVpbmcgbGVmdCBpbnRhY3QgYW5kIHRoZXJlZm9yZSwgbm8gY3Jhc2hpbmcuCgpHREIgb3V0cHV0
IG9mIGRtX3N0cnVjdDoKewogICAgYmFzZSA9IHtzdGF0ZSA9IDB4ZmZmZjg4ODI3Mzg4NGMwMH0s
CiAgICBwYWRkaW5nID0gezB4ZGVhZGJlZWZjYWZlZjAwZCwgMHg1MTNkZjgzYWZkM2FkN2IyfSwK
ICAgIGNvbnRleHQgPSAweGZmZmY4ODgyNGU2ODAwMDAKfQoKVGhhdCBzYWlkLCBJIHN0aWxsIGRv
bid0IGtub3cgdGhlIHJvb3QgY2F1c2Ugb2YgdGhlIGJ1ZywgSSdsbCBzZWUKaWYgSSBjYW4gdXNl
IEtBU0FOIG9yIHNvbWV0aGluZyB0byBmaWd1cmUgb3V0IHdoYXQgZXhhY3RseSBmcmVlZApkbV9z
dGF0ZS4gSWYgYW55b25lIGlzIG1vcmUgZmFtaWxpYXIgd2l0aCB0aGlzIGNvZGUgaGFzIGFueSBh
ZHZpY2UKZm9yIG1lLCBwbGVhc2UgbGV0IG1lIGtub3cuCgotLSAKWW91IGFyZSByZWNlaXZpbmcg
dGhpcyBtYWlsIGJlY2F1c2U6CllvdSBhcmUgd2F0Y2hpbmcgdGhlIGFzc2lnbmVlIG9mIHRoZSBi
dWcuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
