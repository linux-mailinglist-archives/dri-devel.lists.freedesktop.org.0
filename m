Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D858744A6E
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jul 2023 18:09:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7529710E0EB;
	Sat,  1 Jul 2023 16:08:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA2FA10E0EB
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jul 2023 16:08:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 27315608C0
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jul 2023 16:08:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8E2D7C433C9
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jul 2023 16:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688227732;
 bh=gYlTm1SYJVYLKOSO38cHSD2uNG2H4unYw/+1CUAhRcM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=tKJFNecpgdYYrf6KYSRjiGjp4BLdKH6RfPn+9y2VcAQToBWuzQHxWeTovfD+uPcTA
 NTusb29pqB/GUN1r5A7SDAR7kohhY0CfgTqfexPtkbk8073eUlQxyslBDujlO3MCHo
 4lKxfS1H5hfGip37PtlaNxbYDQSmLnDWI2o3ENdaRbMv/gKifJgQeEyFpXOPTHtXe6
 tPKLsC9OySpIp+OIpthUv2zoZzC6al0kis45GKkZvuljoiDSJXKKvQTiSHkjKj49UP
 GsL7SlOOHdJgb7BUylDOoxjduD6R1pIFmJC5DHqQRx5BMDCNvPd8IOnsupixuAx24D
 B46wM4Vmaso5g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 72A18C53BCD; Sat,  1 Jul 2023 16:08:52 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217621] AMDGPU - Internal 4K display used with 1920x1080 leads
 to screen flickering and distortion, regression from commit
 edcfed8671ee57bb599184f2e12a1b3e11b32306
Date: Sat, 01 Jul 2023 16:08:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-217621-2300-R1G3giYJjc@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217621-2300@https.bugzilla.kernel.org/>
References: <bug-217621-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217621

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #4 from Artem S. Tashkinov (aros@gmx.com) ---
Please report here instead https://gitlab.freedesktop.org/drm/amd/-/issues

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
