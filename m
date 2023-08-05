Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35638770F5D
	for <lists+dri-devel@lfdr.de>; Sat,  5 Aug 2023 12:50:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB5188961D;
	Sat,  5 Aug 2023 10:50:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E79610E180
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Aug 2023 10:50:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5D4EF601D0
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Aug 2023 10:50:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A6FA9C433C7
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Aug 2023 10:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691232618;
 bh=erc0DqIXAp+okqEz1hvZaNFXnesWneUgSA0B+X/PafE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=dUSi14kDg+XZ+4J+JNtZ7mEwgP1OiuCy+sLz9mRWcrpIS783tE747XqMStR2euyZx
 fgIjMYly1NqmBrUYMsjy4Y1LrMQDVdXCinaVh5RNjPpCDT6USwQ9vCh6TXAPayYVbZ
 yA253z5tpG8sz9FlLOnlAhsgEjcHT/ixPCOwuuwlBS/YkEa67cRD9iXQIzTtOWJ5LG
 TCvxjmljzfGUd2s/V5lcCVpRmgmn84rFuNc8laEZvuKVtHzf3isQqMOm4LtP9RBU7T
 FXDNFE8BzjwKg/7+MIYvhuXvt8uX0aB7o0qowGUzEYOsAfmeQqa7w/KLx/hHcv9VlZ
 GNSY4BhfvwwUw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 8F40AC53BC6; Sat,  5 Aug 2023 10:50:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217764] nouveau: system hangs when changing pstate on GeForce
 GT 320M (NVAF (MCP89))
Date: Sat, 05 Aug 2023 10:50:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dswdev@outlook.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217764-2300-qhCMifDjyi@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217764-2300@https.bugzilla.kernel.org/>
References: <bug-217764-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217764

--- Comment #2 from dswdev (dswdev@outlook.com) ---
Sure, thank you for answer.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
