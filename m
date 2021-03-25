Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55361348A84
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 08:51:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 521636ECCD;
	Thu, 25 Mar 2021 07:51:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4493A6ECCD
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 07:51:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id DECC461A1F
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 07:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616658712;
 bh=oPbOyTgdfkg+5DGowoL/KLUhUxAy3r6cV+OC7Cm6fO0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=jqLKJLOk0ejs6/+nYbu4I1QVXDnMSEzqFfSZRF0mjiWw6J74N5b5ZVcH44F/X1VON
 nZP8I2Pf7+S/9R7rBR+6HoBsfA8JcoVihFXKrQaDTOABhE0Kyvd9t0dcDh74QcY3VJ
 XIEUmk2mAfMZ9HuEWUfi5by7alK5UwKi5tdcj8iQMR/3YvFBw9ITh761XQ1Xb1yfaj
 RoIyj9PWxbtZe8utdP7zuO6j90kMLYi7FQeDL/BIS4ZrjaBZGkUmEz4GgJqiuiupG0
 R+FmW2zBe0avS1L5jO6GGM3EFx5w5tMHUJ7zDKHZAcXwraoOLd3yLcoFyUENTlV9ez
 pmmFu1oB6qkKw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id D739C62AC6; Thu, 25 Mar 2021 07:51:52 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212425] Kernel warning at drivers/gpu/drm/ttm/ttm_bo.c:517
Date: Thu, 25 Mar 2021 07:51:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: christian.koenig@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-212425-2300-nunMGIOAch@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212425-2300@https.bugzilla.kernel.org/>
References: <bug-212425-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMTI0MjUKCi0tLSBD
b21tZW50ICMzIGZyb20gQ2hyaXN0aWFuIEvDtm5pZyAoY2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29t
KSAtLS0KWWVhaCwgQWxleCBpcyByaWdodCB0aGlzIHBhdGNoIHNob3VsZCBoYXZlIG5ldmVyIGJl
ZW4gYmFja3BvcnRlZCBpbiB0aGUgZmlyc3QKcGxhY2UuCgotLSAKWW91IG1heSByZXBseSB0byB0
aGlzIGVtYWlsIHRvIGFkZCBhIGNvbW1lbnQuCgpZb3UgYXJlIHJlY2VpdmluZyB0aGlzIG1haWwg
YmVjYXVzZToKWW91IGFyZSB3YXRjaGluZyB0aGUgYXNzaWduZWUgb2YgdGhlIGJ1Zy4KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
