Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 129C55E81E9
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 20:42:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1F2F10E861;
	Fri, 23 Sep 2022 18:41:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0CD910E4D8
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 18:41:53 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3EEDEB81AFD
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 18:41:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0059DC4314C
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 18:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663958511;
 bh=ZCG2YzHHbHmGXoZJLfe6oTh3QikiJ/sMuC+17q6DAWI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=cgUIRwfztURaMGOI/uLTG0OI94HXZXxk/xeOp6+8kD1aQf+urPMYuRaMzrCHTkgRU
 7jJvByCpOOBVLxutfW3OQlzwUf9lo/rQjgtmEcB+YdjBwA6UjDvAGp5qOISMtfaJ7B
 Q59Kej13F08xvWylbtDe4q6z9ms51vE1wlWRRoEHo30FNFVrIy35ew4Bs8Zk+vt1pm
 lh7KN8k8qa4UKVlfhadNfCbStQ0nNnb2eTfWjiV47lfkV+gB9ooBuZpgYyF0dKepHy
 +E+j+yIG0tSn55bnJ8JtrgBZlL5QGV3VCX+RaoMMEjfYRIQMLYyHZFrAL7BUvW9lfb
 diPlp3SfCn2iQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id DF74DC433E7; Fri, 23 Sep 2022 18:41:50 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216516] s2ram freezes screen (Ryzen-5650U incl. Radeon GPU)
Date: Fri, 23 Sep 2022 18:41:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216516-2300-XD3Ebw2Zaw@https.bugzilla.kernel.org/>
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

--- Comment #9 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
You're missing CONFIG_AMD_PMC.

/var/log/messages:2022-09-23T20:19:35.187256+02:00 myhost kernel: [=20=20
85.619055][ T3150] amdgpu 0000:05:00.0: amdgpu: Power consumption will be
higher as the kernel has not been compiled with CONFIG_AMD_PMC.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
