Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6322157F591
	for <lists+dri-devel@lfdr.de>; Sun, 24 Jul 2022 16:56:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A082710E09A;
	Sun, 24 Jul 2022 14:56:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5587110E09A
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Jul 2022 14:56:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E9B98B80D78
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Jul 2022 14:56:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B44EFC341CF
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Jul 2022 14:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658674575;
 bh=VLwNDZ0XHMsASZd0tcc7fykqa9zfMEE1D9rpR0xClKs=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Oq/QBOc7f2NrNsTDyxm1tj33NTGoRaBHj+AtyN3GMkxNHc00STukEspLhxCrSBq8x
 9mTyTlhakMKX1HLmogg0LbBByw1H25dZ5ZRESj0CoDpmJpnUhBF+5d56pVE/BXZphQ
 e18fc5E/U+4nvN/c5opshBG4Q1miWVb8yo1wVem9SZ6ZAkUFRlXrTWIWxngxwkhX/a
 3x9R/TFxyytN1RrmcZiBl0CPWtsKvs4/mnN2b2UbvaL0ae1L9bqNo8LYb9CsBbr4+p
 Zczho8lVEQbrpn0mhUr8/0Zhh548ZKGgMoAVHoJjMam6NAb95Dh74F27T8fjLWE67H
 +prk2V9l0pzCw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id A0F9ACC13B0; Sun, 24 Jul 2022 14:56:15 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216277] X11 doesn't wait for amdgpu driver to be up
Date: Sun, 24 Jul 2022 14:56:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dark_sylinc@yahoo.com.ar
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216277-2300-snHkOtnrcQ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216277-2300@https.bugzilla.kernel.org/>
References: <bug-216277-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216277

--- Comment #1 from dark_sylinc@yahoo.com.ar ---
Created attachment 301479
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301479&action=3Dedit
Xorg log when it fails

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
