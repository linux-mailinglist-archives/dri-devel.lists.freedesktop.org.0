Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B95E6483666
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jan 2022 18:49:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDA6889F99;
	Mon,  3 Jan 2022 17:49:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D801C89F99
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jan 2022 17:49:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 53C2261194
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jan 2022 17:49:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BE24BC36AF0
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jan 2022 17:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641232168;
 bh=AmASLWhdam19iDO7UkWvouE8KKVRh0aNrfXmqt25Iy4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=tR/o5fk2wCyLm7Yep8OP2eas/hhJ+7dN1BzWwMRiPs0qe29SkenXdkKj1yt1FBFFD
 eYc0DfX5f7hlW2ePW73ZNH2CfmwZ2eaQEw5fa8kM24hnKkgtVGWCjUKVxDhcCfzEcI
 v0eUsEZjYTx1q0KzPd2hmnRu4vJD3tjpBS0mvkqhpUf+CHxcDxbrxpbqe9deRIr7lb
 wvucjAPEaq9+vYfNQMnuYJp21rLX1hqTx58H9iGbsj/hU2M5JcwUdwaBmOmaEd+Bw+
 15EJbTJ+QsCOix8HRyrmpkxLGNHnS5IAVDJ7ywfCTWYqgdMDWIAZD/rulAbjmGdZsq
 qnUZviGkHhrig==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id A63BDC05FCA; Mon,  3 Jan 2022 17:49:28 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215436] admgpu: suspend and resuming from suspend don't work
Date: Mon, 03 Jan 2022 17:49:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-215436-2300-3vRmAXrVj2@https.bugzilla.kernel.org/>
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

mario.limonciello@amd.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #300214|0                           |1
        is obsolete|                            |

--- Comment #17 from mario.limonciello@amd.com ---
Created attachment 300215
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300215&action=3Dedit
Possible patch that ignores WA in s0ix w/ debugging statements (v2)

OK thanks for trying it!  Here's an updated patch, to try to give an extra
explicit call to update the clocks again during the suspend path.  Also
included a debugging statement so we can see the state of the variables that
matter in each call to update_clocks.

If you can please share the output from your kernel log again with it appli=
ed.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
