Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D0744FC77
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 00:37:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3E3389FAD;
	Sun, 14 Nov 2021 23:37:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88F9F89FAD
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 23:37:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 47EFC60EFE
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 23:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636933023;
 bh=ol/1oK92AnraJLTHuPhTm0jD/pAeBQcMhXwy7MdefPw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=PjLcm6BFulA5WiY5EVQUqbbOBO49ZrO+jgOUJQqZ57PU34Cj8TscJr0rVSYuLUgmR
 WS0a6CtswNEYULLBmwaMcCdGky9Zihay8odCF9PAQrRQEQPtsuZlUOt+9B7abVA0eE
 DjZgrcqgLq++omT8d9yMTAtprLZxot67Mq/Byl8jDveF4DLVyir//vR3Qqwbk+db2I
 BZD7HaCVe99ABWccqxTJWUQjRZYm58Kz5ahw400XWyUwRmnD3sQswjrvkl3KOH91y1
 KFR4YY4gGSQdHrOKaZ6mFzfzgVJYGjb6oAKwo+GVKOAwDtF9QY4WY5drAV5gsNX9CS
 BvX7QgQnNLtbA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 4240C60EE0; Sun, 14 Nov 2021 23:37:03 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215025] [amdgpu] Thinkpad A275 hangs on shutdown / screen does
 not turn on after reboot
Date: Sun, 14 Nov 2021 23:37:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bjo@nord-west.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215025-2300-If9FLMq5VL@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215025-2300@https.bugzilla.kernel.org/>
References: <bug-215025-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215025

--- Comment #1 from Bjoern Franke (bjo@nord-west.org) ---
BTW, iommu is enabled:
[    0.739887] perf/amd_iommu: Detected AMD IOMMU #0 (2 banks, 4
counters/bank).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
