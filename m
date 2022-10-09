Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 317115F8DD1
	for <lists+dri-devel@lfdr.de>; Sun,  9 Oct 2022 22:12:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF46110E048;
	Sun,  9 Oct 2022 20:11:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD63810E048
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Oct 2022 20:11:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 07B0B60C4F
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Oct 2022 20:11:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 23416C43144
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Oct 2022 20:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665346314;
 bh=r9+tPe8JIedLlpsKJkdBp7Q8vubmhQ6M6n04BwzdS68=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=NtRIKDG4VTncVrvGoJit0YuU49UWIFYdFAN4cOH9qkNq/B840I4I4QOFvcEZmVhhc
 C6eq1IixV/xnPZvSQMPZsq7uqlsdCdTu6H5/8SwoTgVHF/hVRaoGq4xAYlajO51bnZ
 PzKozwjFE+8UfwVL6qr0KPITyANf9UZVkYz1mg5pHQpNpsjhVdwxs1AXzbErFFSg5f
 ygmloo+hWSw6eJksVkKd3Y4lwhPiO7SG+M4InNrmG/CQlvchggKl0MNjzWqU4okfiG
 ESzx2RV10LWKJ4RizWDN7E084Voxik/+5tOU8g1d55QATnmJNpjdqLHHlZ/jh1+NiI
 93mUY3bbtFK8Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 110B1C433E9; Sun,  9 Oct 2022 20:11:54 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213145] AMDGPU resets, timesout and crashes after "*ERROR*
 Waiting for fences timed out!"
Date: Sun, 09 Oct 2022 20:11:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: chewi@gentoo.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-213145-2300-TXQ042hH1k@https.bugzilla.kernel.org/>
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

James Le Cuirot (chewi@gentoo.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |chewi@gentoo.org

--- Comment #23 from James Le Cuirot (chewi@gentoo.org) ---
Same. I see this quite frequently with my RX 6800 XT, particularly when usi=
ng
Vivaldi, though that may just be a coincidence, since I use it a lot.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
