Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7143A715061
	for <lists+dri-devel@lfdr.de>; Mon, 29 May 2023 22:15:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B71110E2E3;
	Mon, 29 May 2023 20:15:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1421710E2E3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 20:15:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 78BF360A25
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 20:15:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D699CC433EF
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 20:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685391336;
 bh=aeIDiLZSJ6D1x37zogUyId3E2VItfzI6k8NhqP71OM4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Ok3G1UW+7jRT/UtrZ9cVdPPgaN6tascSmtpZsovn8KUEND0lFa24L9kwsaO0WC4z7
 lZv9+WfptNafJLjZyOcCNbkY8tFuKmtVZCJS2Z6f1IlwiGulatwivt6tDpwJMMp1cl
 89h7p8Hod5eK8lh2kJsuoFDo0X5QUvS4mkm2VDf8hRyHf7NzHO3S/RXRohj2GgRlcH
 HBSDySOj7PE5G1ahYMmfwQg6OgAv0ZQyAC7yBR5HNugxfSbUAWUzuAYU1BwoHtufbw
 KPU9Xd38TaKKBd6jIM5DVduCwncOAk7vc9Dvu05qni5z3Fn8+j42ZNTM0q3wSTjTZU
 qCfB/VEg86VWw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id C1756C43143; Mon, 29 May 2023 20:15:36 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217499] NVIDIA drivers fail to install on 6.4.0-rc3-1-mainline
 kernel
Date: Mon, 29 May 2023 20:15:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: wessel.working+kernel@gmail.com
X-Bugzilla-Status: CLOSED
X-Bugzilla-Resolution: MOVED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-217499-2300-jc0blajV7k@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217499-2300@https.bugzilla.kernel.org/>
References: <bug-217499-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217499

Wessel (wessel.working+kernel@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |CLOSED
         Resolution|ANSWERED                    |MOVED

--- Comment #2 from Wessel (wessel.working+kernel@gmail.com) ---
Thank you! Will do!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
