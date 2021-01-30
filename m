Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CACCE30948D
	for <lists+dri-devel@lfdr.de>; Sat, 30 Jan 2021 11:42:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1244D6E03D;
	Sat, 30 Jan 2021 10:42:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C184C6E03D
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Jan 2021 10:41:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 9B52764E08
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Jan 2021 10:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612003319;
 bh=Rt0vHYiTr9GtregFnv8jDvHTXooOSF8OnZScDSKILec=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=gEbOPpXsJQ3yTiakeNr05w63k9dCOKmAj5rIFATrUzRHTRvCC4Ocf9xdpuX0IAedW
 Tlfmo2Qu5rPLBU1BeG09YreXoZuhC1TGaQrovCngpG+ORF6E96PEV9x9ivTOXzW29+
 tHh9mkkdc1GcLFfjTi9Ssd9QHsObjewk7X0+iXa7eY36Ilp0oDliaovwhsLCftm8HQ
 2kYlZozwLXnls4tZuFktOZvftUlPeM6jqArjt9grgDMjX2vHWhEq4aCOnSWvp3xF3I
 c74eX4s+p0t10JMCoDygAjtw3bebIq0/kK3Lb2EPwne6WFPM2N0116w3kfSzVmFui5
 Y8/PR5wK5Txbw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 7F94D6530D; Sat, 30 Jan 2021 10:41:59 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211277] sometimes crash at s2ram-wake (Ryzen 3500U): amdgpu,
 drm, commit_tail, amdgpu_dm_atomic_commit_tail
Date: Sat, 30 Jan 2021 10:41:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: me@jeromec.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211277-2300-j9UsLQM2yl@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211277-2300@https.bugzilla.kernel.org/>
References: <bug-211277-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=211277

--- Comment #7 from Jerome C (me@jeromec.com) ---
ok, you have it turned off already

Weird thing happened this morning... I woke my laptop up and it was slow screen
updates... I just closed my laptop lid, frustrated... I noticed it suspended
again... I open my laptop again and it resumed

I looked in my kernel logs and saw the error messages from the first resume


NOTE: only copied the error messages
> [drm:drm_atomic_helper_wait_for_flip_done [drm_kms_helper]] *ERROR*
> [CRTC:62:crtc-0] flip_done timed out
> [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]] *ERROR*
> [CRTC:62:crtc-0] flip_done timed out
> [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]] *ERROR*
> [CONNECTOR:73:eDP-1] flip_done timed out
> [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]] *ERROR*
> [PLANE:52:plane-3] flip_done timed out


but on the second resume... no warnings or errors

I think it's a bug somewhere between suspension and resuming

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
