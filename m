Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D54F2565B8A
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:19:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0188E10EE85;
	Mon,  4 Jul 2022 16:15:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05A3110E00A
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jul 2022 05:28:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1CCF261449
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jul 2022 05:28:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7A9B3C3411E
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jul 2022 05:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656912481;
 bh=C+6itSDPKNfPeakRl27VbQSN5LhsANPFeVkSWo6hh/M=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=kIENqXQfL9GRnfu7l6rYky6dkxk2y7+m6N+5n1iVkjTR50n2i4h4msuXRIt8/P6An
 YWG6T5VEYP0zc1GdRDh/Ns+rmLe/R8PFX3gVCZDFHNcUBWbMDiRLofqdAJvVlOch2G
 XVIHeNGc44/QJzqEYSayUOeKvN4L4iamGpE4n94Bwg+NZ5E9hSujWcz9txBP87eudr
 gsr/42Ak6ncZUhpbCmvby59oE/HcVNPjIddsRpnlQ6iMEAwwXSfT1nUBzvrbkFZgK4
 3Z653YhlVHcj0VCH81vGzWX1vfg4FqOsvgMcYXg9B1TjSKod7a/PmYAFo7UJCNeDJ/
 rP3WkLiF0raRQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 63E76C05FF5; Mon,  4 Jul 2022 05:28:01 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216201] AMDGPU hung after enabling HIP for gpu acceleration in
 Blender Cycles 3.2
Date: Mon, 04 Jul 2022 05:28:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: toadron@yandex.ru
X-Bugzilla-Status: CLOSED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status
Message-ID: <bug-216201-2300-yx2kkmHmkl@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216201-2300@https.bugzilla.kernel.org/>
References: <bug-216201-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216201

Andrey Solomatin (toadron@yandex.ru) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |CLOSED

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
