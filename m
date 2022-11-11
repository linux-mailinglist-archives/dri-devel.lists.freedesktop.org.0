Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A904A625858
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 11:30:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE66210E7DF;
	Fri, 11 Nov 2022 10:30:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B51110E7DF
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 10:30:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6EA5B61F4B
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 10:30:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D7394C43470
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 10:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668162604;
 bh=AMmp7ZPWm/1BTZic42SFeedGmeNDwHytSBvIJkPBssM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=NFsPI+aTOQCacy1e423IPiAAffkgE/RFRhZOaJQnl7GmXrCOqFerW5YamlTfLnL0m
 aH3guYScSrki3RvwWCOPF3aL0UU/cVXMMttHvmciJ3GgfP/hXWVoQDA28xWkGM5eEN
 hu+MOnp/V167BpHc5RCTsn2DCBu+MfSyBem9Fw56oTLoUEYcXjqY88rzeQIYhoJw+e
 mJCBKRJjWNW1MuMtZPhrEyYJ6VG5gP4YOQ2IpFpNiXSEilwjlE14ux6LsyD/+lu23I
 gMdxVyFYAcDb1MRrq/lf+a2eU/ydm9T8O0PhnpAvwvmizryMLDeIXgTCFmo46PuSTk
 ogcaSb1dmpWtA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id BBBE6C433EA; Fri, 11 Nov 2022 10:30:04 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216673] Recurring amdgpu freeze on kernel 6.0.6 only
Date: Fri, 11 Nov 2022 10:30:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: micheledellaguardia@yahoo.it
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216673-2300-KidzUUM9gn@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216673-2300@https.bugzilla.kernel.org/>
References: <bug-216673-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216673

--- Comment #6 from Michele Della Guardia (micheledellaguardia@yahoo.it) ---
Update: downloaded kernel 6.0.8, applied patches found here:

https://gitlab.freedesktop.org/drm/amd/-/issues/2113

and compiled. That problem seems gone. Hope to find patches applied on next
kernel release.

Regards

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
