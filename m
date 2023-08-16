Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1A277E367
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 16:18:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D3FA10E1E0;
	Wed, 16 Aug 2023 14:18:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7962610E1E0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 14:18:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DA84A63902
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 14:18:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4EE45C433C7
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 14:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692195505;
 bh=3GsvXgvXsYKJpkDpN4clTgho4KbREc3Jt7IdVCwL6Q0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=RJYuXCEpMlgBwxeRg7XljspOMJCWqinuZ3x+Z+GZZ+2D7lpMDmbWgOWMBFyjoQdBN
 dlKs1Q90ZiWw5oXI79m8UL9G2gc4mpTZCMFGZaMQ5onMzLTBfnyRAapd7v44Q/ukPa
 Ffb9TxOZDnrBQZS0YWuEiGHRJZiZu3YzBUHXdV1z5Y01ZH/Th5neR4+WX2cgwU/hb4
 7bhCAOaUk+3+CEkBURSlVfdGsBm8erSV6xHvtMDb3Yn2AeVcqItQC+viQkp1Th2LBX
 Z1d+NWFcxezu0dkX/58Xpn3N3KootjsOTZA6VN9nVOeyTZ8MdQ78crQ3mKM40shj5N
 Va7EFQjcs8rcA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 359A9C53BCD; Wed, 16 Aug 2023 14:18:25 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217797] [amdgpu/mm?] HSA_AMD_SVM=y causes/triggers PAT issues
Date: Wed, 16 Aug 2023 14:18:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-217797-2300-cAXhxSICa1@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217797-2300@https.bugzilla.kernel.org/>
References: <bug-217797-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217797

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #1 from Artem S. Tashkinov (aros@gmx.com) ---
Please report here instead:

https://gitlab.freedesktop.org/drm/amd/-/issues

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
