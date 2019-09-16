Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FACB3D0E
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2019 17:02:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A51186E293;
	Mon, 16 Sep 2019 15:02:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D9786E293
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2019 15:02:34 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 202445] amdgpu/dc: framerate dropping below adaptive sync range
 causes screen flickering
Date: Mon, 16 Sep 2019 15:02:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: libcg@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-202445-2300-hdSPsQiZnx@https.bugzilla.kernel.org/>
In-Reply-To: <bug-202445-2300@https.bugzilla.kernel.org/>
References: <bug-202445-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDI0NDUKCi0tLSBD
b21tZW50ICMzNiBmcm9tIENsw6ltZW50IEd1w6lyaW4gKGxpYmNnQHByb3Rvbm1haWwuY29tKSAt
LS0KSWYgeW91IGhhdmVuJ3QgdXBkYXRlZCB0byBsaW51eCA1LjIgeWV0LCB5b3Ugc2hvdWxkIGJl
Y2F1c2UgaXQgZml4ZWQgY29uc3RhbnQKZmxpY2tlcmluZyB3aGVuIGluIExGQyBtb2RlLgoKVGhp
cyBhZGRpdGlvbmFsIHBhdGNoIGhlbHBzIHdoZW4gdGhlIG1vbml0b3IgZ29lcyBpbiBhbmQgb3V0
IG9mIExGQyBtb2RlLiBJdCdzCm5vdCBmdWxseSBmaXhlZCwgYnV0IHRoZSBmbGlja2VyaW5nIGlz
IGEgbG90IGxlc3Mgc2V2ZXJlLiBBY2NvcmRpbmcgdG8gdGhlClBob3Jvbml4IGFydGljbGUgaXQg
c2hvdWxkIGluZGVlZCBsYW5kIGluIGxpbnV4IDUuNS4KCldoZW4gY29tcGlsaW5nIGEga2VybmVs
IHlvdSBzaG91bGQgYmUgYWJsZSB0byBpbnN0YWxsIGl0IG5leHQgdG8gdGhlIHJlZ3VsYXIKb25l
IHNvIHlvdSBjYW4ndCBicmVhayB5b3VyIHNldHVwLiBJIHBlcnNvbmFsbHkgdXNlZCB0aGUgbGlu
dXgtbWFpbmxpbmUgcGFja2FnZQpmcm9tIEFVUiBhbmQgYWRkZWQgdGhlIExGQyBwYXRjaCBvbiB0
b3AuCi0tLS0tLS0tIE9yaWdpbmFsIE1lc3NhZ2UgLS0tLS0tLS0KT24gU2VwIDE2LCAyMDE5LCAw
NjoyMiwgd3JvdGU6Cgo+IGh0dHBzOi8vYnVnemlsbGEua2VybmVsLm9yZy9zaG93X2J1Zy5jZ2k/
aWQ9MjAyNDQ1Cj4KPiAtLS0gQ29tbWVudCAjMzQgZnJvbSBqYWFwYnV1cm1hbkBnbWFpbC5jb20g
LS0tCj4gSG93IGJpZyBpcyB0aGUgaW1wcm92ZW1lbnQ/IElzIHRoZSBpc3N1ZSBjb21wbGV0ZWx5
IGdvbmUsIG9yIGlzIGl0IHN0aWxsCj4gdGhlcmU/Cj4gVGhlIEtTUCBleGFtcGxlIGFsc28gcmVs
aWFibHkgdHJpZ2dlcnMgdGhlIGZsaWNrZXJpbmcgZm9yIG1lLCBhbmQgSSBhbSB1c2luZwo+IHRo
ZSBleGFjdCBzYW1lIG1vbml0b3IuCj4KPiBUaGVzZSBMRkMgcGF0Y2hlcyBhcmUgZ29pbmcgdG8g
YmUgaW5jbHVkZWQgaW4gdGhlIDUuNSBrZXJuZWwsIHJpZ2h0PyBPciB3aWxsCj4gdGhleSBiZSBp
bmNsdWRlZCBpbiBhbiBlYXJsaWVyIGtlcm5lbCB2ZXJzaW9uPwo+Cj4gLS0KPiBZb3UgYXJlIHJl
Y2VpdmluZyB0aGlzIG1haWwgYmVjYXVzZToKPiBZb3UgcmVwb3J0ZWQgdGhlIGJ1Zy4KCi0tIApZ
b3UgYXJlIHJlY2VpdmluZyB0aGlzIG1haWwgYmVjYXVzZToKWW91IGFyZSB3YXRjaGluZyB0aGUg
YXNzaWduZWUgb2YgdGhlIGJ1Zy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
