Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 521A66AD28
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2019 18:52:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 561B86E150;
	Tue, 16 Jul 2019 16:52:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.wl.linuxfoundation.org (mail.wl.linuxfoundation.org
 [198.145.29.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 041836E150
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 16:52:31 +0000 (UTC)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id BB4AA2866D
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 16:52:31 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id AF32528673; Tue, 16 Jul 2019 16:52:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=unavailable version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204181] NULL pointer dereference regression in amdgpu
Date: Tue, 16 Jul 2019 16:52:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: virtuousfox@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204181-2300-40tVzpXvG8@https.bugzilla.kernel.org/>
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
b21tZW50ICMxNCBmcm9tIFNlcmdleSBLb25kYWtvdiAodmlydHVvdXNmb3hAZ21haWwuY29tKSAt
LS0KKEluIHJlcGx5IHRvIE5pY2hvbGFzIEthemxhdXNrYXMgZnJvbSBjb21tZW50ICMxMCkKPiBU
aGFua3MgZm9yIGFsbCB0aGUgbG9ncy4KPiAKPiBJIG1lYW50IGRybS5kZWJ1Zz00IGFjdHVhbGx5
LCB0aGUgZHJtPWRlYnVnPTQgd2FzIGEgdHlwbyBvbiBteSBwYXJ0IC0gc29ycnkhCgpTbywgSSd2
ZSBnb3QgYWxsIEkgY291bGQgb24gdGhpcy4KCkNvdWxkIHRoaXMgYmUgcmVsZXZhbnQgdG8gbXkg
cmVjZW50IExDRCBvdmVyY2xvY2sgPyBJIGhhdmVuJ3QgdHJpZWQgZ29pbmcgYmFjawp0byA2MCBm
cHMgeWV0LgpjdnQgZXhlY3V0YWJsZSBhbmQgbW9kZXMveGY4NmN2dC5jIGluIFgtc2VydmVyIHdl
cmVuJ3QgdXBkYXRlZCBmb3IgeWVhcnMgYW5kCmNhbid0IGV2ZW4gcHJvZHVjZSBjdnQtMS4yIG1v
ZGVzIG9yIGFueSB1c2VmdWwgInJlZHVjZWQgYmxhbmtpbmciIG1vZGVzIHdpdGgKdGhlbSwgc28g
SSBoYWQgdG8gZ28gZm9yIHRoaW5ncyBsaWtlOiAKaHR0cHM6Ly9naXRodWIuY29tL2tldmlubGVr
aWxsZXIvY3Z0X21vZGVsaW5lX2NhbGN1bGF0b3JfMTIgYW5kCmh0dHBzOi8vYnVncy5kZWJpYW4u
b3JnL2NnaS1iaW4vYnVncmVwb3J0LmNnaT9idWc9ODk5MDY2Ck9uIFdpbmRvd3MgSSBoYWQgdG8g
dXNlCmh0dHBzOi8vd3d3Lm1vbml0b3J0ZXN0cy5jb20vZm9ydW0vVGhyZWFkLUN1c3RvbS1SZXNv
bHV0aW9uLVV0aWxpdHktQ1JVIGJlY2F1c2UKQU1EIGRyaXZlciByZWZ1c2VzIHRvIHVzZSBjdXN0
b20gbW9kZXMgaXQgaXRzZWxmIGdlbmVyYXRlcyB3aXRoICJ1bnN1cHBvcnRlZCIKKHllYWgsIHJp
Z2h04oCmKSAiZXJyb3IiIG5hZ2dpbmdzLgoKLS0gCllvdSBhcmUgcmVjZWl2aW5nIHRoaXMgbWFp
bCBiZWNhdXNlOgpZb3UgYXJlIHdhdGNoaW5nIHRoZSBhc3NpZ25lZSBvZiB0aGUgYnVnLgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
