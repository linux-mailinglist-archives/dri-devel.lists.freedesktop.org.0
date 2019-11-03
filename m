Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEAABED1AF
	for <lists+dri-devel@lfdr.de>; Sun,  3 Nov 2019 05:16:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F8F26E5B2;
	Sun,  3 Nov 2019 04:16:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 985BC6E5B2
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Nov 2019 04:16:44 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201539] AMDGPU R9 390 automatic fan speed control in Linux
 4.19/4.20/5.0
Date: Sun, 03 Nov 2019 04:16:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mastercatz@hotmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-201539-2300-qsns2wNm4l@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201539-2300@https.bugzilla.kernel.org/>
References: <bug-201539-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDE1MzkKCi0tLSBD
b21tZW50ICMyMiBmcm9tIE1hc3RlckNBVFogKG1hc3RlcmNhdHpAaG90bWFpbC5jb20pIC0tLQoK
CihJbiByZXBseSB0byBTZWFuIEJpcmtob2x6IGZyb20gY29tbWVudCAjMTkpCj4gSSd2ZSBkb25l
IGEgYml0IG9mIGRpZ2dpbmcgYW5kIEkndmUgbWFuYWdlZCB0byBnZXQgYSBwcm9wZXIgaHlzdGVy
ZXNpcyB2YWx1ZQo+IHRvIGFwcGVhciBpbiBhIDUuMS4xNCBrZXJuZWwgYnVpbHQgZnJvbSBzb3Vy
Y2UuCgoKPiBJIG1vZGlmaWVkIChrZXJuZWwgc3JjKS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9pbmMvcHBfdGhlcm1hbC5oIGFuZAo+IGNoYW5nZWQgdGhlIHZhbHVlcyBvZiAtMjczMTUw
IHRvIDkwMDAwLiAgVGhpcyBjb3JyZWN0cyB0aGUgaHlzdGVyZXNpcyB2YWx1ZQo+IGJ1dCBJJ20g
c3RpbGwgc2VhcmNoaW5nIGZvciB3aGVyZSB0aGUgY3JpdGljYWwgdGVtcCB2YWx1ZSBpcyBhY3R1
YWxseSBzZXQuCgoKSSB0aGluayB5b3UgaGl0IHRoZSBuYWlsIG9uIHRoZSBoZWFkIAoKYW1kZ3B1
LXBjaS0wMTAwCkFkYXB0ZXI6IFBDSSBhZGFwdGVyCnZkZGdmeDogICAgICAgKzAuOTAgViAgCmZh
bjE6ICAgICAgICAgICAgIE4vQSAgKG1pbiA9ICAgIDAgUlBNLCBtYXggPSAgICAwIFJQTSkKZWRn
ZTogICAgICAgICArNTAuMMKwQyAgKGNyaXQgPSArMTA0MDAwLjDCsEMsIGh5c3QgPSAtMjczLjHC
sEMpCnBvd2VyMTogICAgICAgMTEuMDMgVyAgKGNhcCA9IDIwOC4wMCBXKQoKLS0gCllvdSBhcmUg
cmVjZWl2aW5nIHRoaXMgbWFpbCBiZWNhdXNlOgpZb3UgYXJlIHdhdGNoaW5nIHRoZSBhc3NpZ25l
ZSBvZiB0aGUgYnVnLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
