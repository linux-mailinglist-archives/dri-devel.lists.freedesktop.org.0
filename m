Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CF57E8B32
	for <lists+dri-devel@lfdr.de>; Sat, 11 Nov 2023 15:22:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAA2410E28F;
	Sat, 11 Nov 2023 14:22:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D080810E28F
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 14:22:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0BED360687
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 14:22:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 83135C433CA
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 14:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699712553;
 bh=nO2p4kBM96WX0bmpF1lH/MPoqbIIgqhV3p7nV37odN4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=kz7WJR3ZP8s9MumvtK8Lvwn/kOZA+WcSALnlSfF4Fj5gyCl94p3U9ezoUeOHY/SRx
 muydTiGGaJl97fR7pgpaD6T8dt4PBrUqvJl5xjbw89B3GM6a3AGm/K4NC+zOfCw+x9
 I5nkyrgcV8U2lo4n4v5hgn9S0qb7YhuP+f99vyDfg/WrSVS6FmjcZhg9GKHnh6dX4D
 dRzStaf1WSdeXFDH0f0sz+IQNzgWdL6aNrrI6OoLeJeb4nX6VymF8gnBQ7RePtfefV
 Tzi8beDu7YBWE/j8bCNS1O/pAArrW6GCoeiPuSWM3KD+aWoBhw145vsFjCTDuP8nca
 10q+siawai7uw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 6ED59C53BD3; Sat, 11 Nov 2023 14:22:33 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218134] Null pointer when rearranging screen layout in XFCE.
Date: Sat, 11 Nov 2023 14:22:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: gmack@innerfire.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218134-2300-fAGhqh3Yzr@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218134-2300@https.bugzilla.kernel.org/>
References: <bug-218134-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218134

--- Comment #2 from Gerhard Mack (gmack@innerfire.net) ---
I have discovered this happens when there are two monitors plugged into my
displayport switch.  If I run monitor 4 on hdmi directly, the crash stops
happening.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
