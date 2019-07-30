Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4817B526
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 23:42:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA8746E61D;
	Tue, 30 Jul 2019 21:42:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.wl.linuxfoundation.org (mail.wl.linuxfoundation.org
 [198.145.29.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 705F26E61D
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 21:41:59 +0000 (UTC)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id 39E462887D
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 21:41:59 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id 2688F28874; Tue, 30 Jul 2019 21:41:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=ham version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204181] NULL pointer dereference regression in amdgpu
Date: Tue, 30 Jul 2019 21:41:57 +0000
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
Message-ID: <bug-204181-2300-k4LUyuAjCT@https.bugzilla.kernel.org/>
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
b21tZW50ICMyMyBmcm9tIFNlcmdleSBLb25kYWtvdiAodmlydHVvdXNmb3hAZ21haWwuY29tKSAt
LS0KKEluIHJlcGx5IHRvIE5pY2hvbGFzIEthemxhdXNrYXMgZnJvbSBjb21tZW50ICMyMikKPiBU
aGFua3MgZm9yIHRoZSBsb2chCj4gCj4gSSBjYW4gcmVwcm9kdWNlIHRoZSBpc3N1ZSBub3cgYnkg
ZW11bGF0aW5nIHRoZSBzZXF1ZW5jZSB1c2luZyBJR1QuIEl0Cj4gZG9lc24ndCBzZWVtIHRvIHNo
b3cgdXAgaW4gZGVza3RvcCB1c2FnZSBmb3IgbWUuCgpJbmRlZWQuIEkgdHJpZWQgdXNpbmcgbW9k
ZXNldCBYMTEgZHJpdmVyIGFuZCBnb3QgYSBidW5jaCBvZiBlcnJvcnMgaW4KWG9yZy4wLmxvZyBh
Ym91dCBpbmFiaWxpdHkgdG8gZG8gInBhZ2UgZmxpcHMiLCBzbyBJJ3ZlIHB1dCBgUGFnZUZsaXAg
ZmFsc2VgIGZvcgppdCBhbmQgYEVuYWJsZVBhZ2VGbGlwIGZhbHNlYCBmb3IgYW1kZ3B1IHdpdGgg
cmVtb3ZhbCBvZiAnVGVhckZyZWUgdHJ1ZScgKHdoeQppdCBpc24ndCBhbHdheXMgb24gYnkgZGVm
YXVsdCA/KSwganVzdCBpbiBjYXNlLiBObyBoYW5ncyBmb3IgYWJvdXQgMjQgaG91cnMKZXZlbiB3
aXRoIGEgbG90IG9mIFlvdXR1YmUgaW4gRmlyZWZveCBldmVuIHdpdGggYW1kZ3B1LgoKVGhlcmUg
c2VlbSB0byBiZSBhIGxvdCBvZiBwYXRjaGVzIGZvciBBTUQgR1BVcyBxdWV1ZWQgZm9yIDUuMi41
LCBhbnkgY2hhbmNlIG9mCnRoZSBjb21wbGV0ZSBmaXggYW1vbmcgdGhlbSA/CgotLSAKWW91IGFy
ZSByZWNlaXZpbmcgdGhpcyBtYWlsIGJlY2F1c2U6CllvdSBhcmUgd2F0Y2hpbmcgdGhlIGFzc2ln
bmVlIG9mIHRoZSBidWcuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
