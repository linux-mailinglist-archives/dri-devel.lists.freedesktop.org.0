Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F06E73B085
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 08:08:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18EE610E0D4;
	Fri, 23 Jun 2023 06:08:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0D8910E0D4
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 06:08:30 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BCD31617DC
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 06:08:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1C512C433C8
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 06:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687500508;
 bh=IkVyG0Y/EcuoQwXDZUFy0hP5AVYx9sXYw3tst+3hBKk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=MoYfq+uUWcaVdLitRHoPOhGNTkZHcN/6NXi20Wzu81Dylk/JPCdWeYqTZXdWtLhbO
 zHoVvdiL3wqBvUG3aNW32MC+c2ryaWbwBbmYNq3KTVicdzWf29JnIVF6cG0DuzwcUp
 tlHyGvzZN9XhGCVfbJPNHFKjTcCrDfrOal3ho8Nxg3U1bVIynrxoWYa16q70y5wjfM
 eX4dMQlbSz0s9sdO0vrXxtNaChxdKkViBzLoFY/9wwKm9xXu102hO8h3e/QyvmnyoS
 95f9e3qPlsbIG/q4HpUuOpLGSpp7rzOvJOWGO0FzDkrh6JmB/LxmO5DVPJnrVeyw25
 rX0rTd5ybOmgg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 0505DC53BD1; Fri, 23 Jun 2023 06:08:28 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217587] amdgpu kernel NULL pointer dereference, address:
 0000000000000054
Date: Fri, 23 Jun 2023 06:08:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-217587-2300-J2KRkbLqNW@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217587-2300@https.bugzilla.kernel.org/>
References: <bug-217587-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217587

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #1 from Artem S. Tashkinov (aros@gmx.com) ---
Please report here instead:

https://gitlab.freedesktop.org/drm/amd/-/issues

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
