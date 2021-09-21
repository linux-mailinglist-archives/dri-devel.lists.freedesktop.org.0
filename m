Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A14412E16
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 06:53:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 631186E8F5;
	Tue, 21 Sep 2021 04:53:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C0FB6E8F5
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 04:53:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 05A8461175
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 04:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632199981;
 bh=pVNFuo/DxngOhBpWZIL4NK7bP9se8kyGLMCbr/jLt8M=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=KYrcnvfCrXGLGYTMrR7lnoDdyd6VwxbhYJ9QN70FfkAPhY5XqfjX1krMfeCgHbHMi
 Z/mVnD+6+bEizndheguUSNQn7OwgtNkqH1giyja8asQo2iujBcz61WvWhcNw3EmDNQ
 BDKksczR0EwUgPnYlgiyrGU5d0hmEBDTDkCqOQzS5SFHmGcIiTFbjA9Nse/pMXSf5+
 fnPVHT1cgkWkLmULNG/aw5jiQIlXnemHJF05lgQTbjXOpSHDW4tjy6cXqIf5z/5Ag5
 ZobGDhfg45Ew3fDCo/ug4FnX7PAcolvIaxGng/RUlaX9T7BbDwwdlG8GhFcUc3BQ46
 3niE0DvLPgFMg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id F36B960FA0; Tue, 21 Sep 2021 04:53:00 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211277] sometimes crash at s2ram-wake (Ryzen 3500U): amdgpu,
 drm, commit_tail, amdgpu_dm_atomic_commit_tail
Date: Tue, 21 Sep 2021 04:53:00 +0000
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
Message-ID: <bug-211277-2300-ivOZsLtWgx@https.bugzilla.kernel.org/>
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

--- Comment #66 from youling257@gmail.com ---
resume failed record video,
https://drive.google.com/drive/folders/1bWMC4ByGvudC9zBk-9Xgamz-shir0pqX?us=
p=3Dsharing

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
