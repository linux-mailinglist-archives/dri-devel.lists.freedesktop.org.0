Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCF2E64EE
	for <lists+dri-devel@lfdr.de>; Sun, 27 Oct 2019 19:44:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B01E6E054;
	Sun, 27 Oct 2019 18:44:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5389A6E054
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Oct 2019 18:44:37 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201957] amdgpu: ring gfx timeout
Date: Sun, 27 Oct 2019 18:44:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: shallowaloe@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-201957-2300-BiFMBnv667@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDE5NTcKCi0tLSBD
b21tZW50ICMxNiBmcm9tIHNoYWxsb3dhbG9lQGdtYWlsLmNvbSAtLS0KQ3JlYXRlZCBhdHRhY2ht
ZW50IDI4NTY2NQogIC0tPiBodHRwczovL2J1Z3ppbGxhLmtlcm5lbC5vcmcvYXR0YWNobWVudC5j
Z2k/aWQ9Mjg1NjY1JmFjdGlvbj1lZGl0CjUgc2Vjb25kIHZpZGVvIGNsaXAgdGhhdCB0cmlnZ2Vy
cyBhIGNyYXNoCgpIaSwKCkkgdGhpbmsgSSdtIGhhdmluZyB0aGUgc2FtZSBwcm9ibGVtIGFzIHlv
dSBndXlzLiAgSSBydW4gYSBteXRoYmFja2VuZCB3aGVyZSBJCnJlY29yZCBjYWJsZSB0ZWxldmlz
aW9uIGFuZCB0aG9zZSByZWNvcmRpbmdzIG9mdGVuIGNyYXNoIG15IHN5c3RlbSB3aGVuCmhhcmR3
YXJlIGRlY29kaW5nIGlzIGVuYWJsZWQuICBVc3VhbGx5IGl0J3MganVzdCB0aGUgc2NyZWVuIHRo
YXQgZnJlZXplcyBhbmQgSQpjYW4gc3RpbGwgc3NoIHRvIGl0LiAgCgpLZXJuZWwgNS4xLjYgd2Fz
IGFuIGV4Y2VwdGlvbiBmb3IgbWUgdG9vLCB3aXRoIHRoYXQga2VybmVsIEknbSBhYmxlIHRvIHJl
c3RhcnQKdGhlIGRpc3BsYXkgbWFuYWdlciBhbmQgcmVjb3ZlciB3aXRob3V0IGhhdmluZyB0byBy
ZWJvb3QuCgpBdHRhY2hlZCBpcyBhIHNob3J0IHZpZGVvIHRoYXQgY3Jhc2hlcyBteSBzeXN0ZW0u
ICBJIGNhbiB0cmlnZ2VyIHRoZSBhbGVydCBieQpydW5uaW5nOgoKbXB2IC0tdm89dmFhcGkgb3V0
LnRzCgpJJ20gd29uZGVyaW5nIGlmIGl0IGNyYXNoZXMgeW91ciBzeXN0ZW1zIHRvbyBhbmQgaWYg
aXQncyByZWxhdGVkLgoKLS0gCllvdSBhcmUgcmVjZWl2aW5nIHRoaXMgbWFpbCBiZWNhdXNlOgpZ
b3UgYXJlIHdhdGNoaW5nIHRoZSBhc3NpZ25lZSBvZiB0aGUgYnVnLgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
