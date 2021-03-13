Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF73333A0E1
	for <lists+dri-devel@lfdr.de>; Sat, 13 Mar 2021 21:06:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A11689E15;
	Sat, 13 Mar 2021 20:06:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 704B589E15
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Mar 2021 20:06:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 9F44964EC4
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Mar 2021 20:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615665958;
 bh=5Jr4YuZ3QBQ+gRULpjBoBQYugX6FB9enuN2qx3mZmZ0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Gnfly4vviIEz7eIpBTTgH9NuOEHXLDbq0ghifaV0xQUnoV6pT6tazYf0O614ruv+M
 Pz7UNDkE4VeUzTa1miUp91rFpn7JciHR9HNpSAX5ogz1DBzCkDGR+3AuQ42wpQoJv2
 SRHycFyYOIQ7TGHGBZZKji1SnIkWo38WwCXLBQ9HNxd7DYU03FqdOsqegkEhe/If2G
 gxh1fSC1TjHhGSVgHOGHGfiZTIWzdHmoAUdiOrR4UP/ev+jpjtKdXVjYqATt5Bw1o3
 RNjQZDVRccmoCbkoBHuDFp0e+7vF4pSO2CwDeWt4z7iuQCFSsGt95Mbb2gdG4RrK9p
 CwTcd1ArsM5QQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 96AB765301; Sat, 13 Mar 2021 20:05:58 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212077] AMD GPU discrete card memory at highest frequency even
 while not in use
Date: Sat, 13 Mar 2021 20:05:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: bat_malin@abv.bg
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-212077-2300-dfAhkUwIPw@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212077-2300@https.bugzilla.kernel.org/>
References: <bug-212077-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212077

--- Comment #7 from Bat Malin (bat_malin@abv.bg) ---
Code not fixed in 5.11.6

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
