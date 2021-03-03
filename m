Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5FE32B8C1
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 15:55:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E3F589CCB;
	Wed,  3 Mar 2021 14:55:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B829D89CCB
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 14:55:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 6232264EE1
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 14:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614783336;
 bh=bWdn0VsO9Cu6Zu4Xztdouk64imKjZEFl3h8fagG90rM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=pUX9UI+6qPywmc1ypOVFR15t6OBi92YX4WHUYYC8lJk3/h9COAd/RE6Zo5mm8UOO4
 mbtpHxYshJMzM9rxuqWmm4odxh96ZVwxgJeIsyGhBUcHr4lncX4Hb7Xo4zdtr5dvVj
 NvnUfbgG/TYofPM+NCIpdVYE6AvYqEKe4PioeMNM9zpq6QNpatrWAoRSZjjj31pkt+
 WgZlbczTjxRSUwzDVwN0aSdI/MWTxL6LybGqO2Ad9PnPm/axgbkAH/SxYSjgs7aFe+
 D+1ndrEho6UeDIMimdIC7BXc8AodbCGCPpjUlp0A5I2lok2kKa2bh/7fRYbkHLp7hh
 YSVdJ0iKaK9Dw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 54EE465374; Wed,  3 Mar 2021 14:55:36 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211981] AMDGPU: without cable attached videocard shuts down and
 does not wake up again,
 log prints "[drm] Cannot find any crtc or sizes"
Date: Wed, 03 Mar 2021 14:55:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: raulvior.bcn@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211981-2300-Q02ep2zP4v@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211981-2300@https.bugzilla.kernel.org/>
References: <bug-211981-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=211981

--- Comment #2 from raul (raulvior.bcn@gmail.com) ---
(In reply to Alex Deucher from comment #1)
> Does setting amdgpu.runpm=0 fix it?

Yes, it does.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
