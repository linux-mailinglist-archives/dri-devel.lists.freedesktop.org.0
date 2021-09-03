Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7CA3FFF98
	for <lists+dri-devel@lfdr.de>; Fri,  3 Sep 2021 14:13:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD7516E880;
	Fri,  3 Sep 2021 12:13:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00F2E6E880
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Sep 2021 12:13:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id C7111610F7
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Sep 2021 12:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630671213;
 bh=Je4iIlISZN38lm8qfD9jF6MK73Y0gJk329S7mgriEoQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=apNuxRky9iM5FIFFmk6W/m32SQJRqUjAfwUh74eXLV1CweW6WZruPRYrr/ju83kqu
 4z4HKgg4+0/oG5jwIXEqyS8nKke+nxcHmDAGHr/k3ZyQSLzR9iFEdg65y7KgJmve5h
 C+P4VRV8B0TwWyrvWtsYqBhF5WznJY2m+K6sOtTzhvu/eTYmqmuKAGwVroYBJXXGej
 cDHtItTvVC3zohlhJWxN5Hp1RRCdEn6DkvJ8EhWXJq5+2VCW9ljgrdgiYkQENWuqAv
 jEgRmRqLpVok1+zjucVxu3P/Y+UQfhJN+TMGwJEtTbRIm+/rH/rKH8159z6e/TPQjK
 c+NCw8pXV3Rbw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id C443F60E97; Fri,  3 Sep 2021 12:13:33 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211277] sometimes crash at s2ram-wake (Ryzen 3500U): amdgpu,
 drm, commit_tail, amdgpu_dm_atomic_commit_tail
Date: Fri, 03 Sep 2021 12:13:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ted437@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-211277-2300-NQPHLLcVpx@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211277-2300@https.bugzilla.kernel.org/>
References: <bug-211277-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D211277

--- Comment #49 from Anthony Rabbito (ted437@gmail.com) ---
Created attachment 298661
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298661&action=3Dedit
journalctl of amdgpu trace

(In reply to Anthony Rabbito from comment #48)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
