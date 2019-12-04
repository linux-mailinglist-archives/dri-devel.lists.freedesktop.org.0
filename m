Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A4011289F
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 10:54:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C88B372DE8;
	Wed,  4 Dec 2019 09:54:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E91272BF7
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 09:54:48 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201957] amdgpu: ring gfx timeout
Date: Wed, 04 Dec 2019 09:54:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: pierre-eric.pelloux-prayer@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-201957-2300-6vT2FYGFXe@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDE5NTcKClBpZXJy
ZS1FcmljIFBlbGxvdXgtUHJheWVyIChwaWVycmUtZXJpYy5wZWxsb3V4LXByYXllckBhbWQuY29t
KSBjaGFuZ2VkOgoKICAgICAgICAgICBXaGF0ICAgIHxSZW1vdmVkICAgICAgICAgICAgICAgICAg
ICAgfEFkZGVkCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KICAgICAgICAgICAgICAgICBDQ3wgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfHBpZXJyZS1lcmljLnBlbGxvdXgtcHJheWVyQAogICAgICAg
ICAgICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICB8YW1kLmNvbQoKLS0tIENv
bW1lbnQgIzIyIGZyb20gUGllcnJlLUVyaWMgUGVsbG91eC1QcmF5ZXIgKHBpZXJyZS1lcmljLnBl
bGxvdXgtcHJheWVyQGFtZC5jb20pIC0tLQooSW4gcmVwbHkgdG8gc2hhbGxvd2Fsb2UgZnJvbSBj
b21tZW50ICMxNikKPiBDcmVhdGVkIGF0dGFjaG1lbnQgMjg1NjY1IFtkZXRhaWxzXQo+IDUgc2Vj
b25kIHZpZGVvIGNsaXAgdGhhdCB0cmlnZ2VycyBhIGNyYXNoCj4gCj4gSGksCj4gCj4gSSB0aGlu
ayBJJ20gaGF2aW5nIHRoZSBzYW1lIHByb2JsZW0gYXMgeW91IGd1eXMuICBJIHJ1biBhIG15dGhi
YWNrZW5kIHdoZXJlCj4gSSByZWNvcmQgY2FibGUgdGVsZXZpc2lvbiBhbmQgdGhvc2UgcmVjb3Jk
aW5ncyBvZnRlbiBjcmFzaCBteSBzeXN0ZW0gd2hlbgo+IGhhcmR3YXJlIGRlY29kaW5nIGlzIGVu
YWJsZWQuICBVc3VhbGx5IGl0J3MganVzdCB0aGUgc2NyZWVuIHRoYXQgZnJlZXplcyBhbmQKPiBJ
IGNhbiBzdGlsbCBzc2ggdG8gaXQuICAKPiAKPiBLZXJuZWwgNS4xLjYgd2FzIGFuIGV4Y2VwdGlv
biBmb3IgbWUgdG9vLCB3aXRoIHRoYXQga2VybmVsIEknbSBhYmxlIHRvCj4gcmVzdGFydCB0aGUg
ZGlzcGxheSBtYW5hZ2VyIGFuZCByZWNvdmVyIHdpdGhvdXQgaGF2aW5nIHRvIHJlYm9vdC4KPiAK
PiBBdHRhY2hlZCBpcyBhIHNob3J0IHZpZGVvIHRoYXQgY3Jhc2hlcyBteSBzeXN0ZW0uICBJIGNh
biB0cmlnZ2VyIHRoZSBhbGVydAo+IGJ5IHJ1bm5pbmc6Cj4gCj4gbXB2IC0tdm89dmFhcGkgb3V0
LnRzCj4gCj4gSSdtIHdvbmRlcmluZyBpZiBpdCBjcmFzaGVzIHlvdXIgc3lzdGVtcyB0b28gYW5k
IGlmIGl0J3MgcmVsYXRlZC4KCgpUaGlzIG9uZSBpcyBwcm9iYWJseSBhIE1lc2EgaXNzdWUsIHNl
ZQpodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvbWVzYS9tZXNhL2lzc3Vlcy8yMTc3CgpX
aGF0IE1lc2EgdmVyc2lvbiBhcmUgeW91IHVzaW5nPwoKLS0gCllvdSBhcmUgcmVjZWl2aW5nIHRo
aXMgbWFpbCBiZWNhdXNlOgpZb3UgYXJlIHdhdGNoaW5nIHRoZSBhc3NpZ25lZSBvZiB0aGUgYnVn
LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
