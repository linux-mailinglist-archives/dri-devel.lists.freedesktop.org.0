Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4684CB4F8
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 03:38:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D3DB10EA80;
	Thu,  3 Mar 2022 02:38:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D608410E9B9
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 02:38:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4E0C861694
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 02:38:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B24ADC340EF
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 02:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646275121;
 bh=ZEtyZMCqwRLAniiu4Z+Y2dRuCmKbiCCtSEoXd20vWcM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=kFFOxCyNneuD2uR6e0nRvjqTZZ6vbd3VKuBnqx+iJXEIGwJRiTehXpcQlt9MCJKWB
 84eSYebw4TfcgCX7bZdrUDCIIBdjSzRcTnsnIL4KZXwxj7Jb+IMI7j53tG2wCtsLvA
 Q8oSmHFsRDC23E7cwqyu6AsMdADYK6qNPuMEkevrbrcdVGrvb9KgSWaWHrvE3LZyPJ
 SVn26luKu7w+8DeuNgskQaItNwjdgiFD1HCrRyEzIrER0y7nGd4LLjG731PBxsoX4L
 blmkF7m5e4n3QdYiiKPKh934StIFgXQJSlCyYTx/3JzHxXdOFE7z8Ay3MMC3kOneKh
 eCrI2W/I4s9Zg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id A263DC05FE2; Thu,  3 Mar 2022 02:38:41 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215652] kernel 5.17-rc fail to load radeon DRM "modprobe:
 ERROR: could not insert 'radeon': Unknown symbol in module, or unknown
 parameter (see dmesg)"
Date: Thu, 03 Mar 2022 02:38:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-215652-2300-oiyrIHmwSA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215652-2300@https.bugzilla.kernel.org/>
References: <bug-215652-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215652

Alex Deucher (alexdeucher@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |alexdeucher@gmail.com

--- Comment #3 from Alex Deucher (alexdeucher@gmail.com) ---
If you are using an initrd, the firmware must be present on the initrd for =
the
driver to find it when it loads.  Please make sure the firmware is availabl=
e in
your initrd.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
