Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE73F64C27F
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 04:02:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B44C510E207;
	Wed, 14 Dec 2022 03:02:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2EC710E207
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 03:02:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9A617B815C6
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 03:02:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 65A6DC433F0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 03:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670986933;
 bh=aEsrzsCqUW25x+pNZEfe8qoLGrXSH3kbUaxQmtyFcFU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=EJrU6PwdL9x0X9wbzbdQUvXWtAACRoyDSxCPpPNaEBQzd6A/q6SPdylA3InhWT3LX
 U+spfsjSzr4yE+fX/eatJvuxlK5Yxc0D9zfnc7J58CkCTPofYgf1umdGNSvUcuV6Lz
 VgqasfJNQWnA8AuuDsk4ivvTapzZLDf6kihJa1mapXf2nzvaWVOIN+tcjeZ/91AITb
 Z3o7MYTUxbrgxqi3s3g2D/3BCgMm4bjQX6rkfzqcm3ywTGXVIs+LLXGP+GSKlX4q3T
 So7IZyChNmzhDCEA6GOW/3cqAGAfMF0FW04j+WU/asR7l6PThfrQ+TH6ZSb0a4LUx3
 wvB+e72m0IVHw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 163E0C43143; Wed, 14 Dec 2022 03:02:13 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216805] external monitor not working since 6.1 (amdgpu:
 update_mst_stream_alloc_table, regression from 6.0))
Date: Wed, 14 Dec 2022 03:02:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kolAflash@kolahilft.de
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216805-2300-kk6HcmaHH0@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216805-2300@https.bugzilla.kernel.org/>
References: <bug-216805-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216805

--- Comment #2 from kolAflash (kolAflash@kolahilft.de) ---
Finished the git bisect and created a new bug report here:
https://gitlab.freedesktop.org/drm/amd/-/issues/2297

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
