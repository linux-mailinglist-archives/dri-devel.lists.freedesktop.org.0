Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B63143058E9
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jan 2021 11:57:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E24AA6E454;
	Wed, 27 Jan 2021 10:57:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4488389CBE
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 10:57:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id E41D764D7F
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 10:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611745033;
 bh=/dC58jMIQ5FH0Iy9dI5xxUYJ1MntJNdZmwNR7XjcPRE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=F+zNU7osSxvVVsP4Ae0Gd0gzoB54rapkDSJYDJDVf+aBOHArv2XD3LA9O3GRogOeK
 V9pn83NP+64a43aAYEAYhfYPqHJCJy7li0S3ISYWfWxENGtrOKfNeTOOesbE/F25Yx
 UYms/rHf3RHwipDoQ+34Glu0P/emukiUey7IOr1c6VaLB79x374URKGyRiW47JtWYj
 RkNnH7JOR9Z9FqK2z+uA55dx3BIjlftNOAeH7vGFBJO8ZCo23GzXVwWRG1FOV5megB
 gbuKc4pzCLc+kh6BdEq/WX/FLjUjyBuSEBdH//wtdMw0FJ2TbCRoFLjpxkTA8RUy85
 V2k8fInc92dtw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id D51F56529F; Wed, 27 Jan 2021 10:57:13 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211349] IB test failed on sdma0 ! AMDGPU driver for Raven APU
 (ryzen 2400G) hangs!
Date: Wed, 27 Jan 2021 10:57:13 +0000
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
Message-ID: <bug-211349-2300-kymPRFQCKS@https.bugzilla.kernel.org/>
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
b21tZW50ICMxNCBmcm9tIE1pY2hlbCBEw6RuemVyIChtaWNoZWxAZGFlbnplci5uZXQpIC0tLQo+
IElmIGVuYWJsZSA2NGJpdCBrZXJuZWwgc3VwcG9ydCxJIG5lZWQgdG8gcmVjb21waWxlIGV2ZXJ5
dGhpbmcgb24gTEZTMTAuMCBpbgo+IG5leHQgd2Vla3MuCgpZb3Ugc2hvdWxkbid0LiAzMi1iaXQg
dXNlci1zcGFjZSB3b3JrcyBmaW5lIHdpdGggYSA2NC1iaXQga2VybmVsLgoKLS0gCllvdSBtYXkg
cmVwbHkgdG8gdGhpcyBlbWFpbCB0byBhZGQgYSBjb21tZW50LgoKWW91IGFyZSByZWNlaXZpbmcg
dGhpcyBtYWlsIGJlY2F1c2U6CllvdSBhcmUgd2F0Y2hpbmcgdGhlIGFzc2lnbmVlIG9mIHRoZSBi
dWcuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
