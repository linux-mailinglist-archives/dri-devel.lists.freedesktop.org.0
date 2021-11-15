Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 419314501E9
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 11:01:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C57816EB15;
	Mon, 15 Nov 2021 10:01:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 308B56EB1A
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 10:01:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 0516F630EF
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 10:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636970460;
 bh=1sFAc0jXxcUNSQa2fmLzHlU8iW0MOL/mOXENJU65098=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=sjazUF3E1H4khuUUmWinh3TxYXZUrhw+R+cvKnG8+umRXblMxzMmApntyuOB/+rQf
 0fy9w5MJ3BhHc1QVw4gZp4HEze7sPaWkW5s6H8Ru3CvpBp38eocexh4DoDOz8BGYz9
 o5x1EJOTpG9jCQ/VgiAeZ1mNkVoJVfQY9DgeXstcnPG57+dNO/VKQSGdQgfyd4j5ra
 BKYhGUfW1y+CFZwCjd01vR1sGyv1h2RMvixfXkMkhomTnf+ALIWmJxokBjCVFIS9UU
 648hmO/JDymXWF8/j42UTi9xBM5H21FnyGSzOVML6iaOL1jl6ZiMsJizBO4u7ZdGFP
 QZXt6eRW+4BVQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id EDFD260F23; Mon, 15 Nov 2021 10:00:59 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215025] [amdgpu] Thinkpad A275 hangs on shutdown / screen does
 not turn on after reboot
Date: Mon, 15 Nov 2021 10:00:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bjo@nord-west.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215025-2300-aWqffcZpLa@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215025-2300@https.bugzilla.kernel.org/>
References: <bug-215025-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215025

--- Comment #3 from Bjoern Franke (bjo@nord-west.org) ---
mainline 5.16rc1 is also affected.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
