Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF86553437
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 16:09:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C53110E4BF;
	Tue, 21 Jun 2022 14:09:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF57310E4BF
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 14:09:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4535F61633
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 14:09:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AAA03C3411D
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 14:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655820557;
 bh=EBn7G+9sE0CEOgz1eivS1aYHKrdUWalsWIttTX1X3uY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=PRp/CkU72GIxD4Jv9U9Nf1rmlUYJrJaJnZMpaRovZi8klteJbGdrBNptx69k65rm7
 VyrylrYump5+dtGRbRjVsn4QFksSCv1YTssRo/BWn7TsnsSoIvLc0Fn64EZrB3ZHKq
 CnNx/8ykP9ICtHtSPtK+eUT0gS4YadiF1zMEUJ/wYNvx+UvGj3UYMn1dg+K9YfNAPP
 2DuOWe4nIxmLZHcn/14axAGdHcnDoBggG7TKpN9oo9B5jTxjx/T/lbXoZozpBPw+uH
 DXTiehO546GKAVcF1g2tmUR0OTdxOIu86GjACb8KVcWUii5O1XWGw8f7ky9fOs+7X2
 XuXoESNyullhA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 9898AC05FD5; Tue, 21 Jun 2022 14:09:17 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216119] 087451f372bf76d breaks hibernation on amdgpu Radeon R9
 390
Date: Tue, 21 Jun 2022 14:09:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216119-2300-trvrNdpSgu@https.bugzilla.kernel.org/>
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

--- Comment #16 from Alex Deucher (alexdeucher@gmail.com) ---
Created attachment 301246
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301246&action=3Dedit
patch 4/4

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
