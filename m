Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBBD712230
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 10:28:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07FA810E1C0;
	Fri, 26 May 2023 08:28:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C55E510E1C0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 08:28:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 806DD615F8
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 08:28:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BBD6FC433EF
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 08:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685089728;
 bh=hA+ipB5FjA3VZhlqVrZZUhPr/epEx5eGOp3sFwI1VJM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Z+QbnQKvm+6giDU+o/bqBUdtrI6Kgrdalcj2fISWQ31Ytrr8T6ZBPGcd6EMlF5M+q
 o/zPDiQwnwYjUaQig02o6WMF4SdpLZloZnJ7AaQQFcVIll6Q5Y/CvGUNqLWwwFIoVa
 coA7AnctCyNf6Uoi8Lq1BAu0/tBSTb/ImTz7t+dlZ1Vhgt59YOavzmkEBjhf4lprUq
 RrmUXtw8hknN/vOIrsJeuUz+BCuCWV8L2xlRQUUYzDd0XlSHsgIMzQlE4nsXgpaDqx
 VK3gEmulru/gDI/xeApK+AujfxKwqg3ihWExFsUEJVzj75tYuEIgA0dnWjgMmj3IJD
 ZwooGpJ5GU9wg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 9BB81C43142; Fri, 26 May 2023 08:28:48 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216119] 087451f372bf76d breaks hibernation on amdgpu Radeon R9
 390
Date: Fri, 26 May 2023 08:28:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: h.judt@gmx.at
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: PATCH_ALREADY_AVAILABLE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216119-2300-qnwUaEXoOJ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216119-2300@https.bugzilla.kernel.org/>
References: <bug-216119-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216119

--- Comment #55 from Harald Judt (h.judt@gmx.at) ---
Unfortunately with the patch applied to 6.3.4 it causes the old problem. The
screen stays dark, USB keyboard offline when trying to resume. So special
treatment is still required it seems.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
