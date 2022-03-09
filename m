Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A2D4D314C
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 15:54:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4849A10E4F6;
	Wed,  9 Mar 2022 14:54:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A38E10E4C3
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 14:54:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 84DFA61092
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 14:54:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7F095C340FC
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 14:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646837655;
 bh=/XawhuWDz59ju6W3heR0tlbnbiiYnvDbez/JPYwBvXY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=iBS4paMndB5HsfX6Ti5CasTEWcc83tkJkM35p5fouQmZZHtsrTxgHscm0pUOH0WZD
 YV4z4BdK1nLOGYuDEkk2rKiWlvTXa/w6inAp35hSk3ErAgPELrWX4HS5Zt3qryZiYd
 pw/wTmVnuIyvnm/mQEODkIuBebilTIJmypbzV/eh1bOe8598AI8f2tqAJvELLgxgot
 CJzPmpbcmHEI6KWwUvvbfy5ckQnNsRGNVEJx1Z9aOv8j3UX0IKtP1QIT18WuuzVQOD
 BSwl105r9itrKluhEkicQAkdAZurcK1uKvfLCDS2rND+XRxWaXf6tiJAPqA1K4eiNV
 g5IOaWyZ+7EVA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 6DA75CC13AD; Wed,  9 Mar 2022 14:54:15 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205089] amdgpu : drm:amdgpu_cs_ioctl : Failed to initialize
 parser -125
Date: Wed, 09 Mar 2022 14:54:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-205089-2300-6yVrcuRLPd@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205089-2300@https.bugzilla.kernel.org/>
References: <bug-205089-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D205089

--- Comment #33 from Alex Deucher (alexdeucher@gmail.com) ---
Please try newer or older mesa drivers if you can repro this with a particu=
lar
game like dota2.  The kernel driver is just the messenger.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
