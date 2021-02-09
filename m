Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E97314F5F
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 13:46:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 686266EB15;
	Tue,  9 Feb 2021 12:46:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D49AB6EB15
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 12:45:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 8892264E50
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 12:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612874759;
 bh=ypGXKrEu91/KNXzj2VYMVvkcabyLwbi05omt60A2Syc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=lL/nfUwqUWBslcHMvaQCEAs8ZWK1cmYl4XY4kU5T2VXbJzp9mpAkIMfl6dkiq0OrC
 LeL+Hq+jBU3AxCX3Yx6AZHmaG9MBoQWd2P7yWrBVGLg2hvMU/4xYOPGbHTIbxcuOGl
 U51NaWkqO/83IAMt0KRdiFMmsVVCHYCvzYaXkkWi2cE9n0hDyAk9SYetzfp2dUBSIK
 dVQYfnnOoCQxJKjz+QEW+vU/dKVH+3ldatw4NvT20JTLYIqjHzTqljrgbYMIODhzmF
 vqMbH4Ty3esXjUXUYb2v8lMfcsk+ra3J1TfhcMcyEw/Qbf+4qxkBoH42cT2kpkwmG0
 ptXu0PNm8SuRw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 711FB6535B; Tue,  9 Feb 2021 12:45:59 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211651] Dual screen not working with Nvidia GTX 1050ti in a
 notebook
Date: Tue, 09 Feb 2021 12:45:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kernel@fily.com.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-211651-2300-DT38g5Bcjc@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211651-2300@https.bugzilla.kernel.org/>
References: <bug-211651-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=211651

--- Comment #1 from fily1212 (kernel@fily.com.de) ---
Created attachment 295143
  --> https://bugzilla.kernel.org/attachment.cgi?id=295143&action=edit
screenshoot of screen setting during not working kernel

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
