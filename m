Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6837C5335EF
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 06:04:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAC1311246A;
	Wed, 25 May 2022 04:04:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC97D11246C
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 04:04:03 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BDCBCB81C39
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 04:04:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EA9C2C3411C
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 04:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653451440;
 bh=0Ex4BEozi08bf66zx8Tz7Wnv09T8wBbp0R9iVNoR9BE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ocpfBI5P2DordF69inO5xW6RJUYGZhwk5oqpc0IdyFxvUm90od3RC2Kx9gGVZAbpo
 bMkGS7c+go/ZyaCn+WAaPoeqD0bv3MNrKFc15eBYwtUa4h/Va3LZ6vhDkWOKyBsNI5
 V+2dDLuDj9FM9qgtM6l+1Pz3cWtZpYpmbGsJmQvG4GHiwUxnDHVN8vFfWFRTqz+SiI
 YZcMv5/k00WD9ASy/BHNyA7qS3+cw6c0bl0RT7LWYRXh2qaVcTaduwH/e8WkOMlCWT
 TcgBAgAwO1acV+eWWtZHEX7uwc2mbtQdwBQkHpeOdXTHV9a3JE3RKbIPPQivsfLOw2
 LKO4/O6IeI+8A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id D91A9CC13AD; Wed, 25 May 2022 04:03:59 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213145] AMDGPU resets, timesout and crashes after "*ERROR*
 Waiting for fences timed out!"
Date: Wed, 25 May 2022 04:03:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: bugzilla-kernel@z.ewheeler.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213145-2300-eM6IGeKJ2T@https.bugzilla.kernel.org/>
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

--- Comment #14 from Eric Wheeler (bugzilla-kernel@z.ewheeler.org) ---
Interesting, that makes sense.  Does the kernel have a framework for notify=
ing
window managers that the graphics driver reset?  If not then that seems like
that would be the next logical step.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
