Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CCD115E47
	for <lists+dri-devel@lfdr.de>; Sat,  7 Dec 2019 20:48:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D8A66E128;
	Sat,  7 Dec 2019 19:48:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5DB06E128
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Dec 2019 19:48:10 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201539] AMDGPU R9 390 automatic fan speed control in Linux
 4.19/4.20/5.0
Date: Sat, 07 Dec 2019 19:48:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rmuncrief@humanavance.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-201539-2300-X5aWHTe0qS@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201539-2300@https.bugzilla.kernel.org/>
References: <bug-201539-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDE1MzkKCi0tLSBD
b21tZW50ICM0NSBmcm9tIG11bmNyaWVmIChybXVuY3JpZWZAaHVtYW5hdmFuY2UuY29tKSAtLS0K
KEluIHJlcGx5IHRvIE1hc3RlckNBVFogZnJvbSBjb21tZW50ICM0MykKPiB0aGUgZmlsZSBpcyBj
b3JyZWN0IC4uIGFuZCB5b3UgY2FuIHRlbGwgdGhhdCBiZWNhdXNlIGl0cyByZWFkaW5nIHRoZSB0
ZW1wCj4gImN1cnJlbnQgcHdtOiA3NiIKPiAKPiBlcnJvciBpcyBiZWNhdXNlIE5PVEhJTkcgaXMg
YmVpbmcgYWxsb3dlZCB0byBlZGl0IHB3bTFfZW5hYmxlIGl0IGlzIHN0dWNrIG9uCj4gYXV0byBz
byBub3RoaW5nIGNhbiBtYW51YWxseSBjaGFuZ2UgcHdtMQo+IAo+IAo+IAo+IGJ1dCBpZiB0aGVp
ciBpcyBhbiBlcnJvciBpbiBteSBhZGp1c3RtZW50cyBsZXQgbWUga25vdyAKPiAKPiAKPiAjIGh3
bW9uIHBhdGhzLCBoYXJkY29kZWQgZm9yIG9uZSBhbWRncHUgY2FyZCwgYWRqdXN0IGFzIG5lZWRl
ZAo+IEhXTU9OPSQobHMgL3N5cy9jbGFzcy9kcm0vY2FyZDEvZGV2aWNlL2h3bW9uL2h3bW9uMSkK
PiBGSUxFX1BXTT0kKGVjaG8gL3N5cy9jbGFzcy9kcm0vY2FyZDEvZGV2aWNlL2h3bW9uL2h3bW9u
MS9wd20xKQo+IEZJTEVfRkFOTU9ERT0kKGVjaG8gL3N5cy9jbGFzcy9kcm0vY2FyZDEvZGV2aWNl
L2h3bW9uL2h3bW9uMS9wd20xX2VuYWJsZSkKPiBGSUxFX1RFTVA9JChlY2hvIC9zeXMvY2xhc3Mv
ZHJtL2NhcmQxL2RldmljZS9od21vbi9od21vbjEvdGVtcDFfaW5wdXQpCgpZb3VyIHZhcmlhYmxl
cyBhcmUgc2V0IHdyb25nLiBJZiB5b3VyIEdQVSBpcyBjYXJkMSB0aGV5IHNob3VsZCBiZToKCkhX
TU9OPSQobHMgL3N5cy9jbGFzcy9kcm0vY2FyZDEvZGV2aWNlL2h3bW9uKQpGSUxFX1BXTT0kKGVj
aG8gL3N5cy9jbGFzcy9kcm0vY2FyZDEvZGV2aWNlL2h3bW9uLyRIV01PTi9wd20xKQpGSUxFX0ZB
Tk1PREU9JChlY2hvIC9zeXMvY2xhc3MvZHJtL2NhcmQxL2RldmljZS9od21vbi8kSFdNT04vcHdt
MV9lbmFibGUpCkZJTEVfVEVNUD0kKGVjaG8gL3N5cy9jbGFzcy9kcm0vY2FyZDEvZGV2aWNlL2h3
bW9uLyRIV01PTi90ZW1wMV9pbnB1dCkKCgpUaGUgIkhXTU9OIiB2YXJpYWJsZSBpcyB0aGVyZSB0
byBkZXRlcm1pbmUgd2hpY2ggYWN0dWFsIGhhcmR3YXJlIG1vbml0b3IgaXMKYmVpbmcgdXNlZCBi
ZWNhdXNlIGl0IGNhbiBjaGFuZ2Ugd2hlbmV2ZXIgeW91IGJvb3QuIE9uZSB0aW1lIGl0IGNvdWxk
IGJlCmh3bW9uMSwgdGhlIG5leHQgdGltZSBod21vbjMsIGV0Yy4gU28geW91IGNhbid0IGhhcmQt
Y29kZSBpdCBhcyB5b3UncmUgZG9pbmcuCllvdSBoYXZlIHRvIHVzZSB0aGUgJEhXTU9OIHZhcmlh
YmxlIHRvIHNldCBGSUxFX1BXTSwgRklMRV9GQU5NT0RFLCBhbmQKRklMRV9URU1QLgoKLS0gCllv
dSBhcmUgcmVjZWl2aW5nIHRoaXMgbWFpbCBiZWNhdXNlOgpZb3UgYXJlIHdhdGNoaW5nIHRoZSBh
c3NpZ25lZSBvZiB0aGUgYnVnLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
