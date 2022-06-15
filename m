Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8342A54CA0D
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 15:44:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9167910E78D;
	Wed, 15 Jun 2022 13:44:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4B2D10EA27
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 13:44:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 74EEF61B01
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 13:44:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DA6B3C3411C
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 13:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655300647;
 bh=+WjEQDiocdRkSdazPGWuFt/7CPNmQkOKEin8cSEEiKU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Y4HEd5xHJG8b+yjZjvgZToanFE+z3ntY+P//DMkbI5CcWnmTMRDhGUMvfxsTWfOJp
 mmgKg2IGykeovFYdLcUWk3oa7z8vjnj9YTsg5oivv5m5sRPN4NGunQlvrc1za0mwav
 6LWEcdRzfBCb/u6Yk0AB9jH3WoTUzbKKvEIP93cHrJ7reQyeQTfwABwiFEzVo91igK
 9ZtUV90T73DdQyMMOZguPRwVPBRkU+/ewwPlVZuD9+SmJXX2cs8OUUPQxoAJas6+w5
 GhtogUEFJNpBDIKB0/7X10w/Zl9TzBG0SGmMFc6HJ3y+4ko0+fz+373ZUXM3gZ2Jbf
 5Q9bwvn23r0nw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id C3AF1CC13B1; Wed, 15 Jun 2022 13:44:07 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216092] rn_vbios_smu_send_msg_with_param+0xf9/0x100 - amdgpu
Date: Wed, 15 Jun 2022 13:44:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216092-2300-jgU6fUNFen@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216092-2300@https.bugzilla.kernel.org/>
References: <bug-216092-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216092

--- Comment #3 from Alex Deucher (alexdeucher@gmail.com) ---
Does reverting c1b972a18d05d007f0ddff31db2ff50790576e92 fix the issue?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
