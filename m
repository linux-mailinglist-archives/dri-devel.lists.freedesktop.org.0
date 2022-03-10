Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C654D47F0
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 14:19:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0C1D10E354;
	Thu, 10 Mar 2022 13:19:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ED1110E354
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 13:19:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B4062B8261A
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 13:19:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 58178C340F4
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 13:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646918370;
 bh=XfmP3BP0Jq1tFkAHoq9VnDx/Pl7UGTTKCaGXvj2onR0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Tbo3gOc64Db3hDM5mHJBd/2773+Mun+XRVCC01ZkhsMzf0gM132/qhBltNLAt7zlP
 BaDiMO7IQamz+1LVasj310zYSOjAZnWQevCGYaCOry1ziCWTz6OmnZlJWBjlb6Gvpp
 M/9nTpvW1sTWS11GJ0LUwfqMqIt0rAjQQlusGct0OEOcJdn+TskZqzoVI89iodwQoO
 TUICgof1XBNhWIOCz3AQohc1pR1MqYG+b/HmsjbsV4adwmfIhI4fE48yqjGLJKKMWN
 ImyTGUTAIFGlZynQRHHGYZ9H8wonFYpojbV8Une6/PYb0Gs+Y0Jeg4A8eiKpyGGkrq
 fG1TgUvy2Xpaw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 43869CAC6E2; Thu, 10 Mar 2022 13:19:30 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215652] kernel 5.17-rc fail to load radeon DRM "modprobe:
 ERROR: could not insert 'radeon': Unknown symbol in module, or unknown
 parameter (see dmesg)"
Date: Thu, 10 Mar 2022 13:19:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-215652-2300-LSdCjRJMQ7@https.bugzilla.kernel.org/>
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

--- Comment #8 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 300550
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300550&action=3Dedit
kernel dmesg (kernel 5.17-rc7, CONFIG_DRM_RADEON=3Dm, Talos II)

Seems this is issue already fixed in -rc7.

v5.17-rc7 boots on the Talos II again with radeon drm loaded from disk with=
out
an initrd or firmware being built in.

Out of curiosity I'll do a bisect next week anyhow to check out which commit
fixed the issue.

But feel free to close here if it is not appropriate to hold this bug open =
any
longer.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
