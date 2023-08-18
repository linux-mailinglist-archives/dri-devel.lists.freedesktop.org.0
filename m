Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1007803F3
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 04:51:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30B6010E41F;
	Fri, 18 Aug 2023 02:51:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55FA910E41F
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 02:51:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BFB1C60C09
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 02:51:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 29DE8C433C7
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 02:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692327075;
 bh=JW3OYSMkTY36N4KznDj+yX/PxccSxi6FtKq2qfLFjqQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=tnvRNJKvSxpopu/XYDXR73Z16is73sGIa3wBDw0nlU8BHud0qoPuGu6L+BgGWRvLI
 rajoFA84bOV4wh7joYT97oC4iftkvTZ+G7vVmK7BPsrp/m+ULvFwrGEtotIxw5xvQo
 Krzan1HhNbqANSF7oBrVAXzKZyE+h9psKyCs1E/Atot4bwwER+0o5LJdTdLvFCdQhw
 ODgNJsOluOymhVvutBYX6gYezo/Vy7iJtPfAjhwVsW87hjgVm+iaXlGeKpir2IND9f
 7BIJEh8N0tJozlNTb1YVtk/nk37SjWd47Ib6XKUmExGhbmpoKOjDHK5lRmtjjvbyK3
 YWHBjepTDjZdA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 0C1BDC53BD3; Fri, 18 Aug 2023 02:51:15 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217664] Laptop doesnt wake up from suspend mode.
Date: Fri, 18 Aug 2023 02:51:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: ACPI
X-Bugzilla-Component: Power-Sleep-Wake
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: penteljapan@o2.pl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217664-2300-SKnSbhM5Kp@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217664-2300@https.bugzilla.kernel.org/>
References: <bug-217664-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217664

--- Comment #19 from popus_czy_to_ty (penteljapan@o2.pl) ---
now nvidia using some intel driver somehow xD

sd@Crawler-E25:~$ lspci -knn | grep VGA -A 5
01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GA107M [GeForce
RTX 3050 Mobile] [10de:25a2] (rev a1)
        Subsystem: CLEVO/KAPOK Computer GA107M [GeForce RTX 3050 Mobile]
[1558:5e00]
        Kernel modules: nvidiafb, nouveau, nvidia_drm, nvidia
01:00.1 Audio device [0403]: NVIDIA Corporation Device [10de:2291] (rev a1)
        Subsystem: NVIDIA Corporation Device [10de:0000]
        Kernel driver in use: snd_hda_intel
--
05:00.0 VGA compatible controller [0300]: Advanced Micro Devices, Inc.
[AMD/ATI] Cezanne [Radeon Vega Series / Radeon Vega Mobile Series] [1002:16=
38]
(rev c6)
        Subsystem: CLEVO/KAPOK Computer Cezanne [Radeon Vega Series / Radeon
Vega Mobile Series] [1558:5e00]
        Kernel driver in use: amdgpu
        Kernel modules: amdgpu
05:00.1 Audio device [0403]: Advanced Micro Devices, Inc. [AMD/ATI] Renoir
Radeon High Definition Audio Controller [1002:1637]
        Subsystem: CLEVO/KAPOK Computer Renoir Radeon High Definition Audio

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
