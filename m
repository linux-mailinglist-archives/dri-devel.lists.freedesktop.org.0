Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 730464D1A3A
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 15:18:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 651C710E6C1;
	Tue,  8 Mar 2022 14:18:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C06310E6C1
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 14:18:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 84D9361479
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 14:18:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C0B0CC36AE7
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 14:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646749098;
 bh=Ov52j4hbvOHm+L3Ideth34Stj/DFLIbjjtJ9E1sR1dE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=iNQjolr3xo9sF1TMCkVIbUOaEGVeNrEcc7v/eWTPqc07XLgsfaUfUcO03zzifZ3Yr
 BVJtwG/tL4s6I+Fbo8TBYBj4nUR0RSTKk16/7ka4Du/pBYYOKxXMrNc61cDqOFfI7M
 PvS2kJvCkIvNrkBfXglTYcAGNnlqhwyhuf7B5JVUQcwVBrFp5Yuge+NMSPS5QsT5nw
 6l33TRJzK4HuTY2bYrtPGNyo6nukMjscL2UJ8d3T0CSOLXP1G/1y9ZwB5ZD9aXEPnC
 4J4bh9klmH/VueKNJTYI7T6Id2gyWoZLUAt3kmbuwDWz/Feq4EyRFAxzf14awPnsC1
 mX60xON7Mo23Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id A4BFFC05FF5; Tue,  8 Mar 2022 14:18:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215669] [drm:gfx_v10_0_priv_reg_irq [amdgpu]] *ERROR* Illegal
 register access in command stream
Date: Tue, 08 Mar 2022 14:18:18 +0000
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
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-215669-2300-HMfcDtyeqg@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215669-2300@https.bugzilla.kernel.org/>
References: <bug-215669-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215669

Alex Deucher (alexdeucher@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |alexdeucher@gmail.com

--- Comment #1 from Alex Deucher (alexdeucher@gmail.com) ---
This is most likely a mesa bug.  I'd suggest moving it to here:
https://gitlab.freedesktop.org/groups/mesa/-/issues

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
