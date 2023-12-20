Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5891681A135
	for <lists+dri-devel@lfdr.de>; Wed, 20 Dec 2023 15:36:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9297A10E591;
	Wed, 20 Dec 2023 14:36:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5551910E591
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 14:36:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9DAC061692
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 14:36:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 93598C433CB
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 14:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703082982;
 bh=TpPHgUZdbtyfVO7MIFEF1NnM+tpoEt1DueQBIyi0+HY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=pj5P7E7CPiSVmSS3WyOd+hNGo2xYlNJb9PGV0IRx4BWcQM+Yq6pDLDJiNl4rWQVdx
 sJDnqfnIwfgIqgveXt9FiCRhivEc+Oz+VNrBZQ+/3P9ze1Wh1kl6ODwy3XIH6VfNLF
 j9EP2Gq5poOamIV3hwD/j5b6On/2HGccN234dpmU9Sq8odA4R+3G/EPqnMmYqp4RQi
 UAcSDm1tuZ8Y3hOGi5DdobxZLuFKOIkpzeNxqaIDuhX5dp8NkfD7Lxm/DWhE/Cqufl
 17raWEzZGHI0eblu8BxtUWEYHweHkoTp5VdBLqJ9P3xM3W6uz/+5BGyovaUtWehSq5
 TZ9zvqO7/AEAw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 83BB1C53BD0; Wed, 20 Dec 2023 14:36:22 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218292] Built in Screen (Laptop) won't wake up from sleep (AMD
 Graphics)
Date: Wed, 20 Dec 2023 14:36:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mail@bewi.at
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218292-2300-KTnLOzmPMc@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218292-2300@https.bugzilla.kernel.org/>
References: <bug-218292-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218292

--- Comment #3 from mail@bewi.at ---
Created attachment 305635
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305635&action=3Dedit
dmesg6.6.x_not_working

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
