Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDEAE6665CA
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 22:46:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60B7310E0E2;
	Wed, 11 Jan 2023 21:46:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AB63897C8
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 21:45:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D8F1761E78
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 21:45:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 474B4C433EF
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 21:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673473556;
 bh=R4rAekWHtw888n+Ax4lWdYc+UPZhe/r7thenMaG2ALc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=i1hQx7EgGi7+/lZKzsd2Y9jWteuLt0aWsTNiyXBQ82zvYXf/2Nf4EQOOV2+UZXus0
 U6tjWLmEgMQBS8EuiD+RE1plVnaGTdNMfZS+v5YGq50UObQvUQPSDEJQk03uPoX+uf
 uu6LfHjcSDPi2rtJgpH/GjJUcrPmBl0U68tXECYkthR8oyonkZsgBK6q0D6E7Uzpd4
 yJn53hePXtlCEKS8PNKsETbnqQoBM65SpR0OdCjCmDO6XaEBKzcGm9eM0O9xAC0yoA
 MFou7l2KH7OWsRXO/TJ7uYzAU6I37DQv0IDlAZZcerwV9dyy69hBiov7HSyelA0aHH
 wHcFy2bNe1Txg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 2CA53C43143; Wed, 11 Jan 2023 21:45:56 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216917] hibernation regression since 6.0.18 (Ryzen-5650U incl.
 Radeon GPU)
Date: Wed, 11 Jan 2023 21:45:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216917-2300-hHk8SycPTD@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216917-2300@https.bugzilla.kernel.org/>
References: <bug-216917-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216917

--- Comment #4 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
> Perfect guess!

OK.. so we need to find out why this works in 6.1.y and not in 6.0.y.  There
are some fairly severe bugs it fixed.

Is it 100% failure rate on 6.0.y?

Since you mentioned that you couldn't effectively use 6.1.y because of the =
MST
issue, are you only finding it on 6.0.y when connected to a dock or anything
else unique?

> Sadly I don't know how to provide helpful logs. After reboot there's noth=
ing
> helpful in /var/log/messages

Can you check /var/lib/systemd/pstore?  Perhaps there was a kernel crash th=
at
got saved into NVRAM and restored by systemd on the next boot.

> Just wanted to say THANK YOU for all your help in the last couple of mont=
h!!!

:)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
