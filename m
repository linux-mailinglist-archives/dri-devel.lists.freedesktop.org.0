Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44AD77CA113
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 09:57:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 121A310E12C;
	Mon, 16 Oct 2023 07:57:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 766F510E12C
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 07:57:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AB7D660CF9
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 07:57:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 59BA1C433CC
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 07:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697443043;
 bh=jJv/Gh7m9cExVYLY5aEJ+kzcTA2UVp4FOxocaYxY/S8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ByYq+59yf4Xz6Zydhf1CvWYG0zoltiOVhLFnfT/N2+I+iNFDtX6R/snibGz8bEROv
 RL9UnG9dy1nJA/N47IE94FMggehckvc1yUHja2UljSiJZsN2A/4dnbEfTemW2+awAi
 5bT3Qj4kZn97MrFw+8f3697wcKFSw0Y+KREw6iMj/K8YMGCuR65WA3NlbxlqKBENWq
 ciU4U3PgXAdvW7+8I35hcPOi/tiTJCJhhZ2BXZ83Jelj9aPkihI16Ohrsh17xW1TgO
 kVSTiGXJ8Fqon0GeW61DgzpFwTjTzXdDNtus67Ti/Wu0UssXviaPVNy44eiwm6t/7U
 rLeUse6zI7MUQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 46539C53BD0; Mon, 16 Oct 2023 07:57:23 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218015] amdgpu powerplay: Spontaneous changes to
 power_dpm_force_performance_level
Date: Mon, 16 Oct 2023 07:57:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: roman.zilka@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218015-2300-bva5pri9CP@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218015-2300@https.bugzilla.kernel.org/>
References: <bug-218015-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218015

--- Comment #2 from Roman =C5=BDilka (roman.zilka@gmail.com) ---
Created attachment 305226
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305226&action=3Dedit
lspci -vv

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
