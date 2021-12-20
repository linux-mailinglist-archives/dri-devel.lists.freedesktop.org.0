Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8B647B356
	for <lists+dri-devel@lfdr.de>; Mon, 20 Dec 2021 20:01:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 070B2113CF6;
	Mon, 20 Dec 2021 19:01:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22240113CF6
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 19:01:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 4F67ECE1130
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 19:00:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9E0B3C36AEB
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 19:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640026854;
 bh=4qlpU1tNtkAxtmYsPyTv94LUYCuVxBFj7vh0c0pGFVI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=OrnG7PFAM66cvTFnNPhUAIGiIxHqxe6RcG6A1VNXA/E9p7FpTmf98jq7uFbvZSf2v
 JWva/h8G8S3BphM9+GiQfDO2lB5kwugpYHwsYyhvK3DO/8MsWreJp33dUvJnIJcX1j
 cE+Aclyf7b0a6TsqTlaPvWvnWTLiX3N13Eabl1xZxFHn6eOxynlTed/t79SVWAz0uT
 dyro7+em8Tb9KJIqhxWNJOPBzchcEUIecs7NRQLUSpSNrOuVEux2DPEPDHII+v9Hqw
 F0NLWUtY9Lad7mzfT64e6l8/Wjag6mQQ8hYADIBBIaDhHOw/TtGVtamv2432YgGvfL
 utTcgXCm4p03Q==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 7D8DD610CD; Mon, 20 Dec 2021 19:00:54 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215223] AMDGPU Driver with Radeon RX 6700 sometimes can not
 find display
Date: Mon, 20 Dec 2021 19:00:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: reznov90210@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215223-2300-zhmbqG11Am@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215223-2300@https.bugzilla.kernel.org/>
References: <bug-215223-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215223

--- Comment #6 from reznov90210@gmail.com ---
Switching off and then switching on monitor helps.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
