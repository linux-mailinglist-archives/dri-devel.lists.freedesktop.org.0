Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E8756C944
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jul 2022 13:51:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21CD2112E29;
	Sat,  9 Jul 2022 11:51:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4E71112E27
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Jul 2022 11:51:03 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6BD37B8106E
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Jul 2022 11:51:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 25D2CC3411C
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Jul 2022 11:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657367461;
 bh=Qqgunp/WXdOKXqPbrGoCbVcEjMMEmyABnnIvCaA24Jc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=PdUgMJsGMfs9FZcQvCcizNhm8abSiQNx0w3fANXCuvIKOKqBYLz4Xx55vsiK3ZyTc
 VaZvF6oP5yCa2ZiBMnxE6DMVojYA2qeeqOqzIqiRXBxHP+gtn3YFzPrdToKa/6l8B4
 DRRUZqBUWaRoqJy32xuKvf5nuyyS+D3b99IhJCGgfl9HULIgogICiBzv6c0LMODFKz
 2LlZHaHi4h1UWpYkgtfH44rLP0dAgBaxmq4sQ4OyurMst5p460/iMBxLhHeFrU615L
 l/T9F1VgumUWCiLF8LfsbMd8REJ9u8SoZFII3SFu75NbMw/PZ9GGjU+aP3gVsDDYWs
 7AgV+5gagy2tg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 133E8CC13B1; Sat,  9 Jul 2022 11:51:01 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216226] [amdgpu] BUG: kernel NULL pointer dereference
Date: Sat, 09 Jul 2022 11:51:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: spasswolf@web.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216226-2300-ltS6eFKw5V@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216226-2300@https.bugzilla.kernel.org/>
References: <bug-216226-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216226

--- Comment #1 from spasswolf@web.de ---
Created attachment 301379
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301379&action=3Dedit
kernel config

Of course it's /dev/kfd in the message above.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
