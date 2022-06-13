Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49931547FFE
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 08:58:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 091C510E9B2;
	Mon, 13 Jun 2022 06:58:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C16F10E269
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 06:58:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DCA0B60EF5
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 06:58:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 18421C341C8
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 06:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655103495;
 bh=3hBxXcIuDp/yvvOKF8OUnVAObrL3m4Q91QVSx3915cM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Y58oCTvIZwITy2ETyLKlTk/ICv/mdqDk1YmJL4uHTw7o2VerMUdIlxLV6E9+PRBl1
 3ci22oSUw/bLg7KExrMcDN0JySGtlvHIIvTq7vAvNgz2BXPaDfGeVxG5AdUfjXz/fT
 QPL0d8CX3JLVbGMXUP7XUnrmEnsizpLttpp5KTeWvSvrVB7I8I5E5svD8gpsM3gIuZ
 z9H36KqlcxWUOJN/MMflnug5i4bQy60j6YnZAWGA4pYuW20/9UAYagZq7T8ltWISwQ
 S+P/vHkpseluz9VVALgm/8tzUe3Ay5S6s5u/ndHDv8DtzUExzN9giuVfUcF2SvNBFj
 e/tuk1/YyHS8Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id F14DCC05FD2; Mon, 13 Jun 2022 06:58:14 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213145] AMDGPU resets, timesout and crashes after "*ERROR*
 Waiting for fences timed out!"
Date: Mon, 13 Jun 2022 06:58:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: emlodnaor@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-213145-2300-Un8H0pL8sd@https.bugzilla.kernel.org/>
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

emlodnaor@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |emlodnaor@gmail.com

--- Comment #19 from emlodnaor@gmail.com ---
It seemed to work for me at first, but just crashed again...
However, for me it happens more randomly, and I haven't found a way to
reproduce it...=20

I've also once had a similar crash in windows, so have been suspecting faul=
ty
hardware?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
