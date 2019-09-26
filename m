Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 307BDBFAD4
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2019 23:07:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D45F6EE0B;
	Thu, 26 Sep 2019 21:07:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E2EC6EE0B
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 21:07:32 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 203905] amdgpu:actual_brightness has unreal/wrong value
Date: Thu, 26 Sep 2019 21:07:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lskrejci@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-203905-2300-wZFTL075RR@https.bugzilla.kernel.org/>
In-Reply-To: <bug-203905-2300@https.bugzilla.kernel.org/>
References: <bug-203905-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDM5MDUKCi0tLSBD
b21tZW50ICMzIGZyb20gTHVrw6HFoSBLcmVqxI3DrSAobHNrcmVqY2lAZ21haWwuY29tKSAtLS0K
Q29tbWl0IDI2MjQ4NWE1MGZkNCAoImRybS9hbWQvZGlzcGxheTogRXhwYW5kIGRjIHRvIHVzZSAx
Ni4xNiBiaXQgYmFja2xpZ2h0IikKY2hhbmdlZCB0aGUgdmFsdWUgdGhhdCBpcyByZXR1cm5lZCBm
b3IgYGFjdHVhbF9icmlnaHRuZXNzYDoKCi1zdGF0aWMgdW5zaWduZWQgaW50IGRjZV9hYm1fZ2V0
X2N1cnJlbnRfYmFja2xpZ2h0XzhfYml0KHN0cnVjdCBhYm0gKmFibSkKK3N0YXRpYyB1bnNpZ25l
ZCBpbnQgZGNlX2FibV9nZXRfY3VycmVudF9iYWNrbGlnaHQoc3RydWN0IGFibSAqYWJtKQogewog
ICAgc3RydWN0IGRjZV9hYm0gKmFibV9kY2UgPSBUT19EQ0VfQUJNKGFibSk7CiAgICB1bnNpZ25l
ZCBpbnQgYmFja2xpZ2h0ID0gUkVHX1JFQUQoQkwxX1BXTV9DVVJSRU5UX0FCTV9MRVZFTCk7Cgot
ICAgcmV0dXJuIChiYWNrbGlnaHQgPj4gOCk7CisgICAvKiByZXR1cm4gYmFja2xpZ2h0IGluIGhh
cmR3YXJlIGZvcm1hdCB3aGljaCBpcyB1bnNpZ25lZCAxNyBiaXRzLCB3aXRoCisgICAgKiAxIGJp
dCBpbnRlZ2VyIGFuZCAxNiBiaXQgZnJhY3Rpb25hbAorICAgICovCisgICByZXR1cm4gYmFja2xp
Z2h0OwogfQoKCkkgY291bGQgbm90IGZpbmQgYW55dGhpbmcgb2ZmaWNpYWwgYWJvdXQgdGhlIHJh
bmdlIG9mIGBhY3R1YWxfYnJpZ2h0bmVzc2AsIG9ubHkKdGhlIGZvbGxvd2luZyBibG9nIHNheXMg
dGhhdCBpcyBoYXMgdG8gYmUgaW4gcmFuZ2Ugb2YgYGJyaWdodG5lc3NgOgpodHRwczovL25pa3Vs
YS5vcmcvfmphbmkvYmFja2xpZ2h0LyNpbmRleDNoMwoKSSBndWVzcyBhbWRncHVfZG1fYmFja2xp
Z2h0X2dldF9icmlnaHRuZXNzKCkgY291bGQgYmUgY2hhbmdlZCB0byBicmluZyB0aGUKYGFjdHVh
bF9icmlnaHRuZXNzYCB2YWx1ZSBpbiByYW5nZSBvZiBgYnJpZ2h0bmVzc2AgYWdhaW4gc2luY2Ug
aXQgcmV0dXJucyB0aGUKdmFsdWUgb2YgYGJyaWdodG5lc3NgIGluIHRoZSBlcnJvciBwYXRoIGFu
eXdheS4KCi0tIApZb3UgYXJlIHJlY2VpdmluZyB0aGlzIG1haWwgYmVjYXVzZToKWW91IGFyZSB3
YXRjaGluZyB0aGUgYXNzaWduZWUgb2YgdGhlIGJ1Zy4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
