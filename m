Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB89793F07
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 16:36:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 874C410E683;
	Wed,  6 Sep 2023 14:36:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44A8D10E683
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 14:36:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EA426B81A0D
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 14:36:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9BE39C433C8
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 14:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694011009;
 bh=5BBRCYr1Ha1BlH81o9HyjrCJ4p+21+ue4tor94s8lLU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=QrHkQSJHn0xH6ER/BwcmrmWO5h50MrlWebXKtSAbKGBzXS9/W8vmJCsT1xOtwhK54
 5hhUMqb32UYwuoCfACQ9Wdod/OQZFYA2D+vyjn6EMDexQGblRGr/0E9Y0udaEj2/ob
 8Hi0dZEE78BUCarh2Ci+Axu370qqKTgSd8mayHpG0pMGKuPdEzNe3kaNQXsvDt+BYw
 tTPfwoa5k1Hj/0/ZHsKgpW1NwOAYMarfH/0jl7bjrExtFfUXrSKvbu9LfAUapZGGTu
 6RgI6sAPYkzZ7+gclgC1Xx+WowxFTOakHk3KdPhTKMor5t2Joq7f653wxzom1XY4Kv
 DODYLDYTrscxQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 844FEC53BCD; Wed,  6 Sep 2023 14:36:49 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217876] RIP: 0010:calculate_phy_pix_clks+0xd1/0xe0 [amdgpu]
Date: Wed, 06 Sep 2023 14:36:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: rondo.sp@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217876-2300-jkyH4qI5Uz@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217876-2300@https.bugzilla.kernel.org/>
References: <bug-217876-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217876

--- Comment #2 from Chema (rondo.sp@gmail.com) ---
(In reply to Artem S. Tashkinov from comment #1)
> Please repost here: https://gitlab.freedesktop.org/drm/amd/-/issues

Done, I put the link to the bug here in case anyone is interested in follow=
ing
it:

https://gitlab.freedesktop.org/drm/amd/-/issues/2830

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
