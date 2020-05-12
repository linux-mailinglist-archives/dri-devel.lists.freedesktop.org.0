Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1913E1CF5AC
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 15:26:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DE986E0FB;
	Tue, 12 May 2020 13:26:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF61F6E0FB
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 13:26:32 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 207693] amdgpu: RX 5500 XT boost frequency out of spec
Date: Tue, 12 May 2020 13:26:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: 0xe2.0x9a.0x9b@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-207693-2300-Bu1ZaMcsRw@https.bugzilla.kernel.org/>
In-Reply-To: <bug-207693-2300@https.bugzilla.kernel.org/>
References: <bug-207693-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDc2OTMKCi0tLSBD
b21tZW50ICMyIGZyb20gSmFuIFppYWsgKGh0dHA6Ly9hdG9tLXN5bWJvbC5uZXQpICgweGUyLjB4
OWEuMHg5YkBnbWFpbC5jb20pIC0tLQooSW4gcmVwbHkgdG8gQWxleCBEZXVjaGVyIGZyb20gY29t
bWVudCAjMSkKPiBUaGUgdmJpb3MgZGVmaW5lcyB0aGUgY2xvY2sgZnJlcXVlbmNpZXMgYW5kIG5v
bWluYWwgdm9sdGFnZXMsIG5vdCB0aGUKPiBkcml2ZXIuICBUaGUgdm9sdGFnZSBpcyBjaGFuZ2Vk
IGR5bmFtaWNhbGx5IGF0IHJ1bnRpbWUgYmFzZWQgb24gZnJlcXVlbmN5Cj4gYW5kIHBvd2VyIGFu
ZCBpbmRpdmlkdWFsIGJvYXJkIGxlYWthZ2Ugc28geW91IHdpbGwgc2VlIHNsaWdodCB2YXJpYXRp
b25zIGF0Cj4gcnVudGltZSBkZXBlbmRpbmcgb24gdGhlIGJvYXJkLgoKcGFydGljbGVmaXJlIGZy
b20gVnVsa2FuIGRlbW9zIChodHRwczovL2dpdGh1Yi5jb20vU2FzY2hhV2lsbGVtcy9WdWxrYW4p
IGlzIGFuCmFwcCB3aXRoIGEgcmVsYXRpdmVseSBoaWdoIHBvd2VyIGNvbnN1bXB0aW9uIChoaWdo
ZXIgcG93ZXIgY29uc3VtcHRpb24gdGhhbgpBaWRhNjQgR1BVIHN0YWJpbGl0eSB0ZXN0KS4gT24g
bXkgbWFjaGluZSZkaXNwbGF5IGl0IGhhcyBwZXJmb3JtYW5jZSBvZiBhYm91dAoxMDAwIEZQUyBp
biBhIG1heGltaXplZCB3aW5kb3cuIEkgbGV0IGl0IHJ1biBmb3IgYWJvdXQgMjAgbWludXRlcywg
ZHVyaW5nIHdoaWNoCkkgbWFuaXB1bGF0ZWQgR1BVJ3MgZmFuIHNwZWVkLgoKQWNjb3JkaW5nIHRv
IC91c3IvYmluL3NlbnNvcnMsIHRoZSBHUFUncyBqdW5jdGlvbi9ob3RzcG90IGNyaXRpY2FsIHRl
bXBlcmF0dXJlCmlzIDk5wrBDLiBTbyBJIGxvd2VyZWQgdGhlIGZhbiBSUE0gdG8gbGVzcyB0aGFu
IDEwMDAgaW4gb3JkZXIgdG8gYWNoaWV2ZSBoaWdoZXIKdGVtcGVyYXR1cmVzLiBFdmVuIHdoZW4g
dGhlIGhvdHNwb3QgdGVtcGVyYXR1cmUgd2FzIDEwNcKwQyAoNsKwQyBhYm92ZSBjcml0aWNhbCkK
YW5kIEdQVSBlZGdlIHRlbXBlcmF0dXJlIHdhcyA4NsKwQyBpdCBoYWQgbm8gZWZmZWN0IG9uIHRo
ZSBGUFMgb2YgcGFydGljbGVmaXJlCihzdGlsbCBhYm91dCAxMDAwIEZQUykuCgpyYWRlb250b3Ag
KGh0dHBzOi8vZ2l0aHViLmNvbS9jbGJyL3JhZGVvbnRvcCkgd2FzIHNob3dpbmcgMTg4NU1IeiBh
bGwgdGhlIHRpbWUKZHVyaW5nIHRoZSB0ZXN0aW5nLgoKSW4gc3VtbWFyeSwgSSBhbSB1bmFibGUg
dG8gY29uZmlybSB5b3VyIGNsYWltIHRoYXQgdGhlIEdQVSBpcyBzZWxmLWFkanVzdGluZwppdHMg
dm9sdGFnZSBvciBmcmVxdWVuY3kgaW4gTGludXguCgpJZiB5b3Uga25vdyBhbiBhbHRlcm5hdGl2
ZSBhcHByb2FjaCAob3RoZXIgdGhhbiB0aGUgb25lIGRlc2NyaWJlZCBhYm92ZSkgdG8KdmVyaWZ5
IHRoYXQgdGhlIEdQVSBpcyBkeW5hbWljYWxseSBjaGFuZ2luZyB2b2x0YWdlIGFuZCBmcmVxdWVu
Y3kgaW4gTGludXggZHVlCnRvIHRlbXBlcmF0dXJlcyBhbmQgcG93ZXIgY29uc3VtcHRpb24sIHBs
ZWFzZSBsZXQgbWUga25vdy4KCi0tIApZb3UgYXJlIHJlY2VpdmluZyB0aGlzIG1haWwgYmVjYXVz
ZToKWW91IGFyZSB3YXRjaGluZyB0aGUgYXNzaWduZWUgb2YgdGhlIGJ1Zy4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
