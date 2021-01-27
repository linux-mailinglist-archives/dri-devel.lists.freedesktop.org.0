Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C945D305FDA
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jan 2021 16:41:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14BF46E832;
	Wed, 27 Jan 2021 15:41:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FAF76E832
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 15:41:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id B9B8C64D9C
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 15:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611762107;
 bh=jSLlrfoTTKc4IVFcpYrA1uPRMwwOtHKaxj5nS89am/M=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=k11cminR+DmLQow3wGMEyj4Pgiux7qZ36nwHNC0grTfTDFtto1YkkuEUlWP6Cv086
 27QilxXWfMxhNlYkLv8L7SYCla3kVDUoWKKQnxj5jfKYkZzSzmgTECzq3xL+dJyhFQ
 xvgHLqystokQrJF4kNhPRw11t8f576tVQ6RjBRChtxbjOqsxQZtKi905lhCof4Q7i5
 ngbxvrDhwGW2VohpQJpMrRoHMz8nEynFOwN5KiS0qUBSlU7ZmQr5oB4SxC9HPQvlMZ
 dW/Gbjnak4ABapJwNyf0boCipUA23JY2o8l0sG6zOMWIcUGsBXVzzOYJ+gwZTONLIw
 GjXaa4cFqymeA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id A2F2061499; Wed, 27 Jan 2021 15:41:47 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211349] IB test failed on sdma0 ! AMDGPU driver for Raven APU
 (ryzen 2400G) hangs!
Date: Wed, 27 Jan 2021 15:41:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bolando@163.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211349-2300-b2N9FiXnud@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211349-2300@https.bugzilla.kernel.org/>
References: <bug-211349-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMTEzNDkKCi0tLSBD
b21tZW50ICMxNyBmcm9tIGJvbGFuZG9AMTYzLmNvbSAtLS0KKEluIHJlcGx5IHRvIEFsZXggRGV1
Y2hlciBmcm9tIGNvbW1lbnQgIzE2KQo+IChJbiByZXBseSB0byBib2xhbmRvIGZyb20gY29tbWVu
dCAjMTUpCj4gPiAoSW4gcmVwbHkgdG8gTWljaGVsIETDpG56ZXIgZnJvbSBjb21tZW50ICMxNCkK
PiA+ID4gPiBJZiBlbmFibGUgNjRiaXQga2VybmVsIHN1cHBvcnQsSSBuZWVkIHRvIHJlY29tcGls
ZSBldmVyeXRoaW5nIG9uCj4gTEZTMTAuMAo+ID4gaW4KPiA+ID4gPiBuZXh0IHdlZWtzLgo+ID4g
PiAKPiA+ID4gWW91IHNob3VsZG4ndC4gMzItYml0IHVzZXItc3BhY2Ugd29ya3MgZmluZSB3aXRo
IGEgNjQtYml0IGtlcm5lbC4KPiA+IAo+ID4gVGhhbmtzIGZvciByZXBseS5NeSBMRlMtMTAuMCBp
cyBidWlsdCBmb3IgMzJiaXQsSSBjb3VsZG4ndCBzZWxlY3QgNjRiaXQKPiA+IGtlcm5lbCBjb25m
aWcgd2hlbiByZWNvbXBpbGUgdGhlIExpbnV4IGtlcm5lbC5Pbmx5IDMyYml0IGtlcm5lbCBjb3Vs
ZAo+ID4gYnVpbGQuSSByZWFsbHkgd2FudCB0byBrbm93IHRoYXQgdGhlIDMyYml0IGFyY2ggd29u
J3QgYmUgc3VwcG9ydGVkIGJ5Cj4gQU1ER1BVCj4gPiBkcml2ZXJzIGZyb20gbm93IG9uPwo+IAo+
IEFuZWNkb3RhbGx5IGl0IHdvcmtzIGZvciBzb21lIHBlb3BsZS4gIEl0IG1heSBkZXBlbmQgb24g
dGhlIHBsYXRmb3JtIGFuZAo+IGRldmljZS4KR29kIGZyb20gQU1ER1BVIGRyaXZlcnMgZGV2ZWxv
cG1lbnQgdGVhbT9JIGhhdmUgcmV2aWV3ZWQgdGhlIDUuMTAuMTEga2VybmVsCmNoYW5nZWxvZyBh
bmQgZm91bmQgeW91ciBuYW1lIQpBbmVjZG90YWxseSB3b3JrZWQgb24gMzJiaXQgc3lzdGVtID9J
dCBzZWVtcyBhIGZldyBvZiAgcGVvcGxlIHVzZSB0aGUgMzJiaXQKc3lzdGVtcyAuVGhlIExGUyBi
b29rIGRvbid0IHJlY29tbWVuZCBidWlsZCB4ODZfNjQgc3lzdGVtLHNvIEkgYnVpbHQgMzJiaXQK
c3lzdGVtLiBUaGUgbmV3ZXIga2VybmVsIGRvZXMgd29yayBiZXR0ZXIgb24gQU1ER1BVIGRyaXZl
cixtYXliZSBvbiBvbmUgZGF5LEkKY2FuIHVzZSBSYXZlbiBBUFUgd2l0aCBuZXcgTGludXgga2Vy
bmVsIGV4cGVjdGFudGx5IVRoYW5rcyBhIGxvdCEKCi0tIApZb3UgbWF5IHJlcGx5IHRvIHRoaXMg
ZW1haWwgdG8gYWRkIGEgY29tbWVudC4KCllvdSBhcmUgcmVjZWl2aW5nIHRoaXMgbWFpbCBiZWNh
dXNlOgpZb3UgYXJlIHdhdGNoaW5nIHRoZSBhc3NpZ25lZSBvZiB0aGUgYnVnLgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
