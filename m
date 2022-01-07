Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9951E48704F
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 03:24:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D06BC10EC8E;
	Fri,  7 Jan 2022 02:24:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F86410EC8E
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jan 2022 02:24:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C82C361EBC
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jan 2022 02:24:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3FDEAC36AF2
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jan 2022 02:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641522279;
 bh=cV+0DTAvwsM8LX8UFuHJ/ITbnjGkMO15GsLMJDI8EjM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=l4aXKukQpWpa0mb/PGIPa2iTWlXXojGyHp9YJ47YWlU53cHpbTkAM2eeRToCQ1r11
 iru5NuQriNyvHhk0px04b8lXyHfrkP7wYwwT1OTGMTJXNWdVYTyNCYSf2e94+uI//D
 PAPFGkHtCkbh6eU1LJlzP9VG3VXtukbEvF5BaWrpLYyP8wnCw4fSjnAhQVWTaVQqf6
 ZzX55N1VwNO4L9xVlN2nvYFDOTlW7sJr1isvAxE1xW//67XLOYuZxhZXb6Xw7iNqb3
 5Ol9c6eOWcAJR9iSsVEtBiDuCBURF2RpvAakqWsygt8bpsesOTITlxAsiy3Nl/9S0+
 l6AsBfj2p550A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 1F8F4C05FDA; Fri,  7 Jan 2022 02:24:39 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215001] Regression in 5.15, Firmware-initialized graphics
 console selects FB_VGA16, screen corruption
Date: Fri, 07 Jan 2022 02:24:38 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(Other)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: javier@dowhile0.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-other@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-215001-2300-yVB4Ny3h9f@https.bugzilla.kernel.org/>
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

Javier Martinez Canillas (javier@dowhile0.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #300235|0                           |1
        is obsolete|                            |

--- Comment #6 from Javier Martinez Canillas (javier@dowhile0.org) ---
Created attachment 300236
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300236&action=3Dedit
[PATCH] video: vga16fb: Only probe for EGA and VGA 16 color graphic cards

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are on the CC list for the bug.=
