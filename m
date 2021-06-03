Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BE3399A95
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 08:23:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 836276E0A8;
	Thu,  3 Jun 2021 06:23:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA23E6E0A8
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 06:23:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 6DC69613E6
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 06:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622701412;
 bh=uViifKe4GZWT/K6VoR6QVbgtR9bGTYe1BH+hmMatk3E=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=OkWhiZaNs9HpOJ6V87kPIYqzGMgJaVLVNFJvOpuea0ZhI2dTSKYWZuWkkuBwjIrzN
 jrXh6w9vbEZCr9/RLvX8tF1l4IpTr7uA0fMDqQ8lzOj5RVyFycNzDgKqMVPk1DJPpD
 cuLyV7KrHs7O82CDt2NqFK7PXkI5kh5sTQGuEIZI+L2c4ea2g9l7tby+8k0BYQaH+/
 MpVHaidEzQS47qO1PeufV0jgeyE5gx0Hz5ZQZp4v2MOcr00+HowU1dVXJrBGQ9AURI
 iPXSaalwXzC+rBF+x25XjHhvkz6HMVg5RXWelogqNjpLzco3vxpQ82+rRsCc0BZQ/K
 I6hPEG/hGcBMQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 6AB8E61206; Thu,  3 Jun 2021 06:23:32 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213321] Laptop not waking from sleep
Date: Thu, 03 Jun 2021 06:23:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: sujay1844@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-213321-2300-UEZeYORJCy@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213321-2300@https.bugzilla.kernel.org/>
References: <bug-213321-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213321

--- Comment #1 from Sujay1844 (sujay1844@protonmail.com) ---
Created attachment 297125
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D297125&action=3Dedit
Journalctl output

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
