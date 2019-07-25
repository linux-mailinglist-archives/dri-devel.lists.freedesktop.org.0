Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74830750DF
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 16:22:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 870E189FA7;
	Thu, 25 Jul 2019 14:21:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.wl.linuxfoundation.org (mail.wl.linuxfoundation.org
 [198.145.29.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D72889FA7
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 14:21:56 +0000 (UTC)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id 5422628A06
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 14:21:56 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id 4846D289FB; Thu, 25 Jul 2019 14:21:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=ham version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204181] NULL pointer dereference regression in amdgpu
Date: Thu, 25 Jul 2019 14:21:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: michel@daenzer.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204181-2300-YntZ3xqZtt@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204181-2300@https.bugzilla.kernel.org/>
References: <bug-204181-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQxODEKCi0tLSBD
b21tZW50ICMxOCBmcm9tIE1pY2hlbCBEw6RuemVyIChtaWNoZWxAZGFlbnplci5uZXQpIC0tLQoo
SW4gcmVwbHkgdG8gWWFubiBITiBmcm9tIGNvbW1lbnQgIzE3KQo+IEEgZnJpZW5kIHN1Z2dlc3Rl
ZCBtZSB0byBpbnN0YWxsIHNvbWUgcGFja2FnZXMgdG8gZW5oYW5jZSB0aGUgR1BVIFN1cHBvcnQs
Cj4gb25lIG9mIHRoZW0gd2FzICJ4Zjg2LXZpZGVvLWFtZGdwdSIuCj4gCj4gU2VhbXMgbGlrZSB0
aGF0IHBhY2thZ2Ugd2FzIHJlc3BvbnNpYmxlIGZvciB0aGUgaXNzdWVzLgo+IFJlbW92aW5nIGl0
IGZpeGVkIHRoZSBpc3N1ZSB3aXRob3V0IGFueSBvdGhlciAobm90YWJsZSkgZWZmZWN0cy4KCkRp
ZCB5b3UgZ2V0IHRoZSBzYW1lIGFtZGdwdV9kbV9hdG9taWNfY29tbWl0X3RhaWwgPT4gZGNfY29t
bWl0X3N0YXRlID0+CmRjX3N0cmVhbV9sb2cgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIGFzIHJl
cG9ydGVkIGhlcmU/CgpJZiB5ZXMsIHRoaXMgaXMgYSBrZXJuZWwgZHJpdmVyIGJ1ZywgeGY4Ni12
aWRlby1hbWRncHUganVzdCB0cmlnZ2VycyBpdCAvIHRoZQpYb3JnIG1vZGVzZXR0aW5nIGRyaXZl
ciBhdm9pZHMgaXQgc29tZWhvdy4KCklmIG5vdCwgcGxlYXNlIGZpbGUgeW91ciBvd24gcmVwb3J0
IGF0Cmh0dHBzOi8vYnVncy5mcmVlZGVza3RvcC5vcmcvZW50ZXJfYnVnLmNnaT9wcm9kdWN0PXhv
cmcmY29tcG9uZW50PURyaXZlci9BTURncHUKYW5kIGF0dGFjaCB0aGUgY29ycmVzcG9uZGluZyBY
b3JnIGxvZyBmaWxlIGFuZCBvdXRwdXQgb2YgZG1lc2cuCgotLSAKWW91IGFyZSByZWNlaXZpbmcg
dGhpcyBtYWlsIGJlY2F1c2U6CllvdSBhcmUgd2F0Y2hpbmcgdGhlIGFzc2lnbmVlIG9mIHRoZSBi
dWcuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
