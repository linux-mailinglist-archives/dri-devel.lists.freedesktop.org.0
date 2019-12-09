Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C254211786F
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 22:26:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 107F36E528;
	Mon,  9 Dec 2019 21:26:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E3846E528
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 21:26:55 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201539] AMDGPU R9 390 automatic fan speed control in Linux
 4.19/4.20/5.0
Date: Mon, 09 Dec 2019 21:26:54 +0000
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
Message-ID: <bug-201539-2300-eg2MS1KkCi@https.bugzilla.kernel.org/>
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
b21tZW50ICM1MiBmcm9tIG11bmNyaWVmIChybXVuY3JpZWZAaHVtYW5hdmFuY2UuY29tKSAtLS0K
KEluIHJlcGx5IHRvIE1hc3RlckNBVFogZnJvbSBjb21tZW50ICM1MSkKPiBjdXJyZW50IHRlbXA6
IDYxMDAwCj4gaW50ZXJwb2xhdGVkIHB3bSB2YWx1ZSBmb3IgdGVtcGVyYXR1cmUgNjEwMDAgaXM6
IDE3MAo+IGN1cnJlbnQgcHdtOiAxNjUsIHJlcXVlc3RlZCB0byBzZXQgcHdtIHRvIDE3MAo+IGN1
cnJlbnQgcHdtOiAxNjUsIHJlcXVlc3RlZCB0byBzZXQgcHdtIHRvIDE3MAo+IHRlbXAgYXQgbGFz
dCBjaGFuZ2Ugd2FzIDYxMDAwCj4gY2hhbmdpbmcgcHdtIHRvIDE3MAo+IAo+IGN1cnJlbnQgdGVt
cDogNzEwMDAKPiBjdXJyZW50IHB3bTogMjU1LCByZXF1ZXN0ZWQgdG8gc2V0IHB3bSB0byAyNTUK
PiBjdXJyZW50IHB3bTogMjU1LCByZXF1ZXN0ZWQgdG8gc2V0IHB3bSB0byAyNTUKPiBub3QgY2hh
bmdpbmcgcHdtLCB3ZSBqdXN0IGRpZCBhdCA3MTAwMCwgbmV4dCBjaGFuZ2Ugd2hlbiBiZWxvdyA2
NjAwMAo+IAo+IAo+IGN1cnJlbnQgdGVtcDogNzMwMDAKPiBjdXJyZW50IHB3bTogNjgsIHJlcXVl
c3RlZCB0byBzZXQgcHdtIHRvIDI1NQo+IGN1cnJlbnQgcHdtOiA2OCwgcmVxdWVzdGVkIHRvIHNl
dCBwd20gdG8gMjU1Cj4gRmFubW9kZSBub3Qgc2V0IHRvIG1hbnVhbC4KPiBzZXR0aW5nIGZhbiBt
b2RlIHRvIDEKPiB0ZW1wIGF0IGxhc3QgY2hhbmdlIHdhcyA3MzAwMAo+IGNoYW5naW5nIHB3bSB0
byAyNTUKPiAvdXNyL2xvY2FsL2Jpbi9hbWRncHUtZmFuY29udHJvbDogbGluZSA2NTogZWNobzog
d3JpdGUgZXJyb3I6IEludmFsaWQKPiBhcmd1bWVudAo+IAo+IAo+IAo+IAo+IGN1cnJlbnQgdGVt
cDogODcwMDAKPiBjdXJyZW50IHB3bTogMTI0LCByZXF1ZXN0ZWQgdG8gc2V0IHB3bSB0byAyNTUK
PiBjdXJyZW50IHB3bTogMTI0LCByZXF1ZXN0ZWQgdG8gc2V0IHB3bSB0byAyNTUKPiBGYW5tb2Rl
IG5vdCBzZXQgdG8gbWFudWFsLgo+IHNldHRpbmcgZmFuIG1vZGUgdG8gMQo+IHRlbXAgYXQgbGFz
dCBjaGFuZ2Ugd2FzIDg3MDAwCj4gY2hhbmdpbmcgcHdtIHRvIDI1NQo+IC91c3IvbG9jYWwvYmlu
L2FtZGdwdS1mYW5jb250cm9sOiBsaW5lIDY1OiBlY2hvOiB3cml0ZSBlcnJvcjogSW52YWxpZAo+
IGFyZ3VtZW50CgpXZWxsLCB0aGF0J3MgY2VydGFpbmx5IHF1aXRlIGJpemFycmUuIEkgd2lzaCBJ
IGNvdWxkIHRoaW5rIG9mIHNvbWV0aGluZyBlbHNlCmJ1dCBJJ20gc3R1bXBlZC4gSSd2ZSBuZXZl
ciBleHBlcmllbmNlZCB0aGF0IHByb2JsZW0gb24gbXkgc3lzdGVtLCBhbmQgSSBkb24ndAprbm93
IHdoeSB5b3VycyBpc24ndCBhbGxvd2luZyB0aGUgd3JpdGUuIElzIGl0IHBvc3NpYmxlIHRoZXJl
IHdhcyBzb21lIGVycm9yIGluCmNvcHlpbmcgdGhlIHNjcmlwdD8gSXQgc2VlbXMgdW5saWtlbHkg
YnV0IHRoYXQncyBhbGwgSSBjYW4gY29tZSB1cCB3aXRoIGF0IHRoaXMKcG9pbnQuIElmIHlvdSBo
YXZlIHNvbWV3aGVyZSBJIGNhbiBzZW5kIG15IGFjdHVhbCBzY3JpcHQgYW5kIHNlcnZpY2UgZmls
ZXMgSSdkCmJlIGhhcHB5IHRvIHNlbmQgdGhlbSB0byB5b3UuIE90aGVyd2lzZSBJJ20ganVzdCBv
dXQgb2YgaWRlYXMuCgotLSAKWW91IGFyZSByZWNlaXZpbmcgdGhpcyBtYWlsIGJlY2F1c2U6Cllv
dSBhcmUgd2F0Y2hpbmcgdGhlIGFzc2lnbmVlIG9mIHRoZSBidWcuCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
