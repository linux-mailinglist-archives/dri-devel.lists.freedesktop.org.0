Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D8148CD0F
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 21:23:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EA4D10F93E;
	Wed, 12 Jan 2022 20:23:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52FBE10F93E
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 20:23:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8860060E16
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 20:23:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EF6C5C36AED
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 20:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642019013;
 bh=FvARl0bqBqoIkbUBZ9gMaDtBVjRYfkGbgm/nIHy9tn8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=DsbsgB0TAV2SfmGo0T/hS7Bs/AR6yTUHHkewMPhcj7umqGQRi49B+Sxn/dnkFdpST
 M9hQccqLvoTiFURdKTdHOoujLb0YfZVhAJqN1I0QWumbnQxUDnZ4kD0vE+oEekPrZE
 BuO354Tt7mXJyzfaqsBd26UI7Fa+iEY/V8l0TOPJv8bjXjAqSF0iurigebxAJupLbp
 xUd7oQrH83y2HwDE9CRE5us+GKmVyANiGDAt7+22MzPWaPT9gbcgr7CWCvYbyFaMzL
 AcZVVzlO6BI+7aHTI1t+IhfiaBu6cPQkaM6apTbCjtELWFKmZOwPAo/xGfn3T0Um+S
 Qvsq19hgsA9hQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id D7840CC13B0; Wed, 12 Jan 2022 20:23:32 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215445] AMDGPU -- UBSAN: invalid-load in amdgpu_dm.c:5882:84 -
 load of value 32 is not a valid value for type '_Bool'
Date: Wed, 12 Jan 2022 20:23:32 +0000
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
Message-ID: <bug-215445-2300-mU7XfHVp9b@https.bugzilla.kernel.org/>
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

--- Comment #7 from Bogdan (bogdan.pylypenko107@gmail.com) ---
UBSAN <- Undefined Behaviour sanity checker
> Compile-time instrumentation is used to detect various undefined behaviou=
rs
> at runtime.
> For more details, see: Documentation/dev-tools/ubsan.rst

UBSAN is just a technology that help to detect various bugs, not a bug sour=
ce.

I resolve problem by kernel rebuild:
- rebuild 5.15.12 with different kernel config - have no UBSAN warnings (big
changes made - can not detect which kernel config parameter resolve problem=
);
- update to 5.15.13 - have no UBSAN warnings, have single crash in amdgpu
driver with closing X subsystem (sysrq helps to restart display manager);
- update to 5.16.0 - have no UBSAN warnings, but have high latencies (12-15=
 ms)
in [drm_atomic_helper_wait_for_flip_done] in high loaded mode (detected by
latencytop program).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
