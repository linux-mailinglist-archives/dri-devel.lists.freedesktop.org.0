Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E47132678C
	for <lists+dri-devel@lfdr.de>; Fri, 26 Feb 2021 20:47:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 385C76E075;
	Fri, 26 Feb 2021 19:47:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E17A6E075
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Feb 2021 19:47:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 0016664F1B
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Feb 2021 19:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614368871;
 bh=QaepojK6Fwfn9vjl1/Y9ThXwJ/kRDtxndOy1n+nhjAA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=T+hC+RDrcbeczm58Fx/3F5HTUfIt6hpXM4j4b2uo8c+kVtla4y3TbepOJ20qh80np
 JNB54Ak72XJ2beaPh2/y9NjlDEe8WPrFJF1FkEm+7iOFV4RoRQt4lt2lZzy+3PRO20
 ItxEfiHrn8I5jq2d+rWyKDIVBYenPtjzsb/gD19E5Lj2LZUJaW4wUd3M9SYHdbmFNY
 hyjNIiLvRgSwXfY3QBp/23NQOr8rBuVOCLT4E/EsD7pIcbylClrXCsilUapsLQlvpf
 z6QIWlSL3SB8oA72g9j2GnWB/72dFuaidvGW8uFHTa2lIqndnpzValFQu7DeWeZBiZ
 QDE7d/aQZ9nnA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id EEE556146C; Fri, 26 Feb 2021 19:47:50 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: =?UTF-8?B?W0J1ZyAyMDk3MTNdIGFtZGdwdSBkcml2ZXJzL2dwdS9kcm0vYW1k?=
 =?UTF-8?B?L2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2xpbmtfZW5jb2Rl?=
 =?UTF-8?B?ci5jOjQ4MyBkY24xMF9nZXRfZGlnX2Zyb250ZW5kKzB4OWUvMHhjMCBbYW1k?=
 =?UTF-8?B?Z3B1XSB3aGVuIHJlc3VtaW5nIGZyb20gUzMgc3RhdGU=?=
Date: Fri, 26 Feb 2021 19:47:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: kmueller@justmail.de
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-209713-2300-BOFxjlFY0k@https.bugzilla.kernel.org/>
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

--- Comment #19 from Klaus Mueller (kmueller@justmail.de) ---
I didn't see any problem any more since 2021-02-14 and linux 5.10.16 with this
patch applied:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/stable-queue.git/tree/releases/5.9.14/revert-amd-amdgpu-disable-vcn-dpg-mode-for-picasso.patch

Hope that this really fixed the problem for me.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
