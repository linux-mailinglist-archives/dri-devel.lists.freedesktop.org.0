Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A89D07446C7
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jul 2023 07:27:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7785310E535;
	Sat,  1 Jul 2023 05:27:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 101C610E535
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jul 2023 05:27:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8045F60FBB
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jul 2023 05:27:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 89448C433A9
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jul 2023 05:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688189266;
 bh=C4k+NY4sXcFYBODaYQMU6dPCH26aJZlVjPalGpvHDYY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Ax/ikkITRwOouqTLujwwIMYJuy/9GFUnyHtPJL36lNMZ2kmeZvyPQzVSTY9fGFxLs
 PO8CYz2mhl3mbej7KhKr5waPb5t6/XeHtxHyx12Cm1tV5iXt814TLHz8WmGmQGO9x7
 +DqNpTO06muPzGYxnEAsb+Vaaa9EHcHLb0ObW3GnzhIHvQmnH5bOJv6TeXXkq+ZwFs
 tfU0MT8hUvZ3avwFNiB7m3LxCrHKKjwbqyPfyr2EAIK5cHCDtRdt6wDTvwts9IAuw+
 IRHFRrbL5myN9ohW0zkGXc38ygSP7nSo4SeOWd+dM45hCYbQyiLyj+ia2iZ9AOYNOh
 GUz+RMeFD+qnA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 7AF18C53BCD; Sat,  1 Jul 2023 05:27:46 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213145] AMDGPU resets, timesout and crashes after "*ERROR*
 Waiting for fences timed out!"
Date: Sat, 01 Jul 2023 05:27:45 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213145-2300-sGUCjLEFZG@https.bugzilla.kernel.org/>
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

--- Comment #32 from MasterCATZ (mastercatz@hotmail.com) ---
https://pastebin.com/Lwqayi9j
https://pastebin.com/FBgyNVrt

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
