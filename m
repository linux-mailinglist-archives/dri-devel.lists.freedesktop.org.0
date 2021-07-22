Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 346633D2F9A
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 00:14:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CA4C6E9CB;
	Thu, 22 Jul 2021 22:14:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25EDE6E9CB
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 22:14:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id EE68B60EBA
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 22:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626992042;
 bh=P1kDIkeNA7BXT9IyrqSl8zDHMCMGwgqPYMLXX+NBRfk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=isbcnicG0RZLzyeLo95jbuSuQn4VvtcGl7WsxtDshgSIoduxBVpW2reqO9X6DOnlC
 US8ZWp8hBhHoT3w/NGkzgRXVRhGNEb7tAjy42b77K1+eNMaAPvOhtzHs4AB4+wmWAm
 1FAf3KooiZRgrJxnK31aawjAclIVvim+mkf//OF4YJCkje9hbSIiYzrpwv6Kpwe/66
 E2MJ7rpZw6KqogAEIew0bgToUmxIX2NmX9EmyN0cPkHpbF3fPA2UdNkq2w5PSS0ToK
 qG/2Yze7Oi1yEGs1NVO/53anHLbHqyXgevDOAIA33zJdIr/qNGcbcMqD+ifx2u0yrK
 3Jh6iUtMR/eQQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id E3F15602B1; Thu, 22 Jul 2021 22:14:01 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213823] Broken power management for amdgpu
Date: Thu, 22 Jul 2021 22:14:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: bruno.n.pagani@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213823-2300-tHDcskRtHu@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213823-2300@https.bugzilla.kernel.org/>
References: <bug-213823-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213823

--- Comment #5 from Bruno Pagani (bruno.n.pagani@gmail.com) ---
(In reply to Alex Deucher from comment #2)
> Please attach your full dmesg outputs.  Can you bisect?

Done. Unfortunately no: I=E2=80=99ve never done so before, so while I expec=
t to be
technically able to do it, I guess it will take some time for me to setup (I
have never compiled a kernel myself either), and time is something I
definitively lack of currently (several deadlines to meet each week until t=
he
end of August).

Since I can live with a 5.12 kernel (or even 5.10 LTS), I=E2=80=99m fine wi=
th it having
to wait until I have time to setup bisecting if need be though.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
