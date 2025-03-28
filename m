Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA710A74207
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 02:25:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C5AC10E95D;
	Fri, 28 Mar 2025 01:25:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="vAhK9Imv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB80B10E95D
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 01:25:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0F3886116C
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 01:25:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E30E1C4CEE4
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 01:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743125135;
 bh=21YpMEpC7A9CX9YJtMEL1v85Ik2EKzV+rm4peKT/jbA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=vAhK9ImvBcMIf+QIbgpOoB2nq3Mr/dFBd8iI9NHKKU65ZQnjwdNaw9+5q/Y1p1L7H
 R7fIyzPwl+u9k9HFC/h1rz4RDpr0NdQbK7ZEFyttIECLkfYZc/Gvj/BsX3WqAFAmrX
 eqQydZhn/9XPu3vUKF9cjp3Ucmkbcc9N7t+f7ZZKmXBnBOm1N3j/FnDkrt0HvODw3V
 IWqejEyJIB7ABd8T8Oo0cZijtkECVXogSVkl+xr1v6NzOpSZFc6FoJwaFRxaqstBIQ
 MrnxSHTUUQKXQLoCl+24c8beyaPlqWtOZAUKzmkTH1MiiVMfOTyOdL2OGvYbUjwJmn
 but2BrJVtDPTw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id C8684C41612; Fri, 28 Mar 2025 01:25:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219929] Direct firmware load for amdgpu/isp_4_1_0.bin failed
 with error -2
Date: Fri, 28 Mar 2025 01:25:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: atiqcx@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219929-2300-q1ly5xsTz3@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219929-2300@https.bugzilla.kernel.org/>
References: <bug-219929-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219929

--- Comment #2 from Atiq (atiqcx@gmail.com) ---
Thanks for the clarification and quick reply.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
