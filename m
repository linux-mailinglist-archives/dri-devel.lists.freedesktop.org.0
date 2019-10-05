Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A21CC963
	for <lists+dri-devel@lfdr.de>; Sat,  5 Oct 2019 12:35:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D5AA6E056;
	Sat,  5 Oct 2019 10:35:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E2946E056
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Oct 2019 10:35:26 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204241] amdgpu fails to resume from suspend
Date: Sat, 05 Oct 2019 10:35:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andreas.jackisch@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204241-2300-IPdXs2camZ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204241-2300@https.bugzilla.kernel.org/>
References: <bug-204241-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQyNDEKCi0tLSBD
b21tZW50ICMxNSBmcm9tIEFuZHJlYXMgSmFja2lzY2ggKGFuZHJlYXMuamFja2lzY2hAZ21haWwu
Y29tKSAtLS0KKEluIHJlcGx5IHRvIEFoem8gZnJvbSBjb21tZW50ICMxNCkKPiBDcmVhdGVkIGF0
dGFjaG1lbnQgMjg1MzQ5IFtkZXRhaWxzXQo+IFBhdGNoIHRvIHByZXZlbnQgZnJlcXVlbnQgcmVz
dW1lIGZhaWx1cmVzCj4gLi4uLgo+IEFub3RoZXIgd2F5IHRvIHByZXZlbnQgdGhlc2UgZnJlcXVl
bnQgcmVzdW1lIGZhaWx1cmVzLCB3aGlsZSBwcmVzZXJ2aW5nIHRoZQo+IGludGVudGlvbiBvZiB0
aGlzIGNvbW1pdCwgaXMgdG8gc2ltcGx5IGNhbGwgYW1kZ3B1X2liX3Bvb2xfaW5pdCBkaXJlY3Rs
eQo+IGFmdGVyIGNhbGxpbmcgYW1kZ3B1X3Vjb2RlX2NyZWF0ZV9ibyBpbnN0ZWFkIG9mIGRpcmVj
dGx5IGJlZm9yZSB0aGF0Lgo+IEF0dGFjaGVkIGlzIGEgcGF0Y2ggZG9pbmcgaXQgdGhhdCB3YXku
CkkgYXBwbGllZCB0aGUgcGF0Y2ggYWJvdmUgdG8gNS4zLjItZ2VudG9vLiBBbGwgMzAgU3VzcGVu
ZC9SZXN1bWUgY3ljbGVzIHVzaW5nCnJ0Y3dha2UgYW5kIGEgY291cGxlIG9mIG1hbnVhbCBjeWNs
ZXMgd2VudCBPSy4KCkknbGwgY29udGludWUgdG8gdXNlIHRoaXMgc2V0dXAgYW5kIHdpbGwgcmVw
b3J0IGlmIGl0IGZhaWxzIGFnYWluIG9yIGlzIHN0aWxsCk9LIGFmdGVyIG9uZSB3ZWVrLgoKVGh4
IGZvciBiaXNlY3RpbmcgdGhpcyBpc3N1ZSBhbmQgcHJvdmlkaW5nIHRoaXMgZml4IGFzIEkgYXNz
dW1lIGl0IHRvb2sgc29tZQp0aW1lLgoKLS0gCllvdSBhcmUgcmVjZWl2aW5nIHRoaXMgbWFpbCBi
ZWNhdXNlOgpZb3UgYXJlIHdhdGNoaW5nIHRoZSBhc3NpZ25lZSBvZiB0aGUgYnVnLgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
