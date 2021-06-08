Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57ED539FD8E
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 19:25:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE4F16E21C;
	Tue,  8 Jun 2021 17:25:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBEB36E21C
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 17:25:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id BC4BF61376
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 17:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623173115;
 bh=GIiGPfDBEDWMYj18wxhxVJOFAx4Cp9tBp8yuIHf0NeY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=owEn+0doZu/cu4/gXszJZ34hmSW18jMUW2guE4om0DxNxJR9+ey1erHb3nolrGVTE
 Lkj2RMC4j+XocyIIOxvzhu1eDOjIMyl6r/025Qp24tX1oLUAIB8cpcm6tyJZSvOBc+
 T6geT+OkQvg8OnRshK3akoHu10dFH/Ed1gHguOa9kCnTVC8AU6E5p6hss/0nDbjoVp
 32p9oF3dbvqColqVWrYifMwXgHeOkDkoxf0RWwDN/lukW9CFbCwhM0KrRxNgs0BLp2
 U0k+bgjA32NzrAHEy3k3dCWaH26s8p6frLvTwUxIAYb0GoIyBrmT8lJ8COoMs/FdXI
 AwuUhKtmE8SYQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id B2AD560F6B; Tue,  8 Jun 2021 17:25:15 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213145] AMDGPU resets, timesout and crashes after "*ERROR*
 Waiting for fences timed out!"
Date: Tue, 08 Jun 2021 17:25:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: meep@binary-kitchen.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213145-2300-T9DrU1Vad5@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213145-2300@https.bugzilla.kernel.org/>
References: <bug-213145-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213145

--- Comment #10 from meep@binary-kitchen.de ---
ok nice :)

please report back to https://gitlab.freedesktop.org/mesa/mesa/-/issues/4866
with your config and that this fix resolved random crashes

thanks :)

(its not a kernel issue)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
