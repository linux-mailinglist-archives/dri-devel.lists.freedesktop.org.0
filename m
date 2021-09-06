Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA37440168F
	for <lists+dri-devel@lfdr.de>; Mon,  6 Sep 2021 08:50:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DB3B8997A;
	Mon,  6 Sep 2021 06:50:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 599728997A
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Sep 2021 06:50:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 2188761027
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Sep 2021 06:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630911038;
 bh=qcrHJFs5KweSoYVfrELGn5vGvINsVLR9VnIleI9vnuU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ZecgGDFru726sSaYt+DwAj0wXr8FuTFyGK/0QDA9BxWHNunLSaYHR7e9EwIZL1wJe
 ryeM05LFLeRzpmnhoRezjYyznApgFTWS3V/u9o3nixD/T0ncbuig93YOXhaMrQxnQ6
 +oS3OIkZvWNHZ42iwfG/tlyFkxN4QiZLd49sC58jbMX0/oaCRd9PVnhpIuhdsUt2vm
 9fw0A+3HYM9fKRC/JDI4ocDE7cmXwfUoTKp731+1vBtkaWE4wcOdcD1eEcR9SkC4RU
 sb+I7ILRJnpfFx57ysEGE7MrzreRKvV2zXpaTO9lZ9HUCX9b5GB93ed+MK7PZ9Nr51
 RxM9SimpzJR+w==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 1EA0F60F90; Mon,  6 Sep 2021 06:50:38 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 107381] radeon VCE init error (-110) -- AMD/Intel Mars Hybrid
 Graphics
Date: Mon, 06 Sep 2021 06:50:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: huqiqiao@uniontech.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-107381-2300-rReih1Qw77@https.bugzilla.kernel.org/>
In-Reply-To: <bug-107381-2300@https.bugzilla.kernel.org/>
References: <bug-107381-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D107381

GeorgeQQHu (huqiqiao@uniontech.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |huqiqiao@uniontech.com

--- Comment #23 from GeorgeQQHu (huqiqiao@uniontech.com) ---

this card didn't seem to have VCE at all

pls refer to https://en.wikipedia.org/wiki/Video_Coding_Engine

it is same as Bug: https://bugzilla.kernel.org/show_bug.cgi?id=3D197327

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
