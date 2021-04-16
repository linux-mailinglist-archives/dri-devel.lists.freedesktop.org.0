Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E87933625F9
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 18:48:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E9146E1F5;
	Fri, 16 Apr 2021 16:48:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DE976E1F5
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 16:48:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 1DDC4611EF
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 16:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618591713;
 bh=oD0ZjUafeB8QsuQ9eekVLBmiab0hekfoDAz2tI+hWKE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=jGtk4kqhV1TaWDALIJSfhK8XM45Ao2P9GrgcZwixeoS86IbAKBqJZ9vSrphwK+MLv
 pqK/Y5DguJdGmzAlESGKMVX7nVZDTx9b5S48Fgusbxg2WlshGreaL1ksjLSnrm3duu
 fHA/002oZZj66f6BSWgOFv/J+cwWEJuv1aGUJcS9CAabdiKl+hJihX9gFRgvuvjp1t
 o7Ot66h8H6WHCG1Bb8rz6hwCyaPZVXB04rtcTdxvnnEiPVxVN1708OBLJq+POVyDGv
 VYsCoQChmLN0PA3HRO/0h+VVNYK0ZHwcGR/sTOVTU4sePuG7biGVYN4yJsKCaxGip4
 DJKAl49X9QyPg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 1AA246105A; Fri, 16 Apr 2021 16:48:33 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 13170] Macbook 5,2 only boots with acpi=off, or nosmp, or
 maxcpus=1
Date: Fri, 16 Apr 2021 16:48:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: mortenvermund@gmail.com
X-Bugzilla-Status: CLOSED
X-Bugzilla-Resolution: OBSOLETE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-13170-2300-eCls3ivasj@https.bugzilla.kernel.org/>
In-Reply-To: <bug-13170-2300@https.bugzilla.kernel.org/>
References: <bug-13170-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=13170

--- Comment #73 from morten vermund (mortenvermund@gmail.com) ---
(In reply to Alex Murray from comment #40)
> It may not be relevant, but apparently the same non-bootable issue has been
> seen on the MacBook Air 2,1 - which was solved (ie. without resorting to
> maxcpus=1 or noacpi) with the following options:
> 
> acpi=noirq pnpacpi=off
> 
> (originally from here:
> https://web.bricksite.net/u77w/realmoneycasinos/online-casinos.html)

https://web.bricksite.net/u77w/realmoneycasinos/

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
