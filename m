Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEF83A0828
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 02:10:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8660D6E5D4;
	Wed,  9 Jun 2021 00:10:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 448A56E5D4
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 00:10:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id E9DFF6108E
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 00:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623197424;
 bh=124xoMybjaitHojSHf4sO3uB1qi15lQY7TO2vwx+VIw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=TVU//dzv2hBGRLUclhWj+xS3yJVOGhghV+Ka96UWcih3hs7SI1iIHBohzp/JbCRx8
 9Oz04S1NU6kpFzk5cpR8jctYTHEUuPODxlFlJIBDiHQzW4CziuU7VcHKiRJJn3Z4Tt
 hPvyemKIB23FhGZmEDfLS0kgHWKzC2MAShPU6pQgtD/FbFve8MBlbH9A88ScVd79wP
 WzkWk1MJhSk58Kb5n5bPL6v1Y9gAeee/SKkw17lAA0Frbxf8IbpX2qyGCKyxlQcwhq
 7IdZUt6K52KaF4S7x1eQjgr9JLtJAn5mccaUrdlDc1Ghww/U+cwPwSPVXNm/FFf1Yw
 qY/wiox4Bn/tQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id E6EE0610D2; Wed,  9 Jun 2021 00:10:24 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213373] [drm] [radeon] memory leak at parsing
 radeon_atombios_parse_power_table
Date: Wed, 09 Jun 2021 00:10:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-213373-2300-QnLAskSxSM@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213373-2300@https.bugzilla.kernel.org/>
References: <bug-213373-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213373

--- Comment #1 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 297249
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D297249&action=3Dedit
kernel dmesg (5.13-rc5, eMachines E620)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
