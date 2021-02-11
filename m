Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FF4319264
	for <lists+dri-devel@lfdr.de>; Thu, 11 Feb 2021 19:36:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1C6E6EE63;
	Thu, 11 Feb 2021 18:36:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E00376EE63
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Feb 2021 18:36:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 9C72C64E6F
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Feb 2021 18:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613068602;
 bh=WNTDOGm1yfKlmu33lYWi6NKb4CiJ5OSAoPcJXApIQAY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=A9T9OQcA2k633CtgwkjVzwcup74YRmdtXz2MnLoLZQ6vW2RI3133GvTuQDFsYE1EE
 KYHCiXre//a5UdkjgLJL4+aokCN6nt4EnMXRFFbbP58Vs9K+awDDAREaiF//cocG4S
 kpyZhc/XkP5d6gwYCwaEaHX5Vl3J0Co6W9A7PUoMG+B40w70Yt5x7p1bsyvJleZj1s
 TFtQOc2vunxFfv1HJjBbK5nQS+H/VeAOriCqTb7npYjvSBbtpZevF8t9e+WmXBtxaD
 8fDzIxTmoB+/IX0M0ccGTMJYjO0gNzQmheYZPl3pLYZQ3c+Q2wD5zJsQVk3ga0BY5B
 3kPOH7DJRqMkg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 98259613D8; Thu, 11 Feb 2021 18:36:42 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 206987] [drm] [amdgpu] Whole system crashes when the driver is
 in mode_support_and_system_configuration
Date: Thu, 11 Feb 2021 18:36:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: jan.kokemueller@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-206987-2300-MPnLDMbVIS@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206987-2300@https.bugzilla.kernel.org/>
References: <bug-206987-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDY5ODcKCi0tLSBD
b21tZW50ICM0MSBmcm9tIEphbiBLb2tlbcO8bGxlciAoamFuLmtva2VtdWVsbGVyQGdtYWlsLmNv
bSkgLS0tCj4gTG9va3MgY29ycmVjdC4gIENhcmUgdG8gc2VuZCBvdXQgYSBwcm9wZXIgZ2l0IHBh
dGNoPwoKVGhhbmsgeW91IGZvciBoYXZpbmcgYSBsb29rIGF0IHRoZSBwYXRjaCEgSSd2ZSBzZW50
IGl0IHRvIHRoZSBhbWQtZ2Z4IGxpc3QuCgotLSAKWW91IG1heSByZXBseSB0byB0aGlzIGVtYWls
IHRvIGFkZCBhIGNvbW1lbnQuCgpZb3UgYXJlIHJlY2VpdmluZyB0aGlzIG1haWwgYmVjYXVzZToK
WW91IGFyZSB3YXRjaGluZyB0aGUgYXNzaWduZWUgb2YgdGhlIGJ1Zy4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
