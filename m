Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D6C797A23
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 19:31:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB5A910E02D;
	Thu,  7 Sep 2023 17:31:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6FFF10E02D
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Sep 2023 17:31:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 71A80B81E9C
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Sep 2023 17:31:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D246CC116B2
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Sep 2023 17:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694107889;
 bh=9zL1MzFGAKirSOe/soz5ov0VuORvmMBERcMpv0YbPtM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=jJ2r+X89WqReR9tI86rHC44iwhYRVo9mulDlWeL6g+QveDSxGYvLAH4a9fttwA2X0
 iHPtLfqV6YzoA10eCVAJpsQ3i/4oHIZxNdtFa2PrFbVurhM/k1H///Cr4qOBHyZr1x
 PzTsZ+eiAab7Ep0402zQwDpaqObDF2O1M3eH70lk8DoujlCUrpeMAgiLz8A8NqSwF/
 mjwZnI+H8orLpfBs/q+1WAiPllROI9H8cce8oajjbSQUytblgdUn6VYeij7vPREpUU
 RAOSqbTc4r11DdPYp3ZyWk2TQVi9vrq2o/KzkxIHciYcXPsvjn6+HOMJtDJ+F9yjvm
 mYLETUgvyyq6w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id BF6E3C4332E; Thu,  7 Sep 2023 17:31:29 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205089] amdgpu : drm:amdgpu_cs_ioctl : Failed to initialize
 parser -125
Date: Thu, 07 Sep 2023 17:31:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: axet@me.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-205089-2300-5Wgi1qL6cm@https.bugzilla.kernel.org/>
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

Alexey Kuznetsov (axet@me.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |axet@me.com

--- Comment #58 from Alexey Kuznetsov (axet@me.com) ---
6.1.0-10-amd64 (debian 12)

*ERROR* Failed to initialize parser -125

https://linux-hardware.org/?probe=3D72516e7752

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
