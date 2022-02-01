Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 234104A5AFF
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 12:17:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F13B110E65E;
	Tue,  1 Feb 2022 11:17:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08BC510E65E
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 11:17:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C5DC5B82D63
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 11:17:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 86DC2C340ED
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 11:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643714232;
 bh=YjY6EJ7VVg4nI/GddBVHAL608wdHHHZfnHG+eqgn3a8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=a9chnLVIBreSbHlvQEDYFEArGFbze0nPnn+H08t1oSTh3+5jOmkbUYhtT6OX3Y7Yv
 0Iv2wnsvQu6IZUCWOx3uM7mmwblCdzh7SMj2NCpTf15Wp15eUjuZN8vlnsvCU9Prc5
 9oN2TXWnmjY5ovj9uz9WseFlArZjNcXsAvcPBBcDazE+pKkvJ4GP3Rzi+FssWTHZ+Q
 PswT0qgb6qXU7sntdypNsOKDi0zqSViMQjubA8eYWpBeLmWh6U+S8dgGzK+BBgZXO5
 /kcfF2YE1PUoyi/AfaFou8iNe7/lm2CFpPtd0ssAKS1aScPM5z81rURbQx5gZuycoS
 p49psKtVNAxLg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 73AAAC05FD5; Tue,  1 Feb 2022 11:17:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215558] amdgpu driver sometimes crashes when playing games
Date: Tue, 01 Feb 2022 11:17:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(Other)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: smoenig@uni-bremen.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: component
Message-ID: <bug-215558-2300-LA0CGzzTuS@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215558-2300@https.bugzilla.kernel.org/>
References: <bug-215558-2300@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=3D215558

smoenig@uni-bremen.de changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|Video(DRI - non Intel)      |Video(Other)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
