Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 704144CB2B3
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 00:07:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2861110E7A1;
	Wed,  2 Mar 2022 23:07:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A3FE10E7A1
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 23:07:31 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2D2F4B82294
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 23:07:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EA174C340EF
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 23:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646262448;
 bh=V5Wew0EHQ4AvDFpIaZ3bjLctRuCb64eQiwY2VBy2CE4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=KkdUtgoqTBGXuTTvOmob4P5uasfpyqhQhA3F+DB3JpTBk3252sbcuFjcA6drSgJIE
 lSAq7q+iG/lbEPaVd/UMCAUC+algpK2pz8kPnLmVde7ktgMjSK9qdqdk/xeoD8OuSW
 Yg0xBjqUj/ClUorhEIRxUCpg3lXsGkxLlPfFVqL3ss7sxRr9AGneZSw1HvBjw2Sqot
 rLNhShOo1oYF+E3Mijvs4WZn3fA6kP50s6VNGwToE1K8gFugSO5EX/aWs1cWPaZT/i
 cGlroE1AqJaFBDRakmUB0gKqzVv37Gl4+WuMICev7wuyEY4EHaf6BtUHVikWFjsr2R
 JbBeUWaEVO8ZQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id D9603C05F98; Wed,  2 Mar 2022 23:07:28 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215652] kernel 5.17-rc fail to load radeon DRM "modprobe:
 ERROR: could not insert 'radeon': Unknown symbol in module, or unknown
 parameter (see dmesg)"
Date: Wed, 02 Mar 2022 23:07:28 +0000
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
Message-ID: <bug-215652-2300-oQuSV93BO8@https.bugzilla.kernel.org/>
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

--- Comment #1 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 300521
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300521&action=3Dedit
kernel dmesg (kernel 5.17-rc5, CONFIG_DRM_RADEON=3Dy, Talos II)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
