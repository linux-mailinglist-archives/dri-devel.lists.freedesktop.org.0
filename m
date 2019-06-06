Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C7F3733B
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 13:44:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEB888938B;
	Thu,  6 Jun 2019 11:44:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.wl.linuxfoundation.org (mail.wl.linuxfoundation.org
 [198.145.29.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68DF58938B
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 11:44:18 +0000 (UTC)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id 2E824288B3
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 11:44:18 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id 201B3288FA; Thu,  6 Jun 2019 11:44:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=unavailable version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201539] AMDGPU R9 390 automatic fan speed control in Linux
 4.19/4.20/5.0
Date: Thu, 06 Jun 2019 11:44:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: danglingpointerexception@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-201539-2300-NfGwM6dmqb@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201539-2300@https.bugzilla.kernel.org/>
References: <bug-201539-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDE1MzkKCi0tLSBD
b21tZW50ICMxNSBmcm9tIGRhbmdsaW5ncG9pbnRlcmV4Y2VwdGlvbkBnbWFpbC5jb20gKGRhbmds
aW5ncG9pbnRlcmV4Y2VwdGlvbkBnbWFpbC5jb20pIC0tLQpAUnVkb2xmIC0gSGF2ZSB5b3UgdHJp
ZWQgbXkgc29sdXRpb24gaW4gdGhlIGxpbmsgSSBwcm92aWRlZCBhYm92ZT8gIEknbSBvbgo1LjEu
NiBtYWlubGluZSBhbmQgaGF2ZSBubyBpc3N1ZXMgd2hhdHNvZXZlciB3aXRoIFI5LTI5MFgKCkBB
bGV4IFNtaXRoIC0gSSd2ZSBnb3QgYSBsaXF1aWQtY29vbGVkIGNhcmQgc28gZG9uJ3Qga25vdyBp
ZiBteSBzb2x1dGlvbiBzb2x2ZXMKeW91ciBmYW4gcHJvYmxlbSBidXQgdHJ5IGZvbGxvd2luZyBt
eSBzdGVwcyBpbiB0aGUgbGluay4KCkBTdGVmZmVuIC0gVHJ5IG15IHN0ZXBzIGluIHRoZSBsaW5r
IG1hdGUsIGl0IG1heSBzb2x2ZSB5b3VyIHByb2JsZW0uICBBbGV4CkR1Y2hlciBoaW1zZWxmIGdh
dmUgbWUgdGhlIHRpcCBvbiBmaXhpbmcgaXQuCgotLSAKWW91IGFyZSByZWNlaXZpbmcgdGhpcyBt
YWlsIGJlY2F1c2U6CllvdSBhcmUgd2F0Y2hpbmcgdGhlIGFzc2lnbmVlIG9mIHRoZSBidWcuCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
