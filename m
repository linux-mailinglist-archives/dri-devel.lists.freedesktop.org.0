Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F9155B18E
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jun 2022 13:55:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F204F112183;
	Sun, 26 Jun 2022 11:55:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25B1C1127A3
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jun 2022 11:55:39 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9079E611FC
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jun 2022 11:55:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F334FC34114
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jun 2022 11:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656244538;
 bh=YaSd7W5WzAJ8vijhOllPJGbJWZDxYvvLCHdivcEkVgw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=a+E7sk0OxDrttgD07DvhnTATjdCBPdIxG+HNEy6RGNe8hrmmlV12/GZD1Jjh0lfJz
 CPNCoafPxoWTE/GKTsHp1KOBln7PIRUq9D8Q9g/xqL/Zz+xoKQLr0K6gLQQRAXoqSR
 0yYlNaeLxTSos3/RS6KWfsiBgSOuY3fL7Y8DwAcOFOwcBw1/9lnP5Og5M4Gj7cFd8n
 JNlkMlNIupvcLApL7g7HhlGpBr5QBmeIi2Mv6al6xB2s8BY1OACDYnekoNKHoqxD+z
 dHRhrSUdUJ/MP261AVZP8lLmma3/g3sfNH3SeU7C0iDRyUPOx6ShoBO98atMwhFFfy
 NvImItspHyrsw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id E2B4DC05FD2; Sun, 26 Jun 2022 11:55:37 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216175] PowerColor Radeon Rx 6400 ITX does not work.
Date: Sun, 26 Jun 2022 11:55:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: nobutarounosuke@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.description
Message-ID: <bug-216175-2300-ebJAOlrpfK@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216175-2300@https.bugzilla.kernel.org/>
References: <bug-216175-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216175

nobutarounosuke@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #301279|attachment-C                |Journal: attachment-C
        description|                            |

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
