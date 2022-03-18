Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2414DD242
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 02:08:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B88D310E8FB;
	Fri, 18 Mar 2022 01:08:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49FB110E8FB
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 01:08:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2A7A1615E7
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 01:08:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1F43FC340F6
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 01:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647565716;
 bh=DD2TSTvRHdD/MXdgO9pgSzT8oZKJXD5R7IbzwkwvA14=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=s537Nk9OCJTt0gZgmbmSUBFUI+0IUuygNu3MBecPcMp6gGeH1fXORIyuLjqmCKYur
 stXaPBmTZMOh3j+kd5cvyKS2e/ufin2AldDRjUm99F7v79njSTbLQ05ls0duuyYIaK
 CGRgM56NmgCH+dy5jxPCv1p0mIvkhtidH1lz7N3sStzJrLCZpWkn9+Bi8tOD/90ifg
 E1o5iGvmq9DBdOnhAl6ByZJq4vPBVYVg6KgGp+nnwpBdf9Q9EagTrheGJvGYursxRG
 zqZUp+9Ky6lujTbbYfwMjKwal4iLQfrP8kdySYaXzgr4wjsVQG4UOG33g1SNfmsQoc
 8yXtJKnuwC7kQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 01457C05FD6; Fri, 18 Mar 2022 01:08:36 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215652] kernel 5.17-rc fail to load radeon DRM "modprobe:
 ERROR: could not insert 'radeon': Unknown symbol in module, or unknown
 parameter (see dmesg)"
Date: Fri, 18 Mar 2022 01:08:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: OBSOLETE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-215652-2300-h98HV5Qrko@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215652-2300@https.bugzilla.kernel.org/>
References: <bug-215652-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215652

Erhard F. (erhard_f@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |OBSOLETE

--- Comment #10 from Erhard F. (erhard_f@mailbox.org) ---
I did not get out a meaningful result out of my reverse bisect... But
v5.17.0-rc7 abd v5.17.0-rc8 do not show this issue.

So closing here.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
