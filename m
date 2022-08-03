Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BBD588F70
	for <lists+dri-devel@lfdr.de>; Wed,  3 Aug 2022 17:33:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D5BA10F8E5;
	Wed,  3 Aug 2022 15:31:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD7A910F577
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Aug 2022 15:31:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 10F5EB822DC
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Aug 2022 15:31:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 54AC0C43143
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Aug 2022 15:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659540703;
 bh=MbqOdm6JOtBSyW9bVhqsllHYVmFE8LFofekDoBvuS6Q=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=WokuF6do1L4tL5+L+TzaC4kSP7CZdPImDNZjj9gJxWUxe9i+0+YU3YG1V4XXGHjdv
 zYUKKNVz/vRDowNXTl+p+K1zGrATGPsURY4N47Z/LN1QffJzqhrz2wJkeO5MYdlVkv
 y4YGUEvBXlSkWYLUPff0+RfFE2d1coHac2mQofP5CoYYhpa3EbSxm+trPH7TU6ZGh/
 w08+Kxd3OUBEeP8NfA96XUN3za4hUwK5rghxejWdT4nNqngYnqm9156DWCPp+Jyknm
 XZUYmkkwZ78hA9owjDc+QAA6GZHMAHTEiREvekdJVNKnTM+6ND/OAXklRaiord2ZXO
 QZJ1GKqfciZAA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 452DBC433E6; Wed,  3 Aug 2022 15:31:43 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211807] [drm:drm_dp_mst_dpcd_read] *ERROR* mstb
 000000004e6288dd port 3: DPCD read on addr 0x60 for 1 bytes NAKed
Date: Wed, 03 Aug 2022 15:31:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: crptdngl71@gmx.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211807-2300-NBOlU0i3Sz@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211807-2300@https.bugzilla.kernel.org/>
References: <bug-211807-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D211807

--- Comment #23 from crptdngl71@gmx.net ---
Further details:
After logging into spinchat the issue does not occur straight away. It take=
s a
bit, use all buttons a while.

This seems to suggest that the issue is related to a memory buffer that lea=
ks
somehow or gets corrupted, because after that has been reached the issue oc=
curs
more frequently.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
