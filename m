Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88ABE340AAD
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 17:51:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 777B96E8F3;
	Thu, 18 Mar 2021 16:51:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 239C56E8F3
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 16:51:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 2F18864ED2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 16:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616086301;
 bh=BPNmc/dmTVyz7z2vDjsoIwi0i8shIh072SzI2D3O1Ks=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=fQHCf5LnTzyf/MKP1ARFSJ4H7crYTMwOKaUBic6LxuYN1qRsDmSdE8ys9cTwtAsAh
 3UhlrZnOgYrbuVqksFvhnEQzEwxa5qxdhZrq224DP/Q10PIluCHER8WgtNfDbDoCE7
 65LcZsKkMK+8gpWVlWYmX9ahdgKxL13lpyJQzsa/i1SyOpMDcfFquZOfmWKAkMQX1B
 qY0XyKomF5TlgO1ULL/OmHhTn3aqzGFvGvrMBxKnXGZPjCvkkcs7qa8I/+ZZA4md3I
 9K3RppuHQHmhc3oQLefM9u5zRZqlqMocoRtZUb8OLIzr97uMiSpUmgUCNXZbeGx0LJ
 SFZhimE5MyLmA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 2BCA9653CB; Thu, 18 Mar 2021 16:51:41 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212333] Bisected: 5.11.7 breaks amdgpu resume from S3
Date: Thu, 18 Mar 2021 16:51:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: timo.valtoaho@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-212333-2300-phKbDXIBLg@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212333-2300@https.bugzilla.kernel.org/>
References: <bug-212333-2300@https.bugzilla.kernel.org/>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=212333

--- Comment #2 from Timo Valtoaho (timo.valtoaho@gmail.com) ---
Created attachment 295927
  --> https://bugzilla.kernel.org/attachment.cgi?id=295927&action=edit
lspci

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
