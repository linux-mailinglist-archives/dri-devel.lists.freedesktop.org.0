Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E875A55ADAC
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jun 2022 01:58:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A315710E4BC;
	Sat, 25 Jun 2022 23:58:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E160810E4BC
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jun 2022 23:58:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5D06860FAC
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jun 2022 23:58:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 98EB1C341C8
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jun 2022 23:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656201522;
 bh=SpI1TKKh9Wc9hSpp30iBHc0g0y05WuSX+0iArXSbhI8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=KefOXjfpp4Aui0m9mkDXNYaFGEM3VkUvy4wUrb7N0D3UexOfnxAEeWUyoWzdsRBHY
 lq/vVblvDT9PfCuniSFkN2Ae3W/cJpgWHC7+AtOg5DbeSaFglEwm4A+4YJhB6l2FkK
 yWbY/dNyo6NVfrNRfbBf08jMJ+0SklyQMwZJrzEuw0WSFCqnhmtSIAS1wucfzCi63B
 XSVFVh8YvzdR+nCGeIioIlIkYLV72T6zSgh8A+RMIve+aHtWHJJfDxs8lC9LkTg94w
 Xy3wgSp7WSPLUn54xe0WqoLckf4u/SRePgGeeNpnMjiYNPvikdJDvlSNXJnTOnIh1r
 1BVAiWw0665Hg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 869AACAC6E2; Sat, 25 Jun 2022 23:58:42 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216173] amdgpu [gfxhub] page fault (src_id:0 ring:173 vmid:1
 pasid:32769, for process Xorg pid 2994 thread Xorg:cs0 pid 3237)
Date: Sat, 25 Jun 2022 23:58:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: witold.baryluk+kernel@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_regression
Message-ID: <bug-216173-2300-z886YMVVqd@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216173-2300@https.bugzilla.kernel.org/>
References: <bug-216173-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216173

Witold Baryluk (witold.baryluk+kernel@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Regression|No                          |Yes

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
