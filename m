Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 985A578632A
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 00:09:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEB5510E47B;
	Wed, 23 Aug 2023 22:09:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 038DD10E479
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 22:09:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B46276388B
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 22:09:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E8284C433CB
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 22:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692828588;
 bh=rxv5hWVLBaN1KvxjqjeFn8K/9BukEmmnTf0N5YSEAog=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=GkRkHiRplqe6KpScI8jr0VvrSb30lTw5IRER6f9ywSNN+UojZfaU3VAqTe5rx487i
 5DUfgIvXkBhL5QjwNx8sxAFm6eAUSjjkjlezbLZga2zTf+0oigBkPVzXmKLMNWG6pp
 wvjgFuKJeUA0TfwdinGh5YpGmudJolqpX2E6lrZ9t+xj1zrqI+4gP/WDAidQv/Jcsy
 hs5UndrxdP2TwLjOE5z9sgkEamrfB/OgrsaNlxQClDHhdcPKbryZrQYmQmGXhPl8JN
 foPOop4/BMAeBzZ3kv2eP4MHHRn+0ebj66fnFm6VqP7bG0zJ1xDjOJg06gduEBjDqK
 FC4xXBcAHwzHg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id D49ACC53BD4; Wed, 23 Aug 2023 22:09:48 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217664] Laptop doesnt wake up from suspend mode.
Date: Wed, 23 Aug 2023 22:09:48 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217664-2300-zQFQaJ6LI1@https.bugzilla.kernel.org/>
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

--- Comment #25 from popus_czy_to_ty (penteljapan@o2.pl) ---
sudo add-apt-repository ppa:cappelikan/ppa
sudo apt update
sudo apt install mainline
sudo mainline



lsd@Crawler-E25:~$ sudo mainline install 6.4.11
mainline 1.4.8
Updating Kernels...
Pobieranie 6.4.11
Instalowanie 6.4.11=20=20=20=20=20=20=20=20=20=20=20=20

after this, and format im landing on initramfs on fresh kubuntu 23.04 for s=
ome
reason

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
