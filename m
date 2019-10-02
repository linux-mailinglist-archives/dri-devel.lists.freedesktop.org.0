Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9380DC4BA2
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 12:39:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EEA16E92D;
	Wed,  2 Oct 2019 10:39:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0E7A6E92D
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2019 10:39:31 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201957] amdgpu: ring gfx timeout
Date: Wed, 02 Oct 2019 10:39:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: lekto@o2.pl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-201957-2300-bLQ4j63eIe@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201957-2300@https.bugzilla.kernel.org/>
References: <bug-201957-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDE5NTcKCmxla3Rv
IChsZWt0b0BvMi5wbCkgY2hhbmdlZDoKCiAgICAgICAgICAgV2hhdCAgICB8UmVtb3ZlZCAgICAg
ICAgICAgICAgICAgICAgIHxBZGRlZAotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAgICAgICAgICAgICAg
ICAgQ0N8ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHxsZWt0b0BvMi5wbAoKLS0tIENvbW1l
bnQgIzExIGZyb20gbGVrdG8gKGxla3RvQG8yLnBsKSAtLS0KU2FtZSBwcm9ibGVtIGhlcmUuIEl0
IGhhcHBlbnMgd2hlbiBJIHJ1biBsb29raW5nLWdsYXNzIFsxXSwgYnV0IG5vdCBldmVyeXRpbWUu
CkkgdGllZCBkb3duZ3JhZGluZyBteSBrZXJuZWwgZnJvbSA1LjMuMSB0byA1LjIuMTEgKEknbSBw
cmV0dHkgc3VyZSBpdCB3b3JrZWQKdGhlbiksIGRvd25ncmFkaW5nIG1lc2EgZnJvbSAxOS4yLjAg
dG8gMTkuMS43IChJJ20gc3VyZSBpdCB3b3JrZWQgd2l0aAoxOS4yLjAtcmMpIGFuZCBkb3duZ3Jh
ZGluZyBteSBmaXJtd2FyZSB0byAyMDE5LTA5LTIzIChvbGRlc3QgaW4gcmVwbykuCgpXaGVuIGl0
IGhhcHBlbnMgbG9va2luZyBnbGFzcyBzdGFydHMgYmxpbmtpbmcgYW5kIHNvbWV0aW1lcyBteSBv
dGhlciBtb25pdG9yCnN0dWNrIHRoYXQgSSBjYW4gb25seSBtb3ZlIGN1cnNvciBvbiBpdC4KClNw
ZWM6CkdlbnRvbyB+YW1kNjQKUnl6ZW4gMTYwMCAob3RoZXIgaGF2ZSBSeXplbiB0b28sIGNvaW5j
aWRlbmNlPykKTGludXggR1BVOiBSNyAyNDAgKHdpdGggcmFkZW9uIGRyaXZlcikKV2luZG93cyBH
UFU6IFJYNTgwCkFTUm9jayBYMzcwIEdhbWluZyBYCgoKWzFdIGh0dHBzOi8vbG9va2luZy1nbGFz
cy5ob3N0Zmlzc2lvbi5jb20vCgotLSAKWW91IGFyZSByZWNlaXZpbmcgdGhpcyBtYWlsIGJlY2F1
c2U6CllvdSBhcmUgd2F0Y2hpbmcgdGhlIGFzc2lnbmVlIG9mIHRoZSBidWcuCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
