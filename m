Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5D6370AAE
	for <lists+dri-devel@lfdr.de>; Sun,  2 May 2021 09:18:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D0D96E067;
	Sun,  2 May 2021 07:18:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FD576E067
 for <dri-devel@lists.freedesktop.org>; Sun,  2 May 2021 07:18:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id E60B561476
 for <dri-devel@lists.freedesktop.org>; Sun,  2 May 2021 07:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619939902;
 bh=552yRSlrxsvgZZhZxFe7JlrcJcsKzK6b/YWNEFRjWXM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=uZve2pk8vF5eF1HWUr1wjA5Dz0fSp8G+5A4t8HJq5/cBk0yJmZsgqHs6sghuC7V71
 b1NW4HgL6fVekYp3rwowVvOVsL6NzQsnYr9aNQGUBAj1ytYbyqiKI+Fs28TQUYNLQq
 4ScQFI0NvzsyZT09Y0Q0eED334SBgQd3mLQnDSTk+gLoYtXiRRsmFv6fi5YKS7oxiw
 h575Z7SjD5fM3xrSdX5trREsQX0eCIcJ9r2KTQFIh4+UANupMgtLlA1CZe/vV/YMCF
 UKLFOlgqJH4zyaC7rx1nWJB4vl5kN+y6FnI5D+PuYcBp886t2Vgj4Tk8B+n1O0rcrK
 CIJlw1VD+9Jjw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id D7784611BD; Sun,  2 May 2021 07:18:22 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: =?UTF-8?B?W0J1ZyAyMTIxMDddIFRlbXBlcmF0dXJlIGluY3JlYXNlIGJ5IDE1?=
 =?UTF-8?B?wrBDIG9uIHJhZGVvbiBncHU=?=
Date: Sun, 02 May 2021 07:18:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: martin.tk@gmx.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-212107-2300-nowCPPd2yo@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212107-2300@https.bugzilla.kernel.org/>
References: <bug-212107-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMTIxMDcKCi0tLSBD
b21tZW50ICMxMCBmcm9tIE1hcnRpbiAobWFydGluLnRrQGdteC5jb20pIC0tLQooSW4gcmVwbHkg
dG8gTWFydGluIGZyb20gY29tbWVudCAjOSkKPiAKPiBJJ20gcnVubmluZyA1LjExLjE3IGN1cnJl
bnRseSBhbmQgdGVtcGVyYXR1cmUgb24gdGhlIEdQVSBnZXRzIHRvIDcwwrBDIGJ1dAo+IGZhbiBp
cyBhdCBsaWtlIDMwMHJwbS4KPiAKClRoaXMgaXNuJ3QgYWx3YXlzIHJlcHJvZHVjaWJsZS4gSSB0
aG91Z2h0IGl0IG1heSBiZSByZWxhdGVkIHRvIHN1c3BlbmRpbmcgbXkgUEMKYnV0IGluIGxhc3Qg
ZmV3IGRheXMgdGhlIHRlbXBlcmF0dXJlIGlzIGtlcHQgYXJvdW5kIDU1wrBDCgotLSAKWW91IG1h
eSByZXBseSB0byB0aGlzIGVtYWlsIHRvIGFkZCBhIGNvbW1lbnQuCgpZb3UgYXJlIHJlY2Vpdmlu
ZyB0aGlzIG1haWwgYmVjYXVzZToKWW91IGFyZSB3YXRjaGluZyB0aGUgYXNzaWduZWUgb2YgdGhl
IGJ1Zy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
