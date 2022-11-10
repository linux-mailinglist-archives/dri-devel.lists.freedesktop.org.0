Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE570624481
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 15:42:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EED5D10E82A;
	Thu, 10 Nov 2022 14:42:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E1CD10E82A
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 14:42:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B18B361632
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 14:42:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 20F9EC433B5
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 14:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668091360;
 bh=pO9l0pvPctEQycB1scznNLqArbqxZr5QVItu4LzX17I=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=h7bqausy2Os8CZ44z5anLt/z56KWyyodr3+d22rCUXxV5fGf/Z6L8Cfp+FpA4sSm1
 zutiygAnk34zHP1gtB/EAIuSnWshxRGq7JMjOmMGQVBwOySOPRObNaRgXDzM6Te+a1
 mOlJIFHQ8LfJJ9cIkksiopP2xYAv8/IDJ2pQrfhW9N2vqCtDhpGGtfBD/u1kysMf1G
 GjYM3pCx5wHXTTDTYadXC+cVlZTUJkKHPJqXt7WZwRmT3mvAbe8PmZCuAV3NS+l4kn
 STs2CIO9ZL+hBMUFwbw0FGsHvClkTcLIcCoe90xuKWKLt8dGR0khvHYvHeOjngmudM
 ZnCNis8YnHYuA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 099FDC433EA; Thu, 10 Nov 2022 14:42:40 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216673] Recurring amdgpu freeze on kernel 6.0.6 only
Date: Thu, 10 Nov 2022 14:42:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: micheledellaguardia@yahoo.it
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216673-2300-uIZklgIMtc@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216673-2300@https.bugzilla.kernel.org/>
References: <bug-216673-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216673

Michele Della Guardia (micheledellaguardia@yahoo.it) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |micheledellaguardia@yahoo.i
                   |                            |t

--- Comment #5 from Michele Della Guardia (micheledellaguardia@yahoo.it) ---
I've got the same issue on 6.0.6 and 6.0.7 kernel, but found that the probl=
em
has already been discussed and addressed here:

https://gitlab.freedesktop.org/drm/amd/-/issues/2113

I think fixes have been already committed so we should find them in the next
kernel release.
Regards

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
