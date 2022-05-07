Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E65851E4BB
	for <lists+dri-devel@lfdr.de>; Sat,  7 May 2022 08:48:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D76361125EA;
	Sat,  7 May 2022 06:48:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CC62112607
 for <dri-devel@lists.freedesktop.org>; Sat,  7 May 2022 06:48:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 456F6B83A87
 for <dri-devel@lists.freedesktop.org>; Sat,  7 May 2022 06:48:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 07217C385B3
 for <dri-devel@lists.freedesktop.org>; Sat,  7 May 2022 06:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651906092;
 bh=cxMvEeijU9vuFnRWmjv74Tkm0+C3qLiuBNos+9EqFUM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=hGk+GJ/K17m6Ns0H/Hxt7TFYHgpAZHpPMCRe5DyuxBd5x/eZuBJ+UT9C7EkS3wdro
 u3JzEEWu1hQglc2drdQOLCWVgiKDsO+PX1ZF5+CU8aAlRXHifFyk5N9j+LXwXKVSJz
 dcZe2aX8WK3uI+Uh9z1DmNvzDG8iXNqv0L6rjgm2jlHmSjwtnwi447EhsVO66IsBpm
 C0jhqpAKNzOsVrsWeePSStXYDCOxKpCgVCxaTOZl/SjTtrGSvYk6ShQKLnU4a8QCZF
 8pN8T/J6fy7888gehYhfM2tsqgYuYACYklXtV0jPXcxgm8vwRko2bqzzTdnr+MrG5Q
 fyRJBwDyYghEw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id EB56FCAC6E2; Sat,  7 May 2022 06:48:11 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205089] amdgpu : drm:amdgpu_cs_ioctl : Failed to initialize
 parser -125
Date: Sat, 07 May 2022 06:48:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mastercatz@hotmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-205089-2300-k60L2WO7KQ@https.bugzilla.kernel.org/>
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

--- Comment #39 from MasterCATZ (mastercatz@hotmail.com) ---
h.264 is fine=20

any h.265 does it=20

do not know why my dmesg logs do not contain all the spam when the gpu rese=
ts

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
