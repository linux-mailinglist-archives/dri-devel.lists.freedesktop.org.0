Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B77A7535F38
	for <lists+dri-devel@lfdr.de>; Fri, 27 May 2022 13:23:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C3B010E16D;
	Fri, 27 May 2022 11:23:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E567B10E16D
 for <dri-devel@lists.freedesktop.org>; Fri, 27 May 2022 11:23:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 69BC261CDC
 for <dri-devel@lists.freedesktop.org>; Fri, 27 May 2022 11:23:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E99ACC341C6
 for <dri-devel@lists.freedesktop.org>; Fri, 27 May 2022 11:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653650592;
 bh=IBxwSnDWuOVZbay0nJS8mXgMNlmtgNKmEtnMIcjOK8s=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=BwkqqG42FSkULxZxAR3zbNbNgy+r/nnIDdN8PXtkyQogAiLNr2kHz7IloGUpe0Bra
 zTVQMSCZHG6mq+0ViSaDDQDlbeMWEerpPWgyCFBOIrXIFnfs78EE03F0oEv6scgWn5
 DxzfDWffeKtnvbyo8yojQVC5LfLoprYIQfNdEhdOPidp1UrvmKIhVdsEgzhZmz5txS
 yQEXpKuFqeMrOmOtzn+s9E3MW0yyOo4EdA5CrWzzhb9LXt6lzVGXqtDrI0TIVBA+qI
 Gq2BLPjPjZXsdGwolwNlNLHnct+I5ebHgjER/ldDDOXzFgVCdtqDkps6uXuwQ3vjeL
 px2a6vuH69Gsw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id D9632C05FF5; Fri, 27 May 2022 11:23:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205089] amdgpu : drm:amdgpu_cs_ioctl : Failed to initialize
 parser -125
Date: Fri, 27 May 2022 11:23:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: laguest@archeia.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-205089-2300-YxnrrxdGSb@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205089-2300@https.bugzilla.kernel.org/>
References: <bug-205089-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D205089

--- Comment #43 from Luke A. Guest (laguest@archeia.com) ---
Oh, and I've tested 5.18.0, 5.17.7/6/5 - all the same error/hang.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
