Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D39CE32E15
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2019 12:56:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0350A89225;
	Mon,  3 Jun 2019 10:56:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.wl.linuxfoundation.org (mail.wl.linuxfoundation.org
 [198.145.29.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A65489225
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2019 10:56:37 +0000 (UTC)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id 332FA285ED
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2019 10:56:37 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id 247F2288C7; Mon,  3 Jun 2019 10:56:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=unavailable version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 202445] amdgpu/dc: framerate dropping below adaptive sync range
 causes screen flickering
Date: Mon, 03 Jun 2019 10:56:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jaapbuurman@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-202445-2300-klcB0SKWjf@https.bugzilla.kernel.org/>
In-Reply-To: <bug-202445-2300@https.bugzilla.kernel.org/>
References: <bug-202445-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDI0NDUKCmphYXBi
dXVybWFuQGdtYWlsLmNvbSBjaGFuZ2VkOgoKICAgICAgICAgICBXaGF0ICAgIHxSZW1vdmVkICAg
ICAgICAgICAgICAgICAgICAgfEFkZGVkCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KICAgICAgICAgICAg
ICAgICBDQ3wgICAgICAgICAgICAgICAgICAgICAgICAgICAgfGphYXBidXVybWFuQGdtYWlsLmNv
bQoKLS0tIENvbW1lbnQgIzMyIGZyb20gamFhcGJ1dXJtYW5AZ21haWwuY29tIC0tLQpJIGFtIGV4
cGVyaWVuY2luZyB0aGUgZXhhY3Qgc2FtZSBpc3N1ZSwgYWx0aG91Z2ggSSBhbSBzdGlsbCBydW5u
aW5nIHRoZSA1LjEKa2VybmVsLiBJIGZlZWwgdW5jb21mb3J0YWJsZSBjb21waWxpbmcgbXkgb3du
IGtlcm5lbCwgc28gSSBjYW5ub3QgdGVzdCA1LjIganVzdAp5ZXQuIEkgZG8gaGF2ZSBhbiBhZGRp
dGlvbmFsIG9ic2VydmF0aW9uIHRoYXQgbWlnaHQgYmUgdXNlZnVsIGZvciBkZWJ1Z2dpbmcuIE15
CmZyZWVzeW5jIG1vbml0b3IgaGFzIGEgNDgtMTQ0IGZyZWVzeW5jIHJhbmdlLCBhbmQgZGlzcGxh
eXMgdGhlIGN1cnJlbnQgcmVmcmVzaApyYXRlIG9uIGl0cyBPU0QuCgpUaGUgaXNzdWUgZm9yIG1l
IGlzIHRoZSBlYXNpZXN0IHRvIHJlcHJvZHVjZSBpbiBLZXJiYWwgU3BhY2UgcHJvZ3JhbSB3aGls
ZSBpbgpzcGFjZSwgc2luY2UgdGhlIGZsaWNrZXJpbmcgaXMgZXNwZWNpYWxseSB2aXNpYmxlIHdp
dGggdGhlIG1hbnkgd2hpdGUgc3RhcnMgb24KdGhlIGJsYWNrbmVzcyBvZiBzcGFjZS4KCldoaWxl
IGluIHNwYWNlIHdpdGggYSBsYXJnZSB2ZXNzZWwgdGhhdCBwdXNoZXMgeW91ciBGUFMgZG93biAo
MzMtNDAgRlBTIGluIHRoZQppbmdhbWUgRlBTIG1vbml0b3IpLCBteSBtb25pdG9yIGlzIHJhcGlk
bHkgb3NjaWxsYXRpbmcgdGhyb3VnaCB0aGUgZW50aXJlCmZyZWVzeW5jIHJhbmdlIChhcyBsb3cg
YXMgNDggYW5kIGFzIGhpZ2ggYXMgMTQ0LCBhbmQgZXZlcnl0aGluZyBpbiBiZXR3ZWVuKS4gQXMK
ZmFyIGFzIEkgdW5kZXJzdGFuZCB0aGUgdGVjaG5vbG9neSwgd2hlbmV2ZXIgdGhlIEZQUyBpcyBz
dGFibGUgKGZvciBleGFtcGxlIGF0CjM3KSwgaXQgc2hvdWxkIHVzZSBMRkMgdG8gZGlzcGxheSBl
YWNoIGZyYW1lIHR3aWNlIG9yIHRocmljZSwgYW5kIHRoZSBtb25pdG9yCnNob3VsZCByZWZyZXNo
IGF0IGEgY29uc3RhbnQgNzRoeiBvciAxMTFoei4gQnV0IHRoYXQgaXMgbm90IHdoYXQgaXMgaGFw
cGVuaW5nCmlmIEkgdXNlIGEgc3RhdGljIHZpZXcgd2l0aCBhIGNvbnN0YW50IDM3IEZQUy4KCklz
IHRoZXJlIHNvbWV0aGluZyBJIGNhbiBkbyB0byBydWxlIG91dCBhIG1vbml0b3IgaXNzdWU/IFBl
cmhhcHMgYnkgc2V0dGluZwpzb21lIGtpbmQgb2YgZGVidWcgb3B0aW9uIHRvIHNlZSB3aGF0IHRo
ZSBkcml2ZXIgaXMgaW5zdHJ1Y3RpbmcgdGhlIG1vbml0b3IgdG8KZG8/CgotLSAKWW91IGFyZSBy
ZWNlaXZpbmcgdGhpcyBtYWlsIGJlY2F1c2U6CllvdSBhcmUgd2F0Y2hpbmcgdGhlIGFzc2lnbmVl
IG9mIHRoZSBidWcuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
