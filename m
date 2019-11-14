Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E993FC832
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 14:56:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68DB56E9C2;
	Thu, 14 Nov 2019 13:56:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9CD96E320
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2019 13:56:16 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205521] 5.3.11 update broke AMDGPU Raven Ridge
Date: Thu, 14 Nov 2019 13:56:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-205521-2300-usCNi1kNRc@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205521-2300@https.bugzilla.kernel.org/>
References: <bug-205521-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDU1MjEKCkFsZXgg
RGV1Y2hlciAoYWxleGRldWNoZXJAZ21haWwuY29tKSBjaGFuZ2VkOgoKICAgICAgICAgICBXaGF0
ICAgIHxSZW1vdmVkICAgICAgICAgICAgICAgICAgICAgfEFkZGVkCi0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KICAgICAgICAgICAgICAgICBDQ3wgICAgICAgICAgICAgICAgICAgICAgICAgICAgfGFsZXhk
ZXVjaGVyQGdtYWlsLmNvbQoKLS0tIENvbW1lbnQgIzMgZnJvbSBBbGV4IERldWNoZXIgKGFsZXhk
ZXVjaGVyQGdtYWlsLmNvbSkgLS0tCihJbiByZXBseSB0byBMdXlhIFRzaGltYmFsYW5nYSBmcm9t
IGNvbW1lbnQgIzApCj4gCj4gbm92IDEzIDEzOjUzOjU1IGtlcm5lbDogYW1kZ3B1IDAwMDA6MDM6
MDAuMDogRGlyZWN0IGZpcm13YXJlIGxvYWQgZm9yCj4gYW1kZ3B1L3JhdmVuX2dwdV9pbmZvLmJp
biBmYWlsZWQgd2l0aCBlcnJvciAtMgo+IG5vdiAxMyAxMzo1Mzo1NSBrZXJuZWw6IGFtZGdwdSAw
MDAwOjAzOjAwLjA6IEZhaWxlZCB0byBsb2FkIGdwdV9pbmZvCj4gZmlybXdhcmUgImFtZGdwdS9y
YXZlbl9ncHVfaW5mby5iaW4iCj4gbm92IDEzIDEzOjUzOjU1IGtlcm5lbDogYW1kZ3B1IDAwMDA6
MDM6MDAuMDogRmF0YWwgZXJyb3IgZHVyaW5nIEdQVSBpbml0CgpUaGUga2VybmVsIGlzIG5vdCBh
YmxlIHRvIGZpbmQgdGhlIGZpcm13YXJlIGltYWdlLiAgSWYgeW91IGFyZSB1c2luZyBhbiBpbml0
cmQsCnBsZWFzZSBtYWtlIHN1cmUgdG8gaW5jbHVkZXMgdGhlIGZpcm13YXJlcyBpbiB0aGUgaW5p
dHJkLiAgSWYgeW91IGFyZSBidWlsZGluZwp0aGUgZGl2ZXIgaW50byB0aGUga2VybmVsLCB5b3Ug
bmVlZCB0byBidWlsZCB0aGUgZmlybXdhcmUgaW50byB0aGUga2VybmVsIGFzCndlbGwuCgotLSAK
WW91IGFyZSByZWNlaXZpbmcgdGhpcyBtYWlsIGJlY2F1c2U6CllvdSBhcmUgd2F0Y2hpbmcgdGhl
IGFzc2lnbmVlIG9mIHRoZSBidWcuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
