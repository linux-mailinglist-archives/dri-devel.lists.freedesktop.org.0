Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD143DDAE6
	for <lists+dri-devel@lfdr.de>; Mon,  2 Aug 2021 16:24:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FD8D89E35;
	Mon,  2 Aug 2021 14:24:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0C0689E35
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Aug 2021 14:24:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id A276160F51
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Aug 2021 14:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627914262;
 bh=fitRTiQUMfMnpSLJIElFG7MK+p4BKdPnLOpLQ01KKVo=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=agHzPtrczcNhrD67ImrnbfWDGYxk9/fBX0NNgXMGNnB8dUnh5BLj5xfT37q3x7AOj
 SKnkP2f3D9K5zWT4pxbl9vb5Z+fcOdGQQQXpdGAXEB+i1fOYRHMKcFfP156Q2Ud0SD
 +LGEbgv8u/zHoAeElIwtoOil/1j9PP9n5PhKgmPgDr7x7wxtzdpqX+6qrwz6YShdvA
 XltTGWav2e5AZEfQpSkwEEJBI3ijpv73hB4Esy5X/BMeTvzaAzU2TxFfeKsUbcRjem
 qth6QjJY3eHbwCtbj2D5FGZgiweHN6K8IwCyRfi8SKdf4YAeeYXHjYIkUBoNGYKqCe
 vZq9n+0bCJdfg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 9FB8960EB3; Mon,  2 Aug 2021 14:24:22 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205089] amdgpu : drm:amdgpu_cs_ioctl : Failed to initialize
 parser -125
Date: Mon, 02 Aug 2021 14:24:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jesper@jnsn.dev
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-205089-2300-C6aM5X4Qrh@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205089-2300@https.bugzilla.kernel.org/>
References: <bug-205089-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D205089

--- Comment #18 from jesper@jnsn.dev ---
On 02/08/21 at 02:13pm, bugzilla-daemon@bugzilla.kernel.org wrote:
>Does up/downgrading the mesa driver help?

Upgrading to the latest git revision of mesa has fixed Dota 2 for me at lea=
st.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
