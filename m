Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DB04361EE
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 14:39:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EE876EC4C;
	Thu, 21 Oct 2021 12:39:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A980F6EC4C
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 12:39:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 0BFD161251
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 12:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634819984;
 bh=UKgE+eNxYggonJLBreBOmEBeE+5mjCaNvFJ4hLuLVAY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=XmG9JyKcXQV2vkUMd5etrLtcEoC1ouCXYzmydIwCjRKl4zVTmqBzT9QfRmHLcDizb
 NZxcC/FKnA3VxOh/W/+zGGh0o1Jx7F99Mm1TfcWUjwHrxowqU3RJcb5KUs+EegUBoS
 q8s8DsjlTDnCyMrspbnxPaIh4RfiDE7irBS6th2OWw5BN+7eV8ZuCVCran/Naxd01I
 rA4oJt5FnaFVdZJEMn5+0EpFa9d7VJbo41hOQTpA2zq/liETY6CXdZ5wITUYhnznA/
 +3cBE5TcrGW/jTrgQY0PqtmZ9S51GaDTpbJWbqdmPeWuN78KgYIsv/5R0soM4qc+Us
 BNX6OeI726uVw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 0907760E73; Thu, 21 Oct 2021 12:39:44 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214029] [bisected] [amdgpu] Several memory leaks in amdgpu and
 ttm
Date: Thu, 21 Oct 2021 12:39:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214029-2300-Eync77DQAG@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214029-2300@https.bugzilla.kernel.org/>
References: <bug-214029-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214029

--- Comment #22 from Erhard F. (erhard_f@mailbox.org) ---
(In reply to Christian K=C3=B6nig from comment #21)
> Can I add your mail as Tested-by? (you potentially get a bit more spam wi=
th
> that).
Yes, I'm fine with that. Getting spam anyhow. ;)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
