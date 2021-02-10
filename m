Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1EC316AC3
	for <lists+dri-devel@lfdr.de>; Wed, 10 Feb 2021 17:10:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 849286ECA7;
	Wed, 10 Feb 2021 16:10:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E7576ECA7
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 16:10:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 3CBC864E45
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 16:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612973411;
 bh=hgz5S3mxsOAyoBRnIqO7+N+nDXuqrTiFe7tnYr8LbG4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=WjyiZ5GXCbDzZym1b/kOE1x9OU09nP+G3LQEPDIRP3/256/j48mpAxj8tyD3RwZjM
 73fOLmhiP7diUOcMSXVyi2q3chw3U2dRqROJvcXVdTlt2s60z2ZU87NF+VNqJkQfOX
 JdFu8TaBEG1zkpKlQRKKM+M2oGtnMpnu7NokKxC+wQpxuNjf68NP1WlAcjobdm7ZEn
 JKiHb3anq25BzvshETfA0JfBu2IWBrdGZm6s7THFqCnsE+STHSKMBwkZV/YDuGoQHD
 jr81v7lD4ZNxkt7fhdQ3vp6J2ked/6rsWVOkmAd/wm24Cv0ncFRdK0M1ZBRIiYqQD+
 +ke7IFMZ6qQ8w==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 348616147B; Wed, 10 Feb 2021 16:10:11 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 210263] brightness device returns ENXIO (?) on brightness
 restore at boot, with bootoption "quiet"
Date: Wed, 10 Feb 2021 16:10:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: plusfabi@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210263-2300-MSOVo23Ee0@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210263-2300@https.bugzilla.kernel.org/>
References: <bug-210263-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=210263

--- Comment #3 from Fabian (plusfabi@gmail.com) ---
(In reply to ninelore from comment #2)
> I just found out that this Issue does NOT occur when you additionally add
> the fbcon=nodefer kernel parameter.

This workaround works for me too.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
