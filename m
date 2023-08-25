Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A44787FBD
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 08:21:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A781A10E0FE;
	Fri, 25 Aug 2023 06:21:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7EC910E0FE
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 06:21:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5DD2C636F3
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 06:21:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C2E4DC433CB
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 06:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692944473;
 bh=yF6vFzS9Z9M28redKPIfK8r6biHhpcmMlZSVd3qUwXw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=I4fvNIFhycSnEjCHqfLfJNhTkiqy6jbE7J8vhM5gNjil3VsMzyXhMajjGxqs/+RLg
 lEjO5JmrDZhaLTzv2ZcjgQCFF2zO/+rsaFAVAmAXoDNLqxgkxJceETQX15SqaxP1UK
 KiPOPxHf+r0zgmxnhd2pRb2WrA02sx5Gn8HWxt7wHXE8UVYeF6qqQO5aK2Z1jIWSxX
 ebsfrP4jxsbTLPzUNh+IDpAEK8UHVexLTPtGVLJKACWU6bNSrb58R2lKuCpSSSwF2N
 w33CnrW68UIY4OEOAbgcOBlbjCZb4eb7ebbiCObGyc+X1gaAXidPa5Gmu65F68I5I/
 itrpnvOjtSf1g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id AD8BFC53BD4; Fri, 25 Aug 2023 06:21:13 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217664] Laptop doesnt wake up from suspend mode.
Date: Fri, 25 Aug 2023 06:21:13 +0000
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
Message-ID: <bug-217664-2300-aV9ZLaaiRl@https.bugzilla.kernel.org/>
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

--- Comment #33 from popus_czy_to_ty (penteljapan@o2.pl) ---
Created attachment 304940
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304940&action=3Dedit
second run

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
