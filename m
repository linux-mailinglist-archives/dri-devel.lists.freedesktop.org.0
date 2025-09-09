Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5042CB50861
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 23:45:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFA9410E806;
	Tue,  9 Sep 2025 21:45:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tKU2KNWH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FBDB10E806
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 21:45:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 19CA5601F0
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 21:45:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BDCF2C4CEF7
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 21:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757454349;
 bh=75dzQbGxqBJFYXY4ghhPVMVaya3/a2b5BL299xkGKbU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=tKU2KNWHcpAfUeeqgK8LOiFYxV87X8AjVrtfAiLg3p2qji0L3PfeKpvRG1ZKOM7rj
 6mn/kFbqXTOHsMSeVFDjLrTQfPYREmeYLTI7ImGIkla+T80SyFwbkWfLvmxf495Aee
 dbRxPDR7NTaxnqOtFelyFSID2OfcqKuWkL+I0v5uw5WcO6PAkxw/hvMIy4aUVd0bXH
 bJg+0oz2LCbzaCdbnLkQjOXeGmF937EhGmYIu1Lhg7GfZdKOK2IgrXwe+Lqp/35qq8
 hqV//VDbRiLM8kijH8eQcBpDTF64mQD8GHdTR5n8vnVKvxCgyARjCggGDPIYEdlqyI
 ZnITPzuoSyOUA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id B7B22C433E1; Tue,  9 Sep 2025 21:45:49 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 220554] Display powers off after every update.
Date: Tue, 09 Sep 2025 21:45:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: vicencb@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_kernel_version
Message-ID: <bug-220554-2300-LbnK2vbnv0@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220554-2300@https.bugzilla.kernel.org/>
References: <bug-220554-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220554

vicencb@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
     Kernel Version|6.17-rc2                    |6.17-rc1

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
