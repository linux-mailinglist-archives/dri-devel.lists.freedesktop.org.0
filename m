Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C96713A21
	for <lists+dri-devel@lfdr.de>; Sun, 28 May 2023 16:36:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C9C310E09B;
	Sun, 28 May 2023 14:36:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBA4810E09B
 for <dri-devel@lists.freedesktop.org>; Sun, 28 May 2023 14:36:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6E8D0615E7
 for <dri-devel@lists.freedesktop.org>; Sun, 28 May 2023 14:36:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D61CDC4339C
 for <dri-devel@lists.freedesktop.org>; Sun, 28 May 2023 14:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685284576;
 bh=h7p73YZ6h/VrpHDmNhyOipEK/x9SBe16gL70Issej5c=;
 h=From:To:Subject:Date:From;
 b=LtN5ftlpF83YElc3gCaHnbuusxLNHRTNQbPQegO2HO+F4pYQ5wRaW+ZeiH+hdKQnr
 mKYDK5ZuFf/s5yiyXNDk8XdOJUTOA81hET4a0Lt92OvB6oIBc+XWeQBMLktp02Zoab
 CrYJoau8zETWBth3FL5q3HN1gwIgds9Obe/fJeeBtNGUBewLRRatpJzJldmvysGppI
 Ujf6Hu8fxCBiLMz+GG0EejpDK1CySUymxUL/bO6SKlxIhg5xbCbt8cVcp1FLYhme1a
 euHL0u4UMVQCWbwiOrFknVCnFuT7QrD7poDciqaRNSn6Ayl8z2PJFLANTQRGnqejy5
 CvLJxEjiiUNIg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id BFCA9C43141; Sun, 28 May 2023 14:36:16 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217499] New: NVIDIA drivers fail to install on
 6.4.0-rc3-1-mainline kernel
Date: Sun, 28 May 2023 14:36:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: wessel.working+kernel@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-217499-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217499

            Bug ID: 217499
           Summary: NVIDIA drivers fail to install on 6.4.0-rc3-1-mainline
                    kernel
           Product: Drivers
           Version: 2.5
          Hardware: Intel
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: wessel.working+kernel@gmail.com
        Regression: No

Created attachment 304341
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304341&action=3Dedit
/var/lib/dkms/nvidia/530.41.03/build/make.log

Unsure if this is the right place to post or If I have to post somewhere
NVIDIA. If so please direct me to the appropriate place to raise this.

I am unsure if this is a priority in this point of the mainline release but=
 I
had issues with installing the `nvidia/530.41.03` drivers on
`6.4.0-rc3-1-mainline` release.

Driver installs correctly on LTS and Stable as well as cachyos BORE.

I posted on my distribution's help
[forums](https://forum.garudalinux.org/t/nvidia-drivers-fail-to-install-on-=
6-4-0-rc3-1-mainline-kernel/28769)
and they directed me to the kernel maintainers.

This is what happens if I try to install the drivers on mainline.

```
> sudo dkms install nvidia/530.41.03 -k 6.4.0-rc3-1-mainline=20=20
> Sign command: /usr/lib/modules/6.4.0-rc3-1-mainline/build/scripts/sign-fi=
le=20=20
> Signing key: /var/lib/dkms/mok.key=20=20
> Public certificate (MOK): /var/lib/dkms/mok.pub=20=20
>=20=20=20
> Building module:=20=20
> Cleaning build area...=20=20
> 'make' -j4 IGNORE_PREEMPT_RT_PRESENCE=3D1
> NV_EXCLUDE_BUILD_MODULES=3D'__EXCLUDE_MODULES'=20=20
> KERNEL_UNAME=3D6.4.0-rc3-1-mainline modules.......................(bad ex=
it
> status: 2)=20=20
> Error! Bad return status for module build on kernel: 6.4.0-rc3-1-mainline
> (x86_64)=20=20
> Consult /var/lib/dkms/nvidia/530.41.03/build/make.log for more informatio=
n.=20=20
```

Please find attached the `make.log`

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
