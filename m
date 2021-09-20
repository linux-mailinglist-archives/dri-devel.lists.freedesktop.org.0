Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 358534117AE
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 16:57:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E52AB8910E;
	Mon, 20 Sep 2021 14:57:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D8AF8910E
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 14:57:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 5A23D61159
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 14:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632149821;
 bh=LLHGO+Nn4BRi00caOC53G6COxlO8OZbNYMRH20qQzzM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=QBDYY/4vQfVbdSm2zU/IEaUq9XUeae5tpVTeuwv2XL9RtAgTQpMDP/KSXgZ2pm9Iq
 TMkjlF1ejarQ7o7RZTOjzxqC43WF7wA34559CXHtyuMrcbdoTyHgoZo7FYUAsm0fvW
 yDvlntXivjtWXGU2ZJWf1kgdj2syv4fYWRlLuGmeYYW1hXI9qOOHGw6eVt9GmOXRNj
 ezIoklag1ctZoBRFMYlSyUOZZtO04Zvd809jeKbBkLS8MCQjuQNA0aP4tLWEtwZNX5
 j6/Hqg1vhFtPGBg61AitnFXA9hEDApwHjndO3rK1Bnj9Pe3Ej9c976rS8hnDxpTvP2
 axvQeooUcHoEA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 5749560F50; Mon, 20 Sep 2021 14:57:01 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211277] sometimes crash at s2ram-wake (Ryzen 3500U): amdgpu,
 drm, commit_tail, amdgpu_dm_atomic_commit_tail
Date: Mon, 20 Sep 2021 14:57:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jamesz@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211277-2300-92g27cOh0h@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211277-2300@https.bugzilla.kernel.org/>
References: <bug-211277-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D211277

--- Comment #61 from James Zhu (jamesz@amd.com) ---
(In reply to youling257 from comment #60)
> Created attachment 298889 [details]
> dmesg5.15.txt
>=20
> (In reply to James Zhu from comment #59)
> > (In reply to youling257 from comment #58)
> > > drm/amdgpu: move iommu_resume before ip init/resume cause suspend to =
disk
> > > resume failed on my amdgpu 3400g.
> >=20
> > Can you share whole demsg log? Regards! James
>=20
> when resume failed have to force shutdown, how to output dmesg?
> only has boot log dmesg.

after reboot, you can find under /var/log/kern.log and /var/log/syslog base=
d on
timestamp. you can just attach kern.log

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
