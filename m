Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A543354CA6E
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 15:56:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 914AA10F349;
	Wed, 15 Jun 2022 13:56:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDCEB10F0C2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 13:56:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 02D8561B65
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 13:56:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6C59EC3411C
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 13:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655301392;
 bh=6RHegslXZnvWMKKSkv0/Y/IL3yf4xn/PkU/azw2E0M8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=OMZiFMM3Hz/R8t6J46ElVu7EQdu4yqrJnsiCOCod9nvD0HyrekZL2qL1DN21HLxS0
 xGUXx/y/NogS7MM7hy200FQo5ras4A5oHzP29zv3ioIx19gXznon9bi3YrJqGVcOkt
 f5bd7ebejB5AfaWVMbrqfSIoyxJsnIe4oEqdv6QMvUaTYb6UQ7rb3FEG5oOHveBAZC
 PcxF/9KHSBQqlnTpV3HbgEQtVvnx4QGr4xiIwzQXrvdfklXDoX3ChBJDVLSqqUige3
 Qx5tQ4aRUsGaX0Cd5imBVhlGS+HZ5YMZMXmUrcJtHRxNwC6p63LsXmj4i6hCP3hw10
 YIF6gPm32A6SQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 4ED09CC13B3; Wed, 15 Jun 2022 13:56:32 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216092] rn_vbios_smu_send_msg_with_param+0xf9/0x100 - amdgpu
Date: Wed, 15 Jun 2022 13:56:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tr.ml@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216092-2300-fuQwKl1Usl@https.bugzilla.kernel.org/>
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

--- Comment #4 from RockT (tr.ml@gmx.de) ---
(In reply to Alex Deucher from comment #3)
> Does reverting c1b972a18d05d007f0ddff31db2ff50790576e92 fix the issue?

I never rebuild an Arch/Manjaro Kernel.
Will try but cannot promise.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
