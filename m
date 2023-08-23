Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF3A785817
	for <lists+dri-devel@lfdr.de>; Wed, 23 Aug 2023 14:52:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E4FC10E421;
	Wed, 23 Aug 2023 12:51:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B0D710E420
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 12:51:53 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C2CE165B6C
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 12:51:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F323CC433A9
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 12:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692795111;
 bh=3xSs7TJv6k+rBxw/x01fECvqHhQw6nILPgVtauM+IeU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=d4z/voq+EF3kO7AWHsCY0lqVsrmF0L5R7hQNbjDHlo4cV0OryyX27tJhgjIttqQ3q
 F3c3Rft0SOjKllMvp3CwwOOC8Rw/iRMNYckeQ7nTzavU7FHUqsdWbBkbKKaJ1urvc7
 YAbkkerPCEjBYqmLxaS0wB2xoLL2m++dTwRRZQYTZUqRNhuqy1RAYDA8vAwC4T3lOE
 io/xzMAN/2vQs2f09MmbdDkFj08HRvFXEFdACr/VK798O4AcPrzVzmrvN0CqhR7Wke
 X5AyJOo7EarTE2ygu33kO8xLliSMUpSmptNlOgLMFk7RHwNPzyXPAwUtMtQtC60l/6
 iFhuhQmXPnr6A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id D0429C53BC6; Wed, 23 Aug 2023 12:51:50 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217664] Laptop doesnt wake up from suspend mode.
Date: Wed, 23 Aug 2023 12:51:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: ACPI
X-Bugzilla-Component: Power-Sleep-Wake
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217664-2300-UJcjH1vJOU@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217664-2300@https.bugzilla.kernel.org/>
References: <bug-217664-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217664

--- Comment #23 from Alex Deucher (alexdeucher@gmail.com) ---
Is the system accessible on resume?  I.e., can you get ssh access if the
display is not active?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
