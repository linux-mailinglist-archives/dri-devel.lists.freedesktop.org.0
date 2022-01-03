Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5ECC482DA2
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jan 2022 04:38:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3207789D43;
	Mon,  3 Jan 2022 03:38:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BBFA89D43
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jan 2022 03:38:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A049AB80989
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jan 2022 03:38:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 43AAEC36AED
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jan 2022 03:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641181084;
 bh=efQKEakWKulZFX8OgdbBy2m0RpfZgUoTTH6PXl/4je4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=tQ8+nVSHP6UpSN6Ao8Q/JWV3aCLqEbfEXMwFrmbhCCwD+debQCiaCg67+3fLLYfw1
 NTiOcBgxO/K/nOm0sy1TKlgCcA2T8fKOwYFtUXqoq1hGc7llPSs4yMnyW1OYbWZoY4
 Y0Ef+IuWMVo4V4rOLd5mmomI+u0IZBnfdAnPvBbHTPAppCx/zQGxL0i0dQpzWqHpOF
 lrnOvyjyU0sy0j3HA45qO/XTTAwenVXciTZ4OVgttVJrpP4wW9zywIEVzzN2iqi1kF
 /irW3gPgSbEuRv7BsY6yBxhd7gyK1d753jF8hZX7wW0PEz9HTNXOqn2XWUplj+bwXE
 T+jjIvfxdBGpg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 2DDACC05FCC; Mon,  3 Jan 2022 03:38:04 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215445] UBSAN: invalid-load in amdgpu_dm.c:5882:84 - load of
 value 32 is not a valid value for type '_Bool'
Date: Mon, 03 Jan 2022 03:38:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bogdan.pylypenko107@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215445-2300-Sy305kxLv0@https.bugzilla.kernel.org/>
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

--- Comment #1 from Bogdan (bogdan.pylypenko107@gmail.com) ---
More info about system:
  https://linux-hardware.org/?probe=3D08b04c15d3

Full dmesg:
  https://linux-hardware.org/?probe=3D08b04c15d3&log=3Ddmesg

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
