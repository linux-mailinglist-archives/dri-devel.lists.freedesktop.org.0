Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B573F7AF7
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 18:53:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFD7D6E3DB;
	Wed, 25 Aug 2021 16:53:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A10E96E3DB
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 16:53:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 7EACC6108D
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 16:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629910390;
 bh=wzmn3kdpOwYzDaYyhY7iMwtd0nkQ/IebCjFNSlrB8Us=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=mkURpEEzHUc+9LR0wNdBpGeqTzx8mt1bOF8xIiqYo6kMz0PlTedys2dkvUYM1eU3w
 +AUvl7JrUCuOU1zaVdsjSqrM4qGenQH9XatqoD7x6LkN0Gt32Bc0Eta5+NJFHAOueQ
 fwprSvsse808kehwIAl6hEC3EicXM71EjFC7NA1XGqQ2CzMH4Tq8kptFPMZRpqPhNK
 7OY+gxtwc3YkvYfLd4mpr3LiBxT0i3j8f5AIvVaJrYimiT/pFAhaGOULd/5rB9I/ml
 flwhhA9lH8iEHcfbf1zf6PAlZjDxffreBkmy14UzENDenuoCcjxDY9Th+kNO/PPq3T
 pdfWcoWWj8KgA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 7C87361003; Wed, 25 Aug 2021 16:53:10 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211277] sometimes crash at s2ram-wake (Ryzen 3500U): amdgpu,
 drm, commit_tail, amdgpu_dm_atomic_commit_tail
Date: Wed, 25 Aug 2021 16:53:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: me@jeromec.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211277-2300-C0prBkZvD2@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211277-2300@https.bugzilla.kernel.org/>
References: <bug-211277-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D211277

--- Comment #38 from Jerome C (me@jeromec.com) ---
Hi James,

With "pci=3Dnoats" set the suspension and resume works fine

I did see some errors ( something about device not added ) in the kernel
log from "kfd" but I guess that's related to PCIe ATS being disabled
with the kernel parameter set

Thanks

Jerome

On 21/02/2021 00:17, bugzilla-daemon@bugzilla.kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D211277
>
> --- Comment #9 from kolAflash (kolAflash@kolahilft.de) ---
> I'm on Linux-5.7 now since 2021-01-26.
> And I woke up the notebook at least once a day since then.
> So it's clearly a regression in the kernel somewhere between 5.7 and 5.10=
 and
> probably between 5.7 and 5.8.
>
> And it's definitely not a BIOS issue, because I changed anything about the
> BIOS
> since the problem appeared last time with Kernel-5.10.
>
> Regards,
> kolAflash
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
