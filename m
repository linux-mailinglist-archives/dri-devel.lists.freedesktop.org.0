Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E95675CA9D
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 16:51:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD5F910E693;
	Fri, 21 Jul 2023 14:51:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F225E10E693
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 14:51:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 60C3B61B41
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 14:51:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C8D7EC433CD
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 14:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689951061;
 bh=5n/QvtBl5gR2TL7OWC/gun9zrzMUY8Yf1glNt2A9+uE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=F+sHzRmO6arC/CWdOh98noK3VOxNonzFfjMecRcyXV37zf40wfxXEctK9rDUqNCb2
 3klpXFqT6mGAPG837AhZjnLdCIMxIVNq8Xidcfwt1FA2CjtkWEiolOD9xkL8AY7EX7
 g4+4Ax4duMAnyd9JglRFe0Fa/NJ9p+hFbb9CsS0Sj8FBOdyWt900bYUAIL3vsnYFnq
 IBlmTRzA6NG91Rpn+6jAellDfgP57cVzKMaFs9bbmaJpQnxhF27oZagbho0SB9TJUA
 idF7fDpj/tzdiWUHwtFUSckumWYMI+DVBpNulqDMv8bcWJXEhvCPyzOD+4pfuLEcoD
 PsU0kIafJx0Xw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id AB154C53BD2; Fri, 21 Jul 2023 14:51:01 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217692] amdgpu crashes on resume from standby -
 amdgpu-reset-dev drm_sched_job_timedout
Date: Fri, 21 Jul 2023 14:51:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-217692-2300-q7wEl0TF9M@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217692-2300@https.bugzilla.kernel.org/>
References: <bug-217692-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217692

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #1 from Artem S. Tashkinov (aros@gmx.com) ---
Please take it here instead: https://gitlab.freedesktop.org/drm/amd/-/issues

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
