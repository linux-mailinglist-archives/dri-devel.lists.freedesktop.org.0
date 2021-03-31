Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1AB34FC39
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 11:11:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB47F6EA03;
	Wed, 31 Mar 2021 09:10:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 023016EA03
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 09:10:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id D30CE619AB
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 09:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617181857;
 bh=HALbKTWfa7Zxn2sBGGD4Q7Ij2in9XIqLoHLcCIfQJLs=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=lMLCWfvhjWdDmbbvBPkpkolVi1HLZLfBfMDamlpk2dmGNSH6Y2vzh5eOOHYqwz8NF
 Neuys3+UTFf9npWtNW6Vlx5IJVUJs0o4I5545TzxmwThp51qsDalvm+mzXl2GAAr5c
 Z8yB0rxROJHOGsbXQk7dEKIaG7MHHKA48fk+zWWv1XOa5FLzrcxAG7cwYeLcNxrmcf
 canFyhBfCRsIu2gnp1zWkyqOsPmCfwdbcdRzKWzcVb4Kurrl2jDPallsyomPPJNSWM
 uQ0UEVdCh270p9AvpFf6RQKy9OTrbAfXreSDTkT3A/GEGZs/4FUloX/WBc87SZFX4y
 JPlFfjVBxH+xQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id CC66F62ABE; Wed, 31 Mar 2021 09:10:57 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212499] nouveau locking issue - WARNING: possible circular
 locking dependency detected
Date: Wed, 31 Mar 2021 09:10:57 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-212499-2300-TSYVUYrYjH@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212499-2300@https.bugzilla.kernel.org/>
References: <bug-212499-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212499

--- Comment #1 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 296157
  --> https://bugzilla.kernel.org/attachment.cgi?id=296157&action=edit
kernel .config (kernel 5.12-rc5, A10-9700E)

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are on the CC list for the bug.
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
