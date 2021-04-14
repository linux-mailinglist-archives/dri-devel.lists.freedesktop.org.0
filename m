Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B62E35F7B9
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 17:35:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA02A6E93B;
	Wed, 14 Apr 2021 15:35:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 501806E93B
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 15:35:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 24C8E6112F
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 15:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618414548;
 bh=H9t9sRBARJYEflizb9SagS3j20EsM1XsSL5S9pp1HlE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=H8dToRNqKlfQdKULrA79/ncVA7nuJ7eq3mAreqzFEqroczzSR0RQkrS5I4D9chMq2
 1V4aiFAuZvbDefM2gkf1n/NrRC9gFZOBnZtaR9MghHJi7Mdh3m/dqSaBBCBdUJFv6V
 eo41vwzXnm545MesTS5H51JHaNNB9Cqf/2X+bNfQ/jSRpOQuzCFlhX4BZl6HevAEBk
 QGQTJUOkEmDNuHvp/OP/q1E/IyTfajbwWz7jOdfls/xNjV0qSeXfQe/7JBo1XuI65C
 xLeyrYjDGzawiJOBIYAQOh+JI1Elz37nokPBJc6daSZAVzKbpB813mwBbuO7E6o1uc
 KA+z0x7OoPeCQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 1B93661186; Wed, 14 Apr 2021 15:35:48 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 209345] [nouveau] unknown chipset (0f22d0a1) (nVidia Tesla K80)
Date: Wed, 14 Apr 2021 15:35:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kallisti5@unixzen.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-209345-2300-fOdSm3L3Bg@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209345-2300@https.bugzilla.kernel.org/>
References: <bug-209345-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=209345

--- Comment #15 from Alexander von Gluck (kallisti5@unixzen.com) ---
Applied my patch above to ArchLinux (5.11.13-arch1-1) and gave it a whirl.  Got
a little information from nouveou before the system hard locks up.

nouveau 0000:0d:00.0: enabling device (0000 -> 0002)
nouveau 0000:0d:00.0: NVIDIA GK120 (0f22d0a1)
nouveau 0000:0d:00.0: bios: version 80.21.1f.00.01
nouveau 0000:0d:00.0: fb: 11520 MiB GDDR5

(hard crash)

I might get more information from serial... however, ran into an unrelated
issue. Cooling!

The Tesla K80 got up to 175F+ at idle and I had to shut things down. Need to
rig some better cooling solution.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
