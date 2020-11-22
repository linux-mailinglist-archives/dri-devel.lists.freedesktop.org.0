Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4122BC35E
	for <lists+dri-devel@lfdr.de>; Sun, 22 Nov 2020 04:29:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52C0689B18;
	Sun, 22 Nov 2020 03:29:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E7DA89B18
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Nov 2020 03:29:55 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205675] Display locks up. AMDGPU timeout
Date: Sun, 22 Nov 2020 03:29:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: gosesen253@tjuln.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-205675-2300-eTV31LJg4F@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205675-2300@https.bugzilla.kernel.org/>
References: <bug-205675-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=205675

--- Comment #19 from swebwaer (gosesen253@tjuln.com) ---
https://gitlab.com/gitlab-org/gitlab/-/issues/286778
https://gitlab.com/gitlab-org/gitlab/-/issues/286779
https://gitlab.com/gitlab-org/gitlab/-/issues/286780
https://gitlab.com/gitlab-org/gitlab/-/issues/286781
https://gitlab.com/gitlab-org/gitlab/-/issues/286782
https://gitlab.com/gitlab-org/gitlab/-/issues/286784
https://gitlab.com/gitlab-org/gitlab/-/issues/286785
https://gitlab.com/gitlab-org/gitlab/-/issues/286787
https://gitlab.com/gitlab-org/gitlab/-/issues/286789
https://gitlab.com/gitlab-org/gitlab/-/issues/286792
https://gitlab.com/gitlab-org/gitlab/-/issues/286793
https://gitlab.com/gitlab-org/gitlab/-/issues/286795
https://gitlab.com/gitlab-org/gitlab/-/issues/286797
https://gitlab.com/gitlab-org/gitlab/-/issues/286799
https://gitlab.com/gitlab-org/gitlab/-/issues/286800
https://gitlab.com/gitlab-org/gitlab/-/issues/286803
https://gitlab.com/gitlab-org/gitlab/-/issues/286804
https://gitlab.com/gitlab-org/gitlab/-/issues/286805
https://gitlab.com/gitlab-org/gitlab/-/issues/286806
https://gitlab.com/gitlab-org/gitlab/-/issues/286807
https://gitlab.com/gitlab-org/gitlab/-/issues/286809
https://gitlab.com/gitlab-org/gitlab/-/issues/286810
https://gitlab.com/gitlab-org/gitlab/-/issues/286812
https://gitlab.com/gitlab-org/gitlab/-/issues/286813
https://gitlab.com/gitlab-org/gitlab/-/issues/286815
https://gitlab.com/gitlab-org/gitlab/-/issues/286816
https://gitlab.com/gitlab-org/gitlab/-/issues/286817
https://gitlab.com/gitlab-org/gitlab/-/issues/286819
https://gitlab.com/gitlab-org/gitlab/-/issues/286820
https://gitlab.com/gitlab-org/gitlab/-/issues/286822
https://gitlab.com/gitlab-org/gitlab/-/issues/286823
https://gitlab.com/gitlab-org/gitlab/-/issues/286824
https://gitlab.com/gitlab-org/gitlab/-/issues/286826
https://paiza.io/projects/Ci_bkGbc4qMJBBpvrjibTg?language=php
https://blog.goo.ne.jp/seresrnetyrt/e/d0a624c5e266c8b4090fe3ee6566127d
https://note.com/wsrbwanretrytuy/n/n4a06eda47b11
https://caribbeanfever.com/photo/albums/deiveson-figueiredo-vs-alex-perez-fight-free-live-stream
https://www.postads.ph/ad/watch-ufc-255-full-fight-live-free
https://jersen-ruari.medium.com/as-people-get-older-they-tend-to-think-that-they-can-do-less-and-less-when-in-reality-they-b86bdefc088
https://niltofipsi.medium.com/whether-they-approve-of-what-you-do-or-not-at-some-point-no-longer-matters-633b4c97da1f
https://niltofipsi.medium.com/ask-anyone-you-know-the-last-good-book-they-read-and-ill-bet-most-of-them-respond-with-wow-i-5f9535e53498
https://niltofipsi.medium.com/when-was-the-last-time-you-sat-on-a-sidewalk-and-looked-closely-at-the-cracks-the-rocks-the-dirt-e9d1cfbb0d2b

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
