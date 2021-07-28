Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 012AC3D95D3
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 21:03:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38FA66E570;
	Wed, 28 Jul 2021 19:03:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 784A16E570
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 19:03:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 6D77D61055
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 19:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627499008;
 bh=VDYtpZRLg/hQG31Q8CgvqmoedkudfgIBvaQWkcZFsM8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=cMGGcI6wL1NduR93U9K+PO9ITi+2NVcUHf0nTetyBMcr1eknYxuGoMmTtV1y201n8
 A9kOEb/ENkpPL4HHLl53Tz2AN0fB6sDIve+5ERFuu4nhqK3WL0OwBYgWpoA18A3aTo
 ixmUaKqcnpqcKjSpjZZxGUGVkowqtNAemEv5XS9+7BnhwWhf8aEYleTSMyPzyzxlq9
 WtXCRnHi8y+N3bXQfboLsHkHg6CRp0bYp/GXkBHoUEATlhERNZDdwrIC/pmx8JPsvf
 1x+B3Xl3H3g2supTQxp0i8/F4WVq131RUMDyfQFJ8C68AnswaYH6MXpTsk/o8xCRhI
 b7bYnADAA6mcQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 6A41E60EBE; Wed, 28 Jul 2021 19:03:28 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205089] amdgpu : drm:amdgpu_cs_ioctl : Failed to initialize
 parser -125
Date: Wed, 28 Jul 2021 19:03:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: info@aloisnespor.info
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-205089-2300-Vr3g1CXvyd@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205089-2300@https.bugzilla.kernel.org/>
References: <bug-205089-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D205089

Alois Nespor (info@aloisnespor.info) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |info@aloisnespor.info

--- Comment #15 from Alois Nespor (info@aloisnespor.info) ---
i can confirm, have same problem now with Ryzen 5 3400G (RX Vega 11).

kernel 5.13.4 and mesa 21.1.5

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
