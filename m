Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF1F3D86E4
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 06:49:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF81A6EABF;
	Wed, 28 Jul 2021 04:49:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 182D16EABF
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 04:49:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id E86E460F41
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 04:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627447790;
 bh=Adth2HpqYkdw2HAUI79tEfpdCPZ7iqPtpQcoS0nkL2I=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=gYTW133lxELFN0lUJHBgB5qEwJ6dhEyOtV8ZDiI5pd3zg8bW8okvvxubmgycHi6F4
 QcZZRkLs9QNW8zheSluNxE0o46HTiUQzebDfPPJzPwn0zpStGIs7Qtb3nSQK3CA8g/
 j5kjMQYiyHaJ068hI9vZRXnRBAaoG0vyBNoWLYnCM8rHVnEwGgOjFHheneyrFcMxBg
 pZozklXYaLozJEU5+fQK/bwOuelJXeWnJsmzUvJQQkW31H9XXh2yLTFme70B0NWK0z
 X7uMJygg3jRsSXNVJn/4sS1Oqs4LsFTVysO/UccTGt3GqLlGicUMYB3TfX/gDDdhsM
 6YUTGVCvMXAEA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id DF36760ED6; Wed, 28 Jul 2021 04:49:50 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213779] Screen  stays blank on resume from hibernate
Date: Wed, 28 Jul 2021 04:49:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213779-2300-jTJhEYVMcG@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213779-2300@https.bugzilla.kernel.org/>
References: <bug-213779-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213779

--- Comment #4 from Alex Deucher (alexdeucher@gmail.com) ---
Fix is in 5.14 and should land in stable shortly:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3D6be50f5d83adc9541de3d5be26e968182b5ac150

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
