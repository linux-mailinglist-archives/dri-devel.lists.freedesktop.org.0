Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC14770EAC
	for <lists+dri-devel@lfdr.de>; Sat,  5 Aug 2023 10:09:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DDEF10E164;
	Sat,  5 Aug 2023 08:09:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0899410E177
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Aug 2023 08:09:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4CFFE60B7C
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Aug 2023 08:09:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ABC02C433C7
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Aug 2023 08:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691222939;
 bh=4OiUz6a/WXk5dinc8itOwfKIEzDioJTSfT0Nbs9H5iQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=WAGt95ehklup/Fh9doDUr2ly1SttVdZykXf/ebFPkLYlPXW+kiEn4PvzK2ey+Orbo
 p+pcM8HZ9GoE65QEgy4w/8vMCHCMwMQ2kxG19+X64LxfsUK4lGrb53kMJFulvzAn7y
 fuXrY9WwKw4Qh0UG/5rggZKAAddidPazOPM2ELPvpehd3aCo1YohclfeBLJgH/k8x3
 zIzCtzrgVCHlH0inZ1qWUbm1zAKrxOb3y+Fz/dLLJXa5Zdo68pv6xbKVKq4Co7Lkwv
 gYU61Lvc23G77IWWe6kP57f+vV7weq0xAmiJcyjqsgnXIIwACtIgjO65kNcNYq1DfQ
 Tw9aJBjVPoPvA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 91B48C53BD1; Sat,  5 Aug 2023 08:08:59 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217764] nouveau: system hangs when changing pstate on GeForce
 GT 320M (NVAF (MCP89))
Date: Sat, 05 Aug 2023 08:08:59 +0000
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
Message-ID: <bug-217764-2300-jxgmwgROpY@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217764-2300@https.bugzilla.kernel.org/>
References: <bug-217764-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217764

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #1 from Artem S. Tashkinov (aros@gmx.com) ---
Please report here instead:

https://gitlab.freedesktop.org/drm/nouveau/-/issues/

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
