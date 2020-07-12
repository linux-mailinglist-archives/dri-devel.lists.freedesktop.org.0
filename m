Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC0321C7A1
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jul 2020 07:20:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 734CC6E42B;
	Sun, 12 Jul 2020 05:20:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4CF36E42B
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jul 2020 05:20:48 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 207383] [Regression] 5.7 amdgpu/polaris11 gpf:
 amdgpu_atomic_commit_tail
Date: Sun, 12 Jul 2020 05:20:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: chancuan66@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-207383-2300-xZUiy0Yi9e@https.bugzilla.kernel.org/>
In-Reply-To: <bug-207383-2300@https.bugzilla.kernel.org/>
References: <bug-207383-2300@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDczODMKCi0tLSBD
b21tZW50ICM1OSBmcm9tIGNoYW5jdWFuNjZAZ21haWwuY29tIC0tLQooSW4gcmVwbHkgdG8gUGF1
bCBNZW56ZWwgZnJvbSBjb21tZW50ICM1NCkKPiAoSW4gcmVwbHkgdG8gU3RyYXRvcyBab2xvdGFz
IGZyb20gY29tbWVudCAjNTMpCj4gCj4gPiBEb24ndCBrbm93IGlmIGl0IGhlbHBzLiBJJ20gZ2V0
dGluZyBhIHNpbWlsYXIgaXNzdWUgb24gT3BlbnN1c2UgVHVtYmxld2VlZAo+ID4gd2l0aCBrZXJu
ZWwgNS43LjcuIFJldmVydGluZyB0byBrZXJuZWwgNS43LjUgbWFrZXMgdGhpbmdzIHN0YWJsZSBm
b3IgbWUuIE15Cj4gPiBHUFUgaXMgUlg1ODAuCj4gCj4gW+KApl0KPiAKPiBUaGFuayB5b3UgZm9y
IHlvdXIgcmVwb3J0LiBIb3cgcXVpY2tseSBjYW4geW91IHJlcHJvZHVjZSBpdD8gSWYgeW91IGNv
dWxkCj4gYmlzZWN0IHRoZSBpc3N1ZSB0byBwaW5wb2ludCB0aGUgY3VscHJpdCBjb21taXQgYmV0
d2VlbiA1LjcuNSBhbmQgNS43LjcsCj4gdGhhdOKAmWQgYmUgZ3JlYXQuIE1heWJlIG9wZW4gZXZl
biBhIHNlcGFyYXRlIGJ1ZyByZXBvcnQsIGluIGNhc2UgdGhleSBhcmUKPiB1bnJlbGF0ZWQuIFRo
ZXkgY2FuIGFsd2F5cyBiZSBtYXJrZWQgYXMgZHVwbGljYXRlcyBsYXRlci4KCkkgYW0gcnVubmlu
ZyB0aGUgc2FtZSBzZXR1cCBhcyB0aGUgY29tbWVudC4gUlggNTgwLCBUdW1ibGV3ZWVkLCBoYXZl
IGJvdGgKa2VybmVscyA1LjcuNSBhbmQgNS43LjcuIE9uIDUuNy43LCBpdCBoYXBwZW5zIGFsbW9z
dCBpbW1lZGlhdGVseSBhZnRlciBsb2dpbi4KSG93ZXZlciwgcmV2ZXJ0aW5nIHRvIDUuNy41IGRv
ZXMgTk9UIHN0YWJpbGlzZSwgYW5kIHRoZSBzYW1lIHByb2JsZW0gYXJpc2VzCnNvbWV3aGVyZSBi
ZXR3ZWVuIDEgdG8gMTAgbWludXRlcy4KCkkgZGlkbid0IGhhdmUgdGhpcyBpc3N1ZSBwcmlvciB0
byBpbnN0YWxsaW5nIHRoZSA1LjcuNyBrZXJuZWwgdGhvdWdoLi4uCgotLSAKWW91IGFyZSByZWNl
aXZpbmcgdGhpcyBtYWlsIGJlY2F1c2U6CllvdSBhcmUgd2F0Y2hpbmcgdGhlIGFzc2lnbmVlIG9m
IHRoZSBidWcuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
