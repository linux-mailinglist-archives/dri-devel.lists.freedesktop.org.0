Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 852CC54A90A
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 07:59:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8387C10F878;
	Tue, 14 Jun 2022 05:59:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC02810FB0C
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 05:59:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4DDD0612ED
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 05:59:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B4254C3411B
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 05:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655186358;
 bh=S+tSpiee9XQhhzC9nX5QUaqH/Puib7EeKM+URtEKapU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=I6fCGqwsR5ekKgev+5DxygnDG2+mGpHvqZJoJ4OENvUEup8vNqkAhILIhvKGH2+vp
 D2Ynt8n2Qw04BpJOlngCehcXNqetNV5ixOoLOczuMDh6Yg21wtYzqvpaja9ZB/uKmP
 lvGLUxXk9I3ULeMsrNV5I6EhN0gRFUYbZBvD4e+XpyTMt3ZRNaSndaB7co84s7bHfB
 aS4CQwzs9DZnKIBhyopIlH0PISQj7ZA9nQ23vm54QHsXFx1p9D5GjA5I795x2YLGBE
 AmT222FyocGyc7Nd0h4hRv68jBr8gzmpRjUN+Q65Ad9q7DM21TlfieUlPB60dCJzuD
 NIuSzN5csFw5w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 9FA2BC05FF5; Tue, 14 Jun 2022 05:59:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216120] [BISECTED][REGRESSION] drm/amdgpu:  add drm buddy
 support to amdgpu
Date: Tue, 14 Jun 2022 05:59:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mat200300h@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216120-2300-t2hvtAf0M2@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216120-2300@https.bugzilla.kernel.org/>
References: <bug-216120-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216120

--- Comment #3 from mat200300h@gmail.com ---
same bad commit:
https://gitlab.freedesktop.org/drm/amd/-/issues/2050

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
