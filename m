Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E2F32D8B7
	for <lists+dri-devel@lfdr.de>; Thu,  4 Mar 2021 18:40:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2792D6EA4B;
	Thu,  4 Mar 2021 17:40:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DF2A6EA4B
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Mar 2021 17:40:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 2BAB964F64
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Mar 2021 17:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614879619;
 bh=bcBqsL+dXAimvGWeyYMhq7bKVsD2GD72OuKaHXrljGA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=HaD7woTv3VhJ0hacz8bzMP+nmEd3Q1dXz6kCz394yu7zwlxgyjnulgTT0Y21MhXr5
 AdCp4BGOafWsvJHeRRxRprzEQhbZJRRJn36ioDX5JcdLCVHOsGfyJ8wXHz0kIWzynq
 z7iFmjTsw13i85+Mb8NI20eknU6gZheq7hQqYlGx5oNtRVhde+0Bs/57u2yV4eKM82
 g5GzQNRV5iwBeKN2lk39ZUIOWFH/Hed6ZLM2roycFQsTcIoc2wr5C+gPFzBEMQ4NdN
 xnZd+7Kvtlmjv+j3ci/8/rpKPSNBZYJuN0sc4slin15NbYH6orRs6kSm2kPPnPEeXy
 Xm/GIxbKATutw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 267866537D; Thu,  4 Mar 2021 17:40:19 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211997] sys-kernel/gentoo-sources-5.11.2 crash upon disconnect
 HDMI monitor AMDGPU
Date: Thu, 04 Mar 2021 17:40:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stefan@konink.de
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: resolution
Message-ID: <bug-211997-2300-8nr2X39BHs@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211997-2300@https.bugzilla.kernel.org/>
References: <bug-211997-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=211997

Stefan de Konink (stefan@konink.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|PATCH_ALREADY_AVAILABLE     |DUPLICATE

--- Comment #5 from Stefan de Konink (stefan@konink.de) ---


*** This bug has been marked as a duplicate of bug 211649 ***

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
