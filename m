Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E107C3BA3E9
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 20:22:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A19FC6E1BA;
	Fri,  2 Jul 2021 18:22:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE0356E1BA
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jul 2021 18:22:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 909196140E
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jul 2021 18:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625250144;
 bh=8zLvrTL5yuQNxq3rH7AF6jxLXLPmY2bXo77JbrWHSQw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=WARNP0kcPPZcZR+sKSpJwbyVninI9kmO82LqXnAN9YFg1Wt8+F7SUM7n3YilQr6rt
 Z4LcW1NqfFgvlnJgcvRIi7xsuyycrzO97+z2LG7T4Px33IrmFjf0DJWbofKsbZ5MKb
 Qa2rm6xysJL5B2ymIUzn3rS02m5o1EwZTuefqxx13cpCXeYvPAjtpsvJNEw13t+3vN
 thv+MjKa6CF+di7GLuTFk7NcZOf7xz3K4qHJ45Wj6gdwDqpaVCf1oUR7V64aDqCr3J
 LaOKebqEs1rr3x+0k8YQDoyNGtPncEyq7qVP+Z/LbWOre6xQyblshVv4mhhgcH0fWV
 dDra9WS66pwoQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 8B75A610CA; Fri,  2 Jul 2021 18:22:24 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212469] plymouth animation freezes during shutdown
Date: Fri, 02 Jul 2021 18:22:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: asterix52@gmx.de
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-212469-2300-RJiFomCbgV@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212469-2300@https.bugzilla.kernel.org/>
References: <bug-212469-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D212469

Norbert (asterix52@gmx.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |asterix52@gmx.de

--- Comment #8 from Norbert (asterix52@gmx.de) ---
I tried plymouth_0.9.5git20210323-0ubuntu1_amd64 without any change.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
