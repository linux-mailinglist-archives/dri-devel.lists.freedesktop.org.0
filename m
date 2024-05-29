Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FADE8D369F
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 14:43:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A456A10E5BA;
	Wed, 29 May 2024 12:43:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jKaSeM2K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55E4B10E5BA
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 12:43:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 97CE16289F
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 12:43:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4E27EC4AF08
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 12:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716986622;
 bh=k7fnp1KGPT+vL5xLFX8K8qM60ceoKRLLXz60Bbs24Co=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=jKaSeM2K+vgmQuNpXNXjQVhARaFZMZkueqsmmGg0k4yfOunTbNsBtkn4BN4uQ/bzq
 t7fGvI3PR/gP0hqGgBmJchYdWWEQ4KWyEoYfhpL3xba+nADgfr/7T4fa8dWxnQjVPi
 ACeliUkHXizSKIZkSyc4/Ys6J08fqjIoPiiwCK0MbKUrOgHS8jtJaw5dtVaOwI63Hn
 RfoCbQSBTDmSlxhN5Y7BwRmrYmQqRpzDR4YZc41yC7PQLukt31F40JJgY3Eq0FwNUh
 rrbUfhCEMfa8ktg0sQZFG5H6ouDS/OsMGhnRJEQh0qgysdE9WJXmIWMLrsTTAvBhWH
 AJtydHgyctHmQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 45494C53BB9; Wed, 29 May 2024 12:43:42 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218900] amdgpu: Fatal error during GPU init
Date: Wed, 29 May 2024 12:43:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: jean-christophe@guillain.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218900-2300-tsPVTdEm9G@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218900-2300@https.bugzilla.kernel.org/>
References: <bug-218900-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218900

--- Comment #11 from Jean-Christophe Guillain (jean-christophe@guillain.net=
) ---
Created attachment 306367
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306367&action=3Dedit
Full dmesg after applying Vasant's patch

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
