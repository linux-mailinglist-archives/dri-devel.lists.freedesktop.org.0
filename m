Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D64B85FE368
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 22:39:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF71F10E387;
	Thu, 13 Oct 2022 20:39:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0214610E387
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 20:39:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 568B961940
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 20:39:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B2DB4C43141
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 20:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665693554;
 bh=whtcAzAfKWmZoZYvDPqxTh9P2QTYS8aOnlwkaOJAS9I=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=mz7qD3NkvIZpaKjCCvifQm5N4XM9WwLfdOfUR6p3yPsBHnhBKmj+PO4yKA7WHENjS
 BQF2+SJ4GO+45QTPWNaVMJBzEx/YfGs3W6DGtoCrNTCQN7ynf2GZO7LzxILVvh/iaL
 zW7KC0Y7vKWETxE+85cn3QuXHvuc6GaEwtoC8T68CIQMNPlaeotXR7FgADFVpGnd3z
 aFGwux4LXBRz7rN5XDaTzD59peX46zXAx8luk1HgGdlrVEdSX22JSZ9aE4a7+DjSZL
 GWmlHUAO1QolTKJ0pOZ0uPUyN8HIQH6bhYko2x+DgfrhTpgF9zb7RkYOe/wVlwJ2KC
 6Esxuk7aPTZ9g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 997D0C433E7; Thu, 13 Oct 2022 20:39:14 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216119] 087451f372bf76d breaks hibernation on amdgpu Radeon R9
 390
Date: Thu, 13 Oct 2022 20:39:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216119-2300-cAH8sB6UfV@https.bugzilla.kernel.org/>
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

--- Comment #41 from Alex Deucher (alexdeucher@gmail.com) ---
Does setting amdgpu.dc=3D0 make any difference?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
