Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 799DE358CA0
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 20:31:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 113B26E2D1;
	Thu,  8 Apr 2021 18:31:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC2116E2D1
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Apr 2021 18:31:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id EB36D61151
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Apr 2021 18:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617906670;
 bh=WkfgsERcHkXFHT1gwPmZGMlZzCeRvPU9ZL7heCxMKzY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=W5Lwck8Q7cfnAlxlCW5PfpDjk+rgeOO+/I51nRokocH/nuFZ22Djew8uafVA/7Wu+
 8xtLLFz5oakMgxyLz3NvXjLo0rq6ytshca6kkIuqGeIXXe1dt+dFiNA8zVos8rN4bQ
 j4kGPhd5PkcYaSyr+z5MjVla5gUnOptlnLENsjIVj3OUnrn0KqY4Q8A5i1LO/PE5jw
 vJqvu2ZuKE32tN85PS60OcTpA+KwSdnn0UnIYe/YRXhcwcj2YIcLqsfLP9759HOWIL
 OzyKFvLJdM7TGNv5DFTuPy0wav2xih8iqwzfKV+tzQ/7WcMlR4Au/6s2u+Xx1mgvF0
 ls/IG1CbSUlNA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id E286161131; Thu,  8 Apr 2021 18:31:09 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212077] AMD GPU discrete card memory at highest frequency even
 while not in use
Date: Thu, 08 Apr 2021 18:31:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: bat_malin@abv.bg
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-212077-2300-eqkhm6jHBG@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212077-2300@https.bugzilla.kernel.org/>
References: <bug-212077-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMTIwNzcKCi0tLSBD
b21tZW50ICMxNiBmcm9tIEJhdCBNYWxpbiAoYmF0X21hbGluQGFidi5iZykgLS0tCkFmdGVyIHJl
Ym9vdCBldmVuIGJldHRlciAtIAphbWRncHUtcGNpLTAxMDAKQWRhcHRlcjogUENJIGFkYXB0ZXIK
dmRkZ2Z4OiAgICAgIDc1Ni4wMCBtViAKZWRnZTogICAgICAgICArMzUuMMKwQyAgKGNyaXQgPSAr
OTQuMMKwQywgaHlzdCA9IC0yNzMuMcKwQykKcG93ZXIxOiAgICAgICAgNi4yMiBXICAoY2FwID0g
IDYwLjAwIFcpCgotLSAKWW91IG1heSByZXBseSB0byB0aGlzIGVtYWlsIHRvIGFkZCBhIGNvbW1l
bnQuCgpZb3UgYXJlIHJlY2VpdmluZyB0aGlzIG1haWwgYmVjYXVzZToKWW91IGFyZSB3YXRjaGlu
ZyB0aGUgYXNzaWduZWUgb2YgdGhlIGJ1Zy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
