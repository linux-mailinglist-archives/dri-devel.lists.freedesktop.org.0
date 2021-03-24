Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6ED3483C2
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 22:32:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69A286EA92;
	Wed, 24 Mar 2021 21:32:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74B9D6EA92
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 21:32:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 7018561A1F
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 21:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616621528;
 bh=JSd6YBqZSKBKLl8aGQUhk3yxQI1heogWRuf/1iiHaxw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=mjZTiX1FS+N5A3AEU1ONOH/C9SfFBOr8KEWV9N3lS02lTSUYWLiZcXSb7br4xgnOP
 tBSsoYTMoTjm8WOKk4ifXTG+8v2uF1Tvh8uRSlpi3q7ROXcTBb+gyUrX1Hg9v7+aKK
 6UkF8cFagaZsaNq9uIZnVdRzMG2qkUfipLM+s1C/iqT+hUcI6t4ipMNpSjMj5sEkAs
 QJ1BtQEqqdb2I4TaM3pf3iWMO3Enz1oE/lQpn5lqWrGrywpI/Uu7muxSLFX47Y8KRF
 77vDD03FlC3SdL0YzkteGljqcd7UhbMk/bHsa08abMFRzSlDUOCiCBmeUcbzq9gCfZ
 9wZes3RJxwgaw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 5FAA862AC1; Wed, 24 Mar 2021 21:32:08 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212077] AMD GPU discrete card memory at highest frequency even
 while not in use
Date: Wed, 24 Mar 2021 21:32:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-212077-2300-YtxqM8qD4A@https.bugzilla.kernel.org/>
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

--- Comment #13 from Alex Deucher (alexdeucher@gmail.com) ---
Created attachment 296035
  --> https://bugzilla.kernel.org/attachment.cgi?id=296035&action=edit
possible fix

This patch should fix it.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
