Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C271845E6B5
	for <lists+dri-devel@lfdr.de>; Fri, 26 Nov 2021 05:04:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0D646E517;
	Fri, 26 Nov 2021 04:04:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1EB96E517
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 04:04:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 6FBD661151
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 04:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637899446;
 bh=wujNyZq6PkRPHMrAJjn1lFuZHDG+K/tU6AqYIQtWnhQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ArESGN4AIr1eISgXZwPVIOab11uZe/qB1saHcT/bMUrDxKMr64FoYa9ZTmPkM0fL9
 6QDQYyQ3w+dOsOFAmR8odxEEjBjfSQxw8lDz8J6cyxIsX/NPtwmBkj5wTUepqP4ptF
 2O3EwTGeBPAYQm7GG8gc7Dhpmglz+5jfnp/5xcGWrL2cchyMSSSwi6M8YBS9NII3Tb
 Pmoj8F63QGD3ouJ5+O+f6Cksj7EP7xQemgp9+GvMRTp1JgNoj7sHeD+wIjmvCiuKiA
 IlfxTF45lTpdWR25zUXVvPKsANuUZAk5DFIE5sLt/uPdlvOtihS6+8SXM4MpcSxyUw
 fhiU651dpuInA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 6691760EE5; Fri, 26 Nov 2021 04:04:06 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211277] sometimes crash at s2ram-wake (Ryzen 3500U): amdgpu,
 drm, commit_tail, amdgpu_dm_atomic_commit_tail
Date: Fri, 26 Nov 2021 04:04:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kolAflash@kolahilft.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-211277-2300-k1N8RRtZjL@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211277-2300@https.bugzilla.kernel.org/>
References: <bug-211277-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D211277

--- Comment #81 from kolAflash (kolAflash@kolahilft.de) ---
Created attachment 299721
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D299721&action=3Dedit
Linux kernel make .config

@James

Compiling v5.10.80 (f884bb85b8d877d4e0c670403754813a7901705b) with the prov=
ided
patch results in the same error.

I attached my Linux kernel make .config.

Compilation platform is Debian-11.1.0.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
