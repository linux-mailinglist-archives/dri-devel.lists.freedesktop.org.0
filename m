Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC8C114B4B
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2019 03:58:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E42D6F955;
	Fri,  6 Dec 2019 02:58:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7921B6F955
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2019 02:58:06 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201539] AMDGPU R9 390 automatic fan speed control in Linux
 4.19/4.20/5.0
Date: Fri, 06 Dec 2019 02:58:05 +0000
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
Message-ID: <bug-201539-2300-pA0c16ZI3g@https.bugzilla.kernel.org/>
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
b21tZW50ICMzNiBmcm9tIE1hc3RlckNBVFogKG1hc3RlcmNhdHpAaG90bWFpbC5jb20pIC0tLQph
ZnRlciBoYXZpbmcgZ29vZCBmYW4gY29udHJvbCBmb3IgYSBmZXcgd2Vla3MKIDUuNC4yLTA1MDQw
Mi1nZW5lcmljIGlzIG5vdyBoYXZpbmcgYSBtZWx0IGRvd24gYmFjayB0byB0cnlpbmcgdG8gcnVu
IHRoZSBjYXJkcwpACiAoY3JpdCA9ICsxMDQwMDAuMMKwQywgaHlzdCA9IC0yNzMuMcKwQykKCmFu
ZCB0aGlzIGlzIHdoYXRzIGdvdCBtZSBzdHVtcGVkICwgaXQgc2VlbXMgdG8gZ28gYXV0byB3aGVu
IGl0IGhpdHMgaGlnaCB0ZW1wIH4KNzAgdGhlbiBzdGFydHMgZHJvcHBpbmcgdGhlIGZhbiBzcGVl
ZCBJIGNhbiBleGl0IGEgZ2FtZSBzZXQgYSBoaWdoIGZhbiBzcGVlZCBpdAp3aWxsIHNpdCB0aGVp
ciBAIDYwIGRlZyBmb3IgYSBnb29kIDIwIG1pbnMgd2l0aCB+IDYwJSAsIGRlY2lkZSB0byBnbyBi
YWNrIGludG8KZ2FtZSAuLiBoaXRzIDcwIC4uIGZhbiBzcGVlZHMga2VlcCBkcm9wcGluZyB1bnRp
bCBpdHMgMjAlIGFuZCBibGlwcGluZyAxMDAlIEAKOTUgZGVnCgpJIGFtIHZlcnkgY2xvc2UgdG8g
Z29pbmcgYmFjayB0byBsaXF1aWQgY29vbGluZyAuLi4gb3IgY29ubmVjdGluZyB0aGUgZmFuIHRv
IGEKbWFudWFsIHNwZWVkIGNvbnRyb2xsZXIgKCBpZiBzb21lb25lIGtub3dzIG9mIGEgd2F5IEkg
Y2FuIHN0aWxsIGhhdmUgdGhlIGZhbgpjb25uZWN0ZWQgZG9yIGRyaXZlciBjb250cm9sIGFuZCBt
b25pdG9yaW5nIHdpdGggYSBtYW51YWwgZGV2aWNlIG92ZXJyaWRlIGZvcgpQV00gSSBhbSBhbGwg
ZWFycyAsIHdvdWxkIGl0IGJlIHNhZmUgZm9yIG1lIHRvIGp1c3QgdXNlIGEgdGhlcm1vc3RhdCB0
byBqdXN0CnNlbmQgdm9sdGFnZSB0byB0aGUgZmFuID8gaWUpIDJ4IGlucHV0IHBvd2VyIHNvdXJj
ZXMgCgoKCm15IGd1ZXNzIGJhc2Ugb3IgYXNpYyAgaXMgd2hhdCBpdHMgcmVhZGluZyBub3cgYWJv
dXQgdG8gaGFjayBhd2F5IGF0IHRob3NlCm1vZHVsZXMgYW5kIHRyeSBhZ2FpbiAKCi9ob21lL2Fp
by9Qcm9ncmFtcy9saW51eC9kcml2ZXJzL2dwdS9kcm0vaTkxNS9vYS9pOTE1X29hX3RnbC5jCi9o
b21lL2Fpby9Qcm9ncmFtcy9saW51eC9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYXNpY19y
ZWcvdmNlL3ZjZV80XzBfZGVmYXVsdC5oCi9ob21lL2Fpby9Qcm9ncmFtcy9saW51eC9kcml2ZXJz
L2dwdS9kcm0vbm91dmVhdS9udmttL2VuZ2luZS9jZS9nZjEwMC5jCi9ob21lL2Fpby9Qcm9ncmFt
cy9saW51eC9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL2VuZ2luZS9jZS9ndDIxNS5jCi9o
b21lL2Fpby9Qcm9ncmFtcy9saW51eC9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL2VuZ2lu
ZS9kZXZpY2UvYmFzZS5jCgotLSAKWW91IGFyZSByZWNlaXZpbmcgdGhpcyBtYWlsIGJlY2F1c2U6
CllvdSBhcmUgd2F0Y2hpbmcgdGhlIGFzc2lnbmVlIG9mIHRoZSBidWcuCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
