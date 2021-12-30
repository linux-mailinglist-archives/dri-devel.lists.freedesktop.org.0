Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 621AC481C68
	for <lists+dri-devel@lfdr.de>; Thu, 30 Dec 2021 14:16:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0CD510E229;
	Thu, 30 Dec 2021 13:16:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4621910E229
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Dec 2021 13:16:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CEACEB81C34
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Dec 2021 13:16:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A1D42C36AEC
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Dec 2021 13:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640870201;
 bh=z5iBEfOqK7J/jRaJLLbOIBTycsfclEOWRySkUDS+CGU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=meV8zV0+u6MXCgx+OcUEJiFS8soovV8dHkvLhtdllOIFBnsrJwwwjhiMGXgSLgC8O
 LYNAFAJMFef9bkNCl5KlAWvqLGSCOrbjPsZ/l4hGd4vGmzet67jGqwGMk+n09zLXSw
 zHiFdd7sgG2CR6mgm3QV/lTgawPy0HzpuZbeBTmY9n67kXXgxmcVeijtfWMPuzWpso
 IF4J08q+LcWDR9hSIK7n/VcRugnBw1KK1EyuaMU5mif75wl1Leok6UtrKQ2zh21QUz
 V8o7BDC3AFHtXje0za+H+zO5lFtUNavfH9ahH6J655k9PJ4ufg683PXEOcFxiC1CZy
 Wt3goMeenghiQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 8AB22C05FCE; Thu, 30 Dec 2021 13:16:41 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215436] admgpu: suspend and resuming from suspend don't work
Date: Thu, 30 Dec 2021 13:16:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: spasswolf@web.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215436-2300-ACvsFXGeDB@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215436-2300@https.bugzilla.kernel.org/>
References: <bug-215436-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215436

--- Comment #4 from spasswolf@web.de ---
Unfortunately I optimized my .config to make bisections faster, but now I
cannot reproduce the Hang with commit 2a50edbf10c8c56e930bfb53d8f9f00a33fd8=
37e.
So now I will start over with the bisection ...

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
