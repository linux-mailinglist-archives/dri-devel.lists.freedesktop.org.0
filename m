Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB947EA1D1
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 18:26:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C961510E3D9;
	Mon, 13 Nov 2023 17:26:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFB9C10E3D8
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 17:26:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2F37960FCD
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 17:26:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F02A6C433CC
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 17:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699896366;
 bh=+8IbRz+xs6Xil59qJsE5YxO/l7a7/QhDZhg6QFd1qLU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=LTCfcoL7iPVdF71UnBEWH4OK/Eh2E+6D+2juOD6e/lGpKl8X607a8GNREtRVmjEnF
 FVFlDKuNLBbMc4AcQ/KXmmPLzpKTdHbxU+aP6xtQGHpDjY76XbOu2pyRgY+TNBnBqL
 5L+Rr2AswQiMiLromGXp8QUw4kT4IVa8jaaUJQK+tRYmpY5O/4QGjoBk/S8DIHrJ6E
 0CL2ogo4+l/JAyYTdXgDxGVkMxUhWhdSsZ7JFalnlzAXCIuj1iU8UeJS75/on6wwmo
 RLMObj2u5BJ+/yv44+p4aunQvoXr/0hLV7fRqZFCcUxxCdgZMeLM3an1TJXO89JMsE
 byx+qyzYQ69Gg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id E05F6C53BC6; Mon, 13 Nov 2023 17:26:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218141] fb: trapped write at 0000006000 on channel -1 [3fed0000
 unknown] engine 06 [BAR] client 04 [PFIFO_WRITE] subclient 00 [FB]
 reason 00000002 [PAGE_NOT_PRESENT]
Date: Mon, 13 Nov 2023 17:26:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ionut_n2001@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_kernel_version
Message-ID: <bug-218141-2300-GyDOoWaNvQ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218141-2300@https.bugzilla.kernel.org/>
References: <bug-218141-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218141

sander44 (ionut_n2001@yahoo.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
     Kernel Version|                            |6.6.1

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
