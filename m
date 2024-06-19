Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C1D90E2D9
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 07:48:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB74D10E06F;
	Wed, 19 Jun 2024 05:48:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oZtXB5XG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 010D810E06F
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 05:48:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 7E6A4CE1D42
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 05:48:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A96F1C4AF53
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 05:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718776080;
 bh=RhS3HNSv4A/7O6lNl1Kpj9YEJxN33shbD+v7NzCmufE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=oZtXB5XGPX44Ki/ZKE26YKgrapH2+13vTueMhtyU+7bZKwWWTteXnxcXG8HoyJs5N
 WHub03MmqzwRozf1DkO1nsxA8zNFx8KZ5bTUTG/oFvy8O/y5Tl9YF1L0s6nELT/yhJ
 nV0nGDLS3ATvwzoBgZw0i4Y/enw+dYTHsXDTayehiQtoVcgg/1VXn9Y6+WvXY1fEaN
 AGfjw6N0uOGy5/IZW1vz3jMyAjtKj5YWPOU2MriNEGSmlGKmb87kdyguJS07LUxjvA
 XR0kuxQ6eKxN9RTjC5mQRr3SZJQrLqUm2S0HpHpRVG7/VMDNltIuZaGD6oGqqCtKzE
 1Eqj2o4c/JTeA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id A131FC53BBF; Wed, 19 Jun 2024 05:48:00 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211807] [drm:drm_dp_mst_dpcd_read] *ERROR* mstb
 000000004e6288dd port 3: DPCD read on addr 0x60 for 1 bytes NAKed
Date: Wed, 19 Jun 2024 05:48:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: jiloxe4653@elahan.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-211807-2300-Ls7jxBb9nq@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211807-2300@https.bugzilla.kernel.org/>
References: <bug-211807-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D211807

TiaPadavano (jiloxe4653@elahan.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jiloxe4653@elahan.com

--- Comment #26 from TiaPadavano (jiloxe4653@elahan.com) ---
This game is an epic adventure with breathtaking graphics.
https://lafontanacitta.com/blog/what-time-does-mcdonalds-stop-selling-break=
fast/

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
