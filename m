Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1623B48768A
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 12:31:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE5421123B4;
	Fri,  7 Jan 2022 11:31:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27E141123B4
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jan 2022 11:31:51 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9574E6171F
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jan 2022 11:31:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0D026C36AF3
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jan 2022 11:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641555110;
 bh=9ycQd/7F8zrBxCw9f40LVefK5Yai+ghIz04g6Mx4ZJ0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=apxn/o335joYaypD2DB7utLHNiCEcjURBqo/wawr7DImnFRrkc7vDY7q6dA4wWbVj
 /cgwr7vS1K6iV/V4dbgKA6sH7jz+1/ph3Ok1ySavwq+uer4Q9qCPGXsNAy0pj/FbuG
 8sPTTEEGNjtOrdNd/qAP8Ux0ouMI/e1mlXyoG3m1FN1KtnfqjgmFOokWiVGqlNGRtD
 iV+tstzMdOm6euvYrornLMOIMjLxAunH60FIr0g+0bbVJuoyu0cZLTWzsz3jJSJyyn
 gOhtBjF0pRYJN6XDlq9o/JvoNunxiRtk23d2JlHG1qBCGiw5waEoFynfedFtqIzZuW
 8sKzhhIjf2Y0Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id EFC4BC05FD7; Fri,  7 Jan 2022 11:31:49 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215001] Regression in 5.15, Firmware-initialized graphics
 console selects FB_VGA16, screen corruption
Date: Fri, 07 Jan 2022 11:31:49 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(Other)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: regressions@leemhuis.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-other@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215001-2300-6SLWZVJdvs@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215001-2300@https.bugzilla.kernel.org/>
References: <bug-215001-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215001

--- Comment #9 from The Linux kernel's regression tracker (Thorsten Leemhui=
s) (regressions@leemhuis.info) ---
(In reply to Kris Karas from comment #7)
>=20
> ... I filed this bug nearly 2 months ago with the "Regression =3D Y" meta=
data
> clearly set; but the various kernel regression trackers

Which trackers? Humans or software? I'm running a bot, but that is still in=
 the
early stages -- and has no bugzilla integration as of now (but it's on the =
todo
list, but only in the middle), as the kernel's docs discourage from using it
most of the time. See
https://www.kernel.org/doc/html/latest/admin-guide/reporting-issues.html
(written by yours truly). See also the last section of that document.

> What's the best way to get a bugzilla report
> for a regression tracked so that it doesn't get forgotten or lost in the
> shuffle?

Docs on that are in the work:
https://lore.kernel.org/linux-doc/cover.1641203216.git.linux@leemhuis.info/

>  For example, bug 199533 was filed back in 2018, with a proper
> bisect even, but hasn't garnered even so much as a single comment.=20
> (Probably ought to be closed as I no longer have the hardware to test a f=
ix
> :-)

There are many things wrt kernel bug/regression reporting that IMHO need to=
 be
fixed or improved. I'm working on this, but I'm mostly doing it in my spare
time (except for the regzbot, for which I found external funding).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are on the CC list for the bug.=
