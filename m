Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF14533555
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 04:31:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEC0C10E454;
	Wed, 25 May 2022 02:30:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D066610E454
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 02:30:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3399A61523
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 02:30:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3A950C34119
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 02:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653445856;
 bh=l1JLLpYg/OSG1cWDMFqGnP8VD6DHGuHb4SKKbmFZ8Vc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=lxsQqlq+QSE0xhu5NwWbDAljM4kRSP7IWCVnWA2ZMvZJeQSZhilFGzpcATuDzmhWA
 IWQTTTNwDiqYEU/kNLKs0vqERwKaWltrMDECY70pMVOLJBUbqQTUw+x4uritJG/TRk
 Fr9LM8HCw1+vR/EAWpBLoHdxLANtK3JrLJJTGX0uKP4Qkp8DAEGYtuRoZ7SyDzIn28
 VusVfWipfsHOiqNPTGin0RfFSaKmJgPcVrdbt3PrNB6FdYkQxToeBTLy8vt1xCbpH3
 rn0EbDs9ua/1Bu55fjymsbw6zGUu86hF/VNTf12kxAnwF/0ZJc8pMdHDEXySMqIy+7
 q1wum7NzbsqAQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 27964CC13B0; Wed, 25 May 2022 02:30:56 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213145] AMDGPU resets, timesout and crashes after "*ERROR*
 Waiting for fences timed out!"
Date: Wed, 25 May 2022 02:30:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-213145-2300-r1ZOZf1BUk@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213145-2300@https.bugzilla.kernel.org/>
References: <bug-213145-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213145

Alex Deucher (alexdeucher@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |alexdeucher@gmail.com

--- Comment #13 from Alex Deucher (alexdeucher@gmail.com) ---
(In reply to Eric Wheeler from comment #12)
> Considering this is a kernel crash, why wouldn't we still consider this a
> kernel bug?
>=20
> Just because it can be fixed in userspace doesn't mean we shouldn't addre=
ss
> the kernel crash because userspace should not be able to crash the kernel=
!=20=20
>=20
> For servers it is considered a security problem when non-root users can
> crash the machine.

There is no reasonable way for the kernel to handle it.  We would need to p=
arse
every texture, vertex buffer, command buffer, and shader that the applicati=
on
submits to the GPU to try and verify if that combination of data, shader co=
de
and pipeline state would possibly cause a hang.  A more robust solution wou=
ld
for session managers to monitor the GPU for resets and then restart the use=
r's
session so they don't lose their desktop.  This is how it works on other OS=
es.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
