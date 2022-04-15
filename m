Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DD0502E28
	for <lists+dri-devel@lfdr.de>; Fri, 15 Apr 2022 19:03:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92BE610E19A;
	Fri, 15 Apr 2022 17:02:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88AA110E19A
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Apr 2022 17:02:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E6B24622DF
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Apr 2022 17:02:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 57ABAC385AD
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Apr 2022 17:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650042174;
 bh=6MfgZxWzjigUvgAmGIGR8e2QE3p/S7bVIwybdwvStUI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=kiw6Csh/x7WMyPZGOunkRf0qUFUd22gejSNmDKmLyqJY93bd1YHCIU0TOvYs22XP5
 WEtitR/X1XfU1ndP8e4rYAZCkje0RBvLEK+4q7j+lSBNOCJ2PisJUO8wnxcGbg+ThJ
 WfRbwkO/xriMbOnGqaSIqMItrQooYkoeVZEP6foVj8XnjoP9Za+ud0AibmAN8kj+GL
 AWScgO7cNk5lr6rZgncotwNBFKXQ+GCrxQhy9CA4wOhIASGbDF3d4Db4a8Rwr4g5/l
 35OFoHp+j0WmewE0F6nUZ4DtvR2ZREmVlshQhCkBV05dnmiGQwm66diaIc9ySqiWXq
 RLHLxHrwZ3UzA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 378C8CAC6E2; Fri, 15 Apr 2022 17:02:54 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215839] distorted video playback with hybrid GPU (DRI_PRIME=1,
 Radeon HD 6470M and Intel-GPU)
Date: Fri, 15 Apr 2022 17:02:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kolAflash@kolahilft.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215839-2300-rjsjV7qHOa@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215839-2300@https.bugzilla.kernel.org/>
References: <bug-215839-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215839

--- Comment #2 from kolAflash (kolAflash@kolahilft.de) ---
Thanks for your assessment Alex!

Here is the Mesa bug:
https://gitlab.freedesktop.org/mesa/mesa/-/issues/6326
I can only set the status of this kernel.org bug to "resolved". But I guess=
 it
should be "invalid" or something else!?

I also found a workaround for Kodi:
Settings -> Player
Set UI mode to >=3D Advanced
Under "Videos" disable
  "Allow hardware acceleration - VAAPI"
Then Kodi will work fine with DRI_PRIME=3D1
Interestingly even without DRI_PRIME=3D1 full HD videos now play smooth too.
(maybe Kodi should leave VAAPI disabled by default...)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
