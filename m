Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D598D47A5
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 20:33:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A08C46EC80;
	Fri, 11 Oct 2019 18:33:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B20EC6EC80
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2019 18:33:10 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204241] amdgpu fails to resume from suspend
Date: Fri, 11 Oct 2019 18:33:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: Ahzo@tutanota.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-204241-2300-barOeJsZ15@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQyNDEKCkFoem9A
dHV0YW5vdGEuY29tIGNoYW5nZWQ6CgogICAgICAgICAgIFdoYXQgICAgfFJlbW92ZWQgICAgICAg
ICAgICAgICAgICAgICB8QWRkZWQKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogQXR0YWNobWVudCAjMjg1
MzQ5fDAgICAgICAgICAgICAgICAgICAgICAgICAgICB8MQogICAgICAgIGlzIG9ic29sZXRlfCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8CgotLS0gQ29tbWVudCAjMjAgZnJvbSBBaHpvQHR1
dGFub3RhLmNvbSAtLS0KQ3JlYXRlZCBhdHRhY2htZW50IDI4NTQ2OQogIC0tPiBodHRwczovL2J1
Z3ppbGxhLmtlcm5lbC5vcmcvYXR0YWNobWVudC5jZ2k/aWQ9Mjg1NDY5JmFjdGlvbj1lZGl0ClBh
dGNoIHRvIGZpeCB0aGUgcmVzdW1lIGZhaWx1cmVzCgooSW4gcmVwbHkgdG8gQWxleCBEZXVjaGVy
IGZyb20gY29tbWVudCAjMTcpCj4gSSdtIG5vdCBzdXJlIEkgdW5kZXJzdGFuZCB3aHkgdGhlIHBh
dGNoIGhlbHBzLiAgWW91IGFyZSBqdXN0IGNoYW5naW5nIHRoZQo+IG9yZGVyIG9mIHR3byBtZW1v
cnkgYWxsb2NhdGlvbnMuICBUaGUgb3JkZXIgc2hvdWxkbid0IG1hdHRlci4KCk15IGh5cG90aGVz
aXMgaXMgdGhhdCB0aGUgb3JkZXIgaGVyZSBpcyBub3QgdGhlIHJvb3QgY2F1c2Ugb2YgdGhlIHBy
b2JsZW0sIGJ1dApyYXRoZXIgYWZmZWN0cyB0aGUgbGlrZWxpaG9vZCBvZiB0aGF0IG1hbmlmZXN0
aW5nIGl0c2VsZi4KVGhpcyBpcyBiYXNlZCBvbiB0aGUgZmFjdCB0aGF0IEkgaGF2ZSBzZWVuIGEg
cmVzdW1lIGZhaWx1cmUgdHlwaWNhbCBmb3IgdGhpcwpidWcgb24gbGludXggNS4wIG9uY2UsIGJ1
dCBJJ20gdW5hYmxlIHRvIHJlcHJvZHVjZSBpdCB3aXRoIHRoYXQgdmVyc2lvbi4KCkFzIGNvbW1p
dCA1MzNhZWQyNzhhZmUgYXBwYXJlbnRseSBtYWtlcyB0aGUgZmFpbHVyZXMgbXVjaCBtb3JlIGxp
a2VseSB0bwpoYXBwZW4sIGl0IHByb3ZpZGVzIGFuIG9wcG9ydHVuaXR5IHRvIGRlYnVnIHRoaXMg
ZnVydGhlciBieSBiYWNrcG9ydGluZyBpdCB0bwpvbGRlciBsaW51eCB2ZXJzaW9ucy4KRG9pbmcg
dGhhdCBmb3IgdmVyc2lvbnMgZG93biB0byBsaW51eCA0LjE1IGV4cG9zZXMgdGhlIHJlc3VtZSBm
YWlsdXJlcywgYnV0IG5vdApvbiBsaW51eCA0LjE0LgoKQSBiaXNlY3Rpb24gYmV0d2VlbiB0aGVz
ZSB0d28sIHdoaWxlIGJhY2twb3J0aW5nIDUzM2FlZDI3OGFmZSBvbiBldmVyeSBzdGVwLApsZWFk
IHRvIGNvbW1pdCAyYTkxZjI3MmUzNGMsIHdoaWNoIGZhaWxlZCB0byBib290IGFuZCB0aHVzIGhh
ZCB0byBiZSBza2lwcGVkLAphbmQ6CmNvbW1pdCBlMDEyOGVmYjA4YjNkNjI4ZDc2N2VjODU3OGU3
N2NkZDdlY2M4ZjgxCkF1dGhvcjogSmFtZXMgWmh1IDxKYW1lcy5aaHVAYW1kLmNvbT4KRGF0ZTog
ICBGcmkgU2VwIDI5IDE2OjQyOjI3IDIwMTcgLTA0MDAKCiAgICBkcm0vYW1kZ3B1OiBhZGQgdXZk
IGVuYyBpYiB0ZXN0CgogICAgR2VuZXJhdGUgY3JlYXRlL2Rlc3Ryb3kgbWVzc2FnZXMgdG8gdGVz
dCBVVkQgZW5jb2RlIGluZGlyZWN0IGJ1ZmZlcgpmdW5jdGlvbi4KICAgIEFuZCBlbmFibGUgVVZE
IGVuY29kZSBJQiB0ZXN0IGR1cmluZyBkZXZpY2UgaW5pdGlhbGl6YXRpb24uCgogICAgU2lnbmVk
LW9mZi1ieTogSmFtZXMgWmh1IDxKYW1lcy5aaHVAYW1kLmNvbT4KICAgIFJldmlld2VkLWFuZC1U
ZXN0ZWQtYnk6IExlbyBMaXUgPGxlby5saXVAYW1kLmNvbT4KICAgIFJldmlld2VkLWJ5OiBDaHJp
c3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CiAgICBTaWduZWQtb2ZmLWJ5
OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+CgpUaGlzIGxvb2tzIGxp
a2UgYSBsaWtlbHkgcm9vdCBjYXVzZS4gSW5kZWVkLCBhZGRpbmcgJ3JldHVybiAwOycgYXQgdGhl
CmJlZ2lubmluZyBvZiB1dmRfdjZfMF9lbmNfcmluZ190ZXN0X2liIG1ha2VzIHRoZSBwcm9ibGVt
IHVucmVwcm9kdWNpYmxlLCBldmVuCm9uIHRoZSBsYXRlc3QgbGludXggNS40LXJjMi4KCkNvbXBh
cmluZyB3aXRoIGFtZGdwdV91dmRfZ2V0X3tjcmVhdGUsZGVzdHJveX1fbXNnIHNob3dzIHRoYXQg
dGhlc2UgdXNlIDAgYXMKZHVtbXkgR1BVIHBvaW50ZXIsIHdoaWxlIHV2ZF92Nl8wX2VuY19nZXRf
e2NyZWF0ZSxkZXN0cm95fV9tc2cgdXNlIGEgcmVhbCBHUFUKbWVtb3J5IGFkZHJlc3MuCkNoYW5n
aW5nIHRoZW0gdG8gYWxzbyB1c2UgMCBhcyBkdW1teSBwb2ludGVyLCBhcyBpcyBkb25lIGluIHRo
ZSBhdHRhY2hlZCBwYXRjaCwKYWN0dWFsbHkgZml4ZXMgdGhlIHJlc3VtZSBmYWlsdXJlcy4KCk1h
eWJlIGEgc2ltaWxhciBjaGFuZ2Ugc2hvdWxkIGFsc28gYmUgbWFkZSBmb3IgVVZEIDcuCgotLSAK
WW91IGFyZSByZWNlaXZpbmcgdGhpcyBtYWlsIGJlY2F1c2U6CllvdSBhcmUgd2F0Y2hpbmcgdGhl
IGFzc2lnbmVlIG9mIHRoZSBidWcuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
