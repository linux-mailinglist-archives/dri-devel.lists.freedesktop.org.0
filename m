Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54660598AF2
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 20:15:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2B7A10E86E;
	Thu, 18 Aug 2022 18:15:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E002310E098
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 18:15:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7ADF1B82357
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 18:15:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2ABF5C433D6
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 18:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660846521;
 bh=NsU5Z89C9cFjAwxZVeDAXxF3HrzQNRrbZMNAfwdyrzc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=NrQRgiWjj4zlfv6gZdavkUNfNbITkvziQInrVYAvnG/IfuMq+13MFpIljwrWh1qK/
 biTEvotur1n/Jps1Sdo1WRprDqvs7eZBURHeDqw66BNaMkUdjNmcwggL1x2rdzDE5F
 n3GCcmNudKf4iVwLJLpUNPUwqaTVgF0UOiKtL6mF3NTjgiAQr5Iko1E4J0UeXKZA+P
 vDmp/zT48aRaXHq79TcVBIjVpGK58466tI0VUCGLwNF65qjno60qkesD1eQ8y8wSfS
 rt35/8H5HCXGfyDgm9NAT3NyIUfBU61Pz69+HkrqFBD8b8nzyIRorZbWThtDMyd1y2
 38Iwn9/bf5ehg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 18E29C433E6; Thu, 18 Aug 2022 18:15:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216376] AMDGPU: display output disables and quickly reenables
 when switching AVR into/from standby doing HDMI passthrough
Date: Thu, 18 Aug 2022 18:15:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: jlp.bugs@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216376-2300-WVx5MxfHC4@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216376-2300@https.bugzilla.kernel.org/>
References: <bug-216376-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216376

--- Comment #1 from Jure Repinc (jlp.bugs@gmail.com) ---
Created attachment 301601
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301601&action=3Dedit
Xorg.0.log

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
