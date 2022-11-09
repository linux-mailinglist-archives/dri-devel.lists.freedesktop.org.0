Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FCE622C1E
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 14:08:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB11D10E038;
	Wed,  9 Nov 2022 13:08:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 580A610E0AB
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Nov 2022 13:08:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0946BB81EAE
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Nov 2022 13:08:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BB968C433C1
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Nov 2022 13:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667999314;
 bh=bfdXH1XB1f2vjpulfWycYXyqYQ0aMBSeW/GHCwZSFJU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=cuHpNWYsB+R1fKaqFU4ke1CPDz2AsOyBK3LSB2ag98UqQRxjQCJ9LrBodJQNb/21o
 CHyIFDe2j2ccb0wunCAenzZBOksq/r38xJsRjSkD4Xso1y704IjrYML62ZC4ucGPu7
 klN6NXhRwwQGHOQJ20Js3eMY9jeCjePR1MFIf2S3dYzeb7kYqmdTP9pUhqanMsUzmw
 EN7vpUGiE9PDpDE9Xv4I0kw3Lx0XGBTl7NkWt/q+s8hN4SHmHkAI3u+pUe0BIHuGIM
 pnJkSAiC6C5NGDtrb14eMmq3kz0JKNiIs0d/owrcbonf/2AWEw3i0UwWkfn7NS1LEA
 MAPDM3EHnGkIQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id A771FC433E6; Wed,  9 Nov 2022 13:08:34 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216673] Recurring amdgpu freeze on kernel 6.0.6 only
Date: Wed, 09 Nov 2022 13:08:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: stanislav.modrak@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216673-2300-knlp7OIqTs@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216673-2300@https.bugzilla.kernel.org/>
References: <bug-216673-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216673

--- Comment #3 from Stanislav Modrak (stanislav.modrak@gmail.com) ---
(In reply to Artem S. Tashkinov from comment #2)
> https://gitlab.freedesktop.org is where it should be anyways.

Can you please explain why it belongs there and not here? Thx!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
