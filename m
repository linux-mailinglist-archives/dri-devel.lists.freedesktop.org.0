Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2340143C398
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 09:12:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07F4889A59;
	Wed, 27 Oct 2021 07:12:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36F93899AB
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 07:12:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 050AB610EA
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 07:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635318746;
 bh=oAU5+SEin0fXd8NdRoWe4wmNguIAHIlPXZbpp5x4pZw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=cKZE8FqHHNwG9Yf+zH725rhEJDkVTY22YkIqKaxrNpaDTz6+DPqoorOtigHwTGVW9
 A1jCtROpNZ6UjDRngocfZc1v11tydNWaQzJHAPpxI7kcrD594impoompbOQjmOuPb8
 AGN4gSLPS7g32NwpmZ6UPv3ultLphp3kMJmKfDdUbsY+7biL/uBYTxSoinwiDjfWB5
 j1/eUr/aDjrnsVuChwCDRzNpjWNMe99ceGWHur612EuPu9/EvIY0IY2knLmUFTuOgC
 kGC97BknnuPhma9dW1RG7WVTxdRGSrGb//im93q1ta40gt661d0rp1xlhkf5peQ2Ka
 znTP1ZokTlmCg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 02A8660F90; Wed, 27 Oct 2021 07:12:26 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214621] WARNING: CPU: 3 PID: 521 at
 drivers/gpu/drm/ttm/ttm_bo.c:409 ttm_bo_release+0xb64/0xe40 [ttm]
Date: Wed, 27 Oct 2021 07:12:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: Lang.Yu@amd.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214621-2300-R55fAp0Enp@https.bugzilla.kernel.org/>
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

--- Comment #3 from Lang Yu (Lang.Yu@amd.com) ---
Could you please reproduce it on a ubuntu 20.04 system? I didn't reproduce =
it
on ubuntu 20.04.=20

And could you please get outputs of following command before rebooting? Tha=
nks!

$ cat /sys/kernel/debug/dma_buf/bufinfo

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
