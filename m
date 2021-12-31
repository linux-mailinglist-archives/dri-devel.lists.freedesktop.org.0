Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 875F44820F5
	for <lists+dri-devel@lfdr.de>; Fri, 31 Dec 2021 01:17:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DB9210EBCB;
	Fri, 31 Dec 2021 00:17:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AFC110EBCB
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Dec 2021 00:17:21 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EA88B61760
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Dec 2021 00:17:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 552D2C36AEC
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Dec 2021 00:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640909838;
 bh=Tz8vf6UBo4BTeHaznihJGFkFlnl4EXBlhxiNoXefoIg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=FvXUCOtSOIUC1dQp8lB7hMRk8KxSukfwUX7RnnNHn7E2oymNaksfT/FlRotXrOVa2
 ggzpRZI9N6XZbEbYXD0M7lAu+kf+aCl1Z+87iZEVKB7nyug8jiiM8eJOS93ww/4i9L
 wuBqK1y/NkCrWjSQLDz+g53u/L5Ixb769GtGYoD8auvHdp2/lk97/hSWVinkQUJVZs
 dcnkD12FaCyivKslAevoVO79osMHA3CGXkTayH6dzYJp5snGBgTXr2cx0RDw74vRFA
 ums/FpJlc5F7mTYvrEwfFFD0fbQhTUhslpS/rOCaWONSIdgk2qaHl1EtF+v9ueSdxm
 rl6bpTtEl5JXg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 3F2FEC05FC8; Fri, 31 Dec 2021 00:17:18 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215436] admgpu: suspend and resuming from suspend don't work
Date: Fri, 31 Dec 2021 00:17:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: spasswolf@web.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215436-2300-oG0N7Ejyic@https.bugzilla.kernel.org/>
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

--- Comment #6 from spasswolf@web.de ---
After sorting out some .config troubles I've reverted commit
2a50edbf10c8c56e930bfb53d8f9f00a33fd837e in linux-5.16-rc7 and this seems to
cure both the not properly suspending issue (fan and keyboard lights stayed=
 on)
and the hang on resuming from suspend issue.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
