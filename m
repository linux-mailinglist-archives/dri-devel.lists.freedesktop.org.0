Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4E7362613
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 18:54:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8E2C6E187;
	Fri, 16 Apr 2021 16:54:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82D406E187
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 16:54:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 6734A611BF
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 16:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618592073;
 bh=tGjSiyGZ2l4ccBDXRRIAYEa9a96w/JMDhplEZ6YDFVM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Uv2zHfFZKxvYA9GbVdxOEuk6SFkNFAVGHDAccQo+Twqz18XlqU2rQJQ0ZJPn0eHfl
 oZzeSQjiPgN0KisgTLgEs010YkCg5mSvpUeSWEmTE7HMlS4CpIyPLjyMNmcoRdEO39
 HmBpJMuBnIuAZZ2JpikjwsUAC0D8C9SAgCKHOU91sfJZvqBixHDK9E9wep1CRzZrAZ
 EqcnVzuboKb5GJdvkCEjGBq4J9N21n0q/QnbMhy6fWJhcui8pbaDRFNlwisxxyD0fC
 IO1XwlpLLSdthClvddSD4p7iz57UJoc6nzCgflOzMmY6rDTPHuseABJix4GHYMpZTe
 pf3exY0cT487Q==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 63D856105A; Fri, 16 Apr 2021 16:54:33 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 13170] Macbook 5,2 only boots with acpi=off, or nosmp, or
 maxcpus=1
Date: Fri, 16 Apr 2021 16:54:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: mortenvermund@gmail.com
X-Bugzilla-Status: CLOSED
X-Bugzilla-Resolution: OBSOLETE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-13170-2300-dIvgA6Zp1D@https.bugzilla.kernel.org/>
In-Reply-To: <bug-13170-2300@https.bugzilla.kernel.org/>
References: <bug-13170-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=13170

--- Comment #76 from morten vermund (mortenvermund@gmail.com) ---
(In reply to danny.piccirillo from comment #34)
> I ran into this installing Ubuntu on a friend's machine (the newer MacBook
> 5,2 http://en.wikipedia.org/wiki/MacBook#Model_specifications released May
> 27, 2009). 
> 
> Potentially helpful information: 
> 
> Someone found that /proc/cpuinfo reports the CPU as being single core, even
> though it is actually dual core. From
> https://bugs.launchpad.net/ubuntu/+source/linux/+bug/341230
> 
> When booting without any of the options as a workaround for this bug, the
> screen goes blank and for a brief moment i see "[5.162415] Not responding"
> before the screen goes blank once again. I uploaded a video of this to
> https://casinowatchnj.com/tropicana-online-casino/ but it is temporary and
> will
> disappear after a few days. Anybody know a better place to host? 
> 
> How can i help? What other info is needed for this bug?

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
