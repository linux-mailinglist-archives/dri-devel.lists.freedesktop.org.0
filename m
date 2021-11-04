Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE8C445379
	for <lists+dri-devel@lfdr.de>; Thu,  4 Nov 2021 14:02:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 571DC6F4DC;
	Thu,  4 Nov 2021 13:02:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C13B6F4DC
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Nov 2021 13:02:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id E068F6120E
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Nov 2021 13:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636030936;
 bh=0N3PoSH9KxI9uDHvNVeoA4Pc22joWk/lkDm1SEsLK00=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=qZsVXhucpVgc1QlzU80cGy0p2p4LZiiCuSbGVRX1i+K1P52DOKNbAdGh/z5cGddBe
 e7Wc+c9by10wkvoUgByUUvaMZcB5h9qbx6XL/ZVAxrFcCZ+CZqxuueon1Zmia9hzIj
 ARTFNX9SNiWKOhMQPMzVbhoawvp7TZ8Wh3cqgCdCBNp+0Qrb9SROCKTDwMCuOFUqPt
 kgaCcTdMKK3s1L0limykY9VMTdWoJmaXAcIbcPkknmEjgtk5tuKl3eRVGiAcngWAEK
 yHmVHqqAJb0NRSIHl8oM4Z+K6+ejms74LolWuWY2OZrUcLDM1GBFqRjrPX/X1SdK5D
 JrWbMw08n54OA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id DD21561130; Thu,  4 Nov 2021 13:02:16 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214621] WARNING: CPU: 3 PID: 521 at
 drivers/gpu/drm/ttm/ttm_bo.c:409 ttm_bo_release+0xb64/0xe40 [ttm]
Date: Thu, 04 Nov 2021 13:02:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214621-2300-bJV80mSP7n@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214621-2300@https.bugzilla.kernel.org/>
References: <bug-214621-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214621

--- Comment #14 from Erhard F. (erhard_f@mailbox.org) ---
(In reply to Lang Yu from comment #12)
> The warning was just merged into mainline 5.15.0 on Tue Nov 2 16:47:49
> 2021(commit 56d33754481f). Not sure Erhard F.'s build contains this warni=
ng.
I applied your patch on top of v5.15 after its' release which was 2021-10-31
not on git master.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
