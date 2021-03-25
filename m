Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E279349394
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 15:03:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BD9E6ED87;
	Thu, 25 Mar 2021 14:03:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A85796ED83
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 14:03:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id B34D361A2E
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 14:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616681034;
 bh=fu29XCDM0S/ing+gaxIVn+JIMFa2sVvyfy+KARoeKJ0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=KPqph5My8clM9Kc9f1sKf+WNHTU06/jeCSz/7vrAQH7qT1A8ip3o/I5zKA+LPkHvp
 t0BmfzOn/vib0WEemcOBpDffMVm67G1ho6ZBUlRKGf2SGxxGggVqDPFo08BNMj3HJY
 1bH6/I+caMJMnQV09D2/THAJgg3pr8NC18bBtWCmb1KsP4ndAtRE92jcoXccl+Lcd3
 x4VekICPb8meZEl8t8t9kXEOMBILVSUsWNHJrwEc19PKh2ftl3x/JloC3Gg5mLtP+e
 QUrxV804Dr+R3yE3TBGWHJWIF/9flYWS0jXH3R3rBHbo0QSM7Luys+hLcSopviKizH
 RJfGaMBmSapUQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id AF0BA62AC3; Thu, 25 Mar 2021 14:03:54 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 203905] amdgpu:actual_brightness has unreal/wrong value
Date: Thu, 25 Mar 2021 14:03:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kurmikon@libero.it
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-203905-2300-IpByjG9fkq@https.bugzilla.kernel.org/>
In-Reply-To: <bug-203905-2300@https.bugzilla.kernel.org/>
References: <bug-203905-2300@https.bugzilla.kernel.org/>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=203905

--- Comment #27 from kurmikon@libero.it ---
For me the only workaround to avoid this bug is disabling systemd backlight
restoration. Then use brillo and enable a specific service to restore the
brightness at startup.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
