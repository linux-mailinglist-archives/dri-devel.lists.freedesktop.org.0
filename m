Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7AFE556DB7
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 23:08:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 994B710E1D9;
	Wed, 22 Jun 2022 21:08:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 639D410E1D9
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 21:08:11 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CE61261910
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 21:08:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3DF84C341C6
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 21:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655932088;
 bh=HPmckMbsC2+mLzcbBT9NWdxphcJWLxqDWKFxySq5jbo=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=hvRAgOxxp4yvk1sumL6jD8NmOG5/t2l1pGbkC853eqNzrHr5P62D85tp/XJHUe53K
 xNfVEbro8qTXCP0B1BIYhIHwljztpIh4+LReYm2Wr82Q5banIukyfKv/VpNqxC87N+
 RkOmFrf9LPFxjf0YjrkKYKA4ARu/VyozPs1bFZT/DWvzGZlKueN30+9ygQ0Vagieqw
 SnHT/CuqpLYL8k97Hp1OauTKPKiZpaNAjKrkOPiWz0vviqwMy90qTIzRychtUy9i2o
 oXl6xG1UmIK9127ZqN60cKZm/Y2MbnReC3jWEhPqXlJfAQJay8SqRi3O+MRH3/wB3L
 DETcK3clfSufQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 28DBECC13B4; Wed, 22 Jun 2022 21:08:08 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216119] 087451f372bf76d breaks hibernation on amdgpu Radeon R9
 390
Date: Wed, 22 Jun 2022 21:08:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: h.judt@gmx.at
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216119-2300-rBnEv7Mryh@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216119-2300@https.bugzilla.kernel.org/>
References: <bug-216119-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216119

--- Comment #19 from Harald Judt (h.judt@gmx.at) ---
Yes, I definitely removed the patch from comment 11 before testing the new
patch set. I will try the other combinations later this week, I am a bit sh=
ort
on time at the moment.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
