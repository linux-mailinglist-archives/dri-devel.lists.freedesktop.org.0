Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F0C116336
	for <lists+dri-devel@lfdr.de>; Sun,  8 Dec 2019 18:32:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC99F6E0AD;
	Sun,  8 Dec 2019 17:32:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10EB16E0AD
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Dec 2019 17:32:51 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201957] amdgpu: ring gfx timeout
Date: Sun, 08 Dec 2019 17:32:49 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-201957-2300-n0dTtwT7gm@https.bugzilla.kernel.org/>
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
b21tZW50ICMyMyBmcm9tIHNoYWxsb3dhbG9lQGdtYWlsLmNvbSAtLS0KVGhhbmtzIGZvciB0aGUg
bGluayB0byB0aGUgYnVnLiBJJ20gcnVubmluZyBhbiB1YnVudHUgYmFzZWQgc3lzdGVtIGFuZCBh
bQp1c2luZyB0aGUgb2liYWYgcHBhLiAgVGhlIGN1cnJlbnQgdmVyc2lvbiBpcyAyMC4wLgoKCgpP
biBXZWQsIERlYyA0LCAyMDE5IGF0IDE6NTQgQU0gPGJ1Z3ppbGxhLWRhZW1vbkBidWd6aWxsYS5r
ZXJuZWwub3JnPiB3cm90ZToKCj4gaHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVn
LmNnaT9pZD0yMDE5NTcKPgo+IFBpZXJyZS1FcmljIFBlbGxvdXgtUHJheWVyIChwaWVycmUtZXJp
Yy5wZWxsb3V4LXByYXllckBhbWQuY29tKSBjaGFuZ2VkOgo+Cj4gICAgICAgICAgICBXaGF0ICAg
IHxSZW1vdmVkICAgICAgICAgICAgICAgICAgICAgfEFkZGVkCj4KPiAtLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCj4gICAgICAgICAgICAgICAgICBDQ3wKPiB8cGllcnJlLWVyaWMucGVsbG91eC1wcmF5ZXJA
Cj4gICAgICAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgfGFtZC5j
b20KPgo+IC0tLSBDb21tZW50ICMyMiBmcm9tIFBpZXJyZS1FcmljIFBlbGxvdXgtUHJheWVyICgK
PiBwaWVycmUtZXJpYy5wZWxsb3V4LXByYXllckBhbWQuY29tKSAtLS0KPiAoSW4gcmVwbHkgdG8g
c2hhbGxvd2Fsb2UgZnJvbSBjb21tZW50ICMxNikKPiA+IENyZWF0ZWQgYXR0YWNobWVudCAyODU2
NjUgW2RldGFpbHNdCj4gPiA1IHNlY29uZCB2aWRlbyBjbGlwIHRoYXQgdHJpZ2dlcnMgYSBjcmFz
aAo+ID4KPiA+IEhpLAo+ID4KPiA+IEkgdGhpbmsgSSdtIGhhdmluZyB0aGUgc2FtZSBwcm9ibGVt
IGFzIHlvdSBndXlzLiAgSSBydW4gYSBteXRoYmFja2VuZAo+IHdoZXJlCj4gPiBJIHJlY29yZCBj
YWJsZSB0ZWxldmlzaW9uIGFuZCB0aG9zZSByZWNvcmRpbmdzIG9mdGVuIGNyYXNoIG15IHN5c3Rl
bSB3aGVuCj4gPiBoYXJkd2FyZSBkZWNvZGluZyBpcyBlbmFibGVkLiAgVXN1YWxseSBpdCdzIGp1
c3QgdGhlIHNjcmVlbiB0aGF0IGZyZWV6ZXMKPiBhbmQKPiA+IEkgY2FuIHN0aWxsIHNzaCB0byBp
dC4KPiA+Cj4gPiBLZXJuZWwgNS4xLjYgd2FzIGFuIGV4Y2VwdGlvbiBmb3IgbWUgdG9vLCB3aXRo
IHRoYXQga2VybmVsIEknbSBhYmxlIHRvCj4gPiByZXN0YXJ0IHRoZSBkaXNwbGF5IG1hbmFnZXIg
YW5kIHJlY292ZXIgd2l0aG91dCBoYXZpbmcgdG8gcmVib290Lgo+ID4KPiA+IEF0dGFjaGVkIGlz
IGEgc2hvcnQgdmlkZW8gdGhhdCBjcmFzaGVzIG15IHN5c3RlbS4gIEkgY2FuIHRyaWdnZXIgdGhl
Cj4gYWxlcnQKPiA+IGJ5IHJ1bm5pbmc6Cj4gPgo+ID4gbXB2IC0tdm89dmFhcGkgb3V0LnRzCj4g
Pgo+ID4gSSdtIHdvbmRlcmluZyBpZiBpdCBjcmFzaGVzIHlvdXIgc3lzdGVtcyB0b28gYW5kIGlm
IGl0J3MgcmVsYXRlZC4KPgo+Cj4gVGhpcyBvbmUgaXMgcHJvYmFibHkgYSBNZXNhIGlzc3VlLCBz
ZWUKPiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvbWVzYS9tZXNhL2lzc3Vlcy8yMTc3
Cj4KPiBXaGF0IE1lc2EgdmVyc2lvbiBhcmUgeW91IHVzaW5nPwo+Cj4gLS0KPiBZb3UgYXJlIHJl
Y2VpdmluZyB0aGlzIG1haWwgYmVjYXVzZToKPiBZb3UgYXJlIG9uIHRoZSBDQyBsaXN0IGZvciB0
aGUgYnVnLgoKLS0gCllvdSBhcmUgcmVjZWl2aW5nIHRoaXMgbWFpbCBiZWNhdXNlOgpZb3UgYXJl
IHdhdGNoaW5nIHRoZSBhc3NpZ25lZSBvZiB0aGUgYnVnLgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
