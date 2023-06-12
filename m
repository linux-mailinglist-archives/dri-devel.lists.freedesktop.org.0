Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E89DE72C7DC
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 16:15:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C982E10E2C5;
	Mon, 12 Jun 2023 14:15:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B95310E2AE
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 14:15:39 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 66B44629DF
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 14:15:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 842C9C43444
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 14:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686579337;
 bh=GfZe1ea1WoE7DbNbTM+DxMEe/A465p5+JE4fES9k55M=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=n26t9gbg/E+V8T0o21aa/KKSGdlq3bbrpxgzrwqymr3U4Qhmt5prMVh9xG6iW9aCH
 fxaYABLEjoL4arqbT1X092B1msP9gG7+ovNH2970omzuegZVkW+emQzJtQrIKnIoz2
 uE3jjBUTSLkIkWgGg+1ZQ//6/vx6Rae7gRRXyjqFVq/muPZprMHjUUb8r3grzshhc4
 fWy+nEd03Dw+MHE+Hvo8p4JBzpa4CVuoOZeGP28Huvnkjznrkab0OQjBfCXaGeAtcH
 aHxHLjTTt7o0WZaBbeAS5sOhLwc/6b6I/8llCb2KmrpkE1MPz4alM0QZOtpRqVIe/d
 2oiO2hd4wQ77g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 7070AC43142; Mon, 12 Jun 2023 14:15:37 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217545] Serious regression on amdgpu
 (drm_display_helper/drm_dp_atomic_find_time_slots) with two DisplayPort
 connected via a HP G5 docking station
Date: Mon, 12 Jun 2023 14:15:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bugzilla.kernel.bpeb@manchmal.in-ulm.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-217545-2300-kxXg4MGDjV@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217545-2300@https.bugzilla.kernel.org/>
References: <bug-217545-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217545

--- Comment #1 from Christoph Biedl (bugzilla.kernel.bpeb@manchmal.in-ulm.d=
e) ---
Created attachment 304405
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304405&action=3Dedit
dmesg

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
