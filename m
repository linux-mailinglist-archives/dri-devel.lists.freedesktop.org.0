Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DB431100C
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 19:37:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9F146E34B;
	Fri,  5 Feb 2021 18:37:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19B8C6E34B
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 18:37:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id C7F4564EE8
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 18:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612550247;
 bh=gLL/3T4qIbLQAPo3bsVQW87o5zW/iGWj1OU0OdZ3eVo=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=EfLTBBdU3pYXJxMeDkBA5EuZkObpOBxYJFlRjydZQ1cwxQ9YqBrnI/CPmL9hX5KRN
 iHuJj7CFNUJI1oRqcCRdnjlwZvRpE385S7M92zwur/b9SYJrn9PC6Rz7YXP5/lYPhW
 47lakwN5wZXKhI6EGOOmsQSsG7axBzy8i4GcUSYyBCBEtMWujfSzzAD4Ypb5ZC1uVN
 uIy3HSQr7YNpgitxJ9/u62dAPzEQAIhvqkhHHLXo2+t32bFDH7LwP5o8hwH8oOoe8O
 ds157/6fLRge1zormAYXMZOa+3OJeLZV3rIfkJtTLabkYUMg4jnUiafg40dcrrzVqo
 uSs5xT+miMy8g==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id B83716533F; Fri,  5 Feb 2021 18:37:27 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 210849] Black screen after resume from long suspend. Open/Close
 lid. AMDGPU
Date: Fri, 05 Feb 2021 18:37:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210849-2300-mxs4QhrzQo@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210849-2300@https.bugzilla.kernel.org/>
References: <bug-210849-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=210849

--- Comment #13 from Alex Deucher (alexdeucher@gmail.com) ---
most likely kernel.

https://www.kernel.org/doc/html/latest/admin-guide/bug-bisect.html

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
