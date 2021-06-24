Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5B13B357C
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 20:16:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D44E36EB43;
	Thu, 24 Jun 2021 18:16:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ACB66EB43
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 18:16:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 0F7B8611CB
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 18:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624558583;
 bh=gpl1FhAiHwv/nP9jlc/69InjERb/zRN7hUltpOi2NiQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=PfEJ99wbHDzdoypPaMSUgxYGHKvvJ4hXRFw54F1uTCI09jmxAwNJkAPD7dRwryRaR
 nFLoa8JsslxxPHfcAvs/9C8YpARPKBi4oGReFpBSUsw0d2jSqz8BbsxfOnBlvBOt4b
 Ktq7VGPJDOLUV9v2fS3JdGKjOzREFOiDrSMds/CZ3Ey7qYgNvc+w/aODXaa2RwJM9Z
 DYFUwVkKqEeHFeFh01zBk5ptEfpv1cM0Ug8mijKgSUVv7TZ2EKfjsO2y/bzYcqw33q
 FHn2LauN7T4JmFYPDV5oYYKp1vI+pPgScX9jga46Gu2NsQX/8Bd4/CQ0ezlku7arup
 s2tTN53Aa5MZA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 0C7956112F; Thu, 24 Jun 2021 18:16:23 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213561] [bisected][regression] GFX10 AMDGPUs can no longer
 enter idle state after commit. Commit has been pushed to stable branches too.
Date: Thu, 24 Jun 2021 18:16:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: hagar-dunor@wanadoo.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213561-2300-1h4UL37i1d@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213561-2300@https.bugzilla.kernel.org/>
References: <bug-213561-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213561

--- Comment #8 from hagar-dunor@wanadoo.fr ---
Thanks for pointing to a different commit. I don't really have the time
currently to revert a specific commit to try it out, pointing out the probl=
em
happening between two consecutive kernel versions should be enough TBH for =
the
author to know what this is about.

I don't mind filling another bug if you insist, it would be nice to have the
dev show up here and state if that's necessary; the problem might not affect
the same hwid, but it's basically identical, I wouldn't be surprised if I o=
pen
a bug the dev decides it's a duplicate.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
