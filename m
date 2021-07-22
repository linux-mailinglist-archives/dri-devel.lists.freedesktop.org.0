Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 469BC3D2F7F
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 00:06:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 899186E898;
	Thu, 22 Jul 2021 22:06:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 086F16E898
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 22:06:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id D726360EB6
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 22:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626991607;
 bh=LWbAoD6Z833XYyWgQK1CXQ6fnKKlW3UBe08pwt/CRkY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=CbgrMcZrNgVPCLyAowObiSa9Wgwqf+s2b2MHPtRpW66QEt4jM5jR89nyRAUHyqJwY
 gnzx+Nf8HHxnGCMCnir8yznMiUOfZ3TZH9bsE9UcaqtqhzNDejHbAK1VZoA/m2Akfr
 +p2lPbBxDj3pF5xwPSw2zVimZcboR5Vl04Ss7EOmnzh86N3DvE9picirEsEJ/yqV4E
 wV/hA1y78TzcQQeTqsk3lBkHxVYmTp4YJvBvPyU6bvSquQJCbyN6rG+nKXhBl0ve8J
 VExeL9ZZD64Cucb6GdWgseUchgK27fAZWzRCMwazCVf3/R9JCt35mKTnz22VxEzN+a
 4B/M4jZkxH/ZA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id D458660237; Thu, 22 Jul 2021 22:06:47 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213823] Broken power management for amdgpu
Date: Thu, 22 Jul 2021 22:06:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: bruno.n.pagani@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-213823-2300-hswtGAJZyO@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213823-2300@https.bugzilla.kernel.org/>
References: <bug-213823-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213823

--- Comment #4 from Bruno Pagani (bruno.n.pagani@gmail.com) ---
Created attachment 298011
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298011&action=3Dedit
dmesg 5.13

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
