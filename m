Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E605EB084
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 20:50:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1C2110E08D;
	Mon, 26 Sep 2022 18:50:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C131510E08D
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 18:49:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id CB605CE1318
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 18:49:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D430AC43142
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 18:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664218185;
 bh=JXpkfEu90r87P7xfEZGQAdT3wRdBxe6oewUbU3Pd1no=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=nN4oEAwAv33lcor5pPpepzVrAS7ZJdA9CfrNk153JT9V1av7e4t5Yu8RVxEMBbiSK
 Mcz03noJGacH7ExecPX+O/kSOXvICoNnRLVjvFRhRbuFHvb8rGD5yNy+CufSzetoh7
 Ph4CdC12zk4lomiXAtX/oc4o3uX4WrLmPWT+Qwdmm8fXBmeOULmnoo7OYoqylxjM4o
 Pz6wy5lUv6fg+yJzgse7PhsGWQQ83nDv3KZ3OhVO46ETwy0u5B1XqpU07LwAlre/pP
 iWjzZnHnGaibqn0VkAWbn4DzqnaUV3p+u+18tHASrJ4sDLU5r+n3wDJOmCcCtTzsjI
 6YKN+VWsr6/QA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id C2DEEC433E7; Mon, 26 Sep 2022 18:49:45 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216516] s2ram freezes screen (Ryzen-5650U incl. Radeon GPU)
Date: Mon, 26 Sep 2022 18:49:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: component assigned_to
Message-ID: <bug-216516-2300-7mH9yzzr9J@https.bugzilla.kernel.org/>
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

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|Video(DRI - non Intel)      |Platform_x86
           Assignee|drivers_video-dri@kernel-bu |drivers_platform_x86@kernel
                   |gs.osdl.org                 |-bugs.osdl.org

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
