Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7758E3A94C4
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 10:09:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CC356E51D;
	Wed, 16 Jun 2021 08:09:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D8F56E528
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 08:09:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id F3B27613B4
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 08:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623830943;
 bh=rdtnSAHCbtIUiv+2HCEYH+hRdsXt8KINzOyDJr61oMI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=vIJl3Cm5uVnlDqaQ64yrDJ7mdADKOiJjMnCQJ7ZhCvkbF1pXoq9OKjKcsXuJsSnzl
 xydYauyWIaDhri7WLqmxCeYHYmr/mMXPAKUbpqySeypvvJWSksYkv5o/byvUkcpPRD
 2NYHKEQEv+3yV6KkVTOs2kl9Ai4d0YUMPdbUN5IjIbENPHReMICAaP9yYl5+BSQ/ck
 XPwbYCtEabRyPjpskVgwE1xS9amDxU5oi3gq7LfA/Fi1aRm0xAqofpZxqidJbkP/WU
 Pq70B/m0/lwP6XS6I0VYQzWCa4zb0RPbDKkiBwJ/8lUVmPLgu9o8arGbv6d2s6f0/I
 C89v+XGJrlBVg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id E3D616109D; Wed, 16 Jun 2021 08:09:02 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205517] nouveau MMIO read of 00000000 FAULT at 619444
Date: Wed, 16 Jun 2021 08:09:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lee.jones@linaro.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-205517-2300-NUmlBBeo33@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205517-2300@https.bugzilla.kernel.org/>
References: <bug-205517-2300@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=3D205517

Lee Jones (lee.jones@linaro.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |lee.jones@linaro.org

--- Comment #2 from Lee Jones (lee.jones@linaro.org) ---
Did you find a solution Todd?

I'm also struggling with a 619444 fault followed by GUI freeze.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
