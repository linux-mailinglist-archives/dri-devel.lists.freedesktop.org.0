Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4E3C0630
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2019 15:19:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3FE289F5B;
	Fri, 27 Sep 2019 13:19:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0D2389F5B
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2019 13:19:06 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204181] NULL pointer dereference regression in amdgpu
Date: Fri, 27 Sep 2019 13:19:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: tseewald@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204181-2300-KYLLnloVae@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204181-2300@https.bugzilla.kernel.org/>
References: <bug-204181-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQxODEKCi0tLSBD
b21tZW50ICM1NSBmcm9tIFRvbSBTZWV3YWxkICh0c2Vld2FsZEBnbWFpbC5jb20pIC0tLQooSW4g
cmVwbHkgdG8gU2VyZ2V5IEtvbmRha292IGZyb20gY29tbWVudCAjNTMpCj4gQ3JlYXRlZCBhdHRh
Y2htZW50IDI4NTIwOSBbZGV0YWlsc10KPiBkbWVzZ18yMDE5LTA5LTI2LWFtZGdwdS1vbGRfZGVy
ZWZlcmVuY2Vfb25fcGF0Y2hlZF81LjMuMQo+IAo+IEFmdGVyIGFib3V0IGEgZGF5IG9mIHVwdGlt
ZSBteSBwYXRjaGVkIDUuMy4xIGhhbmdlZCBkdXJpbmcgaG91cnMtbG9uZwo+IFlvdXR1YmUgdmlk
ZW8gd2l0aCBkZXJlZmVyZW5jZSB0aGF0IGlzIGFsbW9zdCBpZGVudGljYWwgdG8gdGhlIG9yaWdp
bmFsIG9uZToKCkkgZG9uJ3QgYmVsaWV2ZSB0aGUgcGF0Y2hlc1sxXSBoYXZlIGxhbmRlZCBpbiBh
IHN0YWJsZSBrZXJuZWwgcmVsZWFzZSB5ZXQsIGF0CmxlYXN0IGdvaW5nIGJ5IHRoZSA1LjMuMSBj
aGFuZ2UgbG9nWzJdIEkgZG9uJ3Qgc2VlIGFueSByZWZlcmVuY2UgdG8gdGhlbS4KClsxXSBodHRw
czovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzY0NTA1LwpbMl0gaHR0cHM6Ly9j
ZG4ua2VybmVsLm9yZy9wdWIvbGludXgva2VybmVsL3Y1LngvQ2hhbmdlTG9nLTUuMy4xCgotLSAK
WW91IGFyZSByZWNlaXZpbmcgdGhpcyBtYWlsIGJlY2F1c2U6CllvdSBhcmUgd2F0Y2hpbmcgdGhl
IGFzc2lnbmVlIG9mIHRoZSBidWcuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
