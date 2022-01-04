Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5762484486
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jan 2022 16:28:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B4B610E3E3;
	Tue,  4 Jan 2022 15:28:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDC2B10E3E3
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jan 2022 15:28:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 626A4B816B7
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jan 2022 15:28:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 37A52C36AF3
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jan 2022 15:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641310121;
 bh=2goSexfDbecBV6O6/17s0BZXpTWNWe1uaD1AxMEfSEk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=cUz1Zbo/rENDcnjpPeTeMFs7MbxFotFxkdE6WbB9kT9bOAANQiLlBsg/lqag82Klx
 fNO2ksDW0lZefxHdoh3w4HMcl9CGXLI8c5K7sWcACuG7bqE080y+GwwF0VwGOQeAAM
 kFUNCwRg0t+asX5vs5csp6Sn5toIlXHZSR2n8O1eTrxajx8vttsIL5GTQeR8bsiFvD
 L/mdageGVsoIZ0zGDQZ1h75lEhVLKfO8BTaAfHIUUjt1/atNtPUAwBKKMAVx4g5So4
 Tal8Nyh4FjdeI9Mx1Yk/qGcialKRW4z6RGeD1IDJjWAg3mAC3QtB0RFtAzPqKWi9GK
 Hf2/pHb3n5F0g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 276ACC05FCA; Tue,  4 Jan 2022 15:28:41 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215436] admgpu: suspend and resuming from suspend don't work
Date: Tue, 04 Jan 2022 15:28:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215436-2300-GVc4fVoGaz@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215436-2300@https.bugzilla.kernel.org/>
References: <bug-215436-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215436

--- Comment #27 from mario.limonciello@amd.com ---
Great!=20
OK, let me send that out for review then and see what folks think.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
