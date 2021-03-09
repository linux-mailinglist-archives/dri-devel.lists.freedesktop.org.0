Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D2B332ACF
	for <lists+dri-devel@lfdr.de>; Tue,  9 Mar 2021 16:43:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75CF56E8EE;
	Tue,  9 Mar 2021 15:43:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88FA76E8EE
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Mar 2021 15:43:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 5055E65275
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Mar 2021 15:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615304604;
 bh=2O0p+H5p2hXe0tQNoBs5z04wVkdEn7iGhp/sTGd2kew=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=t0hKs88Lrs0Jx9zoReO3+p0kfFr800FLsrs4NVt1wK/+OUrBMJaGj4tk3SIxu5cZu
 2T41z7NCk1DJwYsLBn7VR11TtGmEbj58Irq8Y4w4lg449jqHhItKgKj9rWqRM+6NQA
 46jzUumvaASzhJXtVnEeDsSW4uadhu1/Uyic5oQ0HMLpm8AdkwyC2OlPs1XPRe/YDF
 +3/KKRcZIQCC4Eh76umXFYDuxneWKzyLoXFPh5oYhEk8w9E/QAD9wrBS5x/PMMcRsa
 Q6KNeSHgCoMb8aNYHS2NmVYw54X4YX+ajvgF8yHi8UBa660A0CvD5CQYCTaxszyVXf
 RFUaen2+Gsw1g==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 48E2E6535E; Tue,  9 Mar 2021 15:43:24 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: =?UTF-8?B?W0J1ZyAyMTIxMDddIFRlbXBlcmF0dXJlIGluY3JlYXNlIGJ5IDE1?=
 =?UTF-8?B?wrBDIG9uIHJhZGVvbiBncHU=?=
Date: Tue, 09 Mar 2021 15:43:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: martin.tk@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-212107-2300-9CyiTzVSVk@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212107-2300@https.bugzilla.kernel.org/>
References: <bug-212107-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212107

--- Comment #5 from Martin (martin.tk@gmx.com) ---
(In reply to Alex Deucher from comment #4)
> The driver turns off the fans for acoustic reasons if the OEM enabled
> support for the feature in the vbios.  They will still go on when the
> temperature gets high enough.

Ok. I checked again and the fan does turn on when playing a game (gzdoom).

Too bad it's the quietest fan in my PC :)

I guess I panicked.

If this is the expected behaviour then this bug can be closed.

Thank you.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
