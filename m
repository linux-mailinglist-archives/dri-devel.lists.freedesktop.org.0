Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C68B1638
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 00:18:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBB9C6EE47;
	Thu, 12 Sep 2019 22:18:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6470A6EE47
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 22:18:46 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204683] amdgpu: ring sdma0 timeout
Date: Thu, 12 Sep 2019 22:18:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-204683-2300-pYjBy9iRSi@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204683-2300@https.bugzilla.kernel.org/>
References: <bug-204683-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQ2ODMKCi0tLSBD
b21tZW50ICMxMCBmcm9tIE1hdHRoaWFzIEhlaW56IChtaEBmYW1pbGllLWhlaW56Lm5hbWUpIC0t
LQpDcmVhdGVkIGF0dGFjaG1lbnQgMjg0OTQ1CiAgLS0+IGh0dHBzOi8vYnVnemlsbGEua2VybmVs
Lm9yZy9hdHRhY2htZW50LmNnaT9pZD0yODQ5NDUmYWN0aW9uPWVkaXQKS2VybmVsIHRyYWNlCgpV
cGRhdGUgMiBmb3IgdG9kYXkuCgpXaXRoIGRlMDBkMjUzYmM4NSwgd2hpY2ggaXMgdGhlIHByZWRl
Y2Vzc29yIG9mIGU2ZDI0MjEzNDNhNywgSSBnZXQgdGhpcyBrZXJuZWwKYnVnLgoKSSBoYXZlIG5l
dmVyIHNlZW4gdGhpcyBvbmUgYWZ0ZXIgZGUwMGQyNTNiYzg1LCBzbyBteSBndWVzcyBpcyB0aGF0
IGU2ZDI0MjEzNDNhNwpmaXhlcyBpdCBwYXJ0aWFsbHkuCgpJIHdpbGwgbm93IHN0YXJ0IGEgYmlz
ZWN0IHN0YXJ0aW5nIHdpdGggdGhlIGxhc3Qga25vd24gZ29vZCBrZXJuZWwgYW5kCmRlMDBkMjUz
YmM4NSBhbmQgdHJ5IHRvIGZpZ3VyZSBvdXQgd2hlbiB0aGlzIG9uZSB3YXMgaW50cm9kdWNlZC4g
KEJhY2sgdG8Ka2VybmVsIGJhY2tpbmcgaGVsbC4uLikKCi0tIApZb3UgYXJlIHJlY2VpdmluZyB0
aGlzIG1haWwgYmVjYXVzZToKWW91IGFyZSB3YXRjaGluZyB0aGUgYXNzaWduZWUgb2YgdGhlIGJ1
Zy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
