Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6C4787F8A
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 08:07:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3A1D10E600;
	Fri, 25 Aug 2023 06:07:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B7D010E600
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 06:07:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 83CA1617BF
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 06:07:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EA46BC433C7
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 06:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692943642;
 bh=vx2lu2ZIpgrxx4aGwHsdIF/pj2TpbZ86k2n4w9PQb5U=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=uawL3fkzERaOn5Wgue8cYGZImzbFGAKZU4K3XWOBM7+2tE/vkjMxISaMKHMrV7nih
 +hn06uGiCOdr8Ti6zG9d0dT4Cr+IIq5MR+WDAiT/DvWLUFWQ+PKT8CeQsFgEp0RkUq
 VP6M6RR5qCpEXm/OuAk7/P+XD5vunmo3H4w7BD5itZpyj0ScegtHTsrwMQu/qeyzC9
 b9kwgbaoTzga4dJl78/4TVTJlKkl+IFFO0N5+J5jNB9ZPILcm8t33r55n3p060aSTF
 sh+dVWzB4rbGPkoED582zuK63jenz6tV1lzNjH/P2Gi1uE0wFNm7a1iag7dh7Siwoy
 tcZnbz6Foqrcw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id DA815C53BD4; Fri, 25 Aug 2023 06:07:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217664] Laptop doesnt wake up from suspend mode.
Date: Fri, 25 Aug 2023 06:07:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: ACPI
X-Bugzilla-Component: Power-Sleep-Wake
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: penteljapan@o2.pl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-217664-2300-x0OITxo78B@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217664-2300@https.bugzilla.kernel.org/>
References: <bug-217664-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217664

--- Comment #30 from popus_czy_to_ty (penteljapan@o2.pl) ---
Created attachment 304937
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304937&action=3Dedit
kernel log

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
