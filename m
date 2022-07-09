Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB7456C78A
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jul 2022 08:27:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DD8210FA9F;
	Sat,  9 Jul 2022 06:27:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14A7110FAA6
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Jul 2022 06:27:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 788A960C70
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Jul 2022 06:27:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D5B78C341CD
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Jul 2022 06:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657348033;
 bh=b39wv4T75z5CQQLz7c/sqvcxpRGLvDBbP1XAjDLK4uQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=pZYMKStiOgFJbKIsrL3+LKAgTbtv5n+1A8nJaIA+7yDccLFAvNILnNGOSg+FZoz7Q
 B2jVzY9VULiI3XLzQ5CXM2Pv+LCIWw2gJJcrVVIm9F4DGcoNiCK/68cFER88h4f+aG
 hmpo2Oi5K9SVqo18k16z+VI+3Q/szHd41GEyVFT8Q/touQfu7St0Brfqnm+GaO2Gnt
 +YvDRirTEdzGTGkmfpRVB5ibIz9u9+cVJFMYQdQ8F4D/FteVgcnu7lPmt3NOyG2YLk
 Wlbej/cv5LpMbtOky7zBSDdlYIhUuWeHfHxGhQF9LhNUmslx2RrvGDBI3h/WHWq8AO
 9Eby0rfviSbzA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id C3C4ECC13B6; Sat,  9 Jul 2022 06:27:13 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216224] AMDGPU fails to reset RX 480 after Ring GFX timeout
Date: Sat, 09 Jul 2022 06:27:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: happysmash27@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.description
Message-ID: <bug-216224-2300-XGd6xq9K2z@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216224-2300@https.bugzilla.kernel.org/>
References: <bug-216224-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216224

happysmash27@protonmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #301374|SteamTV-induced crash       |SteamVR-induced crash
        description|2022-07-08                  |2022-07-08

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
