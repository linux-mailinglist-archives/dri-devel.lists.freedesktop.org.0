Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F6F3170B4
	for <lists+dri-devel@lfdr.de>; Wed, 10 Feb 2021 20:55:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7C826E092;
	Wed, 10 Feb 2021 19:55:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 357D06ECCD
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 19:55:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 06CA764EF1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 19:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612986916;
 bh=To2WFTm6n48WTcXkvJKWK7QhOw8ktysPORjXOJNAB0E=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=DnZTBtDokxfmsCw97dt4hbG+GhnT1McKW0H3eMsd9eA8dWbazleC241kJ8NHIfyu7
 g0aEDTT6/RuJ1+OA4LfsPgTJ0sMtM6aq/G3bTo6gKgCnL7KrCQLKFPa+QDXSnO43Pd
 zTuTouRlo5zO/6hqPloypqgV33VI6GfFPF57uUI3DCIFpDzHYY5P1bTDDVOf7X9GzH
 whb4gtTIas3O3FUJjjKKmEvGtuoJFo9jJhvAjzjY2Pkc2vX4zNzBIkwWdqc1uAPvtS
 co2wuKEDhdyjHHTZBd2O3GkLlf8bxY6ABWwjCKKnGMj2gOQLHJuj1OK9fEr2svWRzN
 1MR3wxyIAID8Q==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 039F565259; Wed, 10 Feb 2021 19:55:16 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211649] "drm/amd/display: reuse current context instead of
 recreating one" cause hdmi hotplug blackscreen on amdgpu
Date: Wed, 10 Feb 2021 19:55:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: youling257@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-211649-2300-RRqALhrZNm@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211649-2300@https.bugzilla.kernel.org/>
References: <bug-211649-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=211649

--- Comment #11 from youling257@gmail.com ---
Created attachment 295201
  --> https://bugzilla.kernel.org/attachment.cgi?id=295201&action=edit
trace.txt

cat /sys/kernel/debug/tracing/trace

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
