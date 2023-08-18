Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E88F77803F2
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 04:49:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 042DF10E04B;
	Fri, 18 Aug 2023 02:49:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A844710E04B
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 02:49:31 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0F39C6397A
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 02:49:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 72787C433CA
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 02:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692326968;
 bh=g8ulWdti+0llwfLy6XzgyUlp4foC1DJu8MgkBMoDtpQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=bT4tnm0wcSeCCzfaVUI+Ah85bE2OQBBZP6Ufe9QkpWwm4MCLh4rAgP4QYfRjCy/8p
 M0xjeaJhbaJ44MYsVNPW0QEyhVpZt3XwDQ3kevck7c3qDoVwt7Dl1wcOwiBCaaRKSG
 2+EM70HDeMFII/ZUbeQhkzW7SvazwLqi/FbwOKJmO/hZhzdsecmStwkPqIOOSFGguT
 RRZ1tdIfmFmizEy6j27LRpBmPe0gHsWUc6Sf7gv9SVcsEkQuVSInHrfx+K9G2IJZop
 jxGvawHYIDD015C3+7u+T8g/3Lonm+ig42GkDUAzYXkJGSJibq1m5A57yQxoVMu6sk
 1CWTvhBVUYP9A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 5B752C53BCD; Fri, 18 Aug 2023 02:49:28 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217664] Laptop doesnt wake up from suspend mode.
Date: Fri, 18 Aug 2023 02:49:28 +0000
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
X-Bugzilla-Changed-Fields: cf_kernel_version
Message-ID: <bug-217664-2300-1YnvK8GsNK@https.bugzilla.kernel.org/>
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

popus_czy_to_ty (penteljapan@o2.pl) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
     Kernel Version|                            |6.2.0-27-generic

--- Comment #18 from popus_czy_to_ty (penteljapan@o2.pl) ---
banned all in grub ( GRUB_CMDLINE_LINUX_DEFAULT=3D"quiet splash
module_blacklist=3Dnvidia,nvidia-current,nvidia_drm,nvidia_uvm,nvidia_modes=
et,nouveau"
)
still doesnt wake up

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
