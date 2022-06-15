Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A0254CA08
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 15:42:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D04910EBE7;
	Wed, 15 Jun 2022 13:42:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4B9010EBAC
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 13:42:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 46F1AB8164A
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 13:42:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DD247C341C0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 13:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655300563;
 bh=V9zkBXaBxXHb1tfEPi/jz8iSy0HJyV/wDlKeZ7v14Fs=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=md8h3OJ7bgmkCDU6G1gqSfd0IArBLaynlSqmYGTmM+bCnt0I5ZdvTtt3bBtPQtTBn
 R8nL3zduA2ZpHfHmVKeEIvz2r3vgtNYolgDDBmAS2G1opIndZsKbCZgM2/LmW0nsHL
 el/Rl5C0RFE9dkCoC81/YQLB/kDg5LVAgvUKvFhR2/ZXnaJ8WQ7QR4jfDDj5ZZnXHc
 VY/VVRd06cLXz3ulKuO23ROlF2wl+WwRys6RVauCYcMAv1inIkJe89QFEN/dHAFo0c
 49DZrooqzIRuSYBrCO0FmNZdDSrwl4e72aTl0+G7VPq/H1UFHhBFIkSC5s1fUmVanl
 Fm9Do7iyJQCVw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id C228ACC13B1; Wed, 15 Jun 2022 13:42:43 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216092] rn_vbios_smu_send_msg_with_param+0xf9/0x100 - amdgpu
Date: Wed, 15 Jun 2022 13:42:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216092-2300-tbN5LTvQTc@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216092-2300@https.bugzilla.kernel.org/>
References: <bug-216092-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216092

Alex Deucher (alexdeucher@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |alexdeucher@gmail.com

--- Comment #2 from Alex Deucher (alexdeucher@gmail.com) ---
Can you bisect?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
