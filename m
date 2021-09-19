Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE20410B71
	for <lists+dri-devel@lfdr.de>; Sun, 19 Sep 2021 14:04:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27CAF6E1B8;
	Sun, 19 Sep 2021 12:04:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95C966E1B8
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Sep 2021 12:04:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 6A26E61268
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Sep 2021 12:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632053048;
 bh=GYFlv8jBImT3fFCc2/5MPDgTUsxaR5CyVPGqmK9UZjo=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=BBm90F4EAMFktoowpLNv18qJFkeDwB7F3udr0sMCVa6kVo/Z86nfasUXLzbU7rV8x
 RuwvN7s8I+I7gBIDCToc2AQIj6AA2Hqx8GGVlc2RKJFcAadoLI8qr14IUIpAYh9O1p
 0HttSU3zNAvZTeXBkGFtHN7gXypPVPi2nvPrXWczRbLnHi18unudrtDxNgmMucOEpP
 E0GSA3aanHIAPPeHY/GDXGpd4NsxOo2cK/1sMKh1RZ4a2U36ti45cuQV2c1TOi2aka
 S9a/t+JjowjnnO5lAUgCYrlOUHc09tesdonSI5uvwFbA0ZGqf/RM0e5G9rgZpYCAlp
 F7Q1Njb/cAhjQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 677A360EB6; Sun, 19 Sep 2021 12:04:08 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214413] Kernel oops on boot for amdgpu (in
 si_dpm_set_power_state)
Date: Sun, 19 Sep 2021 12:04:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214413-2300-dXkABsagGe@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214413-2300@https.bugzilla.kernel.org/>
References: <bug-214413-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214413

--- Comment #1 from Artem S. Tashkinov (aros@gmx.com) ---
Is this a regression?

Could you please perform a git bisect?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
