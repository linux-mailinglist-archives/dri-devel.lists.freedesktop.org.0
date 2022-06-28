Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9CC55F063
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 23:33:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA34E11B27D;
	Tue, 28 Jun 2022 21:33:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B239A11B27D
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 21:33:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 265DEB82055
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 21:33:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DCF68C341CD
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 21:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656452006;
 bh=MTFRlqCvqT4wEgP6MnsHhz8ArQdz0I1RZ89rvl9SQ8I=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=U1JZuLvgOWTK2iIYShMpLvF9cAzmfRH6ClHWWx8ik781SOj3waiWEKpEQwgri51Fi
 r+228FL6pUmQLeN1nwvirtd0b3gen07W86WYWGL/K6Jml7cna79qex22EMc04Edb21
 I9bIzyIg2DaH+8Rl8BbOwRc203D7aLGsp9X+Am54kXLe4HSp7woCl7X7ISd5g+i6D0
 0Iw4iqEsYD1SvCvZTE6CpBSxDlSX8vOzfHiiRh2n6XbXa32WXxcgOBaeIPck/SXube
 ABaFBTSEKnCWM8/zXAWsjphAbTDEcRCy7IUZcZcpPNYyxPYpAK2vZqnRvvjI195VgW
 F2whY/whYwkTQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id CB457CC13B5; Tue, 28 Jun 2022 21:33:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216119] 087451f372bf76d breaks hibernation on amdgpu Radeon R9
 390
Date: Tue, 28 Jun 2022 21:33:26 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216119-2300-CUxyoUFFKC@https.bugzilla.kernel.org/>
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

--- Comment #27 from Alex Deucher (alexdeucher@gmail.com) ---
Created attachment 301300
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301300&action=3Dedit
patch 2/2

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
