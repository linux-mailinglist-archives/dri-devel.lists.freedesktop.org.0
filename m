Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC1D5E76A0
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 11:16:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B442E10E7CF;
	Fri, 23 Sep 2022 09:16:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4695510E7CB
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 09:16:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id F32A3B82880
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 09:16:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BC996C433C1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 09:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663924597;
 bh=UX8DTzQjQ12mqg9TxhxnT/YrIuxZDif4MZ5G5nqfGYA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=sTwz91DLThyDP73deN3HtVNURaEIpEO3ON2xleE0TZbR9xcM84oekPT1Ctg3fdVNA
 YbWb4vsc7fUXVJZxMDFZscEAlVnIcuxxrxGtUDV0EfAOo3OHzLBeVCIv54SzHbDoDs
 f2PO+xUd50E4Jq6eqN8nzL8CHO75gfxzlwDjze79WPzdWUdK63+Sc4IWLVs9yjyL9y
 bK70WHZahXOjEIIh0sc4ykA3PJtk6AzIF/bVMvEbK/nwKvIBFp345OVVRyd+uGH+T6
 cye+rM8R8LluX+lVbL5pMsR2L8be/7i+QM/X0QVoecw+gNWnYWLImqbsR7yc/cfv75
 uNcuREswtxKcQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id AABE6C433E7; Fri, 23 Sep 2022 09:16:37 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216516] s2ram freezes screen (Ryzen-5650U incl. Radeon GPU)
Date: Fri, 23 Sep 2022 09:16:37 +0000
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
Message-ID: <bug-216516-2300-G2ngCjAI23@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216516-2300@https.bugzilla.kernel.org/>
References: <bug-216516-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216516

--- Comment #3 from kolAflash (kolAflash@kolahilft.de) ---
@Thorsten
Sure I understand that simply reverting is not an option.
Is there anything I can do to track this down further?
Maybe enabling some debug log options to get more informative output?

Or is there a kernel/driver option I can set so workaround this behavior, s=
o I
don't have to patch my kernel?


I'm using the firmware (/lib/firmware/amdgpu/) as provided by the openSUSE
Linux distro.
https://download.opensuse.org/update/leap/15.4/sle/noarch/kernel-firmware-a=
mdgpu-20220509-150400.4.8.1.noarch.rpm

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
