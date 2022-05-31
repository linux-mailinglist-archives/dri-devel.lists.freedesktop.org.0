Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE60353976E
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 21:59:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 079CF10E013;
	Tue, 31 May 2022 19:59:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BABA10E0D7
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 19:59:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 891C6B8121B
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 19:59:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C62AEC36AE7
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 19:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654027177;
 bh=e0S9/BpENMH/WAGauL/Dq6I71GmKS5JkZ3e6wEQCz+M=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=s8X1nL4Lx6/yuO6Q58sHRYbIIpjucS1qDElX625p8ERURJ/T613xvqdtogjwykXah
 2o8oAaTy02nG6FfLBcaZTUZS0wx7SnprTintRgSuzKRYdJ7c7gzEGVefFBMowImsrM
 kKvHlXO5PZG9Y+Hk5X24Tk/WI1I6WKl9lNwso+5RdKViIiXqIYls0wvuNW2oO5kVT4
 dafLVnFHjKxBbURLqbHCXRHcwEJK4MAIOusxjOIdfyIQCGGNf00ddHzzMAk6adHSrL
 tO15vnbrumFj8j66PyidMazgW3iQmUkJrRLAsK4G+sLL5EIU58oRO3M+trtpP0cc2G
 piTqIbJDhXbiA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id B0DDCC05FD5; Tue, 31 May 2022 19:59:37 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213145] AMDGPU resets, timesout and crashes after "*ERROR*
 Waiting for fences timed out!"
Date: Tue, 31 May 2022 19:59:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: bugzilla-kernel@z.ewheeler.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213145-2300-F5y56XoEtY@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213145-2300@https.bugzilla.kernel.org/>
References: <bug-213145-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213145

--- Comment #18 from Eric Wheeler (bugzilla-kernel@z.ewheeler.org) ---
Nix, did you try Linux 5.18?  It worked for me...

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
