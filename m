Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9388C332B9F
	for <lists+dri-devel@lfdr.de>; Tue,  9 Mar 2021 17:11:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A6CC89BA9;
	Tue,  9 Mar 2021 16:11:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7CAD89BA9
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Mar 2021 16:11:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id A5AC26518C
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Mar 2021 16:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615306296;
 bh=REo7/Ma8mszvf8oUrLnoTFkUX1AgXAhKJJLfCjLx+Ho=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=D+qh7XFrK3CsL/ZnooiZPVnXpFNmg8E37YIiDzlHlMq/mRsMY6liK9qaL0UzyzNsS
 n/zMgNrwv+B+QuJjmdzbWm0kZm61xpH+C/wFtq+53aU5YibCxcIIG5OFBBuWmsi/RO
 +rcQpIYaRDQRdvGQv+IJppncw8TyDkultRx1jOtK3CJZqXn0M4WpCS3w5hB4KOUIFz
 a8oHlXsR4AEm+wHWRx0Y7SH67f2XQHe4GyrCtVjSKgyJdGtkCW+uTGXTOB7G7Q2Y1t
 ztqjtKBJpEaP33HvycMvngL5NSPaBAoSqmHMQFkPc+JVDUVD3flLmEnCNWGEzJASSZ
 bzlysAIkQg0ZA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 9EE5F6537C; Tue,  9 Mar 2021 16:11:36 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: =?UTF-8?B?W0J1ZyAyMTIxMDddIFRlbXBlcmF0dXJlIGluY3JlYXNlIGJ5IDE1?=
 =?UTF-8?B?wrBDIG9uIHJhZGVvbiBncHU=?=
Date: Tue, 09 Mar 2021 16:11:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: Dieter@nuetzel-hh.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-212107-2300-uncBHmZV3h@https.bugzilla.kernel.org/>
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
b21tZW50ICM3IGZyb20gRGlldGVyIE7DvHR6ZWwgKERpZXRlckBudWV0emVsLWhoLmRlKSAtLS0K
QWRkZW5kdW0gKEBBbGV4KQpNYXliZSB3ZSBjb3VsZCBkbyBzb21ldGluZyBhYm91dCB0aGUgcmVw
b3J0ZWQgZmFuIHNwZWVkLgpaZXJvICgwKSBpZiBzdG9wcGVkLgoKQE1hcnRpbgpZb3UgY2FuIHZl
cmlmeSB0aGUgZmFuIHNwZWVkIChyYWlzZSkgaWYgeW91IHB1dCBsb2FkIG9uIHlvdXIgZ2Z4IGNh
cmQuCgotLSAKWW91IG1heSByZXBseSB0byB0aGlzIGVtYWlsIHRvIGFkZCBhIGNvbW1lbnQuCgpZ
b3UgYXJlIHJlY2VpdmluZyB0aGlzIG1haWwgYmVjYXVzZToKWW91IGFyZSB3YXRjaGluZyB0aGUg
YXNzaWduZWUgb2YgdGhlIGJ1Zy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
