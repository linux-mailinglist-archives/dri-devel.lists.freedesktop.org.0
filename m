Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 538864852FC
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jan 2022 13:46:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC70410EBDD;
	Wed,  5 Jan 2022 12:46:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F8E710E7C0
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jan 2022 12:45:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A4379B81AAA
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jan 2022 12:45:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7FF8DC36AEF
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jan 2022 12:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641386756;
 bh=QczaVMa6h1Sz91fEwAGBRSJN3SpHJOtnU4bvt+PuYyw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=hfdHrLBxzLWbuqoUUdLfg5NdvGPqQ7r5xr88DVANasIJerTOvIaoRFreyCaGLiwbT
 kQsCAr5TRO3Rh5OgHFw3OR6Or1FqCF7++MLhaIdkJMCPVI5bj6ML2XWYRwqvR+YvYe
 PY2RKHQTy7xOMQfp6rEy/9vV0Jnzxly4sJiTZ7fECIjBdH3EQYm845x90XVtA7FBnt
 lbfzNk5aTFTaxc2JzxZ5b3ntpyWZHSWrdM/M13egegWJ973osCbk8JQlGIzO+wpOkA
 Bb0T2iw4X6Ieps1YgXslV0Em106PQpoEsPYqH2cRKSxO72p3nl8dVZgh3YSe8HpZ5G
 iuenLTDKe3kcw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 698B1C05FE1; Wed,  5 Jan 2022 12:45:56 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215445] AMDGPU -- UBSAN: invalid-load in amdgpu_dm.c:5882:84 -
 load of value 32 is not a valid value for type '_Bool'
Date: Wed, 05 Jan 2022 12:45:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: peci1@seznam.cz
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-215445-2300-iKLrKfl5eJ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215445-2300@https.bugzilla.kernel.org/>
References: <bug-215445-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215445

Martin Pecka (peci1@seznam.cz) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |peci1@seznam.cz

--- Comment #3 from Martin Pecka (peci1@seznam.cz) ---
I have this problem too on Thinkpad T14s AMD, kernel 5.15.12.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
