Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59838539656
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 20:34:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DFB310E3A6;
	Tue, 31 May 2022 18:34:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37DD210E29E
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 18:34:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 37E15611C0
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 18:34:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D7DA7C3411F
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 18:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654022071;
 bh=ONnWqv5Y9kWnlBjejivz/N5keZiz0QmzzTBGz7LKJ0Q=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=NVQt07BVjlqOg+o/RIFyF20FjWbrTDxgcusPCOMwrNEmCAa0Lz4U+/nDIxadw3ieh
 /TSYK9D7OeMDa45kC4xwDovwRVy3AmajowWgA3Ri3xfTX9ESjg4a2ShbkA2ijtbKks
 +2AamhyW42CJlgN8Tn5/3bNDOS/Iu3BZ30Y7WFKjmOanOVt87g8vZjib23gLrZxv/V
 DCr5MmlNJz0oUxKFlFgP+bLfh0jNcebGbxptQOqValTwlfE+gyva5BXPFp9E3agH9x
 e2GYlJh/QpXFj8XMtPUeCemD3DPy1/L9St3rY99oA74E/DYvNg/H3F0vvlRgESmY7l
 7kn0hNm3RVNaA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id C3943C05FD2; Tue, 31 May 2022 18:34:31 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205089] amdgpu : drm:amdgpu_cs_ioctl : Failed to initialize
 parser -125
Date: Tue, 31 May 2022 18:34:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: laguest@archeia.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-205089-2300-QB6f1IFMVE@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205089-2300@https.bugzilla.kernel.org/>
References: <bug-205089-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D205089

--- Comment #46 from Luke A. Guest (laguest@archeia.com) ---
Can confirm, for my case, emerge -av @mesa (where @mesa is libdrm, mes and
mesa-tools from git HEAD) fixes it.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
