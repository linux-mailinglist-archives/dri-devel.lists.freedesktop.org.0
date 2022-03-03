Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CE84CC504
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 19:21:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02B4610EE0D;
	Thu,  3 Mar 2022 18:21:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49BEF10EE0D
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 18:21:51 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B98E0619E4
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 18:21:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2F4ECC340EF
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 18:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646331710;
 bh=nI7yzH33RDXRX2SJO80rUDc+FGrTnb4N6v8/+hKekA8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=tiLZq2ygiJsKlsEjS1SLNBVRhdcwjNIuktVbR8nTn30bw0/mj4cxbtWVPSdqEmcgU
 OCZINOWMIZWws74CVBGI9tw7PILhO6Ajfvvriu+BpOpl29RJOTq4Cf8fCriNtr/Z/2
 bbF95rj1ux6f/pmmmAqUhPCI0ridF0GWxQP+UebdkSaYywJnFnjp6mvOwagpdMgVxj
 1b8kM8COOPnV1m6gB5ZCJT3i7jiCHpBfq/NN4wl4jG3uCrLZlkrRZPdUEvn7aee/cW
 C8F1Co+gOgpYFp5mwi81QazF4ZImeymZMnbWw1PnNQrbqpTe+9UTmiOdesQ3kb5qJy
 imkqaAO7yuYlg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 0E782CC13AF; Thu,  3 Mar 2022 18:21:50 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215652] kernel 5.17-rc fail to load radeon DRM "modprobe:
 ERROR: could not insert 'radeon': Unknown symbol in module, or unknown
 parameter (see dmesg)"
Date: Thu, 03 Mar 2022 18:21:49 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215652-2300-Ri5pWkDhjm@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215652-2300@https.bugzilla.kernel.org/>
References: <bug-215652-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215652

--- Comment #7 from Erhard F. (erhard_f@mailbox.org) ---
(In reply to Alex Deucher from comment #6)
> You need to make sure the firmware is in your initrd.  When the kernel
> loads, it loads from the initrd.  There is no filesystem mounted yet when
> the radeon driver is loaded so the firmwares need to be in the initrd.
As I said I am not using an initrd and this config worked on <5.17-rc. So
something must have changed that I now get "modprobe: ERROR: could not inse=
rt
'radeon': Unknown symbol in module, or unknown parameter (see dmesg)". I'll=
 try
a bisect and see if I can dig out more.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
