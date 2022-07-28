Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E922B584321
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 17:35:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D892B112C85;
	Thu, 28 Jul 2022 15:35:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3893E112EAE
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 15:35:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BE404B8248C
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 15:35:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7A79DC433C1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 15:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659022531;
 bh=saUrfCOrSqunC1EzNipKNNGLNsUauJ/ZqZjqQ1kWjNE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=P6BiPjYr9nxQfVlhSVlDL95lLx4kadUThOdlIQByORLh35rYHEcbvq0KURoZ30ntC
 m8YHxGPd0lEcYkolwbwSC4dHgaK91MzR27YkyfDTbdnC1kYHWTuAvAmIzvw0qaXd81
 /d1hVgKyO1SAuPjgO/20sMfKpnLbiIICj6iLKbSVisfDCHaR4LH7iL93U7ivnhm0El
 uhAmxSNXfoE0BpVWpOJ0qgbVwEj7hH7t1Bs+FKQbGTj/WlOjucxRXOXvZ7vmZUeQjo
 pKQGj3z1Zl7sIsrN9dHhzZLQfMt/JIfhui/PJ8gSPgD7eX5gmuY98H9FhBv3FGZgmw
 u8lXBdF/dWunA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 66E5EC433E6; Thu, 28 Jul 2022 15:35:31 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201273] Fatal error during GPU init amdgpu RX560
Date: Thu, 28 Jul 2022 15:35:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: quirin.blaeser@freenet.de
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-201273-2300-vqXzVsewJW@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201273-2300@https.bugzilla.kernel.org/>
References: <bug-201273-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D201273

quirin.blaeser@freenet.de changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--- Comment #57 from quirin.blaeser@freenet.de ---
Three years without a crash should be enough to prove: It's fixed.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
