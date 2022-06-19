Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DD8550BDD
	for <lists+dri-devel@lfdr.de>; Sun, 19 Jun 2022 17:33:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3EC710FA3D;
	Sun, 19 Jun 2022 15:33:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E0EA10FA34
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jun 2022 15:33:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0D89EB80D2E
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jun 2022 15:33:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 583FDC341CB
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jun 2022 15:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655652811;
 bh=BmsnpOojbVrnLNbOKOHliQETDSsBw2f+JPs/HBeWwTI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=YeFtzxux3cy5oe5ANIiXaWRqhgHVTCk0TfB+kZ+xDU2kwerS2iTrQgHCO/EGAQg3y
 72lWMRvu3O31WVkxmHAFhm6Et/rLC3gEr5Gz5JmCkd9MyLzVkF983KQaUqkr96vQB4
 JoGSohdSs5tTs7RsEKRQ7RjbvttDCv/5Gg+2EDFssEz2BjugR9kluZIpjpLcBZsbMl
 HCJQyY5AdzKhI/jxQTwaRyvtX3JMI0c6CLblUKY3u9at0AtAltKuzjzFC/ytbXs+bc
 6EyQeQlSW0GIth/SMGIEAcql3eTkSzRXB1Rqh64Vcq+4Kx75KtzNQ3HRUnfb9I23dQ
 Z84z1I9zrNvnA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 4194AC05FD6; Sun, 19 Jun 2022 15:33:31 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 172421] radeon: allow to set the TMDS frequency by a special
 kernel parameter
Date: Sun, 19 Jun 2022 15:33:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: enhancement
X-Bugzilla-Who: estellnb@elstel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-172421-2300-DcbiQdZKYp@https.bugzilla.kernel.org/>
In-Reply-To: <bug-172421-2300@https.bugzilla.kernel.org/>
References: <bug-172421-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D172421

--- Comment #22 from Elmar Stellnberger (estellnb@elstel.org) ---
  The patch was not accepted because someone claimed it could damage the
hardware. All lies. As years have gone by these graphics cards are still un=
der
daily use with this UHD patch and no damages have ever occured. As this
hardware is still in use I would really like to see this in mainline, not j=
ust
the Mageia kernel. Someone who knows about it, told it would be highly
improbable that this could be detrimental for the hardware. The only fallacy
would be that the screen shows black on a too high TMDS and nobody would ev=
er
continue to run the graphics card with a TMDS that yields a black screen. T=
his
hardware is near to getting phased out on many computers by now and I=C2=B4=
d regard
it as ridiculous if the patch is withheld because of the argument that it c=
ould
damage hardware on the long run. This hardware will get phased out long bef=
ore
any damage could ever occur.
  As distributors and kernel developers still support Pentium IV hardware I=
 am
reopening this bug. This is about Core 2 aged hardware which is totally
sufficient for UHD/desktop computers. I would never give up my Xi3650 machi=
nes
because they are ultimately silent, something you don=C2=B4t get with a new=
er
computer. And unfortunately the Xi3650 does not work with newer 3D gaming U=
HD
graphics cards (these cards inhibt s2ram also on Windows, which isn=C2=B4t =
what you
want for a desktop system)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
