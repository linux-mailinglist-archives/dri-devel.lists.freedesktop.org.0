Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F45F68A35
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2019 15:08:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 158AD89830;
	Mon, 15 Jul 2019 13:07:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.wl.linuxfoundation.org (mail.wl.linuxfoundation.org
 [198.145.29.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77A1C89830
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 13:07:56 +0000 (UTC)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id 2D98E283BB
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 13:07:56 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id 21D4C2842D; Mon, 15 Jul 2019 13:07:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=unavailable version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204181] NULL pointer dereference regression in amdgpu
Date: Mon, 15 Jul 2019 13:07:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: nicholas.kazlauskas@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-204181-2300-xd1Os6ELek@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204181-2300@https.bugzilla.kernel.org/>
References: <bug-204181-2300@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQxODEKCk5pY2hv
bGFzIEthemxhdXNrYXMgKG5pY2hvbGFzLmthemxhdXNrYXNAYW1kLmNvbSkgY2hhbmdlZDoKCiAg
ICAgICAgICAgV2hhdCAgICB8UmVtb3ZlZCAgICAgICAgICAgICAgICAgICAgIHxBZGRlZAotLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCiAgICAgICAgICAgICAgICAgQ0N8ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHxuaWNob2xhcy5rYXpsYXVza2FzQGFtZC5jb20KCi0tLSBDb21tZW50ICMxIGZyb20g
TmljaG9sYXMgS2F6bGF1c2thcyAobmljaG9sYXMua2F6bGF1c2thc0BhbWQuY29tKSAtLS0KRG8g
eW91IG1pbmQgcG9zdGluZyBhbiBkbWVzZyBsb2cgd2l0aCBkcm09ZGVidWc9NCBhcyBwYXJ0IG9m
IHlvdXIgYm9vdApwYXJhbWV0ZXJzPwoKQW4geG9yZyBsb2cgd291bGQgYmUgZ29vZCB0b28gaWYg
YXBwbGljYWJsZS4KCkknbSBjdXJpb3VzIHRvIGtub3cgd2hhdCB0aGUgYWN0dWFsIHNlcXVlbmNl
IC8gc3lzdGVtIHNldHVwIGlzIGZvciByZXByb2R1Y2luZwp0aGlzIGFzIHRoaXMgaXNuJ3QgcmVh
bGx5IGEgdHlwaWNhbCBzZXF1ZW5jZS4gSSB0aGluayB5b3UnZCBydW4gaW50byBvdGhlciBOVUxM
CnBvaW50ZXIgZGVyZWZlcmVuY2VzIGV2ZW4gaWYgdGhpcyBvbmUgaXMgZ3VhcmRlZC4KCkkgdGhp
bmsgdGhlIHN0cmVhbSBpdHNlbGYgaXMgTlVMTCBhbmQgaXQgc2hvdWxkbid0IGJlIGluIHRoZSBj
b250ZXh0LgoKLS0gCllvdSBhcmUgcmVjZWl2aW5nIHRoaXMgbWFpbCBiZWNhdXNlOgpZb3UgYXJl
IHdhdGNoaW5nIHRoZSBhc3NpZ25lZSBvZiB0aGUgYnVnLgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
