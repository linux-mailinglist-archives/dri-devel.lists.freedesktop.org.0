Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 726B470E480
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 20:21:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23B4C10E499;
	Tue, 23 May 2023 18:21:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45FA410E499
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 18:21:03 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 45C846359D
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 18:21:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A8F8EC4339B
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 18:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684866061;
 bh=kHq8pphZKRS1JknlE8VUZESyNHEgCXRnH8ShUFbfL1Y=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=SQNqXSUr9DtEbZ7Cl+n52WLHyBUJQHOzeRZ05pqfG8WyyIiz8c6WQZuZ+G0itruKE
 qkIcMiWDVvOU2RwVKCmm8ewtbRZop8GhIzV6XMK1XgrNSJ4OO1oYziS+mguGpu7drf
 d5B6SeAvfAnwtyQEBERe1Mo/ceocnHMoPCDrzuiJuEFQwAolA1btcHsSZut2sR68HX
 HAQohuNqbEtkaw8btxIKljWewwSetRbA5NV7/4URDShqxTQnql0+KPdGMHaue3vjr5
 gIDVv0YEB0jsJ4lQ76IQFOThul9d/rT/HnGoAJSd2Eos7RNlkCi1ale/p22h7Fjgoi
 d315Sbue8AU/Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 93C50C43143; Tue, 23 May 2023 18:21:01 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216119] 087451f372bf76d breaks hibernation on amdgpu Radeon R9
 390
Date: Tue, 23 May 2023 18:21:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: PATCH_ALREADY_AVAILABLE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216119-2300-gJz5egW4lt@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216119-2300@https.bugzilla.kernel.org/>
References: <bug-216119-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216119

--- Comment #54 from Alex Deucher (alexdeucher@gmail.com) ---
Does the patch in https://bugzilla.kernel.org/attachment.cgi?id=3D303064 ma=
ke a
difference?  It would be nice to remove the special treatment for hawaii if=
 it
is not required.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
