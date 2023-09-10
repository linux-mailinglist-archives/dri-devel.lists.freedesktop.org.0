Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 118EE799DF3
	for <lists+dri-devel@lfdr.de>; Sun, 10 Sep 2023 13:57:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BE5F10E180;
	Sun, 10 Sep 2023 11:57:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC53510E180
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Sep 2023 11:56:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0CA4560A48
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Sep 2023 11:56:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 71DABC433C9
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Sep 2023 11:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694347016;
 bh=xW0jwJy+qm9a/YDPxhrwlGgca6WSBCJn4FogVqfUzpA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=tt+3l+dB8JEuizHvmWnOUfy14eJ2NWADrqYmka2XGknb6OkJmXH1VxXDLOQNL5Qyh
 pUIULpvfRz8xAVHcW4zxhB+OgOJlu7RVQWtQkXjq5XAJKUIAbU2Wv/UfeUKngBeCsr
 Jfu974ncjJT6maF1iPD168TTGDl9euJc9cwGstX2+KLMCdKGJ/X3mAaJ0s42L+G/VU
 gG+xsOLDMRilTTIfNpiwfyRdf4R1e/frnpjattMQAC6dTn692iTmDVDzq57IgHe9ye
 Pd7gUXFZoEekHzZ+kjKRUbh3Mi7Nj5gxGXO75nC9IjLiWwWxegDres5bIBcq9FOXv9
 3ckuimsSdYGgg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 63827C53BD0; Sun, 10 Sep 2023 11:56:56 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217896] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process
 information: process Xwayland pid 2985 thread Xwayland:cs0 pid 3129
Date: Sun, 10 Sep 2023 11:56:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: ionut_n2001@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-217896-2300-qmU8qPjjyF@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217896-2300@https.bugzilla.kernel.org/>
References: <bug-217896-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217896

--- Comment #1 from sander44 (ionut_n2001@yahoo.com) ---
Created attachment 305078
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305078&action=3Dedit
journalctl

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
