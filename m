Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 611C6340A95
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 17:50:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D9876E922;
	Thu, 18 Mar 2021 16:50:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5A406E922
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 16:50:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 9D86464DF2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 16:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616086206;
 bh=oYsWULUEYUgg/XaqVxZUajFDETWUgUQyZr+gfeRl+KQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=OXdTVoNAgEsIkG6utgMBr+EVr5HokKE37jESXORTVt08ZT6RU940ojw4pLMqEVJMD
 UBVyb25wMZ2+XAvhoHTSNYe7heUu5abgIVWC5RcqgNpoVoxf3ZaYXotpro6dvmT/7X
 am+RzLDI7HOP/J/g4x/ISxQFfidDhiERCDi2MumFakf/cnZzaUDQR8h7QxzQq0Kmv/
 Y1E7c8L3Rl00ZBZ+ZIOejzwdExZy8OhVQJP5pKB6M9kyztJ2JNfgBQrNqeP+xKR2eb
 KEQNwlO1ov8C11H7J01ujf4AV2ngZyYG9/eKTLMkUKFh6G1cX+OwXLjKTQN7bro/Si
 SLabR+e1yPU4w==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 900AE653CB; Thu, 18 Mar 2021 16:50:06 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212333] Bisected: 5.11.7 breaks amdgpu resume from S3
Date: Thu, 18 Mar 2021 16:50:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: timo.valtoaho@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-212333-2300-7bSDck6LUt@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212333-2300@https.bugzilla.kernel.org/>
References: <bug-212333-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212333

--- Comment #1 from Timo Valtoaho (timo.valtoaho@gmail.com) ---
Created attachment 295923
  --> https://bugzilla.kernel.org/attachment.cgi?id=295923&action=edit
git bisect log

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
