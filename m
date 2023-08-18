Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E59E780C7B
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 15:26:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C07710E50A;
	Fri, 18 Aug 2023 13:26:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F4E310E50A
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 13:26:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 55F8361585
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 13:26:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B7EE4C433CB
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 13:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692365174;
 bh=Q4eV21jXV3PH8/kN582pSONT0mHJbvBmblbTAHwvbbk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=gTiBpmQx3YSKM7Rm5r8wfpJd8SqdzEULNSKQmPaCCuouZuFN3cNQxdreQqmzRwEpH
 LvabOMKrVJ+ykSlDRlqo0j/c7FduKv+ukfX9exc5zV0U7y7pyE+KYklHL67Q80G6Ph
 m9s2GQ5sQ+smV7qZ0pElkSA80wotGVJrPIPWjbNoOLxOYaPhYVd2suuKrdV93YpoZC
 XoAbOn89IQjssZ87ELLJVcJwbs6gWSvh8YxhFg2wu5W2PgaoSs+bCv9MSmvElIzbjV
 j/o3BYeUEYmoZ+UDqRqiIasCV1qs0f38BSseIkxDjwR0rCwrtcPy71y8v5lAYhPLP6
 637mESlbpJ57g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 8C54CC53BD3; Fri, 18 Aug 2023 13:26:14 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217664] Laptop doesnt wake up from suspend mode.
Date: Fri, 18 Aug 2023 13:26:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: ACPI
X-Bugzilla-Component: Power-Sleep-Wake
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217664-2300-StzmqsYrip@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217664-2300@https.bugzilla.kernel.org/>
References: <bug-217664-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217664

--- Comment #20 from Alex Deucher (alexdeucher@gmail.com) ---
(In reply to popus_czy_to_ty from comment #18)
> banned all in grub ( GRUB_CMDLINE_LINUX_DEFAULT=3D"quiet splash
> module_blacklist=3Dnvidia,nvidia-current,nvidia_drm,nvidia_uvm,nvidia_mod=
eset,
> nouveau" )
> still doesnt wake up

All GPU drivers, including amdgpu.  I'm trying to understand if this is a
general platform issue or something specific to one of the GPUs.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
