Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E76755B186
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jun 2022 13:47:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A50441122F3;
	Sun, 26 Jun 2022 11:47:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E53CA1122F3
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jun 2022 11:47:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2B2A6611FC
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jun 2022 11:47:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 872D2C341CA
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jun 2022 11:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656244060;
 bh=oPwO9CJhv23LLcfFS74lQcJfQmX8a8DrOhL25g8b184=;
 h=From:To:Subject:Date:From;
 b=RPtmP2vwb/fAvVLocUlaEd3eXZ9DgUQqIt3pyOmSurtk1+49+msZbGunPgQdPhCzx
 wul0nqzgXSyi9N/eroo9eWQHumAgOtKzzn79MEWnPScW455g119xd4cQuF/ndSZSdz
 dpLGmEo4TvdjfPmGE0kzlRiFVCBzzmpdmH63I1RTyS0Rv4LQy5VMlVysRswNRTePWO
 icV9EkjPKLehvZ9L58h/W+X88ovGW/Q4C4NbEpASfcrrBwQOUDwoHs+4+VZ30u3lnZ
 I3Qn3gVwVNNW5fheaGUzupvkyZAOwtRU5qXwHcgQ14sQ2/RKmmM8j0AAUcmKKaEkBN
 Pn+GzMODd4RNQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 6B3EDC05FD2; Sun, 26 Jun 2022 11:47:40 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216175] New: PowerColor Radeon Rx 6400 ITX does not work.
Date: Sun, 26 Jun 2022 11:47:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: nobutarounosuke@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-216175-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216175

            Bug ID: 216175
           Summary: PowerColor Radeon Rx 6400 ITX does not work.
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.19-rc3
          Hardware: AMD
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: blocking
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: nobutarounosuke@gmail.com
        Regression: No

Created attachment 301277
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301277&action=3Dedit
Attachment-A

My PowerColor Radeon Rx 6400 ITX never works. I explain it step by step.


My regular hardware set is here and it surely works well,

CPU: Ryzen 3 PRO 4350G
MB: Asrock A520M-ITX/AC=20
BIOS: v1.90
Display output: From Ryzen 3 PRO 4350G via HDMI.

Next, I turn off the power supply and add Radeon RX 6400 and output from RX
6400.
In this time, a mosaic screen is shown. After some seconds, the screen beco=
mes
black out.
Neither CTRL-ALT-DEL nor SysRq keys are work. (Attachment-A is the journal =
of
this run)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
