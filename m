Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8B7799941
	for <lists+dri-devel@lfdr.de>; Sat,  9 Sep 2023 17:10:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BB4210E144;
	Sat,  9 Sep 2023 15:09:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BF0A10E144
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Sep 2023 15:09:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 736DEB808C9
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Sep 2023 15:09:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3341CC433C7
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Sep 2023 15:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694272193;
 bh=6x41uDxXTMDukce7+t+p7d3MUC1BYRRTEUdQX+9saQg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=lMajj81AC8tVOL4Rb3GHwtlQVx6BtbzmIIWmRAfnTMN8eiWj/1+QFXzr7clqHTTYq
 TnmrHF9L/6VllKFEsGOQJkH1aUkz9451/9TH95rKbaK81IMxfUwqEknfPfRcJ3L7dT
 bQfQ6yHhGpptNJXubxt4EeRbjmKA8vZ0mipo0UwYjm1v/zBZB9Zim3Hrb/FKd+oBJj
 snloFm0KfNsnmLNuymhYNz/IcvYZxbAxjrRSzYC/BiixQ+qnmMP3fMzmGVEJJiIEmw
 mq5siumEzpCT9X2tddLpKi5C7hJ4LDSqvf7paNvGN2NS83Ak6l4AtizZKl/KMeWfVt
 pWrkSmyH4dXWg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 1E420C53BCD; Sat,  9 Sep 2023 15:09:53 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217892] [amdgpu]: system freezes when trying to turn back on
 monitor
Date: Sat, 09 Sep 2023 15:09:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mmk+bugs@levelnine.at
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217892-2300-FXzOQtih60@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217892-2300@https.bugzilla.kernel.org/>
References: <bug-217892-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217892

--- Comment #2 from Michael Mair-Keimberger (mmk+bugs@levelnine.at) ---
Hello Bagas,

Thanks for the hint.=20
I'll wait for the rc1 and then try with the latest kernel.

FYI: I've open a issue freedesktop issue [1]

[1] https://gitlab.freedesktop.org/drm/amd/-/issues/2836

BTW, i forgot to mentioned. I think the regression started with 6.4. I alre=
ady
mentioned that it worked with 6.2 and 6.3 but i had problems with 6.4 alrea=
dy
too.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
