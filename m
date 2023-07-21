Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86EA675CFFC
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 18:46:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 150E510E6C9;
	Fri, 21 Jul 2023 16:46:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A6F310E6C9
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 16:46:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0E12E61D4E
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 16:46:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7400BC433C9
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 16:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689957984;
 bh=//GqL8L4VzaWipf4O39UmEEGbUL+B1nN46u6BwE+Lsk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Rb+S4UQ0RQcaunjRCnvl6MWblN2NsgExi0U1rXCgOQJeL9gRTQhDbJlXwerXFs5+0
 AnoK/pf+K137zTvg1ak+wcd3mmRVR51zB96SoP2j/Gg2B5i/DGQBnLtYEEjbTdEsCj
 lnLRq2ZkwQTgnk5A+or1dR3+a8ympcq0d14CT13puazdvYoqRCcKHyVr5w30bmoW38
 ZoyaKSoQoQRZ1DhOCCni51akuHd/Wk1febwjH4MQBO2H6kLPeXUyHyT1NAqtAfvlQy
 IPURQroWM8XyCZuxOeQf666tiW8Qu7om/C6a4WrT3LgqtkQpBLf/wTJH+A1WmkC5pa
 V3BY3aWcmv83g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 5C850C53BC6; Fri, 21 Jul 2023 16:46:24 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217692] amdgpu crashes on resume from standby -
 amdgpu-reset-dev drm_sched_job_timedout
Date: Fri, 21 Jul 2023 16:46:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: turecki@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217692-2300-UD0t3ue65x@https.bugzilla.kernel.org/>
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

--- Comment #2 from Michal Turecki (turecki@gmail.com) ---
Thanks, posted on https://gitlab.freedesktop.org/drm/amd/-/issues/2711.
Apologies for confusing DRI and DRM. Please feel free to close/delete the
issue.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
