Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9255494AC
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 18:33:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 658A610F21E;
	Mon, 13 Jun 2022 16:33:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7819C10F214
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 16:33:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1556F6153B
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 16:33:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 77A12C3411B
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 16:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655137986;
 bh=mLJZx0Rr8XsFJ6N7nGI+3uCvcT3Mc5uSij+/4RlL5qw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=GOoO79aXHG6iTsXCS1gSMKMDlsQswZ8xU/ECdaFlGEgLAnEkbLSjlbFhlArFKBDcv
 pZdoIwc1Y3tiNO5Bk38CyVmvU5QBj8/O7msN/hu3eYqZBYGZNUZQzCgc+TmeGN3zCL
 rDiG6IH/2K1hucJgPEoFLFP4h9clY3peWGVbqKYYKCyLD59wRW7xH5Dka9vMuy8w8u
 PgpfvJtZHB7rpFcp6Bn1wzVgGTmYNKT75uuBKI1uqz6dCOifj+tD9OjXy4DhdOw8UE
 z5WAM+u+N7NrHfQUfqzF6bUlXe3Xolj8k1a8xyOuRE/etCx/ALkM5YxT/FaQVJC6fi
 6a3l1B9kR6big==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 64914C05FD5; Mon, 13 Jun 2022 16:33:06 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216120] [BISECTED][REGRESSION] drm/amdgpu:  add drm buddy
 support to amdgpu
Date: Mon, 13 Jun 2022 16:33:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mat200300h@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216120-2300-wlanSi7h9x@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216120-2300@https.bugzilla.kernel.org/>
References: <bug-216120-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216120

--- Comment #2 from mat200300h@gmail.com ---
Created attachment 301165
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301165&action=3Dedit
BISECT_LOG

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
