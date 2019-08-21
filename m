Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD379845F
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 21:29:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E9A46E17E;
	Wed, 21 Aug 2019 19:28:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF2106E17E
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 19:28:58 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204181] NULL pointer dereference regression in amdgpu
Date: Wed, 21 Aug 2019 19:28:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204181-2300-z0zNrFqA8i@https.bugzilla.kernel.org/>
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
b21tZW50ICMzOSBmcm9tIEFsZXggRGV1Y2hlciAoYWxleGRldWNoZXJAZ21haWwuY29tKSAtLS0K
KEluIHJlcGx5IHRvIFNlcmdleSBLb25kYWtvdiBmcm9tIGNvbW1lbnQgIzM4KQo+IAo+IFRoYW5r
cyAhIEl0J3MgYSBzaGFtZSwgSSd2ZSBhbHJlYWR5IGJlZ3VuIGJlbGlldmluZyBpbiAiVGhlIFNp
bHZlciBCdWxsZXQgb2YKPiBWU3luYyIuIEFuZCBpdCdzIGNvbXBsZXRlbHkgInNvZnR3YXJlIiBH
UFUtYWdub3N0aWMgZnVuY3Rpb24sIHNvCj4gYWx0ZXJuYXRpdmVzIGxpa2UgV2F5bGFuZCB3b3Vs
ZCBoYXZlIHRvIGp1c3QgcmVpbXBsZW1lbnQgaXQgdGhlIHNhbWUgd2F5ID8KPiBJdCBhbHdheXMg
YWRkcyBhIGJ1ZmZlciBvciAic21hcnQtZW5vdWdoIiBjb21wb3NpdG9yIGNhbiBvcHQtb3V0ID8g
T3IgInRoZQo+IGNvcnJlY3QgZml4IGZvciBsYXRlbmN5IiB3aXRoIFRGIGlzIGRpc2FibGluZyB2
c3luYyBldmVyeXdoZXJlIChzdWNoIGFzCj4ga3dpbidzIEdMUHJlZmVyQnVmZmVyU3dhcD1uKSBl
bHNlIGFuZCBsZXQgaXQgaGFuZGxlIGl0ID8KPiAKPiBObyBtYXR0ZXIgaG93IEkgcHJldmlvdXNs
eSB0cmllZCwgbm90aGluZyBvdGhlciB0aGFuIFRlYXJGcmVlIGd1YXJhbnRlZWQKPiBhY3R1YWwg
bGFjayBvZiB0ZWFyaW5nIGluIGFsbCB0aW1lcyBpbiBzaW1wbGUgMngxMDgwcCBjb25maWd1cmF0
aW9uIGJ1dAo+IHRoZXJlIGlzIGFidW5kYW5jZSBvZiBidWZmZXJpbmcgYXMgaXQgaXMgaW4gYXBw
cyBhbmQgYSBjb21wb3NpdG9yICsgbGF0ZW5jeQo+IG9mIExDRCBkaXNwbGF5cy4gSSdtIHN1cmUs
IHlvdSdyZSBhd2FyZSBvZgo+IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy94b3JnL3hz
ZXJ2ZXIvaXNzdWVzLzI0NCB0b28uIFN0cmFuZ2UgdGhhdAo+ICJ0aGUgbWFnaWMiIG9mIFRGIGlz
bid0IGRvbmUgZGlyZWN0bHkgaW4gY29tcG9zaXRvcnMgb3Iga2VybmVsIHRoZW4uCgpIZXJlIGlz
IHlvdXIgaXNzdWU6ICJzaW1wbGUgMngxMDgwcCIKCm11bHRpcGxlIGRpc3BsYXkgYXJlIHJlYWxs
eSBoYXJkIHRvIGRlYWwgd2l0aC4gIFRoZSBkaXNwbGF5IHRpbWluZyBtYXkgYmUKZGlmZmVyZW50
LCB0aGUgYmxhbmtpbmcgcGVyaW9kcyBtYXkgbm90IGFsaWduLCBldGMuICBYIHVzZXMgYSBzaW5n
bGUgc3VyZmFjZQpmb3IgZWFjaCBtdWx0aS1kaXNwbGF5IGRlc2t0b3BzbyB3aGVuIHlvdSBhcmUg
dXBkYXRpbmcgbXVsdGlwbGUgZGlzcGxheXMsIGlmCnRoZSB0aW1pbmdzIGFyZSBub3QgYWxpZ25l
ZCwgb25lIGRpc3BsYXkgd2lsbCBzaG93IG9sZGVyIGNvbnRlbnQuICBGb3IgdGhpcyB0bwp3b3Jr
IHNtb290aGx5LCB5b3UgcmVhbGx5IG5lZWQgdGhlIGNvbXBvc2l0b3IgdG8gaGF2ZSBlYWNoIGRp
c3BsYXkgdXNpbmcgaXQncwpvd24gc2V0IG9mIGJ1ZmZlcnMgYW5kIGRvaW5nIHZzeW5jZWQgcmVu
ZGVyaW5nIHRvIGVhY2ggZGlzcGxheSBzZXBhcmF0ZWx5LgoKLS0gCllvdSBhcmUgcmVjZWl2aW5n
IHRoaXMgbWFpbCBiZWNhdXNlOgpZb3UgYXJlIHdhdGNoaW5nIHRoZSBhc3NpZ25lZSBvZiB0aGUg
YnVnLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
