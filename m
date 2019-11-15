Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F31FFD817
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2019 09:45:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B7EC6E157;
	Fri, 15 Nov 2019 08:45:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F060F6E157
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2019 08:45:32 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205497] Attempt to read amd gpu id causes a freeze
Date: Fri, 15 Nov 2019 08:45:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: trek00@inbox.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-205497-2300-dqbvHB11Bz@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205497-2300@https.bugzilla.kernel.org/>
References: <bug-205497-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDU0OTcKClRyZWsg
KHRyZWswMEBpbmJveC5ydSkgY2hhbmdlZDoKCiAgICAgICAgICAgV2hhdCAgICB8UmVtb3ZlZCAg
ICAgICAgICAgICAgICAgICAgIHxBZGRlZAotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAgICAgICAgICAg
ICAgICAgQ0N8ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHx0cmVrMDBAaW5ib3gucnUKCi0t
LSBDb21tZW50ICM3IGZyb20gVHJlayAodHJlazAwQGluYm94LnJ1KSAtLS0KYXMgdXNlcnMgcmVw
b3J0ZWQsIHRoaXMgYnVnIHNob3VsZCBvbmx5IGFmZmVjdHMga2VybmVscyA1LjIrCgpieSBkZWZh
dWx0LCByYWRlb250b3AgY2FsbHMgYW1kZ3B1X3JlYWRfbW1fcmVnaXN0ZXJzLCBhbWRncHVfcXVl
cnlfaW5mbyBhbmQKYW1kZ3B1X3F1ZXJ5X3NlbnNvcl9pbmZvLCBidXQgaXQgY2FuIGJlIGZvcmNl
ZCBieSB0aGUgY29tbWFuZCBsaW5lIHRvIHJlYWQgQkFSCmZyb20gL2Rldi9tZW0KCnRoZXJlIGlz
IGEga2VybmVsIGR1bXAgYXQKaHR0cHM6Ly9naXRodWIuY29tL2NsYnIvcmFkZW9udG9wL2lzc3Vl
cy84NyNpc3N1ZWNvbW1lbnQtNTI5MjY3MjQ0Cgp0aGFuayB5b3UgZm9yIHRoZSBwYXRjaCwgYnV0
IEkgY2Fubm90IHRlc3QgaXQgYXMgbXkgaGFyZHdhcmUgaXMgbm90IGFmZmVjdGVkCihLQVZFUkkp
CgotLSAKWW91IGFyZSByZWNlaXZpbmcgdGhpcyBtYWlsIGJlY2F1c2U6CllvdSBhcmUgd2F0Y2hp
bmcgdGhlIGFzc2lnbmVlIG9mIHRoZSBidWcuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
