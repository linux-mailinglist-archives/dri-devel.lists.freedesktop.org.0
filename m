Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BE6662FC2
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 20:03:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23F3710E472;
	Mon,  9 Jan 2023 19:03:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7AC810E472
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 19:03:03 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0E7B0B80F91
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 19:03:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B56B7C43392
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 19:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673290980;
 bh=tFr/bDNr0OO/0SJ/HXIC8jcwBvljImmkfKpSVa+RnP0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=pBHBRpjTWlpphGFv4LaB+uR0Y1cQggc8bNVKCCvFkeaj5YUIDfW/cnYiuQwWB5p0E
 w6zWhsXN0y6YFsTqD90EkcTZfaFfC8Qg2j4/ggJzpLpQHwl+xwFuhOtWSsAKXsJ5z9
 3kJnufE8OrXGZv4CcpUqDxLUWBDtOblFQSPpYQEWP+siulZnaNPzROSpuLwx1HD5Qe
 KG0Wq/30qrwnquLiaKzYhe6odOB1uwBLJbBUoKrSJahgor9z/q6DXNZKXQ8M2T76tV
 Gl6h0VtOfc8xaxXybEUaPoOL0zUI5srgFUC61cJGNc0Vo1nXE61VnjWyVymaGfiFsM
 VjpW4fXXE326g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 9C23CC004D5; Mon,  9 Jan 2023 19:03:00 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211189] vgaarb overrides boot device unexpectedly with Intel
 and discrete AMDGPU
Date: Mon, 09 Jan 2023 19:03:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211189-2300-oDKm9ETiC6@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211189-2300@https.bugzilla.kernel.org/>
References: <bug-211189-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D211189

--- Comment #9 from Alex Deucher (alexdeucher@gmail.com) ---
No worries.  Can you close this ticket?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
