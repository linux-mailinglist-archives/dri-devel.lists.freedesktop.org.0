Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 923E933704B
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 11:43:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF8EC6EB8E;
	Thu, 11 Mar 2021 10:43:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF78C6EB8E
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 10:43:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 68C1164FC4
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 10:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615459382;
 bh=Y4D/sIag3GPc2uDRiRsZcjhA1BibQxoNgDG0zBJSnqg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=sm/CzdLiRFBpCnbfoKqRd7PPFdTH+tbXbl2RoEOzyLYiUZPqnQBChpP/uPqvwWfJa
 6BfBV+gS6GFzOYlzFN8avj1E7eDMq9IAX1Iz5HdZ7wL5RouOVQZJZtVcL24Oz9CqEq
 E0Xi5bsQHpVcwPsRhdGe241JkZ1K1Hch4aF4Sk6xERTj+tchcK2aCCKkWSCpuhsnKQ
 Qn+wuaJ5sDOu/REMoQhvunxaGY8KDAtgDuCDa/AwwjQ//Swcnj7ccGZRJl0fxET5au
 D8KKkdTU4aj3GcZpu+qXi0BpSODiL6HAGtEG39HsBCXya2Ok2sMKuNHFdszPoGz8j2
 w52ysxaXQdfNA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 65870653BD; Thu, 11 Mar 2021 10:43:02 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212229] STM32F469: vblank wait timed out on output to
 /sys/class/graphics/fb0/pan
Date: Thu, 11 Mar 2021 10:43:02 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Console/Framebuffers
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: eugentoo@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: jsimmons@infradead.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-212229-2300-6NmOAKBgyr@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212229-2300@https.bugzilla.kernel.org/>
References: <bug-212229-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212229

--- Comment #1 from Yauheni Saldatsenka (eugentoo@gmail.com) ---
Created attachment 295799
  --> https://bugzilla.kernel.org/attachment.cgi?id=295799&action=edit
Decompiled device tree

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
