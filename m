Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F1B63A060
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 05:12:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 851AC10E03E;
	Mon, 28 Nov 2022 04:12:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D65E210E03E
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Nov 2022 04:12:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E51AE60F9A
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Nov 2022 04:12:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 56560C433C1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Nov 2022 04:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669608738;
 bh=zlYnxEPKkiyCPgHpZhxVlBvfEtaafcNXCuCnG+KNIkQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=jZwlpmjryif3tFFPSveYkZGx8EyKc7MgDttcmfnV9EjV625lF749GlAoveT95Cd6d
 +e8T0Nc15NGjjdWlGWqH8u53GfHjKYgTn9Uw6DUao2euUtiyuLo42JGoquQ85C76ZS
 /ALz6P1LgnZYCLUr+LXTbKa6pJ3Sqc+phKJCgCizHcammiGnzujqvag1PdAGcIdxhy
 K/mHXHR6TAxWesNQxDJkyOEc9XhfHDM1VEgKiHykr2F8ukvHAS/zWnzoS1LNNEtkr0
 hq7CMd9ygw2TTNDJIHFoDG2fTIQqM6s/BeIcY6hfRggNvrAxryupMN93ghl0oFSiHU
 XTp8BClqUTuYA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 38FD6C433E4; Mon, 28 Nov 2022 04:12:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216745] Kernel 6.1 breaks Thinkpad T14 Gen 2 AMD connection to
 USB-C dock Gen 2 with kernel Null pointer
Date: Mon, 28 Nov 2022 04:12:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: regressions@leemhuis.info
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: OBSOLETE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216745-2300-IG4BAzWdWd@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216745-2300@https.bugzilla.kernel.org/>
References: <bug-216745-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216745

--- Comment #5 from The Linux kernel's regression tracker (Thorsten Leemhui=
s) (regressions@leemhuis.info) ---
(In reply to Eric Zou from comment #4)
> I will close this one now (if I can) to follow
> https://gitlab.freedesktop.org/drm/amd/-/issues/2171

It might (but TBH there is a second issue that recently was fixed that migh=
t be
the real cause), but then it should be fixed with rc7; and if not, please l=
et
me know here (or by private mail)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
