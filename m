Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 174E848441D
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jan 2022 16:03:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8366210E444;
	Tue,  4 Jan 2022 15:03:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4E8210E444
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jan 2022 15:03:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6EDDBB816B8
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jan 2022 15:03:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 432F0C36AEF
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jan 2022 15:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641308625;
 bh=wW1BJ7osRvGGeh4ylvXEis7mqt0vqBl1emMg4PswUnQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=OL/dT78EvlHoG8X1Me8FKZsZAoVWtfiF5sqpNtE2GYQS2nsjL30Ltx4gtDDDVuOQy
 wk/XAtWjYh1CEerBujZKR+wLaRvVKBR1Fl0+8hgfF7QFnXt3A/ixYjXh7IWQaFDcI4
 yh7WCc8JOlWFU9hU8Ep8yY4dL1Q3lAIfRBVjdlJ8Mz33Bpf0AQDDfbsM462JQwJ1pU
 8G0gYL8P6jBYaVhKq6jJE51v8sAi2zj5TpCpFDMrHhIpc7z+5kBNpuzP3+1RXePLeT
 AeePWusEd5wgKh8YSqHwrJRI1XuYNsO78EFAjFiUUqdoBLSBsmnkupxVL/XQuCaSKa
 PquJ4q9K/AykQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 2B204C05FCA; Tue,  4 Jan 2022 15:03:45 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215436] admgpu: suspend and resuming from suspend don't work
Date: Tue, 04 Jan 2022 15:03:44 +0000
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
Message-ID: <bug-215436-2300-hNvPjiUSkK@https.bugzilla.kernel.org/>
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

--- Comment #25 from mario.limonciello@amd.com ---
Can you check the state of the other variables though with that extra call?=
=20
That was in my debugging patch but not inyours.
Is the HPD active?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
