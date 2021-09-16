Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C5240D9AD
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 14:18:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 087A66EB81;
	Thu, 16 Sep 2021 12:18:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ED0A6EB81
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 12:18:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id D8A7860F11
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 12:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631794727;
 bh=yAR7tjX7DeDOxTzY5YegyXG3FgjKrRh9BjCUOnVr9EQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=A46xFbQAYse7ALUQT0M0dZrenV7be3L9auc8/rKB0My+qIpanZ96PYd48njvrFDWt
 TUHBo/hekxkWhHy60GXjxb9C3/V46nCOM+4Or8u7q8ezQtc3kztOCCDmzZI3ZQoser
 e3XkIy8OTYYFvrcNygmly5V8gSinD3cwHydwfeoGOzSQZQeBGOZQ/BOp4k4S614tZj
 Ljqw9twmDog6pZXTl4b3kbSrBi1sV3+qV1Yw8+9G76mfcsbijq07r+C7Baz780of9A
 +UtC8GJn714BTpAYBUQGyW1/OzTmjZQk2itxVfVV/31SnLeBy6SBSJqwlv4/lGbedU
 6gKPt6jgSdhXw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id D5CE3610CA; Thu, 16 Sep 2021 12:18:47 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214431] [AMDGPU] Graphic lockups and various ECC errors on
 Radeon VII
Date: Thu, 16 Sep 2021 12:18:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: ted437@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-214431-2300-x7UUiNbH9S@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214431-2300@https.bugzilla.kernel.org/>
References: <bug-214431-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214431

--- Comment #1 from Anthony Rabbito (ted437@gmail.com) ---
Created attachment 298839
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298839&action=3Dedit
AMDGPU lockup when waking up from monitor sleep

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
