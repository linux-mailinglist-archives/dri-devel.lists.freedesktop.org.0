Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFE5413A19
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 20:29:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C010289FFD;
	Tue, 21 Sep 2021 18:29:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1475D89FFD
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 18:29:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id D507061268
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 18:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632248971;
 bh=kC7wFbzMXoKxM1Vuja2oJyPgWbLFWXxE0TWorOkiRtM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ebH9vzfL+jff6Rvb98VJLN+28txTAZqK30WgiLIsuf2eLabf3IChWCjbKEFoZdPq+
 7wvqeuWTEi8p2aupaVPgwG6KAu4Tf1HuZuq1MCjoegJLLnHxybQ63Y4nab2lXtoqCY
 4L84CVO88XufCnnuCYbXtbc2pht15ZlkYGujdp4FTfttSle5svvke/geMV27QFyzBV
 q65fDQBhF+aRNxt0b/AEvkYOhzUIzsbvPXtArz4TTUFbBubQ3i2ehZWlLm1NGjgPVF
 P6nqpinbOeUKZvpSCSk3gIrBoQpJB+ebZ1wcJgM0jTEmlq8Icijgwb8/WvFLTTQnN+
 2l/HsyZ7PP3UA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id D121860F53; Tue, 21 Sep 2021 18:29:31 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211277] sometimes crash at s2ram-wake (Ryzen 3500U): amdgpu,
 drm, commit_tail, amdgpu_dm_atomic_commit_tail
Date: Tue, 21 Sep 2021 18:29:31 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211277-2300-lCcKejwmfM@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211277-2300@https.bugzilla.kernel.org/>
References: <bug-211277-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D211277

--- Comment #71 from youling257@gmail.com ---
(In reply to James Zhu from comment #70)
> My mistaake. Can you try add pci=3Dnoats in boot parameters?

no help, still resume failed.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
