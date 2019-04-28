Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33244B630
	for <lists+dri-devel@lfdr.de>; Sun, 28 Apr 2019 17:46:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50C3F88FE1;
	Sun, 28 Apr 2019 15:46:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.wl.linuxfoundation.org (mail.wl.linuxfoundation.org
 [198.145.29.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84DA488FE1
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Apr 2019 15:46:49 +0000 (UTC)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id 113892873F
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Apr 2019 15:46:49 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id 058092874B; Sun, 28 Apr 2019 15:46:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=ham version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201273] Fatal error during GPU init amdgpu RX560
Date: Sun, 28 Apr 2019 15:46:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: quirin.blaeser@freenet.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-201273-2300-G2nINRdzcJ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201273-2300@https.bugzilla.kernel.org/>
References: <bug-201273-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDEyNzMKCi0tLSBD
b21tZW50ICM0NiBmcm9tIHF1aXJpbi5ibGFlc2VyQGZyZWVuZXQuZGUgLS0tCihJbiByZXBseSB0
byBxdWlyaW4uYmxhZXNlciBmcm9tIGNvbW1lbnQgIzQ1KQo+IChJbiByZXBseSB0byBxdWlyaW4u
YmxhZXNlciBmcm9tIGNvbW1lbnQgIzQ0KQo+ID4gKEluIHJlcGx5IHRvIEFsZXggRGV1Y2hlciBm
cm9tIGNvbW1lbnQgIzQzKQo+ID4gPiBEb2VzIGJvb3Rpbmcgd2l0aCBhbnkgb2YgdGhlIGZvbGxv
d2luZyBvcHRpb25zIG9uIHRoZSBrZXJuZWwgY29tbWFuZCBsaW5lCj4gPiBpbgo+ID4gPiBncnVi
IGhlbHA/Cj4gPiA+IGFtZF9pb21tdT1vZmYKPiA+ID4gaWRsZT1ub213YWl0Cj4gPiA+IGlvbW11
PXB0Cj4gPiA+IHBjaT1ub2F0cwo+ID4gPiBDYW4geW91IGFsc28gdHJ5IGRpZmZlcmVudCBJT01N
VSBhbmQgU1ZNIHNldHRpbmdzIGluIHRoZSBzYmlvcz8gIEUuZy4sCj4gPiA+IGNoYW5nZSBmcm9t
ICJhdXRvIiB0byAiZW5hYmxlZCIgb3IgImRpc2FibGVkIi4KPiA+IAo+ID4gScK0bGwgdHJ5IGlk
bGU9bm9td2FpdCBpb21tdT1wdCBwY2k9bm9hdHMgZm9yIG5vdwo+ID4gaW9tbXUgYW5kIHN2bSBh
cmUgc3RpbGwgZW5hYmxlZCBpbiBCSU9TCj4gCj4gQnVnIGlzIHN0aWxsIGFsaXZlLiB2NS4wLjkK
PiBOZXh0IFN0ZXA6Cj4gaW9tbXUgYW5kIHN2bSBkaXNhYmxlZCBpbiBCSU9TCj4gY2hhbmdlZCBj
bWRsaW5lIHRvIGFtZF9pb21tdT1vZmYKCkJ1ZyBpcyBzdGlsbCBhbGl2ZS4gdjUuMC45Cm5vdyBp
b21tdSBhbmQgc3ZtIGVuYWJsZWQgaW4gQklPUwpjbWRsaW5lIG5vdCBjaGFuZ2VkOiBhbWRfaW9t
bXU9b2ZmCgotLSAKWW91IGFyZSByZWNlaXZpbmcgdGhpcyBtYWlsIGJlY2F1c2U6CllvdSBhcmUg
d2F0Y2hpbmcgdGhlIGFzc2lnbmVlIG9mIHRoZSBidWcuCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
