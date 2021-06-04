Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D5B39B297
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 08:28:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B7CC6F585;
	Fri,  4 Jun 2021 06:28:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 324A66F585
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 06:28:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id D764361412
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 06:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622788125;
 bh=HD+tP24N3i1sk80Jrk34rh78M/QRC3sxwIKHhnInYsE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=HTO34Ajq6Z/a14h2hYX7Kru7N45feV4NXZZ6K/RSk5WfVGiRKm8RTIK87k87p9iet
 80tm35nUBwyV1P7gNmjsC/jAupj//pVTZvxjOT6xVwmnprjFDucbhJ5HIAumIUGzIo
 80FjbKiMjqzjrS1c60ft92xzafZaJ6TfEkfzoQv7D0ie25P/Uk8V1Udbw35d9vwbgT
 YaoObsInSCgnZKUJ1pn73PtvAEI9FHjW90FAnDMTJKe7W/oSmGG3sCwTuURkVk9bN0
 IV+qDSUmuUDssFEPhhgz/gg0i84bVTTsi07H3yYEMZZR8kR+6wUNcgYgCcMWXeVCyy
 Go/jcJyFcye2w==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id CBC386125F; Fri,  4 Jun 2021 06:28:45 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213053] WARNING on dcn30_hwseq.c dcn30_set_hubp_blank, AMD
 Radeon 6700XT
Date: Fri, 04 Jun 2021 06:28:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erik.badman@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-213053-2300-zsuBjYKpcI@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213053-2300@https.bugzilla.kernel.org/>
References: <bug-213053-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213053

Erik Badman (erik.badman@yahoo.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |erik.badman@yahoo.com

--- Comment #1 from Erik Badman (erik.badman@yahoo.com) ---
Created attachment 297145
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D297145&action=3Dedit
full dmesg

I see the same in dmesg every boot, since the 5.12 kernel. AMD 6800 XT here.
Started around 5.12.4 somewhere I think.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
