Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B59642379
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 08:14:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 760F610E0F4;
	Mon,  5 Dec 2022 07:14:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A80F710E0F4
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Dec 2022 07:14:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CE2C760F89
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Dec 2022 07:14:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 39E24C433B5
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Dec 2022 07:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670224448;
 bh=nC9bcVDg3qIZxSEISNlNNclwPJsMMOzbPQmXs3ErVck=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=LjZaZVLTZe1kcXoBFaNSI5giVfC7dIbn2V5amvtIl0U4SqfC2qYBICL3p8GsN+jwc
 G8Afc4F1xOF8FG7SMczoAoABBuJgxy88oJjNrI7fOSRf+7SArDuWRftNRKcXAsUW3h
 OkH8jKMP7tdvyjtAtY8RLywB/92qmjdoqEpcLAYRng8nr2PXsUd4RexQfejBZCB43E
 3GtDGWc2ajdq/SdUjQRzTB0j34jZChHw8C2Y6JepVnmC7ueOYWCp3kfqFO/2AkuGBa
 Au4gqIPUxrXrpZNVPII77lDKG7jrEq/eri/cK3Y1Eq6zgVnUaer2R6ndSKQDieyVqE
 ZdylXuuQ4SovA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 20B5BC433E9; Mon,  5 Dec 2022 07:14:08 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216774] On amdgpu the drm subsystem lists additional modes
 beyond what EDID has available
Date: Mon, 05 Dec 2022 07:14:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-216774-2300-vjADnYhQ8p@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216774-2300@https.bugzilla.kernel.org/>
References: <bug-216774-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216774

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #1 from Artem S. Tashkinov (aros@gmx.com) ---
Please search for dupes here https://gitlab.freedesktop.org/drm/amd/-/issues
and file a bug report if there are none.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
