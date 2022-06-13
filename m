Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D55215492F6
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 18:31:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACBA210F14A;
	Mon, 13 Jun 2022 16:31:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D98010F146
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 16:31:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5F5B861511
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 16:31:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BDF6AC34114
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 16:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655137870;
 bh=ERRDW4TdZg9anMpUoAmxWn8gkhU0yEhvOQBFgOSB3XU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=eR8zVJ3ZSVMdtdIs5sFV0gWgZXyVE/236rNBv9KBoeTtZDvuLqK5W2FoxWcCKchB1
 0VJKVwbAU1IQXpSxoAe0axmzP4wS8RcO0W1BjfvM+7fa89pf7TsZhGcI7LFQU6lyKP
 MJbngosOADCpqfO5nBfjeZJPLqA5v1AbErvyIP4S8Uu56IoBl9XXCRVH7Q2gsn6AO4
 6I+1QPW6BPUoAG8jHuROdF601Onfocn1MTPRyopJVA1EaQHKYsIpLU4h3jaBvYUIbT
 d9DOqZKZqWwTRb3FzPvVzhY6045/zEFGGQb+Yx80sGTY6r1DpPN54FpPxt/Bu+7EVK
 NvKoApINaLasg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 9F41ACAC6E2; Mon, 13 Jun 2022 16:31:10 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216120] [BISECTED][REGRESSION] drm/amdgpu:  add drm buddy
 support to amdgpu
Date: Mon, 13 Jun 2022 16:31:10 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216120-2300-DXH7hQMPAj@https.bugzilla.kernel.org/>
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

--- Comment #1 from mat200300h@gmail.com ---
Created attachment 301164
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301164&action=3Dedit
BISECT_LOG

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
