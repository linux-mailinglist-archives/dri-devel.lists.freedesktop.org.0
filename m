Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F18108669
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2019 02:39:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF52289DB0;
	Mon, 25 Nov 2019 01:39:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1B5D89DB0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2019 01:39:10 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205169] AMDGPU driver with Navi card hangs Xorg in fullscreen
 only.
Date: Mon, 25 Nov 2019 01:39:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: shtetldik@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-205169-2300-lUAvZo6408@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205169-2300@https.bugzilla.kernel.org/>
References: <bug-205169-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDUxNjkKCi0tLSBD
b21tZW50ICMyNSBmcm9tIFNobWVybCAoc2h0ZXRsZGlrQGdtYWlsLmNvbSkgLS0tCkFsc28sIGV2
ZW4gd2l0aCAxMDAgbXMgdGltZW91dCwgdGhlIGZsaXAgaGFuZyBzdGlsbCBoYXBwZW5zIGp1c3Qg
dmVyeSByYXJlbHkKYW5kIG5vdCBpbiB0aGUgdXN1YWwgc2NlbmFyaW9zIGZvciBtZS4gRm9yIGV4
YW1wbGUgd2hlbiBwbGF5aW5nIFRoZSBXaXRjaGVyIDMKKFdpbmUrZHh2aykgYW5kIG1pbmltaXpp
bmcgdGhlIGdhbWUgV2luZG93LCBvbiBzb21lIHJhcmUgb2NjYXNpb24gdGhhdCBmbGlwCmhhbmcg
b2NjdXJzIGV2ZW4gd2l0aCB0aGUgcGF0Y2guIEkgc3VwcG9zZSBpdCdzIHNvbWV0aGluZyB0byBk
byB3aXRoIEtXaW4gKEkKdXN1YWxseSBrZWVwIGNvbXBvc2l0aW5nIGRpc2FibGVkIHRob3VnaCBp
biB0aG9zZSBjYXNlcykuCgpTbyBtYXkgYmUgMTAwIG1zIHZhbHVlIGlzIG5vdCBhbHdheXMgZW5v
dWdoPwoKLS0gCllvdSBhcmUgcmVjZWl2aW5nIHRoaXMgbWFpbCBiZWNhdXNlOgpZb3UgYXJlIHdh
dGNoaW5nIHRoZSBhc3NpZ25lZSBvZiB0aGUgYnVnLgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
