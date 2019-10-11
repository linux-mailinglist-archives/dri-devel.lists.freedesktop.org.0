Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A5CD43A1
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 17:02:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A5536EC4C;
	Fri, 11 Oct 2019 15:02:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AE5B6EC4C
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2019 15:02:43 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204683] amdgpu: ring sdma0 timeout
Date: Fri, 11 Oct 2019 15:02:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mh@familie-heinz.name
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204683-2300-TOvID8PqT7@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204683-2300@https.bugzilla.kernel.org/>
References: <bug-204683-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQ2ODMKCi0tLSBD
b21tZW50ICMxMiBmcm9tIE1hdHRoaWFzIEhlaW56IChtaEBmYW1pbGllLWhlaW56Lm5hbWUpIC0t
LQpNeSBsYXN0IHVwZGF0ZSwgYmVjYXVzZSBJIGhhdmUgbm8gd2F5IHRvIGdvIGZvcndhcmQgZnJv
bSBoZXJlIG9uLgoKVGhpcyBidWcgc2VlbXMgdG8gZ28gd2F5IGJhY2sgbG9uZ2VyIHRoYW4gSSBp
bml0aWFsbHkgdGhvdWdodC4gSSdtIGN1cnJlbnRseSBhdAoiZHJtLWZpeGVzLTIwMTgtMDgtMzEi
IGluIGxpbnV4LWRybSBhbmQgaXQncyBhbHJlYWR5IGluIHRoZXJlLCBzbyBpdCdzIHByb2JhYmx5
CnByZXR0eSBvbGQuCgpJIGNhbid0IHVzZSBhbnkgb2xkZXIga2VybmVsLCBiZWNhdXNlIEkgbmVl
ZCBzdGVhbSB0byBydW4gdGhlIGdhbWVzIHRvIHRlc3QKdGhpcy4gQnV0IHN0ZWFtIHdvbnQgd29y
ayB3aXRoIGFueXRoaW5nIG9sZGVyIHRoYW4gNC4xOS4KCkJVVCBJIGZvdW5kIGEgZ2FtZSB0aGF0
IGFsbW9zdCBpbnN0YW50bHkgdHJpZ2dlcnMgdGhpcyBidWcgb24gc3RhcnR1cDoKSW5zdXJnZW5j
eS4gCgpKdXN0IHN0YXJ0IGl0IGFuZCBpZiB0aGF0IGRvZXNuJ3QgdHJpZ2dlciBpdCBpbW1lZGlh
dGVseSwgcXVpdCB0aGUgZ2FtZSBhbmQKc3RhcnQgaXQgYWdhaW4uIEl0IGNhbiB0YWtlIHR3byB0
byB0aHJlZSB0aW1lcywgam9pbmluZyBhIG1hdGNoIGhlbHBzLCB0b28sIGJ1dAppdCB0YWtlcyBs
ZXNzIHRoYW4gNSBtaW51dGVzIGZvciBlYWNoIHRlc3QuCgpTbywgcGxlYXNlIGdvIGFoZWFkIGFu
ZCBmaXggdGhpcyBhbHJlYWR5LCBpdCdzIGFubm95aW5nLgoKLS0gCllvdSBhcmUgcmVjZWl2aW5n
IHRoaXMgbWFpbCBiZWNhdXNlOgpZb3UgYXJlIHdhdGNoaW5nIHRoZSBhc3NpZ25lZSBvZiB0aGUg
YnVnLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
