Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45209379AFB
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 01:58:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C787B6E979;
	Mon, 10 May 2021 23:58:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 479B86E979
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 23:58:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 1768F61165
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 23:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620691125;
 bh=W2QCLtj8MWyf2o8lbf5lXYWOXQX5HJekzD2fQbZb5Ys=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Xngjuk1OkLiaWoNcBn1FfGqJoJoie4Xcs1sLOcy1Wv+8CSwRrtYYbpVtRWYSPvR1U
 YzIlF2SHO2X/W8Wf6KenDDuBNY0Qu/BQ3yW1hcXY0JKhxDTzOanO/JBHU8LNLfNjRP
 HWuFxd4LyHSG1OdEFshLW3zPNjtVq9dkdac1Txkuu21NPGSjsKKx2c1c4rttge1R55
 aZQk8y6H/v2e7ekct3Ep9ZaeG6Yr4PuI6mAAbvV5VKNoqJ1cKqwPckLGhVSt+eTUcK
 kmXAeYE8Amam1RPu8ged9DcuGMkg5oPmiTqcu+gMxYl6k97E+vJw+eOpwsQ148LHTc
 OTvKTAzy+dwaQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 0E31B61209; Mon, 10 May 2021 23:58:45 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212959] [drm:dm_helpers_dp_write_dpcd [amdgpu]] *ERROR* Failed
 to find connector for link!
Date: Mon, 10 May 2021 23:58:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: tob88570@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-212959-2300-aCf6KIQj9v@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212959-2300@https.bugzilla.kernel.org/>
References: <bug-212959-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D212959

--- Comment #3 from tob88570@gmail.com ---
Created attachment 296713
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D296713&action=3Dedit
Dmesg output

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
