Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F84560184
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 15:40:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9565510E355;
	Wed, 29 Jun 2022 13:40:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D464F10E355
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 13:40:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4B58161E67
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 13:40:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B5018C341CE
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 13:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656510040;
 bh=YytcQHf+zvc8PsxWWrmu+AiUbSyfaOd2O1TQqLR38CE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=dy5v4jeclRfnXlKwnmvkkkOGIRP1VEN0/AEyvWbDcIUvKqGuDCiTY5s1DC5JuI3B4
 auIOeSdiyX0XLPe5g1xg8EEICWyJVs7G2rJFxwWmRD1YwUBOHfUbGklhDVfRRzNuNC
 GHZYwc7DcQlUxedgntyfUZZY/9pjqAiOKjgHOQSfK2titG1WMNLK54ewJ4DfTK6SUk
 o4Jf+DpETq1Bp9HFYlK3igqXiU5E4MAxgpZ1jd4lXU1uWj38TdweZ0CZz2AcTrRc1g
 yzkupbnnAj+p3WLx3QH81YSJc8Dec9a66hW/CubeCktYfgHJKWvU0Bbgba98mKIRRx
 EWtSn/zG7ha4w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id A07AECC13B6; Wed, 29 Jun 2022 13:40:40 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216119] 087451f372bf76d breaks hibernation on amdgpu Radeon R9
 390
Date: Wed, 29 Jun 2022 13:40:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: h.judt@gmx.at
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216119-2300-b6itNjX19K@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216119-2300@https.bugzilla.kernel.org/>
References: <bug-216119-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216119

--- Comment #31 from Harald Judt (h.judt@gmx.at) ---
Created attachment 301306
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301306&action=3Dedit
dmesg.out

amdgpu.dc=3D0 doesn't seem to make any practical difference.

BTW: With the new patchset, the machine also does no longer vt switch to the
console. I do not care about that very much, but the old behaviour has been
restored.

This time, the following message did not appear in dmesg.out after resume:
[drm] Fence fallback timer expired on ring sdma0

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
