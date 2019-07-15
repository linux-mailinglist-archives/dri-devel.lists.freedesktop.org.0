Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D436D6989F
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2019 17:56:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD4988969E;
	Mon, 15 Jul 2019 15:56:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.wl.linuxfoundation.org (mail.wl.linuxfoundation.org
 [198.145.29.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 168E18969E
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 15:56:11 +0000 (UTC)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id B723D2841F
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 15:56:11 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id A901E28449; Mon, 15 Jul 2019 15:56:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=unavailable version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204181] NULL pointer dereference regression in amdgpu
Date: Mon, 15 Jul 2019 15:56:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: virtuousfox@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204181-2300-VkpwHBD3Kv@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204181-2300@https.bugzilla.kernel.org/>
References: <bug-204181-2300@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
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
b21tZW50ICM5IGZyb20gU2VyZ2V5IEtvbmRha292ICh2aXJ0dW91c2ZveEBnbWFpbC5jb20pIC0t
LQooSW4gcmVwbHkgdG8gTmljaG9sYXMgS2F6bGF1c2thcyBmcm9tIGNvbW1lbnQgIzEpCj4gRG8g
eW91IG1pbmQgcG9zdGluZyBhbiBkbWVzZyBsb2cgd2l0aCBkcm09ZGVidWc9NCBhcyBwYXJ0IG9m
IHlvdXIgYm9vdAo+IHBhcmFtZXRlcnM/Cj4gCj4gQW4geG9yZyBsb2cgd291bGQgYmUgZ29vZCB0
b28gaWYgYXBwbGljYWJsZS4KPiAKPiBJJ20gY3VyaW91cyB0byBrbm93IHdoYXQgdGhlIGFjdHVh
bCBzZXF1ZW5jZSAvIHN5c3RlbSBzZXR1cCBpcyBmb3IKPiByZXByb2R1Y2luZyB0aGlzIGFzIHRo
aXMgaXNuJ3QgcmVhbGx5IGEgdHlwaWNhbCBzZXF1ZW5jZS4gSSB0aGluayB5b3UnZCBydW4KPiBp
bnRvIG90aGVyIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZXMgZXZlbiBpZiB0aGlzIG9uZSBpcyBn
dWFyZGVkLgo+IAo+IEkgdGhpbmsgdGhlIHN0cmVhbSBpdHNlbGYgaXMgTlVMTCBhbmQgaXQgc2hv
dWxkbid0IGJlIGluIHRoZSBjb250ZXh0LgoKSSBkb24ndCB0aGluayB0aGF0IHB1dHRpbmcgJ2Ry
bT1kZWJ1Zz00JyBpbnRvIGJvb3QgY21kIGhhcyBjaGFuZ2VkIGFueXRoaW5nIGJ1dApoZXJlJ3Mg
c29tZSBtb3JlIGRhdGEuIEkgYWxzbyBzdHVtYmxlZCBpbnRvIGFub3RoZXIgYmFmZmxpbmcgcmVn
cmVzc2lvbiAoYnVnCiMyMDM3MDMpIHJlY2VudGx5IChmcm9tIDUuMCB0byA1LjEpIGNvbmNlcm5p
bmcgbmV0d29yayBwYWNrZXQgc2NoZWR1bGluZwooZnFfY29kZWwgcWRpY3MpIHRoYXQgaGFsdHMg
YWZmZWN0ZWQgRXRoZXJuZXQgZGV2aWNlLCBpdCBhbHNvIGdpdmVzIG91dApyZXBlYXRhYmxlIGtl
cm5lbCB0cmFjZSBvbiByYW5kb20gbmV0d29yayBhY3Rpdml0eSB1bmxlc3MgcWRpY3MgaXMgY2hh
bmdlZCBvbgpkdW1iICJwZmlmb19mYXN0IiBlYXJseSBvbiwgc2ltaWxhcmx5IGhvdyB0aGlzIGdp
dmVzIG91dCBzYW1lIHJlcGVhdGFibGUgYW1kZ3B1CnRyYWNlIG9uIHNvbWUgcmFuZG9tIEdQVSBh
Y3Rpdml0eS4gV2VpcmQuCgotLSAKWW91IGFyZSByZWNlaXZpbmcgdGhpcyBtYWlsIGJlY2F1c2U6
CllvdSBhcmUgd2F0Y2hpbmcgdGhlIGFzc2lnbmVlIG9mIHRoZSBidWcuCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
