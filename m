Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7422DFF870
	for <lists+dri-devel@lfdr.de>; Sun, 17 Nov 2019 08:46:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4485C6E25F;
	Sun, 17 Nov 2019 07:46:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77DB36E25F
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Nov 2019 07:46:03 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201539] AMDGPU R9 390 automatic fan speed control in Linux
 4.19/4.20/5.0
Date: Sun, 17 Nov 2019 07:46:02 +0000
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
Message-ID: <bug-201539-2300-9JJDyQlqo9@https.bugzilla.kernel.org/>
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
b21tZW50ICMzNCBmcm9tIE1hc3RlckNBVFogKG1hc3RlcmNhdHpAaG90bWFpbC5jb20pIC0tLQpz
dWNjZXNzIAoKZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvaHdtZ3IuYyAKCmh3
bWdyLT5mYW5fY3RybF9pc19pbl9kZWZhdWx0X21vZGUgPSBmYWxzZTsKCml0IHdpbGwgbm93IGJv
b3QgdXAgaW4gbWFudWFsIG1vZGUKCgpmaW5hbGx5IEkgaGF2ZSBmYW4gY29udHJvbCAiQU1EX0RQ
TV9GT1JDRURfTEVWRUxfQVVUTyIgIApJIGFtIHdvbmRlcmluZyBqdXN0IGhvdyAiRk9SQ0VEIiB0
aGF0ICJBVVRPIiBpcyBtZWFudCB0byBiZSAuLi4uCgpob3cgZXZlciBvbmNlIHlvdSBwdXQgaXQg
YmFjayB0byAiMiIgIkFVVE8iIGl0IHRha2VzIGNvbnRyb2wgYWdhaW4gLi4uIGFuZCB3aWxsCm92
ZXJ3cml0ZSB5b3VyICIwIiBjYXJkIGNvbnRyb2wgYW5kICIxIiBtYW51YWwgIAoKZWNobyAyID4g
IC9zeXMvY2xhc3MvZHJtL2NhcmQxL2RldmljZS9od21vbi9od21vbjEvcHdtMV9lbmFibGUgCmRv
bid0IGRvIGl0IHVubGVzcyB5b3Ugd2FudCB0byByZWJvb3Qgd2l0aCBhIGhvdCBHUFUgOlAgCgoK
CmFsc28gdGhlIGNyaXQgdGVtcCBmb3IgIlNlYSBJc2xhbmQiIGNhcmRzIGxpa2UgbXkgUjkgMjkw
IGlzIGRlZmlhbnRseSBiZWluZwpyZXRyaWV2ZWQgZnJvbSAKZHJpdmVycy9ncHUvZHJtL2FtZC9w
b3dlcnBsYXkvaHdtZ3Ivc211N19od21nci5jIAoKdGhlcm1hbF90ZW1wX3NldHRpbmcudGVtcGVy
YXR1cmVfc2h1dGRvd24KCgppZiAoaHdtZ3ItPmNoaXBfaWQgID09IENISVBfSEFXQUlJKSB7CiAg
ICAgICAgICAgICAgICBkYXRhLT50aGVybWFsX3RlbXBfc2V0dGluZy50ZW1wZXJhdHVyZV9sb3cg
PSA3NDUwMDsKICAgICAgICAgICAgICAgIGRhdGEtPnRoZXJtYWxfdGVtcF9zZXR0aW5nLnRlbXBl
cmF0dXJlX2hpZ2ggPSA4MDAwMDsKICAgICAgICAgICAgICAgIGRhdGEtPnRoZXJtYWxfdGVtcF9z
ZXR0aW5nLnRlbXBlcmF0dXJlX3NodXRkb3duID0gOTgwMDA7CgoKCgphbmQgdGhlIGZhbnMgc3Rp
bGwgc3BpbiBzbG93IHJlZ2FyZGxlc3MgaG93IGxvdyBJIHNldCBpdCAuLiBzb29vIC4uIHNvbWV0
aGluZ3MKYnJva2VuIC4uLiBzbyBsb29rcyBsaWtlIEkgd2lsbCBiZSBkb2luZyBhIGN1c3RvbSBr
ZXJuZWwgb24gZXZlcnkgdXBkYXRlIGZvciBhCndoaWxlIG5vdyB0byBkaXNhYmxlIEFVVE8gZmFu
IGNvbnRyb2wgCgphbmQgZm9yIHNvbWUgcmVhc29uIEFNRCBkZXZzIGZlZWwgMTIwIGRlZyBpcyBO
T1JNQUwgZm9yIGEgR1BVIGFuZCB1c2VycyB3YW50CnF1aXRlIGZhbnMgLi4uIEkgZ2l2ZSB1cCAu
Li4KCi0tIApZb3UgYXJlIHJlY2VpdmluZyB0aGlzIG1haWwgYmVjYXVzZToKWW91IGFyZSB3YXRj
aGluZyB0aGUgYXNzaWduZWUgb2YgdGhlIGJ1Zy4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
