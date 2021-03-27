Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F121934B9BA
	for <lists+dri-devel@lfdr.de>; Sat, 27 Mar 2021 23:05:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 766726E029;
	Sat, 27 Mar 2021 22:05:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 857B46E029
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Mar 2021 22:05:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id AC2276198F
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Mar 2021 22:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616882723;
 bh=Szsgub0sXiwhGY54B0h281Vqyo6/alFWhHvVRMh6Elw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=QwASPKjL96Y83asQlfVv3c8bFVfXEkSRQJfk6KlMsRDF5+dWDul71/aPvCralnOyh
 +YmNQoHdDk71r+b46731fPWGfNLow2mn9x56vUL1ttSa044N7v+HNaXzhR1BgkCpY4
 mJi7ZYnleHMxwsQbDZrxOus2pvi8JqyUsO4mCGgLBVwA0+6OZ4AvnZaafy0nwI1jRE
 aL6oBFecE7NWe0HjPu5OAtAbEiSngbWAysi5ub8Mq6FNaSlCNNUv++ZQdytcTzySkX
 nTE3UJAqbEsXEC/mYDy+gXSavC5nHXjbPyu4BRj5NWnlTbMtyBvUqYYCbvesZ8iR5w
 KjUMXjBlp8Qlg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id A072862AC8; Sat, 27 Mar 2021 22:05:23 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212259] Entire graphics stack locks up when running SteamVR and
 sometimes Sway; is sometimes unrecoverable
Date: Sat, 27 Mar 2021 22:05:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: happysmash27@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-212259-2300-dxdp5oyVYH@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212259-2300@https.bugzilla.kernel.org/>
References: <bug-212259-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212259

--- Comment #3 from happysmash27@protonmail.com ---
Created attachment 296093
  --> https://bugzilla.kernel.org/attachment.cgi?id=296093&action=edit
Full dmesg 2021-03-27

It has happened again today. Attaching another log.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
