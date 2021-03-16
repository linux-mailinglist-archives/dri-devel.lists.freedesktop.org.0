Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0188233DC64
	for <lists+dri-devel@lfdr.de>; Tue, 16 Mar 2021 19:18:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E94689BFB;
	Tue, 16 Mar 2021 18:18:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1585C89BFB
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Mar 2021 18:18:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 44E6565137
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Mar 2021 18:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615918682;
 bh=3TiBx5wRfRmhEj5z3hujE9FzAXprs6TfYRxE42kV2Uo=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=sOlQv2aIrm1IgWZJb9il2Rucoijmtw3LRZtbblrIoa/cggKe+5ZHXJ+HcDQzC5dhH
 0XJVKuiuDBjCKFwKtn+MbbrURmhrtdxXvEB7RA/L6dKsLaLSNErJME6nzNfQ9IFnlp
 L1JCItTn236zsUN5trdfr2zLaZzy99T0AKobxVWszjcwMH7UalYce1VhyqQEsX7QQ/
 8xsDFdfIqqpDJ9mTi2LDDl9n1ZVyvYCyfSDsM6vuSK72bwzaoh+vK7OkYoRPv9YDBq
 GRDjB2Upvp4ZescP1MQx4RJew59FhPphopnU/Fm9mbv/ydkp6v344MtM9LtKDd1zfC
 HULsFF9Re/xAg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 37E1D653B9; Tue, 16 Mar 2021 18:18:02 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212293] [amdgpu] divide error: 0000 on resume from S3
Date: Tue, 16 Mar 2021 18:18:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: contact@scrumplex.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-212293-2300-1uhgTQmA21@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212293-2300@https.bugzilla.kernel.org/>
References: <bug-212293-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212293

--- Comment #3 from Sefa Eyeoglu (contact@scrumplex.net) ---
This took some time, as I apparently went wrong paths sometimes.

Anyways.

I bisected between tags v5.10 (good) and v5.11 (bad), while only looking at
path "drivers/gpu/drm/amd".

At the end I landed at commit 12f4849a1cfd69f3c37cca042f2e9c512f923741 by Simon
Ser (emersion).

I will do some debugging myself to see if it's the real deal, but that change
might very well be it.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
