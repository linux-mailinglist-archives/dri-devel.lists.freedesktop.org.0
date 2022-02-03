Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5424A7D79
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 02:39:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 055A510E1FE;
	Thu,  3 Feb 2022 01:39:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C27110E1FE
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 01:39:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0407D6132F
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 01:39:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3840DC34115
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 01:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643852375;
 bh=INcNhh3hkaHGHHIymgyHeKa30G+kRWI3QHkLhHeNg38=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Znyu2N1Bccg1ZruicD8vPkX6b+g+TtAxr2wSaQgpUNvRfkn1yW9KhJGRCtqRkGG/Q
 HfFeC2iK676gwVCodpTXCW7rduN4KSBjhNJeCbzW3cHqj6Pm5FFv93LDZiwEWy8U0S
 LxRM+6jGynkiavKQpZF/SA7JAbvzIM/S0cZQbLHkFJpokTRHUHGdagUmpbT/PNUoHe
 nmfyNlhlehOo5W6yMmrNgyUMWwRgRJcpt9cIXZs//pBkt/biAJHJtoDAtvpw8gMGDT
 k/DHrAgcmWGrbzecTlv7dHQig9Ca2/72eSw2K97AFIHWjf/jcQveuAKn/9vO+PkvZb
 B3G9SUSPsIEbQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 28AFFC05FD6; Thu,  3 Feb 2022 01:39:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201957] amdgpu: ring gfx timeout
Date: Thu, 03 Feb 2022 01:39:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: randyk161@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-201957-2300-TP4cAdCna9@https.bugzilla.kernel.org/>
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

--- Comment #63 from Randune (randyk161@gmail.com) ---
(In reply to Jon from comment #61)
> Chiming in as another victim of:
> [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize parser -125!
>=20
> Radeon RX 6700 XT (NAVY_FLOUNDER, DRM 3.42.0, 5.15.15-76051515-generic, L=
LVM
> 12.0.1)
> AMD Ryzen 9 5900X=20
> Ubuntu Mate
> Mesa 21.2.2
>=20
> Haven't attempted the amdgpu.dpm=3D0 workaround because the side effects =
of it
> appear to be bad.

I've tried amdgpu.dpm=3D0 and it seriously kills the frame rate in super tu=
x kart
at least.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
