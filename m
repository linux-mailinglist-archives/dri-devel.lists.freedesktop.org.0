Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0655575423
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 19:38:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56C0110F2A8;
	Thu, 14 Jul 2022 17:38:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A72B110F2A8
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 17:38:39 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A5B12B827A0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 17:38:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3836AC34114
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 17:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657820313;
 bh=kz3Frk+pFqiyM9fMR7CEwN8PUiGG2wzGkWUqrbQH2xM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=nGNQVApUPsxkcEoxzBRrm61T20Gnwv075xCs3r7VhmyYJhkY9lqRah+0DP47OhG8d
 euwHj3kcLBjRx9ZeOw/IrqKrk3S911fDFNHSzWRwksP1yir2Y22RpIpstjgRe93Pvg
 56f8fLmlibXypOnWDVbwFcUzgER/LNIMKq5pz71iIicL7fOZkRaxVJDrkOMdKXwzHQ
 EhtKQ7utIWNPtbhRc3AYZywMcvEHNAGVnufMd/+Q6Lo6d5bQiNiO8y5a30X8S3KVjD
 JudoXk4DUaii0SYsf2dzmNKmbCNcIu9u13EQheIx49yCkXEvrP1UMjvvHX41bS7I1c
 MaGTUVYOC9SSQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 26A62CC13B0; Thu, 14 Jul 2022 17:38:33 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216120] [BISECTED][REGRESSION] drm/amdgpu:  add drm buddy
 support to amdgpu
Date: Thu, 14 Jul 2022 17:38:32 +0000
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
Message-ID: <bug-216120-2300-SdiG8GYsdh@https.bugzilla.kernel.org/>
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

--- Comment #5 from mat200300h@gmail.com ---
Created attachment 301427
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301427&action=3Dedit
journal 2022-07-14

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
