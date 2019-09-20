Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E55B9085
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 15:19:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69FE76FCF6;
	Fri, 20 Sep 2019 13:19:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A12E76FCF6
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2019 13:19:10 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204181] NULL pointer dereference regression in amdgpu
Date: Fri, 20 Sep 2019 13:19:09 +0000
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
Message-ID: <bug-204181-2300-PAU61G93el@https.bugzilla.kernel.org/>
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
b21tZW50ICM1MCBmcm9tIFNlcmdleSBLb25kYWtvdiAodmlydHVvdXNmb3hAZ21haWwuY29tKSAt
LS0KKEluIHJlcGx5IHRvIENocmlzdG9waGVyIFNub3doaWxsIGZyb20gY29tbWVudCAjNDkpCj4g
UlggNDgwLiBBcHBsaWVkIHBhdGNoLCBoYXZlbid0IGhhZCBhbnkgc3B1cmlvdXMgY3Jhc2hlcyBz
aW5jZS4gVXNpbmcKPiBwYXRjaHNldCBzaW5jZSBrZXJuZWwgNS4yLjE0LCBub3cgdXNpbmcgaXQg
b24gNS4zLiBIYXZlbid0IGhhZCBhbnkKPiBzdXNwZW5kL3dha2UgY3Jhc2hlcyB5ZXQsIGVpdGhl
ciwgYnV0IHRoYXQgbWF5IGJlIHVucmVsYXRlZC4KPiAKPiBXaWxsIGNvbnRpbnVlIGFwcGx5aW5n
IGl0IHRvIHN1Y2Nlc3NpdmUgNS4zIGtlcm5lbHMgdW50aWwgaXQgaXMgb2ZmaWNpYWxseQo+IGJh
Y2twb3J0ZWQsIGFuZCB3aWxsIHJlcG9ydCBpZiB0aGVyZSBhcmUgYW55IGZ1cnRoZXIgY3Jhc2hl
cy4KCkkgYWxzbyBidWlsdCA1LjMgd2l0aCB0aGVzZSBwYXRjaGVzLCBhbG1vc3QganVzdCBhcyBp
dCBjYW1lIG91dDoKaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy82NDUw
NS8KaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy82NDYxNC8KaHR0cHM6
Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy82NTE5Mi8KCk5vIGZhaWxzIG9uIFgx
MSdzIGFtZGdwdSBzbyBmYXIgQlVUIEkndmUgY2hhbmdlZCBib3RoIFRlYXJGcmVlIGFuZAp2bV91
cGRhdGVfbW9kZSBvcHRpb25zIHRvIGRlZmF1bHRzIChidXQgcGNpPWJpZ19yb290X3dpbmRvdyB0
aGF0IG1ha2VzIEJBUj1WUkFNCmlzIHN0aWxsIGFjdGl2ZSksIHNvIGl0IG1heSBiZSBqdXN0IHdv
cmtlZCBhcm91bmQgYW5kIG5vdCBjb21wbGV0ZWx5IGdvbmUsIHdpbGwKdHJ5IHZtX3VwZGF0ZV9t
b2RlPTMgbGF0ZXIuIFdvdWxkIGJlIG5pY2UgdG8gaGF2ZSBzb21lIGNsdWUgYWJvdXQgd2hhdCB2
bV8qCm9wdGlvbnMgYWN0dWFsbHkgZW50YWlsIGZvciBPcGVuQ0wsIGNvbXB1dGUtc2hhZGVyIGFu
ZCBnZW5lcmFsIHJlbmRlcmluZwpwZXJmb3JtYW5jZS4gSSBqdXN0IHNldCB0aGVtIGZvciB3aGF0
ZXZlciwgY29kZSBpbiBhbWRncHVfdm0uYyBnb2VzIGhpZ2ggYWJvdmUKbXkgaGVhZC4KCk1vZGVz
ZXR0aW5nIFgxMSBkcml2ZXIgYmVoYXZlcyB3ZWlyZGx5IGZvciBtZTogZW5hYmxpbmcgUGFnZUZs
aXAgaW4gaXQgc3RpbGwKZ2l2ZXMgbWUgZXJyb3JzIGFuZCBpbiBib3RoIGNhc2VzIGl0IGp1c3Qg
ZHJhd3MgdGhlIGJsYWNrIHNjcmVlbiB3aXRoIG1vdmFibGUKY3Vyc29yIGFib3ZlIGl0IGluc3Rl
YWQgb2Ygc2RkbSBncmVldC1zY3JlZW4uIEJ1dCBhbWRncHUgd29ya3MsIHNvLCBmaW5lLgoKLS0g
CllvdSBhcmUgcmVjZWl2aW5nIHRoaXMgbWFpbCBiZWNhdXNlOgpZb3UgYXJlIHdhdGNoaW5nIHRo
ZSBhc3NpZ25lZSBvZiB0aGUgYnVnLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
