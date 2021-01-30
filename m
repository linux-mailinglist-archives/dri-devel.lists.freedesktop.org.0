Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7AC4309476
	for <lists+dri-devel@lfdr.de>; Sat, 30 Jan 2021 11:25:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31D916E044;
	Sat, 30 Jan 2021 10:25:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEC966E044
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Jan 2021 10:25:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 7AEBF64E08
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Jan 2021 10:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612002323;
 bh=GZ4ANMyD25G5p/oPYnpRYt+0DVOnCMFUGP5lmzy2Qkc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=MKXKOimqOcak0mcSCNwrVsFdxu7ruBoORiYS7keHTkv9renQ5UgTICZg/d0Zuu2au
 8gLT+5daQR2sRvdvTi+Yft3MvyTF8zUZ9Y52AMIg8pV6ppdAsvJP7epu7wHFrfKldi
 EQcNx3kvSxgp1lUPdImPaI8nK1QZWZsz32iS1OMNoMoiK0yLKdtvr4mL1c+cFTnOmm
 54A0flV5pXyB32SOWcoESnNo11Z3e/m2E//twcNou7a8DsNZIdUO5D14XI8kMp3WHI
 ex9ELD1sdm+HlGkk+9U7WnQzjFyAlhmPsOHAeKZMvC3F43ziwYhFVrtFmC7GWUWuxg
 R1yjyYLyoh9Kg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 6B7E86530E; Sat, 30 Jan 2021 10:25:23 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211277] sometimes crash at s2ram-wake (Ryzen 3500U): amdgpu,
 drm, commit_tail, amdgpu_dm_atomic_commit_tail
Date: Sat, 30 Jan 2021 10:25:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kolAflash@kolahilft.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211277-2300-ovGkQPaOsf@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211277-2300@https.bugzilla.kernel.org/>
References: <bug-211277-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=211277

--- Comment #6 from kolAflash (kolAflash@kolahilft.de) ---
(In reply to Jerome C from comment #4)
> [...]
> Do you have kernel parameter set "init_on_free=1" or in your kernel config
> "CONFIG_INIT_ON_FREE_DEFAULT_ON=y", [...]

I'm using the Debian-11 (Testing / Bullseye) standard kernel.

$ grep -i init_on_free /boot/config-5.10.0-2-amd64 
# CONFIG_INIT_ON_FREE_DEFAULT_ON is not set

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
