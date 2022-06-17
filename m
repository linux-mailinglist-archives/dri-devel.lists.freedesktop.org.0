Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B2254FF79
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 23:45:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FA6710E36F;
	Fri, 17 Jun 2022 21:45:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C056010E36F
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 21:45:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6D77EB82BC3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 21:45:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 21C48C341C0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 21:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655502332;
 bh=mp2dQt6rvusKEj+kV9Te/sHBayHr2Ze3Gydh2C7YaKg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=pXm5FTqwx8quFrVR9LVBgDl+BV2eNLlatjz7iwbkag3DdTL84Mw8NlCIdkO6L1Vi0
 LCoqqrCI2x27ckvUA8WvMuooV2Mv+61CQFX4U49B35k2NGIkAz8vz8JAJhk5vAhLeT
 NVnBVCzAhI99dps+Xklh/5n4AKPodXQLIJX2rn0Wz5zQhhx2CEKzz2wCgoXHkjXJC7
 5X7qntufRXdwKDRWd1PZ+m71f/LKTmcvohxsOazz6yh3ut+m4rUagY3ntmdl9dWE5Q
 EV1caqFrebEM8XNjIfLqc5gKkeZfc+UCJk2xaX+hiCFXzc8c1iRdfAXHkusGVkXBbV
 CMkaTkkazaO7Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 0EB46CC13B1; Fri, 17 Jun 2022 21:45:32 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216143] [bisected] garbled screen when starting X + dmesg
 cluttered with "[drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed in the
 dependencies handling -1431655766!"
Date: Fri, 17 Jun 2022 21:45:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216143-2300-8zoytZQevm@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216143-2300@https.bugzilla.kernel.org/>
References: <bug-216143-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216143

--- Comment #2 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 301198
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301198&action=3Dedit
Xorg.0.log

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
