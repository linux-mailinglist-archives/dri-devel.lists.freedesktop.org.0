Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 490782635B7
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 20:17:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B7A86EC9C;
	Wed,  9 Sep 2020 18:17:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 848126EC9C
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Sep 2020 18:17:10 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 209163] amdgpu: The CS has been cancelled because the context
 is lost
Date: Wed, 09 Sep 2020 18:17:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Memory Management
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: satish.in@outlook.in
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-209163-2300-RnadTx0Kid@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209163-2300@https.bugzilla.kernel.org/>
References: <bug-209163-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDkxNjMKCi0tLSBD
b21tZW50ICM1IGZyb20gU2F0aXNoIHBhdGVsIChzYXRpc2guaW5Ab3V0bG9vay5pbikgLS0tCihJ
biByZXBseSB0byBDaHJpc3RpYW4gS8O2bmlnIGZyb20gY29tbWVudCAjNCkKPiBUaGlzIGlzIGV4
cGVjdGVkIGJlaGF2aW9yLCB5b3VyIGFwcGxpY2F0aW9uIHRyaWVzIHRvIHVzZSBtb3JlIG1lbW9y
eSB0aGFuCj4gcGh5c2ljYWwgYXZhaWxhYmxlOgo+IAo+IFs3MTgwNC45MzAwMDNdIFtkcm06YW1k
Z3B1X2NzX2lvY3RsIFthbWRncHVdXSAqRVJST1IqIE5vdCBlbm91Z2ggbWVtb3J5IGZvcgo+IGNv
bW1hbmQgc3VibWlzc2lvbiEKPiAKPiBUaGF0IGlzIG1vc3QgbGlrZWx5IGEgYnVnIGluIHRoZSBh
cHBsaWNhdGlvbiwgZS5nLiBhIG1lbW9yeSBsZWFrLgoKRGVhciBNci4gS29uaWcsIAoKVGhhbmtz
IGZvciB5b3VyIHJlcGx5ICwgQnV0IEkgd291bGQgbGlrZSB0byBpbmZvcm0gYW5kIGRlc2NyaWJl
IHNhbWUKYXBwbGljYXRpb24gcnVubmluZyB1cCB0byAxMCBkYXlzIHVudGlsICBQaHlzaWNhbCBt
ZW1vcnkgYW5kIHN3YXAgbWVtb3J5IG5vdAp1dGlsaXplZCBpbiBDZW50T1MgNyAoZ25vbWUgZGlz
cGxheSApIHdpdGgga2VybmVsIDMuMTAuMC0xMTI3LmVsNy54ODZfNjQuIAoKQnV0IHNhbWUgYXBw
bGljYXRpb24gaGFzIGVycm9yICJhbWRncHU6IFRoZSBDUyBoYXMgYmVlbiBjYW5jZWxsZWQgYmVj
YXVzZSB0aGUKY29udGV4dCBpcyBsb3N0IiBldmVuIHN5c3RlbSB1dGlsaXplIG9ubHkgIDc1JSBw
aHlzaWNhbCBtZW1vcnkgZnJvbSBUb3RhbCA1LjgzCkdCIFBoeXNpY2FsIG1lbW9yeSAgYW5kIDEl
IHN3YXAgbWVtb3J5IGZyb20gMTUgR0Igc3dhcCBwYXJ0aXRpb24uIFRoaXMgRXJyb3IgLApJIGFt
IGdldHRpbmcgaW4gS2VybmVsIDQuOS4xMTguIFdoeSBzeXN0ZW0gY3Jhc2ggKCBEaXNwbGF5IGZs
aWNrZXJpbmcgYW5kIHRvdWNoCnNjcmVlbiBub3QgcmVzcG9uZGluZykgYW5kIG5vdCB1dGlsaXpl
IHN3YXAgbWVtb3J5IGFyZWEgPyAuIEJ1dCBDUFUgYW5kIG1lbW9yeQp1dGlsaXphdGlvbiBzaG93
aW5nIHdoZW4gbW9uaXRvcmluZyBmcm9tIG90aGVyIHN5c3RlbSAuCgotLSAKWW91IGFyZSByZWNl
aXZpbmcgdGhpcyBtYWlsIGJlY2F1c2U6CllvdSBhcmUgd2F0Y2hpbmcgdGhlIGFzc2lnbmVlIG9m
IHRoZSBidWcuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
