Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1391B916FA1
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 19:55:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44E3F10E002;
	Tue, 25 Jun 2024 17:55:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="px6BSqoI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 215C410E703
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 17:55:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 89096CE1AC2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 17:55:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E9BFAC4AF0B
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 17:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719338120;
 bh=I0VgRKcl6yPOF3QRICktvcbh/7kMamGCojokCNFUBfw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=px6BSqoIrruRkBD7WMvkTowbmtY+DyQL4JJAIaMOZ9IAAIckjOBNaFIFmd/itFVzQ
 7tfGwi29HcuYU/+pLweuoNkaI3BWr6HWFi61pXgui7ec3/g2T/310Fb4RTRjbut+b9
 /MwXWA2sR7EY4AAGBvpHyHOqMiXXgpM2OxquR2P4EFBGhgmD1x80zSR+VHWtYqs31B
 ZHIM2C3zJAaBj8OQb4ZlH27+yaPnxIRpB/rb7Prix9hKiQT1jPawFmvlQ/vxaZwzZm
 aSwqCXB/UJdy7XpTAUdf6dmfeIh9jyDPHCsAbjikoMlWxzER8ezkS05eRx0IC1l0Wj
 B0N1k2jz0NjHw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id E1220C53BB7; Tue, 25 Jun 2024 17:55:20 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218900] amdgpu: Fatal error during GPU init
Date: Tue, 25 Jun 2024 17:55:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: jd.girard@sysnux.pf
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218900-2300-0IJeaWQZwo@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218900-2300@https.bugzilla.kernel.org/>
References: <bug-218900-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218900

--- Comment #20 from Jean-Denis Girard (jd.girard@sysnux.pf) ---
Yes, I confirm the patch "iommu/amd: Fix GT feature enablement again" appli=
ed
to 6.10-rc5 fixes resume on my machine.

Thanks for prompt reply!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
