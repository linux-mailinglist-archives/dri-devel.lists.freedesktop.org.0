Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 766C070DA77
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 12:27:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE84B10E07C;
	Tue, 23 May 2023 10:27:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDA4A10E07C
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 10:27:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1B6A6630FE
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 10:27:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E324DC433A0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 10:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684837638;
 bh=mph3L+prnAXXLyDnbLYaAuszfaK/auk3KZLPB23mRrA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=NA41WAKJEo5HkefDNahZEV4tUphWJSOf4FJl+djsPL/w/2AcrItOGgu/alS7zUzgT
 GJ6XI18028hjm3MJ/u9KwkG55+qQVyCgh8AEDcFfDvQW5R5KIaTrXdZLSK1oZokCzB
 jpjKNcdFTJV1D7iIFTqUljiSbslMQbCvw2pU5BY9bow9Mo2YWJ+Lc83kvkZPgPsyTJ
 0fUyKqlShSXQQYvjO7fTU+sIIvJ3VVWYxD9qU5y5TvSsAT7MiOWCG5HiiNK7GEFvC0
 qsYaA/FumTlXuLcI5wlWCVE/Cz5lQN5b0vt77mUoXrZfWqO5kZNsooDrWD8+7SkZjO
 6PR1AVrP3R0ng==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id D1B8BC43144; Tue, 23 May 2023 10:27:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201957] amdgpu: ring gfx timeout
Date: Tue, 23 May 2023 10:27:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: smf-linux@virginmedia.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-201957-2300-e2pnfKXaCn@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201957-2300@https.bugzilla.kernel.org/>
References: <bug-201957-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D201957

Stuart Foster (smf-linux@virginmedia.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |smf-linux@virginmedia.com

--- Comment #86 from Stuart Foster (smf-linux@virginmedia.com) ---
Created attachment 304307
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304307&action=3Dedit
Started testing kernel 6.4-rc3 got the same problem

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
