Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 663BA3247B4
	for <lists+dri-devel@lfdr.de>; Thu, 25 Feb 2021 01:00:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E62196E0DE;
	Thu, 25 Feb 2021 00:00:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A519D6E0DE
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Feb 2021 00:00:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 54F5864F0A
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Feb 2021 00:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614211229;
 bh=5Qa3QNFWHxl5V0hx98tzsmDTZrZy+cG6hXcCQMhS6gE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=sOPBr+lPiyjZXLAXr67gnl92SpSFV1ES/QpeS/lVl8kBAKS5cjsSL3TdIa5E4mtde
 JoEUsF+o50LilVGPtBzNV3kM/9fAQ1Y04F2RqI76vSI2QRw3Yf4ASiVDJSNKhOEtRm
 YBlfNl9KHlCiifzHlBA+AITT9rwBZv00DHUBD8ws4Wn2o+RR/NYEZE8cCYtPi4PJKc
 bDiVCsxeMgBT+0axvrfPiepDriAkNaAMhPE83vw/bT/mJ1fQqferOtn1PhHxr27KNl
 +rdrMUtZ5Azf+qvON+86Y5/Lh6MzR4qcW1xAy2y5Bxqo+yWzMh0aEyI0UjAJhDb+Tz
 tDD3KzeXDBoYw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 4347D65382; Thu, 25 Feb 2021 00:00:29 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: =?UTF-8?B?W0J1ZyAyMDk3MTNdIGFtZGdwdSBkcml2ZXJzL2dwdS9kcm0vYW1k?=
 =?UTF-8?B?L2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2xpbmtfZW5jb2Rl?=
 =?UTF-8?B?ci5jOjQ4MyBkY24xMF9nZXRfZGlnX2Zyb250ZW5kKzB4OWUvMHhjMCBbYW1k?=
 =?UTF-8?B?Z3B1XSB3aGVuIHJlc3VtaW5nIGZyb20gUzMgc3RhdGU=?=
Date: Thu, 25 Feb 2021 00:00:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: samy@lahfa.xyz
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-209713-2300-6AV0Wvd9bi@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209713-2300@https.bugzilla.kernel.org/>
References: <bug-209713-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=209713

--- Comment #17 from Lahfa Samy (samy@lahfa.xyz) ---
> Looks like this is fixed in 5.11.0 and 5.11.1.
I'm still getting this issue reliably under kernel 5.11.1 when resuming from
suspended state.(In reply to Oliver Reeh from comment #16)

So I confirm this for 5.11.1, still not solved.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
