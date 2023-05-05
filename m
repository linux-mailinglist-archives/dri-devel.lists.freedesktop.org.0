Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B2D6F7E83
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 10:14:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE78110E59B;
	Fri,  5 May 2023 08:14:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB1E510E59B
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 08:14:51 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 16AEC611AC
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 08:14:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7C0F4C433D2
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 08:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683274490;
 bh=97G1Lns8P3rWdBcEnwegJhd5KXGG5rb1vgspHm1zTBE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=BykML3upAbzCguZHVNRtxzMsEdzCmt34B8buv2ekbL4jm2evHwL1fI6vSP4mewyBp
 A6FNU6bBEKYCajhsPvZSz4r0+dwV3DbtcFV6FNmrdHKvBPsnh10EYdRv7SbQnQtD69
 jomsm29amDiyhOEMEBVsYzEXdYA9fD5leUmXU9Sl5AvLtL9a/dtKlmdrr7y/lqpVt9
 PYThy5KOlvLgQKqBy4jO5Ukr3d5Sqo0T97cbqMDLcJI+oMvk9WvNi2z/sXoqomr7hQ
 SQVIbPZ/HEFBUowsDFOM8A/07v5ExBwtdGtJGPiHcP5BLvPdnTYfRmep95FecqL0wC
 U3tN6QB8foSwA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 6E8BBC43144; Fri,  5 May 2023 08:14:50 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217398] amdgpu module loading breaks display output - no signal
Date: Fri, 05 May 2023 08:14:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: a1bert@atlas.cz
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217398-2300-7IkB5jyk3z@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217398-2300@https.bugzilla.kernel.org/>
References: <bug-217398-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217398

--- Comment #5 from a1bert (a1bert@atlas.cz) ---
https://gitlab.freedesktop.org/drm/amd/-/issues/2543

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
