Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB39377D13B
	for <lists+dri-devel@lfdr.de>; Tue, 15 Aug 2023 19:37:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFA8B10E258;
	Tue, 15 Aug 2023 17:37:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F31410E258
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Aug 2023 17:37:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DC80D65E3A
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Aug 2023 17:37:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E1C4EC433CC
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Aug 2023 17:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692121067;
 bh=hawlOrVAxorP+V2/WZqFaBVF90gcOk8Az4wIlzu+4z4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=rEYez1Sx0tgobsgssD8mryaAU/yhFZfJUFPC+y4luCQKbk1rYCxynvgysIdy9zU3G
 PtySe6i1qXFAGmbj+KyBQ779JZSmYYTRlEdvdUMe3vXHJk4ac9JWpFKqZN/GNk8wxa
 OmSe7AqOJ9ZcvrlxGbkt4g+OwIdQIoOKkjTPVUTc8vIchedtbli+dGsn/5eb9entkQ
 C8OONomyDAO3mPHrjXpD61y3XCquK6Q1he70gsyB5k6FFxouemZ2kwMwr9k76x4rVW
 pdQvNOS/OhcS6RNZcMCcJwJkG0y0NVsH51Ibw+C8r6A3Y0nlAflYi/fid/2dHASMg2
 g7Ua7aza4UwLA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id D36CAC53BD0; Tue, 15 Aug 2023 17:37:47 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211033] [bisected][regression] amdgpu: *ERROR* Restoring old
 state failed with -12
Date: Tue, 15 Aug 2023 17:37:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: zaltys@natrix.lt
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-211033-2300-V5gdl3So9m@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211033-2300@https.bugzilla.kernel.org/>
References: <bug-211033-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D211033

=C5=BDilvinas =C5=BDaltiena (zaltys@natrix.lt) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
