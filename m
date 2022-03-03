Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD134CBB70
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 11:33:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 988BB10E2E9;
	Thu,  3 Mar 2022 10:33:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B27DC10EA98
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 10:33:11 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4AACFB824A2
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 10:33:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 11B62C340F3
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 10:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646303589;
 bh=i5RL9qAxkT1qNIxRfszlCpnVICIBz+5XRh3X8eDNG68=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=F/oHIedLnjXgnlreoYph5fwUdOLXSHlMgEICGHSYb1lJZ7bhz+IRE2C0JdWdfSFUL
 35kNqX8nZV8xHZ5BhsLPQ6hErsyombbrk6Irghd5QJJxcLo45JNRbxkDjtTK6nGOfc
 mZ6eAFdme3zJRTUkMuSOAyVsWHrEYSjOVdfp8UcL/if16JhtnLAZT3baQ4xHrM1llD
 qcTauBiBYlBBH4Mz0qDjxe1kg3cZNNzo6WCGnbPedzcvtk5vIDrjAKEi55uIQwVkiX
 RQ0yUY91sX0y1eul+UGtq8GwBGDehMsdcuN708fuIgc/AVanetYA58mM3Bb9ZtCxgV
 BssVHkUUf5o7Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id E9F7BC05FF5; Thu,  3 Mar 2022 10:33:08 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215652] kernel 5.17-rc fail to load radeon DRM "modprobe:
 ERROR: could not insert 'radeon': Unknown symbol in module, or unknown
 parameter (see dmesg)"
Date: Thu, 03 Mar 2022 10:33:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215652-2300-ZW52HAcQ96@https.bugzilla.kernel.org/>
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

--- Comment #4 from Erhard F. (erhard_f@mailbox.org) ---
No I don't use an initrd. The kernel to boot the Talos is on a boot partiti=
on,
modules are loaded from root partition. Which worked in 5.16 and before. No=
w I
am getting this "could not insert 'radeon': Unknown symbol in module".

Though this may explain the 2nd error I got when building radeon statically
into the kernel. I'll add the firmware in-kernel and see if the error messa=
ge
changes and whether it actually works then.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
