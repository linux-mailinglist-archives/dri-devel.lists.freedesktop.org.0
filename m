Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 357FD937562
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2024 10:56:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19D1310EB77;
	Fri, 19 Jul 2024 08:56:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rP5TUtCK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F105C10EB77
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 08:55:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D29F060AE1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 08:55:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 61B62C4AF15
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 08:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721379356;
 bh=HddKW+Z+tKYgia/BhXrmWgsJfxsZkS8z7d2BZTdXHQs=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=rP5TUtCK12rzIDWV2CwWbFQwTozn17H8XO7jRidS9SN6MfJOoC30EoIg+8d1vRu8E
 OzQPoklJBqUI0HoItL2hdBxn9wmyz2KEHH03n8pxodZixRL5qsZXp7c6wMSLgF/q0w
 NRLmd4kFsqvL7k0cmeMnXBxt5pUcrcdbLzZwjUzrJt4XqTTBNq7d9bX6Es00DfBi4y
 EGO8fViszRvrGK7wAwdDMjcGjSoZHd2dIT6X301dkzVCd5SfOmW1Dlqjv8L9eINpf5
 vB8a6gvDDG5S42vI6ccswa7GLkyqnNJAk0/qmOaDxieuPCxoB9I4+hAYmkUou2/fcY
 LbjTuBVk64NMg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 5ABEDC53BBF; Fri, 19 Jul 2024 08:55:56 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201497] [amdgpu]: '*ERROR* No EDID read' is back in 4.19
Date: Fri, 19 Jul 2024 08:55:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rev@pop.ms
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-201497-2300-DxOEsfaJi1@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201497-2300@https.bugzilla.kernel.org/>
References: <bug-201497-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D201497

--- Comment #36 from Rev (rev@pop.ms) ---
I still get around 700 error logs per day on my 24/7 PC.=20

amdgpu 0000:06:00.0: [drm] *ERROR* No EDID read.

I am using the standard-kernel of ubuntu 24.04 LTS now (6.8.0-36-generic), =
with
the standard mesa (24.0.9) drivers that come with the OS.

Display standby's and wake-up's work as intended tho in ubuntu 24.04. Putti=
ng
the whole system on standby and waking it up works since the change from ub=
untu
22.04 to 24.04.=20

So for me it is not an issue about a function. It is an issue that is most
prominent in the logs of ubuntu. If I did not review the logs I would never=
 had
known about wake-up issues in 24.04, that was different in 22.04. Putting t=
he
PC in standby in 22.04 meant never waking up the display again and the need=
 of
a cold boot.

But an average of 700 error messages per day means there is something not
working right, imo. And since that is a very, very old issue since a far ol=
der
kernel version, and a lot of AMD gpu users out there, I would like to help.=
 But
I am not a tech expert, just a user who can read stuff and do stuff a bit
better that an average user. So please, if you want some more help from use=
rs
with that issue, please explain how we can help for a solution and I would
guess people would contribute their information to help solving this issue.

Sorry for the long winded comment.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
