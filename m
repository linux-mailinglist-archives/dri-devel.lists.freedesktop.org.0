Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E3D4A31B8
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jan 2022 20:59:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 268F810E164;
	Sat, 29 Jan 2022 19:59:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95E2510E164
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jan 2022 19:59:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3D1D2B82812
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jan 2022 19:59:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A4528C340F0
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jan 2022 19:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643486342;
 bh=dv3kT11lb4NNnn4tmfWFmXyGU+Xc4WkMrnv93nzBVlE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=CPIqWSVtdxsJj5sFoTb0n4p/NFOiTvho1hUwHY1R+D25ptKQadKtGdlH1hxYghsYX
 66xTyk3s0oRNTgOkPLf3UqeyaSyFS8TOB6eo46ENLAZ0xUZylwt44JXbLZ5ZpULqAc
 R1TDKrluKeFwR57u4iFNa2azCi06Koc0AaC+YagNVmRJvq/0fLv2AYbnfRiYQz2sAS
 hJG1zJXffuPl7oq0RpiyCbsCt86gSgjMvDcEgdv8r1nML80gDnfY+Ntqp1Xmwm7tmm
 lKWAS88a7TF5FG8cRDPtw1aD0i3pp/kqbbnxJZtunezwkt1a8YEbDsmGNdieyo3Gor
 epyskIAWy07Cg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 8BF09C05FCE; Sat, 29 Jan 2022 19:59:02 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204611] amdgpu error scheduling IBs when waking from sleep
Date: Sat, 29 Jan 2022 19:59:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aeon.descriptor@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204611-2300-NpjsLZNboP@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204611-2300@https.bugzilla.kernel.org/>
References: <bug-204611-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D204611

--- Comment #13 from aeon.descriptor@gmail.com ---
I still have this issue, but I'm using the latest Ubuntu 20.04 patched
kernels, so I don't know how 'latest' that is.

What kernel versions work?  I could try them out.

On Sat, Jan 29, 2022, 2:55 PM <bugzilla-daemon@kernel.org> wrote:

> https://bugzilla.kernel.org/show_bug.cgi?id=3D204611
>
> --- Comment #12 from tones111@hotmail.com ---
> I haven't seen problems resuming from sleep in some time.  Is anyone still
> experiencing this problem on newer kernels?  If not then I'd like to
> propose
> this issue be marked as resolved.
>
> --
> You may reply to this email to add a comment.
>
> You are receiving this mail because:
> You are on the CC list for the bug.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
