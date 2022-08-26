Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D42075A29A3
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 16:36:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBD1110E941;
	Fri, 26 Aug 2022 14:36:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00CAB10E941
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 14:36:30 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9C848B83129
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 14:36:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 68147C433C1
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 14:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661524588;
 bh=t8pDpADBDXGtNnAV9PAVz11VGqhujf+RjXff2hfDeHk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Rn7AZVvlllbcQxfsBjXXprwdN6kPcxDB3tbWIKtgW/vIc2akP7PVHEf4klKwcd8D6
 II46Ffz69ZbLEnaNRatoFfJqfAEMmh/eQv/OmWLDuftlVWZ8Zh0PZEREOIeQ2FUtUa
 GkU7hkiV92TbpsTOiu9k8JR1AyIIcR4Zw5YeC3FWFG9JHqHMf/NMuyuaPHUa/CtNDl
 PR+Xd5agVxpLUdb+F/Ym4qf/50InjRWrTr7SIRoR9PXhvHOnF0ihniaS18TP7my5nA
 79A2ofETQ6XQshcBoRxPcYtWX765ZCvD9G3pwCLZnzLlgfmFXPvoQRR/rFdXgQqA4A
 YAKX/BLnX1K6g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 54666C433E4; Fri, 26 Aug 2022 14:36:28 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215443] [radeon] BUG: Unable to handle kernel data access on
 read at 0xc007ffffffff9130, Oops: Kernel access of bad area, sig: 11 [#1]
Date: Fri, 26 Aug 2022 14:36:28 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: OBSOLETE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-215443-2300-rbA9N6GJ7Q@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215443-2300@https.bugzilla.kernel.org/>
References: <bug-215443-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215443

Erhard F. (erhard_f@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |OBSOLETE

--- Comment #4 from Erhard F. (erhard_f@mailbox.org) ---
Have not seen this since quite a few stable kernel releases on the same
hardware. I think it's save to close here.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are on the CC list for the bug.=
