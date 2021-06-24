Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB403B30F3
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 16:07:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D456C6EBA7;
	Thu, 24 Jun 2021 14:07:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F270C6EBAA
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 14:07:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id CBD036140A
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 14:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624543629;
 bh=rMgA0nF0eNthpQD8bvr7Y2N3PBYw8AvoqrOGvjLT/Ok=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=nrO7BC1A8rSs9VkD+mwrYorzAZBRy6J4zH1JKcLyWpzzuOS60conH4Od9fWLkhtci
 wNtvI/+TvrLod0lWMh6IQ99DzFN4oVxufwIN2dNLQTGorygGzctCH+n3phDUfTsXeU
 uVwSd+L9vXkkHLL6wELqc6rrIbaDb/C0FCkoD/E1RfFw2i36CTeo2mcjeTuNrk4eb7
 DSsONPVNriqJXQNuL8ukJOU9e+AzrvVzUE7OhvNhMNno8oikJkizHLsEOCeopZZbAQ
 Unh9qZN0jMD6eeG5jS1dU7dLn+hsxrCjTEExu+plyiQPDDTnbwLIAPTBgTqHoweuKc
 BuXdWDRmhAYww==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id C80966112E; Thu, 24 Jun 2021 14:07:09 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213561] [bisected][regression] GFX10 AMDGPUs can no longer
 enter idle state after commit. Commit has been pushed to stable branches too.
Date: Thu, 24 Jun 2021 14:07:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: untaintableangel@hotmail.co.uk
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: short_desc
Message-ID: <bug-213561-2300-rIdfWurCxx@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213561-2300@https.bugzilla.kernel.org/>
References: <bug-213561-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213561

Linux_Chemist (untaintableangel@hotmail.co.uk) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|[bisected][regression] AMD  |[bisected][regression]
                   |GPU can no longer enter     |GFX10 AMDGPUs can no longer
                   |idle state after commit     |enter idle state after
                   |                            |commit. Commit has been
                   |                            |pushed to stable branches
                   |                            |too.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
