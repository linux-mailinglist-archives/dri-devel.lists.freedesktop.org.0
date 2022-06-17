Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DC354FF7B
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 23:45:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EACD310E38E;
	Fri, 17 Jun 2022 21:45:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8C8C10E38E
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 21:45:51 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3D4EB620C3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 21:45:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9D47AC341C0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 21:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655502348;
 bh=mtYnvyyv7Eac7pmeUWl206HT3/zeMf6JhBVElX6agpE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=SrlPt/IMOTI4PqjIcKHo/9xu+eDM/vQftaCX3nWfuF8CJPGU8kr7a4k9OLEnq3uC3
 aQF4ZRIZkPwik9YWtBxOP7T+cg2km5UCiQciwAKXEXS1cWsOPIgFuicg3nzQeh6q6j
 btE8jj4VMzyA41Bdw+2jXPCs6T50Gu1JUM3LuMMhZ9Nz1u5R/3Mddjq3o8VC/A6aYj
 Yaajw+nIKDJ0orw2yzg/s2rBFz5iuKMs/GNpH5KTQPdsxrimJITKkhPW48wILBi7I4
 1Mq1GZK6DGYlQzfx7Ege8q1s0ANE2o9CT04COYzWCnWFUFfNPk5Ke7Jfdp0wCNYKV0
 Q5h/ZiyiOPB5w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 89FF4CC13B1; Fri, 17 Jun 2022 21:45:48 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216143] [bisected] garbled screen when starting X + dmesg
 cluttered with "[drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed in the
 dependencies handling -1431655766!"
Date: Fri, 17 Jun 2022 21:45:48 +0000
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
Message-ID: <bug-216143-2300-v0zHHv9YYO@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216143-2300@https.bugzilla.kernel.org/>
References: <bug-216143-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216143

--- Comment #3 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 301199
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301199&action=3Dedit
bisect.log

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
