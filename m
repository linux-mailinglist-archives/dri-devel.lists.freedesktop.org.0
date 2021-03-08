Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CAC33198B
	for <lists+dri-devel@lfdr.de>; Mon,  8 Mar 2021 22:48:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0502D6E889;
	Mon,  8 Mar 2021 21:48:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D21F56E889
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Mar 2021 21:48:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 0C7BD65256
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Mar 2021 21:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615240089;
 bh=9cTRm1RfmyUBXRUZm88DKANTYv/TMCXdePGAOXw+QTc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=d89QlHVGr6m938qvJyrut6xHJ2XqJzyM7i7IfQkdzZzA6N5ThejTJjBPVgx/hdsal
 G6kOUR5MXYN8nXCVvT/jhfOHi+x/UQr2HTpKXpFnwSWdATJ3i7r8TcPTvhQoQQDxtr
 6xsnkZGD9hnVO16SyH4rENwgvyR8AIcInGAg3ZIIFMiVawEYelTXeZYPPjDwO9jOGF
 H95EP1T7qVFNGkZA511KsHF+FpZlkujDYXqWFmEslUHH2bdXfmH1lfG5Gxhvqo5AxF
 /8GX4OyoWuwMWsMy5Y/RywOWaRv2acgdks6nHE//g+hpPxv2eFYV57gOuXyQqQ9q/7
 qJmPBzcYyZkFw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 00B9F65349; Mon,  8 Mar 2021 21:48:08 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211033] [bisected][regression] amdgpu: *ERROR* Restoring old
 state failed with -12
Date: Mon, 08 Mar 2021 21:48:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211033-2300-Ce4rIvvlUC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211033-2300@https.bugzilla.kernel.org/>
References: <bug-211033-2300@https.bugzilla.kernel.org/>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=211033

--- Comment #18 from Alex Deucher (alexdeucher@gmail.com) ---
The original issue reported here was fixed.  If you are having other issues,
please open new bugs.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
