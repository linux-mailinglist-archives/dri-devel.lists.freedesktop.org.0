Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE421DDFCA
	for <lists+dri-devel@lfdr.de>; Sun, 20 Oct 2019 19:39:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D27689341;
	Sun, 20 Oct 2019 17:39:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BF3389341
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Oct 2019 17:38:59 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205277] [amd powerplay] vega10: soc voltage for power state 7
 is not changed by overdrive.
Date: Sun, 20 Oct 2019 17:38:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pelle@vangils.xyz
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-205277-2300-ywBQpJsO6G@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205277-2300@https.bugzilla.kernel.org/>
References: <bug-205277-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDUyNzcKCi0tLSBD
b21tZW50ICMyIGZyb20gUGVsbGUgdmFuIEdpbHMgKHBlbGxlQHZhbmdpbHMueHl6KSAtLS0KKElu
IHJlcGx5IHRvIFBlbGxlIHZhbiBHaWxzIGZyb20gY29tbWVudCAjMSkKPiBDcmVhdGVkIGF0dGFj
aG1lbnQgMjg1NTg1IFtkZXRhaWxzXQo+IHByb3Bvc2VkIHBhdGNoCj4gCj4gYWRkZWQgcHJvcG9z
ZWQgZml4Cgp3aXRoIHRoaXMgcGF0Y2ggYXBwbGllZCAoYW5kIHRoZSBkZWJ1ZyBwYXRjaCkgZG1l
c2cgb3V0cHV0IGlzOgouLi4KWyAgMTA3LjE0OTEwNV0gYW1kZ3B1OiBbcG93ZXJwbGF5XSB2ZWdh
MTAgU0NMSyB2ZGRjX2xvb2t1cF90YWJsZSBzdGF0ZTogMCB2ZGRjOgo4MDAKWyAgMTA3LjE0OTEw
N10gYW1kZ3B1OiBbcG93ZXJwbGF5XSB2ZWdhMTAgU0NMSyB2ZGRjX2xvb2t1cF90YWJsZSBzdGF0
ZTogMSB2ZGRjOgo5MDAKWyAgMTA3LjE0OTEwOF0gYW1kZ3B1OiBbcG93ZXJwbGF5XSB2ZWdhMTAg
U0NMSyB2ZGRjX2xvb2t1cF90YWJsZSBzdGF0ZTogMiB2ZGRjOgo5MTAKWyAgMTA3LjE0OTEwOV0g
YW1kZ3B1OiBbcG93ZXJwbGF5XSB2ZWdhMTAgU0NMSyB2ZGRjX2xvb2t1cF90YWJsZSBzdGF0ZTog
MyB2ZGRjOgo5MjAKWyAgMTA3LjE0OTEwOV0gYW1kZ3B1OiBbcG93ZXJwbGF5XSB2ZWdhMTAgU0NM
SyB2ZGRjX2xvb2t1cF90YWJsZSBzdGF0ZTogNCB2ZGRjOgo5MzAKWyAgMTA3LjE0OTExMF0gYW1k
Z3B1OiBbcG93ZXJwbGF5XSB2ZWdhMTAgU0NMSyB2ZGRjX2xvb2t1cF90YWJsZSBzdGF0ZTogNSB2
ZGRjOgo5NDAKWyAgMTA3LjE0OTExMV0gYW1kZ3B1OiBbcG93ZXJwbGF5XSB2ZWdhMTAgU0NMSyB2
ZGRjX2xvb2t1cF90YWJsZSBzdGF0ZTogNiB2ZGRjOgo5NTAKWyAgMTA3LjE0OTExMl0gYW1kZ3B1
OiBbcG93ZXJwbGF5XSB2ZWdhMTAgU0NMSyB2ZGRjX2xvb2t1cF90YWJsZSBzdGF0ZTogNyB2ZGRj
Ogo5ODAKLi4uCgoKQW5kIHRoZSBzb2Mgdm9sdGFnZSB1bmRlciBzdHJlc3Mgc3RheXMgYXQgdGhl
IHNldCB2YWx1ZToKCiMgY2F0IC9zeXMva2VybmVsL2RlYnVnL2RyaS8wL2FtZGdwdV9wbV9pbmZv
Ci4uLgpHRlggQ2xvY2tzIGFuZCBQb3dlcjoKICAgICAgICA4MDAgTUh6IChNQ0xLKQogICAgICAg
IDE1NDEgTUh6IChTQ0xLKQogICAgICAgIDEyNjkgTUh6IChQU1RBVEVfU0NMSykKICAgICAgICA3
MDAgTUh6IChQU1RBVEVfTUNMSykKICAgICAgICA5ODEgbVYgKFZEREdGWCkKICAgICAgICAxNjEu
MCBXIChhdmVyYWdlIEdQVSkKLi4uCgotLSAKWW91IGFyZSByZWNlaXZpbmcgdGhpcyBtYWlsIGJl
Y2F1c2U6CllvdSBhcmUgd2F0Y2hpbmcgdGhlIGFzc2lnbmVlIG9mIHRoZSBidWcuCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
