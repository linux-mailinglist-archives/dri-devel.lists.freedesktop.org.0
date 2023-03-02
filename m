Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3527A6A7B3F
	for <lists+dri-devel@lfdr.de>; Thu,  2 Mar 2023 07:12:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C34810E368;
	Thu,  2 Mar 2023 06:12:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4934F10E368
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Mar 2023 06:12:53 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7001DB80F88
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Mar 2023 06:12:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 28CBDC433EF
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Mar 2023 06:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677737570;
 bh=8WDgkTHHfvCqfHk466M5ofaihY3/rpnLsqxVUmAFMS4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=bumoh8yYj0WEEP6oQ+tAOPF9o4/hQneGkAkZZeaQHO4DeJ5QdQB5w9JGXltapfs6u
 xqaG9cly6vPMdKVfE9B3HJFHgwR9INpm8Looq8mCfUEOY6PHMmv1VTNs7hC2rFOwmu
 BVgjBVNJpV9XPA8RxkdgKFyaRWeVSjEhp1N62y/L36X0Q2rQMgfG5xQnivkiAZb9Ba
 O+qcrRnfoRpm/QF62rJuv2AV6/Vyhu+0GrR1SX8ExOH3M3sqPMvCrItHiNGR/eJ+rF
 V19c8IQFYvvN07Vk+bIEmzP0IALAUd4AHI2bBS12eQXX9PlnLdTwqPCE9YdT2aClfF
 hNRkUfy1GY/jQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 18E98C43143; Thu,  2 Mar 2023 06:12:50 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217110] GPU Lockup on Radeon Pitcairn - VAAPI related
Date: Thu, 02 Mar 2023 06:12:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: regressions@leemhuis.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217110-2300-b3N9L3AGI5@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217110-2300@https.bugzilla.kernel.org/>
References: <bug-217110-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217110

--- Comment #2 from The Linux kernel's regression tracker (Thorsten Leemhui=
s) (regressions@leemhuis.info) ---
(In reply to The Linux kernel's regression tracker (Thorsten Leemhuis) from
comment #1)
> Sorry for causing you trouble (I'm just the messenger here), but most of =
the
> core graphic driver developers (just like many other kernel developers)
> don't really look in this bug tracker; you want to report the issue here
> instead, as that's where they expect issues to be reported:
>=20
> https://gitlab.freedesktop.org/drm/intel/-/wikis/How-to-file-i915-bugs

Sorry, I meant here:

https://gitlab.freedesktop.org/drm/amd/-/issues

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
