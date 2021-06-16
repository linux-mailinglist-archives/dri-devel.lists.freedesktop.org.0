Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D274C3AA5CA
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 22:58:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE1FF6E828;
	Wed, 16 Jun 2021 20:58:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DFF46E828
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 20:58:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 41B86613D5
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 20:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623877094;
 bh=2S5bnMxkyECJm4CUldcRa4yYcNyTICe/RDFIMEvFCcU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=C6/YCt7a12ZxAiLeXwjev3EVS3VPjJ6MBN5D/5RM6r8Gdil1K9efqUd7OncsDGCGn
 kEZYTfMjiS5wKPsmL20Tdys3K+/nawVpsuoJpIXns5B465KO/7W0/fF6XK3bijCyZW
 iRGt7U2egTqfuxgA0AGs755lZOS4s5UzCO45G2ctCqZq0sQ8tDfG+tredU2LfY4nFy
 aKKXs9+7cUNoq/SnC95bFx50BqJZfMzkJCRANdjoiQXTtiQiHaS3GvMrcVwLMD6oeI
 TwRS0gB9nNpTbDHUW9ieaBAbLu+vmoydAxX4bFjLbEuBUG+0ZtvjrLAtzvxsOhB/cE
 dpERW4KBJenAw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 3EA9A6109D; Wed, 16 Jun 2021 20:58:14 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 209457] AMDGPU resume fail with RX 580 GPU
Date: Wed, 16 Jun 2021 20:58:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lsrzj@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-209457-2300-F5Moxf2Brc@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209457-2300@https.bugzilla.kernel.org/>
References: <bug-209457-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D209457

--- Comment #27 from Leandro Jacques (lsrzj@yahoo.com) ---
Comment on attachment 297415
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D297415
Kernel crash log for kernel 5.10.x

I had to downgrade to kernel 5.4 LTS to get rid of any problems

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
