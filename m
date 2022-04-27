Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 922BA5116AE
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 14:22:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D41410EEDA;
	Wed, 27 Apr 2022 12:22:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C26BB10EEDA
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 12:22:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CA1B7B80D66
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 12:22:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8AC91C385A9
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 12:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651062149;
 bh=c3SfV5hj5bwUic1IQX+W08bkHeFwTGHIvBVFQFGFbOw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Krao8QAFL9dv5i9ujP9GQ2yZIJtjfzNQPn1KJloq6SwlqBx+MrVxGCOWUrw3D+/nd
 EY4fwhf8fzk/FVVGVtkZzzBLsjsxSlbQj3WWh4z/eRoyk7hB997v0KpaEr8oIzzzDc
 f8Zr7ke7NukUWLxes86xjaC5TBP/sCoNprk4wypWZDdPRMpilLOQ/ywwZit2HMN734
 5Q3if2Nqbg15GcxdAE/78f0njEybWqopl8Q2L1Igs0vEOPih7eS5fRhe+310egnk2Q
 XiMbif9F7tlgk6E0ZTi5XwGPofAL8gFg6sivKmnrdYxZn7CM8jo2vOKgXC/Rr+Pt7D
 pj02/q3I4L/Gg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 75F01C05FD0; Wed, 27 Apr 2022 12:22:29 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215892] 6500XT [drm:amdgpu_dm_init.isra.0.cold [amdgpu]]
 *ERROR* Failed to register vline0 irq 30!
Date: Wed, 27 Apr 2022 12:22:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ulatec@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215892-2300-AMPp22KfRz@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215892-2300@https.bugzilla.kernel.org/>
References: <bug-215892-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215892

--- Comment #6 from Mark Johnston (ulatec@gmail.com) ---
There is one potentially similar report here:
https://gitlab.freedesktop.org/drm/amd/-/issues/1933

Though both of the users report having working desktop environments and not=
hing
about amdgpu not being able to come out of D3cold. In my case above the gpus
are non-responsive, as they are stuck in the d3cold power state. So the
amdgpu_dm_init.isra may be the same, but the results and impacts differ.

Not really sure what to do here. Should I add my findings (hardware tests) =
to
that report?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
