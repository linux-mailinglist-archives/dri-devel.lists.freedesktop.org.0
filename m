Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1B93DCD76
	for <lists+dri-devel@lfdr.de>; Sun,  1 Aug 2021 21:43:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60BBB6E0B8;
	Sun,  1 Aug 2021 19:43:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E8D56E0B8
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Aug 2021 19:43:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id CFE8A61078
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Aug 2021 19:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627847022;
 bh=Jgqowb/DM0TkVA3ZXcNTKYMpqHatc+ntEEibnFPerfU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ZcLzebQL1jKCLE46r6WQxpeP2EKTurKPH+7Z35n2WJGZFAm77lEAy/yNdMRuD3tBn
 /txGPfI+R6BY1O3RVOYnzt2LAVssC92zWyu1U7jwBWfb2wL/nlkIdaoRuS9skjjPAa
 Yup1MYjy4u6VIuZrCoclKWCsS54X++AoCQqeYcuIRKnZ+vqFMxbegXbrp4EKiNhxiG
 jHB+pDiZBn2LpWagdHZlnXcehhlXecsGG0bEOahtOfLdDV3qHFubo4ASzcBzjYF2iE
 vCcRwYC97dVEiAR1FUFrGfGeKtqBZAniafOwnYHBydMQbf0o1VDXkdGTdynLQ6zX0e
 d/CdvfmDgZcMw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id CC68060F47; Sun,  1 Aug 2021 19:43:42 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205089] amdgpu : drm:amdgpu_cs_ioctl : Failed to initialize
 parser -125
Date: Sun, 01 Aug 2021 19:43:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mcmarius@gmx.net
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-205089-2300-VwjZQhyRz4@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205089-2300@https.bugzilla.kernel.org/>
References: <bug-205089-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D205089

mcmarius@gmx.net changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mcmarius@gmx.net

--- Comment #16 from mcmarius@gmx.net ---
i have the same problem with the kernel 5.11.22-2-MANJARO

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
