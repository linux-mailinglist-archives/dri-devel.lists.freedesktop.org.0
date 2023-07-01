Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A757446C5
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jul 2023 07:26:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E16610E533;
	Sat,  1 Jul 2023 05:26:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45C5F10E533
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jul 2023 05:26:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8313260FAB
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jul 2023 05:25:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BB146C433A9
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jul 2023 05:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688189158;
 bh=juEy3a9Xx95oxY51Fag+zFNefoBc2WrlA70JM2gdXsg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=i9wt33dkDrPNUGiBYEyT+aCAob+xeXmYuOVKzW6I19pANXSfJRhq9zcbguXxlIBAb
 PA1/rZOhhLzzfuhXKEwDJDEPYQP8F+qqylhewTQBp+YPyEMEUvlBu45bmwtc2AVRks
 mlHMFftmGvFPeYylEb7utYoER0kerEDgHubUD9MDz9OWwXz+TzllKlPT5+RbvEwmWA
 32KnxXwD2RdCsWQMgBliX/YQ0iK1MzJIurE4ivbJ23Z98GyDpduEQUTV7bCduJ0VUy
 swDdK2ydek/+clz00ul0Lrzly0zTUGdh8jqA70Z+B618eoMtLock2wpv8SwN2sTiuB
 Epv+6c2p3bJ4Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id AAB27C53BCD; Sat,  1 Jul 2023 05:25:58 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213145] AMDGPU resets, timesout and crashes after "*ERROR*
 Waiting for fences timed out!"
Date: Sat, 01 Jul 2023 05:25:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mastercatz@hotmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-213145-2300-8hE6N7lcaJ@https.bugzilla.kernel.org/>
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

MasterCATZ (mastercatz@hotmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mastercatz@hotmail.com

--- Comment #31 from MasterCATZ (mastercatz@hotmail.com) ---
6800xt Ubuntu=20
I might have to roll back to the 5's currently in the 6's and its happening
every hour !!! pretty much randomly when I change to another video file for
playback=20
or when swapping between browsers with multi monitor displays

5.15 it was every few weeks

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
