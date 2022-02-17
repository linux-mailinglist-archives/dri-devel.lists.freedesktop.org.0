Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BB84BA7C1
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 19:11:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 554C710E642;
	Thu, 17 Feb 2022 18:11:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 633F710E623
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 18:11:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9D693B823BD
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 18:11:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1BB06C340F3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 18:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645121464;
 bh=nnqvXfiEotahpw/qNou/tLDzrpTKTy4NPShBaPlyWH8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=FTDQ/d1kX5C/L/GWCmxRSx0qYDRKVG0HNEMPNHlDePWjKmJmiH3U4+j0ezpj1Bfsa
 TM0zdrKNyFp3zme/PC0Y7CdmJ5y2Baw1aRPKqxGT6N5jKdGhkrFrh+V52CObYHz8TB
 S/DkSMZ3zS9nnZJIuyPDmk/98LMqY9o3nqYmM9N08i4o2E9wf0UCWiZvRhzrIf/Ei5
 Z0dK9ckiVcsx7w7LcZWxL3/hpWfaZaCgv1Cqlrxru3sTg8QQl3Hoo+gmP/+pVqtKX8
 bO4TtQbbf8Rr6vKCvp79+7wj9xt2X8Q67Xzt3GokokmGR7U2cy4OGh4JVule/3rGE1
 i66RXI7mG+ypw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 0BEC9CAC6E2; Thu, 17 Feb 2022 18:11:04 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 121831] Several kmemcheck: Caught 64-bit read from
 uninitialized memory in radeo
Date: Thu, 17 Feb 2022 18:11:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: casteyde.christian@free.fr
X-Bugzilla-Status: CLOSED
X-Bugzilla-Resolution: OBSOLETE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status
Message-ID: <bug-121831-2300-uxKEhZI3e5@https.bugzilla.kernel.org/>
In-Reply-To: <bug-121831-2300@https.bugzilla.kernel.org/>
References: <bug-121831-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D121831

Christian Casteyde (casteyde.christian@free.fr) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |CLOSED

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
