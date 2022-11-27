Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2014D639E2F
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 00:15:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 046ED10E0CB;
	Sun, 27 Nov 2022 23:15:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 302F610E0CB
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Nov 2022 23:14:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8519860F2B
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Nov 2022 23:14:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E89C2C433C1
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Nov 2022 23:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669590896;
 bh=o8e4GRFE6sBf26O2nX2eFdnVkHAc1A02IRstPed94dM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=D8PALCUJeLXNxVeYQOJDnPqAQID3uY4rCjcZSyXJ4hFQf/pSmWarVzEBqcVetPsiy
 3/tnLHI5XcVe634tqUbuodGvcG2IvWtmddvKPDMPCrDgfj4384BitlfJnnZhyPEKiX
 COG4sShQwOfQavx4xap8BIyVbplfmOfnkzuFI0H57kPmPiek5hlhyDdi3jxNQk++3T
 oP1qYfn/Mytow4cOKTOVniDhLtuY4ca9VZjZriMXZCUs8/ZiF+1S7a8bxDNB1NSaW0
 OY9SFS+rJBWkr9rB39Khf+h5P+s2mZ+82nfRWIykXwycPyhhNVP39ek2RLiLFmRB2t
 8uHEWPDiUyemA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id D418DC433E7; Sun, 27 Nov 2022 23:14:56 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216745] Kernel 6.1 breaks Thinkpad T14 Gen 2 AMD connection to
 USB-C dock Gen 2 with kernel Null pointer
Date: Sun, 27 Nov 2022 23:14:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ezou@outlook.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: OBSOLETE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-216745-2300-ZAgfpoffs6@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216745-2300@https.bugzilla.kernel.org/>
References: <bug-216745-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216745

Eric Zou (ezou@outlook.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |OBSOLETE

--- Comment #4 from Eric Zou (ezou@outlook.com) ---
I will close this one now (if I can) to follow
https://gitlab.freedesktop.org/drm/amd/-/issues/2171

as I believe my issue is a duplicate of that.

Thanks
Eric

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
