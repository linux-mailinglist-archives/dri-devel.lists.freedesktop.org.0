Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 124BF6DBC51
	for <lists+dri-devel@lfdr.de>; Sat,  8 Apr 2023 19:26:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C3E210E008;
	Sat,  8 Apr 2023 17:26:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9245A10E008
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Apr 2023 17:26:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 264EF615C9
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Apr 2023 17:26:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 20E09C433AC
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Apr 2023 17:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680974781;
 bh=EbwBsbbBX1k/IYvJcy89H8BUt9WiZ8jMSdIX3nktH+I=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=bre7BkEa9geQtV+n6TVQTAC+k14qEk2AXI8JIkmHUNxYGHO7r6X7Bxg+gNokjkjAS
 03gE/YpT9lfrgLwWctQpokWIXJ4rUfc0EjAhgsltUOD7JTsfKolrK5eWIbnvSZIjWV
 3z8Cv8bGykTxUUk4MWuS+aA3SOgTRdXbRou5Nl8cJvD2WdTqjmiBZdBKtO2VG+yPU9
 4jlix8vkIHqS8U8QihLALlvTiB/kKEY7rnqFPlWbfJd+MMAsAV1VwEfFjW+CrT6s3Y
 jp6GHF1sbfJN5INbRFowxZqJtYkp8nizUSDqnnjYXFaPy8vXkBYifC7wMgDe0pZp3i
 wKpTDGqaoYUpA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 11FE1C43144; Sat,  8 Apr 2023 17:26:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201497] [amdgpu]: '*ERROR* No EDID read' is back in 4.19
Date: Sat, 08 Apr 2023 17:26:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erenoglu@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-201497-2300-fsdoyaI1tA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201497-2300@https.bugzilla.kernel.org/>
References: <bug-201497-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D201497

Emre (erenoglu@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |erenoglu@gmail.com

--- Comment #25 from Emre (erenoglu@gmail.com) ---
I still see this error in 6.2.10-arch1-1. It happens for displays connected
through a USB-C hub:

[    5.230549] EDID block 0 is all zeroes
[    5.230552] [drm:dc_link_add_remote_sink [amdgpu]] *ERROR* Bad EDID,
status3!

A suspend / resume after system boots to login screen solves the issue. But=
 it
comes back sometimes when display is suspended due to idle or other system
suspend/resume cycles.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
