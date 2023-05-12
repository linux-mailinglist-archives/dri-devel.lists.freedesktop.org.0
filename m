Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D94BA700EBF
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 20:25:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FCFF10E245;
	Fri, 12 May 2023 18:25:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C4AC10E245
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 18:25:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 09BBF657D6
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 18:25:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 654C0C4339C
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 18:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683915947;
 bh=jTxa26YITUPv+kp9X89pKVPBlp0TDrEDetTDjJCghnc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=C/K3lpI2SvnmC5hq2SWFVPNfz4wAdoV/dEPt1RDq11fu4CT7gFPZg66MxWf3Vi0DP
 dUBI6OEZAsL4TPLSFEj5fMfs8FmpZpXux9mdpb/ScZWFuzIW9wzMgq90jBpnwvpvl+
 cYe0Y427mBotlIoJBQgFwSGEDEFEPmFvZ267V2hlEXYJAcaKONrmAXmFylLiiMS39Z
 xkxsko2U94E0vsYmh3yTQM+nYO3b3D+tXkaMO6CGdnalRVxaX8OBuVxF4D9X9NH8u5
 wO4qfZnHxiGBfWvLA2bi2S+TrCv1lRCbeOKsjUx473dpj2xMWPncZ5Zt5pf24ai73T
 lXakgn2DEWu2g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 50687C43141; Fri, 12 May 2023 18:25:47 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217432] AMDGPU crash on shutdown
Date: Fri, 12 May 2023 18:25:46 +0000
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
X-Bugzilla-Resolution: PATCH_ALREADY_AVAILABLE
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-217432-2300-6sw2VkF1F0@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217432-2300@https.bugzilla.kernel.org/>
References: <bug-217432-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217432

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |PATCH_ALREADY_AVAILABLE

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
