Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB174CB2B4
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 00:08:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB53E10E7AA;
	Wed,  2 Mar 2022 23:08:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2322B10E7AA
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 23:08:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AF114B82294
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 23:08:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7F268C340F2
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 23:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646262479;
 bh=WB5iMSJiiFMgWBHB4VDyqjaFv/FSR5vIL5MTqIeYdUo=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=D9E3BPSkGYNk1TMFfA29Hl8ey9smHJsn8gO8BbbDhQqZphDToIUaEQhP/fLaeS2BZ
 8URMzb4Jug2ClcEZN+5KmY4Xo71nnnQwbJhBS/X/vdnkInjyIUumWURkEDuTcZdLGD
 Y85aUw2x8t+Zb4Co+Llvll30QekCGNX7b+GUtIxkfwm8V+e8abnWgsO5kBsW6HKZRY
 zZ2z3M7+l4z0O9qCz+W94f382lab9ROf0RMRwW/4HIdCbGnkVT1NGtSuAflya8PhPG
 iyKrP/ZIYPQJ5PZCC6SkcIH2kXLBIFvhkPPcANvUFNUKDPEtAg4jyxHtncB68gSOdF
 P37vzDD1fjjtw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 6DFC2C05FCE; Wed,  2 Mar 2022 23:07:59 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215652] kernel 5.17-rc fail to load radeon DRM "modprobe:
 ERROR: could not insert 'radeon': Unknown symbol in module, or unknown
 parameter (see dmesg)"
Date: Wed, 02 Mar 2022 23:07:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-215652-2300-KIaofuvRPw@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215652-2300@https.bugzilla.kernel.org/>
References: <bug-215652-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215652

--- Comment #2 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 300522
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300522&action=3Dedit
kernel .config (kernel 5.17-rc5, CONFIG_DRM_RADEON=3Dm, Talos II)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
