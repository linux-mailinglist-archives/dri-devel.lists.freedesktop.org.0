Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB5A342EDF
	for <lists+dri-devel@lfdr.de>; Sat, 20 Mar 2021 19:21:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67B806E053;
	Sat, 20 Mar 2021 18:21:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C80936E053
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Mar 2021 18:21:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 887F16186A
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Mar 2021 18:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616264464;
 bh=r6AGJAhjarnSNokKVgzDWEYjlgbfGbZG1axB1ACLvvg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=epfkOCk+fxsWG4m88A+IHNai8pkBLcBpwms4EYHUP/XTepJcbO4dUCAkDk8eh15X9
 ipe1CyVOZO2jNK3lzkkoP2VP9XuHd08JwNnO4/R5DwDzYnH1Z/FVDiS7UoIUiyWBKo
 ae4AvwlEz+6i7PxRNM/h+FHVdNrGmK55ADYLsJGgtoskD/DzrVToLzwxMBswUFBAoO
 mJh4+Umvsu35Umys65wb72L4RVIC80XqEVeccVe5KFF7i4mf/064WpEGt3IDdPED0D
 URX8D7VXT9FOiXi/FlSwOGNUgiyRBV51ASBwYHrGhVUkuMbwmF2TOAkSuovacbGdzv
 n30DeQCcMzV+w==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 717F062A3C; Sat, 20 Mar 2021 18:21:04 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212369] AMDGPU: GPU hangs with '*ERROR* Couldn't update BO_VA
 (-12)' on MIPS64
Date: Sat, 20 Mar 2021 18:21:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: xry111@mengyan1223.wang
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-212369-2300-yluptZHXBW@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212369-2300@https.bugzilla.kernel.org/>
References: <bug-212369-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212369

--- Comment #1 from Xi Ruoyao (xry111@mengyan1223.wang) ---
Created attachment 295963
  --> https://bugzilla.kernel.org/attachment.cgi?id=295963&action=edit
kernel config

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
