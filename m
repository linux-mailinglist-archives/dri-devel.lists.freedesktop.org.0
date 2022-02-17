Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 449AC4BA7BF
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 19:11:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EE9710E47F;
	Thu, 17 Feb 2022 18:11:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A41C10E47F
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 18:11:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 16E5CB823BF
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 18:10:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B4052C340EB
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 18:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645121455;
 bh=p/r/CM1v9snWmovCYjjZrecZ36cHEN600qAOFAQ7Y5w=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=C7mV8cSKvbmLCcI9lYjpTXy2/Suj3OzJ8fP1KNcGEeLY96vSnjmdPhA5BnGZv+dI2
 Zvmk4h9tO3y4id/sNLH/cy2V5hXlmdIAqiQURh7VKcOmOf3sLOngRUnmPi9DcYNcUz
 sOnMlclMJzMxFaZXbvxRPoe+il4jq+6TqI8bSWVkf6TyMCuzZnHDaGRMbNwVx0K6Bq
 CdaPvM3GnLzJvPGkzy/n/238wYo2JjJ8mC4l2dtMxKbyiKmvsL2EfZH+rX9S45HGWH
 f/k2FiMz5q2sopi2ihc/HAhVUZPtKYWKeeGU4ctJsVTDyI7ZL5hSr6hiKrMZPgFrhF
 mC/BoAR92e+gw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id A2D05CAC6E2; Thu, 17 Feb 2022 18:10:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 121831] Several kmemcheck: Caught 64-bit read from
 uninitialized memory in radeo
Date: Thu, 17 Feb 2022 18:10:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: casteyde.christian@free.fr
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: OBSOLETE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-121831-2300-bTkwdsQdzt@https.bugzilla.kernel.org/>
In-Reply-To: <bug-121831-2300@https.bugzilla.kernel.org/>
References: <bug-121831-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D121831

Christian Casteyde (casteyde.christian@free.fr) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |OBSOLETE

--- Comment #2 from Christian Casteyde (casteyde.christian@free.fr) ---
Closing as too old and I do not have the hardware anymore to reproduce.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
