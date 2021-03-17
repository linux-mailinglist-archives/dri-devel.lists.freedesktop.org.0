Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE3033F909
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 20:21:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E96116E5B9;
	Wed, 17 Mar 2021 19:21:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 103C96E5B9
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 19:21:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id C972364E74
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 19:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616008907;
 bh=lx9Uvwo3eIcyaTZ1Q/hnBEw/1HZcEzfbvmjXFL/mceQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=A4RqRq6V1TrQiyhXAo2tZ7RNGd4FJjY3FcsjzUtyyajzq3L+Ipk3h8WBrUvSJnMhU
 kUPtVU15K9T7x2x2PEaDVHyRpar/zkI3IHhLlIIuXxoUqoCSfcvH1CBKhNe6h6Nrou
 WFbhxbel+CWoudKKBTbr3/RIktn93trDL9W6yMSRfhnQa7XQ41izX+rPft5ApfXOp5
 mn0cqBTkD7vAma+Q02rKMzJOS+V/KKF9a6C8/hFMCrQsB2fdlSUHKZkMJBDDDP7zW4
 zyNULXOnr6qiBNFrC7/reA0E81X7/alJuIPxSrkNV04o4jc1RZse9mkmy6m36jYakU
 FeVjUSuP6/RXA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id B07DA6536D; Wed, 17 Mar 2021 19:21:47 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212077] AMD GPU discrete card memory at highest frequency even
 while not in use
Date: Wed, 17 Mar 2021 19:21:47 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-212077-2300-oAFuT7rx1q@https.bugzilla.kernel.org/>
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

--- Comment #10 from Bat Malin (bat_malin@abv.bg) ---
Created attachment 295905
  --> https://bugzilla.kernel.org/attachment.cgi?id=295905&action=edit
Picture of memory status (new)

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
