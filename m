Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71441FD1D3
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2019 01:06:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07E9C6F386;
	Fri, 15 Nov 2019 00:06:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 349BE6F386
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2019 00:06:39 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205169] AMDGPU driver with Navi card hangs Xorg in fullscreen
 only.
Date: Fri, 15 Nov 2019 00:06:38 +0000
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
Message-ID: <bug-205169-2300-iZQmapF8Sg@https.bugzilla.kernel.org/>
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
b21tZW50ICMxNyBmcm9tIFNobWVybCAoc2h0ZXRsZGlrQGdtYWlsLmNvbSkgLS0tCihJbiByZXBs
eSB0byBEbWl0cmkgU2VsZXRza2kgZnJvbSBjb21tZW50ICMxNikKPiAoSW4gcmVwbHkgdG8gU2ht
ZXJsIGZyb20gY29tbWVudCAjMTQpCj4gPiBMb29rcyBsaWtlIHRoZSBzYW1lIGlzc3VlIHdpdGgg
UGF0aGZpbmRlcjogS2luZ21ha2VyOgo+ID4gaHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9yZy9z
aG93X2J1Zy5jZ2k/aWQ9MTEyMjY2Cj4gCj4gaW4gbXkgY2FzZSAgaXRzIHdpdGggQUxMIGdhbWVz
LiBwbHMgdHJ5IG90aGVycyBhbmQgcmVwb3J0IGJhY2suCgpJIGRvbid0IGtub3cgd2hpY2ggZ2Ft
ZXMgeW91IG1lYW4uIFNvbWUgb3RoZXJzIHdvcmsgZG9uJ3QgaGFuZyBtZSwgc3VjaCBhcyBJb24K
RnVyeSwgVGhlIEJhcmQncyBUYWxlIElWIGFuZCBldGMuIFlldCBzb21lIG90aGVycyBsaWtlIEhl
ZG9uIGhhbmcgd2l0aApnZnhfMC4wLjAgdGltZW91dCBoYW5nLCBzbyBub3QgdGhlIHNhbWUgYXMg
ZmxpcF9kb25lIHRpbWVkIG91dCBoYW5nLgoKQW55d2F5LCBJJ2xsIHRyeSByZXZlcnRpbmcgdGhh
dCBjb21taXQsIHRvIGNoZWNrIGlmIGl0IGhlbHBzLgoKLS0gCllvdSBhcmUgcmVjZWl2aW5nIHRo
aXMgbWFpbCBiZWNhdXNlOgpZb3UgYXJlIHdhdGNoaW5nIHRoZSBhc3NpZ25lZSBvZiB0aGUgYnVn
LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
