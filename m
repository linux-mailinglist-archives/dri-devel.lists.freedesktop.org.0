Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 820163B88E4
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jun 2021 21:02:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01EA96EA70;
	Wed, 30 Jun 2021 19:02:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A3046EA70
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jun 2021 19:02:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id AF9C86147D
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jun 2021 19:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625079720;
 bh=2WGg48/XmIl0F2Tx7QYSLQ6G26lWW1wS+HS1yQxfPiM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Qyjy/p+yHmVsvjdGFe17lGMHXuJbRXze9u+xiwN8EmpYYku3K50o/Y+2y8Rc939qw
 mWc9HS9gZpajllOnWVRyZvgCz3eRRsmcWPli1F6YkPKil05CEG1cR96u1D0UztlpnG
 vlvKOYZPqoBwhC6u6gBmQgAWkljM5Be356m7inqzxUp5+PuPh13+3xZ8ko0kN62Ixq
 FssH1z1tcmtwGjh4vBv94udrtufLKDgZxiePeLdEZN9UiHmEIzQJ/c9FeYcHlm450n
 pFCm5qAqFoBLktxz8qy0jaBmxUhtIKkCoK7jDtc/twL0qrxttr+C53zk1K+i24sZte
 ZsR1lghr/RPgA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id AD1A5612AD; Wed, 30 Jun 2021 19:02:00 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 209457] AMDGPU resume fail with RX 580 GPU
Date: Wed, 30 Jun 2021 19:01:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lsrzj@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-209457-2300-eYLtjxIV25@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209457-2300@https.bugzilla.kernel.org/>
References: <bug-209457-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D209457

--- Comment #30 from Leandro Jacques (lsrzj@yahoo.com) ---
(In reply to Leandro Jacques from comment #29)

Until now, no problems. So the problem is with newer firmware versions, wor=
king
without any issues since 2021-06-22 17:16:25 UTC with version 20210315

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
