Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8976598321
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 20:36:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAF266E962;
	Wed, 21 Aug 2019 18:36:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B2736E962
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 18:36:31 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204181] NULL pointer dereference regression in amdgpu
Date: Wed, 21 Aug 2019 18:36:30 +0000
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
Message-ID: <bug-204181-2300-TiEB9e6dkJ@https.bugzilla.kernel.org/>
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
b21tZW50ICMzOCBmcm9tIFNlcmdleSBLb25kYWtvdiAodmlydHVvdXNmb3hAZ21haWwuY29tKSAt
LS0KKEluIHJlcGx5IHRvIEFsZXggRGV1Y2hlciBmcm9tIGNvbW1lbnQgIzM3KQo+IChJbiByZXBs
eSB0byBTZXJnZXkgS29uZGFrb3YgZnJvbSBjb21tZW50ICMzNCkKPiA+IEJ5IHRoZSB3YXksIGlz
IHRoZXJlIGFueSBkaXNhZHZhbnRhZ2UgaW4gZm9yY2luZyBUZWFyRnJlZSB0byBiZSBhbHdheXMg
b24KPiA+IHdoZW4gaXQgd29ya3MgPyBMaWtlIGFkZGl0aW9uYWwgZnJhbWUgb2YgbGF0ZW5jeSBv
ciBzb21ldGhpbmcgbGlrZSB0aGF0ID8KPiAKPiBUaGUgVGVhckZyZWUgb3B0aW9uIGlzIHRoZXJl
IHRvIGRlYWwgd2l0aCBjb21wb3NpdG9ycyB0aGF0IGRvIG5vdCBzdXBwb3J0Cj4gc3luYyB0byB2
YmxhbmsuIFRoZSBkZHggYWxsb2NhdGVzIGFub3RoZXIgZnJvbnQgYnVmZmVyIGFuZCB0aGVuIHRo
YXQgYnVmZmVyCj4gaXMgdXBkYXRlZCBzeW5jaHJvbml6ZWQgd2l0aCB2Ymxhbmsgd2l0aCB0aGUg
ZGF0YSBmcm9tIHRoZSByZWFsIGZyb250Cj4gYnVmZmVyLiAgU28gaXQgdXNlcyBhbiBhZGRpdGlv
bmFsIGJ1ZmZlci4KClRoYW5rcyAhIEl0J3MgYSBzaGFtZSwgSSd2ZSBhbHJlYWR5IGJlZ3VuIGJl
bGlldmluZyBpbiAiVGhlIFNpbHZlciBCdWxsZXQgb2YKVlN5bmMiLiBBbmQgaXQncyBjb21wbGV0
ZWx5ICJzb2Z0d2FyZSIgR1BVLWFnbm9zdGljIGZ1bmN0aW9uLCBzbyBhbHRlcm5hdGl2ZXMKbGlr
ZSBXYXlsYW5kIHdvdWxkIGhhdmUgdG8ganVzdCByZWltcGxlbWVudCBpdCB0aGUgc2FtZSB3YXkg
PyBJdCBhbHdheXMgYWRkcyBhCmJ1ZmZlciBvciAic21hcnQtZW5vdWdoIiBjb21wb3NpdG9yIGNh
biBvcHQtb3V0ID8gT3IgInRoZSBjb3JyZWN0IGZpeCBmb3IKbGF0ZW5jeSIgd2l0aCBURiBpcyBk
aXNhYmxpbmcgdnN5bmMgZXZlcnl3aGVyZSAoc3VjaCBhcyBrd2luJ3MKR0xQcmVmZXJCdWZmZXJT
d2FwPW4pIGVsc2UgYW5kIGxldCBpdCBoYW5kbGUgaXQgPwoKTm8gbWF0dGVyIGhvdyBJIHByZXZp
b3VzbHkgdHJpZWQsIG5vdGhpbmcgb3RoZXIgdGhhbiBUZWFyRnJlZSBndWFyYW50ZWVkIGFjdHVh
bApsYWNrIG9mIHRlYXJpbmcgaW4gYWxsIHRpbWVzIGluIHNpbXBsZSAyeDEwODBwIGNvbmZpZ3Vy
YXRpb24gYnV0IHRoZXJlIGlzCmFidW5kYW5jZSBvZiBidWZmZXJpbmcgYXMgaXQgaXMgaW4gYXBw
cyBhbmQgYSBjb21wb3NpdG9yICsgbGF0ZW5jeSBvZiBMQ0QKZGlzcGxheXMuIEknbSBzdXJlLCB5
b3UncmUgYXdhcmUgb2YKaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3hvcmcveHNlcnZl
ci9pc3N1ZXMvMjQ0IHRvby4gU3RyYW5nZSB0aGF0ICJ0aGUKbWFnaWMiIG9mIFRGIGlzbid0IGRv
bmUgZGlyZWN0bHkgaW4gY29tcG9zaXRvcnMgb3Iga2VybmVsIHRoZW4uCgotLSAKWW91IGFyZSBy
ZWNlaXZpbmcgdGhpcyBtYWlsIGJlY2F1c2U6CllvdSBhcmUgd2F0Y2hpbmcgdGhlIGFzc2lnbmVl
IG9mIHRoZSBidWcuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
