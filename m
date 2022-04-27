Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1A6510EB9
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 04:28:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B645710EE90;
	Wed, 27 Apr 2022 02:28:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC73610EE8F
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 02:28:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3E8F861C30
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 02:28:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A12F3C385A4
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 02:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651026493;
 bh=elfUudpiucd463cM17zNdzlgypwFu1LjCnsGZbuqI8o=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ogYRQ128EHIg3tDxJBNa2XElCu/A9jmEejxHJCjIQu9RT71N3prYxMvQ/1f80MOpX
 YXrgEUxtS/6xLbmmf1aOOA+DkHNZZjTqIgnEFGda6z2IziMKgRzJFi5TOs+YB7n5M2
 5QWlnoQOJwjy9FyK2MLo6o9O+MqA6eMNvNjQMOIHhAdXlSz7iuGd2+b921IaeIlom+
 ozuwNTMBMTrHZQT7C9IfdgaFXZDFCBYzq1Ax3dWkv/foqNiAWu+MJDbomSGutmUQu3
 oYxlqDV7e5mAFlIPMJDgZrHG2qyeuPshcNgypI0WFSulxsQMqiyYaIJqU7N6BegkbW
 ktz+PloD4r/Gg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 82534C05FD5; Wed, 27 Apr 2022 02:28:13 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215892] 6500XT [drm:amdgpu_dm_init.isra.0.cold [amdgpu]]
 *ERROR* Failed to register vline0 irq 30!
Date: Wed, 27 Apr 2022 02:28:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ulatec@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-215892-2300-NOabTbWZBU@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215892-2300@https.bugzilla.kernel.org/>
References: <bug-215892-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215892

--- Comment #2 from Mark Johnston (ulatec@gmail.com) ---
Created attachment 300813
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300813&action=3Dedit
Prior PowerColor (6500XT) board with chip that does not produce error

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
