Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 792AD115EB2
	for <lists+dri-devel@lfdr.de>; Sat,  7 Dec 2019 22:04:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9FB66E228;
	Sat,  7 Dec 2019 21:04:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CB116E228
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Dec 2019 21:04:09 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201539] AMDGPU R9 390 automatic fan speed control in Linux
 4.19/4.20/5.0
Date: Sat, 07 Dec 2019 21:04:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rmuncrief@humanavance.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-201539-2300-2R9TwJwcHA@https.bugzilla.kernel.org/>
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
b21tZW50ICM0OSBmcm9tIG11bmNyaWVmIChybXVuY3JpZWZAaHVtYW5hdmFuY2UuY29tKSAtLS0K
KEluIHJlcGx5IHRvIEphbiBaaWFrIChodHRwOi8vYXRvbS1zeW1ib2wubmV0KSBmcm9tIGNvbW1l
bnQgIzQ4KQo+IChJbiByZXBseSB0byBtdW5jcmllZiBmcm9tIGNvbW1lbnQgIzQ3KQo+ID4gKElu
IHJlcGx5IHRvIEphbiBaaWFrIChodHRwOi8vYXRvbS1zeW1ib2wubmV0KSBmcm9tIGNvbW1lbnQg
IzQ2KQo+ID4gPiBUaGVyZSBpcyBhbHNvIHRoZSBwb3NzaWJpbGl0eSB0byB1c2UgcXVlc3Rpb24g
bWFya3MgaW4gdGhlIHBhdGg6Cj4gPiA+IAo+ID4gPiAvc3lzL2NsYXNzL2RybS9jYXJkPy9kZXZp
Y2UvaHdtb24vaHdtb24/Cj4gPiAKPiA+IFRoYW5rIHlvdSBmb3IgbWVudGlvbmluZyB0aGF0LiBJ
ZiB5b3Ugb25seSBoYXZlIG9uZSBHUFUgdGhhdCB3aWxsIGluZGVlZAo+ID4gd29yay4gSSBoYXZl
IG11bHRpcGxlIEdQVXMsIG9uZSBOdmlkaWEgYW5kIG9uZSBBTUQsIHNvIEkgaGF2ZSB0byBoYXJk
LWNvZGUKPiA+IHRoZSBjYXJkLgo+IAo+IE1heWJlIHlvdSBjYW4gdXNlIHRoZSBQQ0kgSUQgb2Yg
dGhlIGRldmljZToKPiAKPiBGT1VORD1mYWxzZQo+IGZvciBDQVJEIGluIC9zeXMvY2xhc3MvZHJt
L2NhcmQ/OyBkbwo+ICAgREVWSUNFPSIkKGNhdCAiJENBUkQvZGV2aWNlL2RldmljZSIpIgo+ICAg
aWYgW1sgIiR7REVWSUNFLCx9IiA9PSAweDY3YjEgXV07IHRoZW4KPiAgICAgRk9VTkQ9dHJ1ZQo+
ICAgICBicmVhawo+ICAgZmkKPiBkb25lCj4gJEZPVU5EIHx8IGV4aXQgMQo+IEhXTU9OPSRDQVJE
L2RldmljZS9od21vbi9od21vbj8KPiBlY2hvICRIV01PTgoKV2VsbCwgbXkgc3lzdGVtIHdvcmtz
IGdyZWF0IHRoZSB3YXkgaXQgaXMgYW5kIEkgZG9uJ3QgcmVhbGx5IGhhdmUgdGltZSB0byBkbwph
bnkgZnVydGhlciBkZWJ1Z2dpbmcgb3IgcmVkZXNpZ24uIEknbSBqdXN0IHRyeWluZyB0byBoZWxw
IE1hc3RlckNBVFogZ2V0CnRoaW5ncyBnb2luZy4gSG93ZXZlciB0aGF0J3MgYW5vdGhlciBncmVh
dCB3YXkgdG8gZGV0ZXJtaW5lIHdoZXJlIGEgc3BlY2lmaWMKY2FyZCBpcywgdGhhbmsgeW91IGZv
ciB0aGUgbXVsdGlwbGUgZ3JlYXQgc3VnZ2VzdGlvbnMhCgpJdCdzIGdyZWF0IHRvIHNlZSBzbyBt
YW55IHBlb3BsZSB0cnlpbmcgdG8gaGVscCwgd2UgbmVlZCBtb3JlIG9mIHRoYXQgaW4gTGludXgs
CmVzcGVjaWFsbHkgd2l0aCBBcmNoIGFuZCBpdHMgZGVyaXZhdGl2ZSBkaXN0cm9zLiBJdCdzIHZl
cnkgaXJyaXRhdGluZyBhbmQKZnJ1c3RyYXRpbmcgd2hlbiBJIHNlZSBleHBlcmllbmNlZCB1c2Vy
cyBzaW1wbHkgdGVsbCBvdGhlcnMgdG8gInJlYWQgdGhlIHdpa2kiLApvciBleHBlY3QgdGhlbSB0
byB1c2UgTGludXggZm9yIHR3byB5ZWFycyBiZWZvcmUgdGhleSBjYW4gaGF2ZSBhIHVzYWJsZQpp
bnN0YWxsYXRpb24uCgpJbiBmYWN0IHRoYXQga2luZCBvZiBvbGQsIG91dGRhdGVkLCBhbmQgZG93
bnJpZ2h0IG1lYW4gYXR0aXR1ZGUgaXMgb25lIG9mIHRoZQpyZWFzb25zIExpbnV4IHN0aWxsIGhh
cyBzdWNoIGEgbG93IHNoYXJlIG9mIHRoZSBkZXNrdG9wIG1hcmtldC4gU28gd2hlbmV2ZXIgSQpz
ZWUgc29tZW9uZSB3aG8gbmVlZHMgaGVscCBJIHRyeSB0byBtYWtlIGl0IGFzIGVhc3kgYXMgSSBj
YW4gZm9yIHRoZW0sIGFuZCBoYXZlCmV2ZW4gYmVlbiBpbnN1bHRlZCBudW1lcm91cyB0aW1lcyBi
eSB0aGUgY3J1ZWwgcGVvcGxlIHdobyBhcmUgYW5nZXJlZCB0aGF0IEkKZG9uJ3QganVzdCB0ZWxs
IG90aGVycyB0byBnZXQgYSBQaEQgb3Igc29tZXRoaW5nIDopCgotLSAKWW91IGFyZSByZWNlaXZp
bmcgdGhpcyBtYWlsIGJlY2F1c2U6CllvdSBhcmUgd2F0Y2hpbmcgdGhlIGFzc2lnbmVlIG9mIHRo
ZSBidWcuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
