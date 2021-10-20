Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C00434ECD
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 17:15:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E07976E9E9;
	Wed, 20 Oct 2021 15:15:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 046186E9C5
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 15:15:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id CEF056139F
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 15:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634742925;
 bh=j1PpddiU/2sKyp1er5fAEyNKsHnGSzeyOCAY9WXTTuA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=iTb7nZy844f/hUk2uxDjRvF1A0Xq2LvHXwBr0paKkR67Rg1iOspA2SoJ8u36FO1OG
 YeqOpHKcy+gbQQVWIVCIwFY+e1mjiUMXHY1BXItE5JNTx4BvcsFotQDafYjLVywbEl
 w8Hqi6T9nvnrblkOB90HrpsPUKJSGfijTnGTcOx8rQQ/ni5BOiodtWhrwoFL1MZAbs
 mqDXBHfC3xpQAt/rZTPNfQShyOyRyJNAEyYrIhPSZme+ugoe0cChvHIdlKj0nwrkGD
 xTklzgX1oy2dE+7OYfEBbRZlJM39DguDFJgYAhfNBVzRlykz8Bk/DA5BsDze358caO
 9rjitXhnoL4vQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id CAA8461106; Wed, 20 Oct 2021 15:15:25 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213983] WARNING: CPU: 3 PID: 520 at
 drivers/gpu/drm/ttm/ttm_bo.c:409 ttm_bo_release+0x7a/0x803 [ttm]
Date: Wed, 20 Oct 2021 15:15:25 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213983-2300-QzixR33T9U@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213983-2300@https.bugzilla.kernel.org/>
References: <bug-213983-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213983

--- Comment #2 from Erhard F. (erhard_f@mailbox.org) ---
*** Bug 214621 has been marked as a duplicate of this bug. ***

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
