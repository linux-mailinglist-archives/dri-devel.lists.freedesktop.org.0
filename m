Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB1C54EA67
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 21:55:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5776110E343;
	Thu, 16 Jun 2022 19:55:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9E0310E343
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 19:55:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 61D7D61C27
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 19:55:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C7979C3411F
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 19:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655409319;
 bh=+jMwVehOZ94KoElEiLOUmDWABbfrpdvec84aZraPIn0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=BXfU1IUnMt1QfX4z5GkObhiXe0eel9ZNNvgQbqFwt9dWFVBDidcmBqL5BtCVmE80k
 iTOBYLfS7G9YQ9q5PndGbv0E9fBkdE6vU0Ctxt+NHHtJVHHnZSzdutW8CK4QuRK777
 9Y+r8aEWKokxABk36o7/kh8yIKeSfFVlsd8SueSEdy5n0th4nt9isj3Ig/t9hODN1K
 zMDv4LObbcOgDWb2D92FSuCXuiKYVvD8tuIw2imjaPcgke94Ku1kKcseWe26ABE30f
 IxyvHnkqRelx/y00Ht9MLkW/yIDPEDMew8y06Hmj5t4Q35PzPCyVLKs7qIxDcT8OfF
 4E/RkLFC7suRw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id A74ECCC13B3; Thu, 16 Jun 2022 19:55:19 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216119] 087451f372bf76d breaks hibernation on amdgpu Radeon R9
 390
Date: Thu, 16 Jun 2022 19:55:19 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: h.judt@gmx.at
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216119-2300-GuturyTkwe@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216119-2300@https.bugzilla.kernel.org/>
References: <bug-216119-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216119

--- Comment #10 from Harald Judt (h.judt@gmx.at) ---
Again, the same applies to 5.18.4: Reverting the fb helper patch gets me a
working resume from hibernation.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
