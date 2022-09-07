Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 141A35B09C3
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 18:10:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA5ED10E347;
	Wed,  7 Sep 2022 16:10:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A83A10E347
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 16:09:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DB1CC61931
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 16:09:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4A50AC433C1
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 16:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662566997;
 bh=iCp75blGuMclZwyzKWjodGB2f3vqnqZiH7hZ99DY5Ik=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=AHPl4Orx0QeOpPbIPN7LFmsndNPl0PqYqSeuxj8heVWoG/+5E916s5PVEakfljHVY
 NyM4y+1DyMz/gZYbYn8ZkydxHH4WCYSQPs1QDXopaPoTB28ljA3JTDoUKIZp/kE7B1
 zlKSDMQ2q3ODLaT5Hrqptm3F00rlHlcQTFpaiiDTTY1t17SbMyLHOhe2w1t5BLNWNA
 CRH1pAKPh0ZcCNASY6xVTzzdps/vV2myQkIX0D3kGuqyVAtTYTKFmX9Yn/krcBlKg2
 jEKGME0pAovJpBzEzs30uRV4ldbk1vsi5d2PShz2SWvhADuirTWtf0wOat/ko5emhI
 yDHH380tOxz+A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 18334C433E7; Wed,  7 Sep 2022 16:09:57 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216455] PCI AER error caused by LTR enablement on amdgpu with
 LTR disabled on video card PCIe bridge
Date: Wed, 07 Sep 2022 16:09:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: wielkiegie@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216455-2300-OGMKvELFWV@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216455-2300@https.bugzilla.kernel.org/>
References: <bug-216455-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216455

--- Comment #4 from Gustaw Smolarczyk (wielkiegie@gmail.com) ---
Yes, it does. LTR+ is no longer being enabled with this patch.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
