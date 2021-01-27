Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCEE930561F
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jan 2021 09:50:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB2E96E5A5;
	Wed, 27 Jan 2021 08:50:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1436F6E5A5
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 08:50:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id BE24264D7C
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 08:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611737436;
 bh=w8l+PNmc0eR1CVlV49FODXW1op7v0x++z4uobVSLX8w=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=p54qJHTceGqBJKywAimmVtukg9vAR1C9Yj793n9vdiaNpkMfxX95jQG21JAnZijv0
 uxmqovAWIcab9Y1XyXsFlG4TOXxooKJyLxCHaUCXMeGhHSD4hZXDWwZuIv/mu752YU
 7MMr8aEVFicpcHfQeVnu/4X16YZUrRSdDFg271uAzBYy4yVDmX442DO8exita47nqs
 czAm4gdpRdCkaoV1QDIOtNkDVgcCyYtLeyf5xx78lNDbTkS4bVaLwTW5Fm9dfBPqpK
 U+Hmg8DbuwivT5sTVo4MTDcv40jIVlike8rurIqSC5rTaQUHct+5XB9Knhkxp9gNLi
 kYjC5VfN0Dojw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id B011861499; Wed, 27 Jan 2021 08:50:36 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211349] IB test failed on sdma0 ! AMDGPU driver for Raven APU
 (ryzen 2400G) hangs!
Date: Wed, 27 Jan 2021 08:50:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michel@daenzer.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211349-2300-TMZiinwmxe@https.bugzilla.kernel.org/>
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
b21tZW50ICMxMiBmcm9tIE1pY2hlbCBEw6RuemVyIChtaWNoZWxAZGFlbnplci5uZXQpIC0tLQpJ
J2QgcmVjb21tZW5kIHJ1bm5pbmcgYSA2NC1iaXQga2VybmVsLCBldmVuIGlmIGFsbCB1c2VyLXNw
YWNlIGlzIDMyLWJpdC4KCi0tIApZb3UgbWF5IHJlcGx5IHRvIHRoaXMgZW1haWwgdG8gYWRkIGEg
Y29tbWVudC4KCllvdSBhcmUgcmVjZWl2aW5nIHRoaXMgbWFpbCBiZWNhdXNlOgpZb3UgYXJlIHdh
dGNoaW5nIHRoZSBhc3NpZ25lZSBvZiB0aGUgYnVnLgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
