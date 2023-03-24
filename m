Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1936C7952
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 09:04:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27E4110E4FD;
	Fri, 24 Mar 2023 08:04:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FFD110EB97
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 08:04:03 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E954E6296F
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 08:04:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1FDC7C433EF
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 08:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679645042;
 bh=WZZv/Rl9JuymKqfRhX3LlYwyzHVxrAcsNOrVqsEUIf0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=AfX97p3X/PpFHgR5bXTjh5wP+Ar43s+pdiMPkzb+ltUIuPrBgraGkBLTBBluF48jQ
 GeXGVqu9t0Xvn/lXMo8stvtOtFG9r91uA/mSenYrS0HZ9HCNYUcr5hWWuoDOPjOmSJ
 RIrC6wdYrM8Rt+YO23zeLOsM43w9JGbfl5U73jHTtR6BQ+2bSP6bBogRT/QIW4YyxU
 qDHbAfQHwgokd4IeIgg35Ze+vj7/jQv0lJpvJun+aDRDDlDb40gbxBVPwRUtJFmrpJ
 t0yHfVPqJGcoM04VOX6kl6OoEgJtX8O6hjJoWFd82+igGuEavUbdApe0ktg51e1Zj0
 VTJFIJZbJzkaQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 0B5F4C43142; Fri, 24 Mar 2023 08:04:02 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217237] Fail to read EDID after resuming from suspend since
 kernel 6.2
Date: Fri, 24 Mar 2023 08:04:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jani.nikula@intel.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217237-2300-IaqZLPGtUe@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217237-2300@https.bugzilla.kernel.org/>
References: <bug-217237-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217237

--- Comment #2 from Jani Nikula (jani.nikula@intel.com) ---
Yeah, bisection is likely the quickest way to resolve this.

Please add drm.debug=3D0xe module parameter, redo the full dmesg, and attac=
h it
to the gitlab issue.

Please also tag me with @jani in the gitlab issue. Thanks.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
