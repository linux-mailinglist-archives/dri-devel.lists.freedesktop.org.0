Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7584489F13
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2019 15:02:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF5BC6E506;
	Mon, 12 Aug 2019 13:02:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.wl.linuxfoundation.org (mail.wl.linuxfoundation.org
 [198.145.29.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 093516E506
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 13:02:27 +0000 (UTC)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id ACBF527F8E
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 13:02:27 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id 9EAFB283A5; Mon, 12 Aug 2019 13:02:27 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=unavailable version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 203471] Tearing on Raven Ridge and RX560X PRIME setup even with
 Vsync enabled
Date: Mon, 12 Aug 2019 13:02:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-203471-2300-wE6DJm2c1M@https.bugzilla.kernel.org/>
In-Reply-To: <bug-203471-2300@https.bugzilla.kernel.org/>
References: <bug-203471-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDM0NzEKCkFsZXgg
RGV1Y2hlciAoYWxleGRldWNoZXJAZ21haWwuY29tKSBjaGFuZ2VkOgoKICAgICAgICAgICBXaGF0
ICAgIHxSZW1vdmVkICAgICAgICAgICAgICAgICAgICAgfEFkZGVkCi0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KICAgICAgICAgICAgICAgICBDQ3wgICAgICAgICAgICAgICAgICAgICAgICAgICAgfGFsZXhk
ZXVjaGVyQGdtYWlsLmNvbQoKLS0tIENvbW1lbnQgIzE0IGZyb20gQWxleCBEZXVjaGVyIChhbGV4
ZGV1Y2hlckBnbWFpbC5jb20pIC0tLQpodHRwczovL2NnaXQuZnJlZWRlc2t0b3Aub3JnL35hZ2Q1
Zi9saW51eC9jb21taXQvP2g9ZHJtLW5leHQtNS40JmlkPWU0YzQwNzNiMDEzOWQwNTVkNDNhOTU2
ODY5MGZjNTYwYWFiNGZhNWMKaHR0cHM6Ly9jZ2l0LmZyZWVkZXNrdG9wLm9yZy9+YWdkNWYvbGlu
dXgvY29tbWl0Lz9oPWRybS1uZXh0LTUuNCZpZD0zZDFiOGVjNzZiOGY0ZjkxNjQxZmQ4N2NjMTlj
ZDk4MDQyNmEyMDYwCmh0dHBzOi8vY2dpdC5mcmVlZGVza3RvcC5vcmcvfmFnZDVmL2xpbnV4L2Nv
bW1pdC8/aD1kcm0tbmV4dC01LjQmaWQ9ZGRjYjdmYzYyZjRiZTk5ZmFlZGZhMTc2NGM5NzFhMmYz
MTQ2ODk2MgpodHRwczovL2NnaXQuZnJlZWRlc2t0b3Aub3JnL35hZ2Q1Zi9saW51eC9jb21taXQv
P2g9ZHJtLW5leHQtNS40JmlkPTFjNDI1OTE1OTEzMmFlNGNlYWY3YzZkYjM3YTZjZjc2NDE3Zjcz
ZDkKaHR0cHM6Ly9jZ2l0LmZyZWVkZXNrdG9wLm9yZy9+YWdkNWYvbGludXgvY29tbWl0Lz9oPWRy
bS1uZXh0LTUuNCZpZD1mMmJkOGEwZWQ3ZTc5NTc5ZDYxY2VhMDFiYWIyZGZiMDkwOTlkMzc5Cgot
LSAKWW91IGFyZSByZWNlaXZpbmcgdGhpcyBtYWlsIGJlY2F1c2U6CllvdSBhcmUgd2F0Y2hpbmcg
dGhlIGFzc2lnbmVlIG9mIHRoZSBidWcuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
