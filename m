Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66AC9D9E2D
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 00:03:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 588E06E9D8;
	Wed, 16 Oct 2019 22:03:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B66A86E9D2
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 22:03:18 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204241] amdgpu fails to resume from suspend
Date: Wed, 16 Oct 2019 22:03:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andreas.jackisch@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204241-2300-e9TmxiGE82@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204241-2300@https.bugzilla.kernel.org/>
References: <bug-204241-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQyNDEKCi0tLSBD
b21tZW50ICMzNSBmcm9tIEFuZHJlYXMgSmFja2lzY2ggKGFuZHJlYXMuamFja2lzY2hAZ21haWwu
Y29tKSAtLS0KCgooSW4gcmVwbHkgdG8gQWh6byBmcm9tIGNvbW1lbnQgIzM0KQo+IChJbiByZXBs
eSB0byBBbGV4IERldWNoZXIgZnJvbSBjb21tZW50ICMyOSkKPiA+IENyZWF0ZWQgYXR0YWNobWVu
dCAyODU1MDcgW2RldGFpbHNdCj4gPiBwb3NzaWJsZSBmaXggZm9yIHV2ZDYKPiA+IAo+ID4gVGhl
IHNlc3Npb24gaW5mbyBpcyAxMjhLIGFjY29yZGluZyB0byBtZXNhLgo+IAo+IFRoaXMgdmVyc2lv
biBvZiB0aGUgcGF0Y2ggZGlkbid0IGZhaWwgZm9yIDEwMCBzdXNwZW5kL3Jlc3VtZSBjeWNsZXMs
IHNvIEkKPiB0aGluayBpdCBhY3R1YWxseSBmaXhlcyB0aGUgcHJvYmxlbS4KCkkgY2FuIGNvbmZp
cm0gdGhhdCB0aGUgcGF0Y2ggc2VlbXMgdG8gd29yayBPSy4gMzArIHN1c3BlbmQvcmVzdW1lIGN5
Y2xlcyBzbyBmYXIKd2hlcmUgaXQgbm9ybWFsbHkgZmFpbHMgYWZ0ZXIgMTAgY3ljbGVzLgoKLS0g
CllvdSBhcmUgcmVjZWl2aW5nIHRoaXMgbWFpbCBiZWNhdXNlOgpZb3UgYXJlIHdhdGNoaW5nIHRo
ZSBhc3NpZ25lZSBvZiB0aGUgYnVnLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
