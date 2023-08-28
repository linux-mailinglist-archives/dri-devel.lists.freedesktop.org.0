Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9569278BACB
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 00:03:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAED210E0ED;
	Mon, 28 Aug 2023 22:03:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B8A510E0ED
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 22:03:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E898961BA9
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 22:03:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 19B68C433CD
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 22:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693260225;
 bh=sz6pPPyHTEqJeRd/WlDUWdxC/7YXu9dJa6rQyX6GO6s=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Z5T7y/SEYobtr3wPFol176sI/Fv/PipZh7kQPaP+vyQqzudEB7aNMvMtlAGDFl9bQ
 lTT1g/L8Fdiu66GOJkaD58Cbg1DqAEiMeSSbQ+P7x8jaICKmfodoeRkZKj78pepxSc
 jZpflQ2yDkRQDjtdiVd5xGNOuhm19UGAq+WrNE7kubSngSr75C7IDfgq9TbuThQ8sP
 iGBoyYkrI24hvgUrrfox9pcwt6Dj7gC7IeQHyMm3WwVUY9/g8kVOmODE9oaYFc8HxS
 dMrXcjbAx5SGSXuGQxjbHouKPgPU5rVc6N50GbcOv8MY/xomuIcjudqpSBRVEdcV0S
 zZft83ZKgdNsA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 097EAC4332E; Mon, 28 Aug 2023 22:03:45 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217664] Medion AMD Laptop doesn't wake up from s2idle with SATA
 disk
Date: Mon, 28 Aug 2023 22:03:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: IO/Storage
X-Bugzilla-Component: Serial ATA
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: tj@kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: assigned_to
Message-ID: <bug-217664-2300-LFvBd6zQFE@https.bugzilla.kernel.org/>
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

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Assignee|drivers_video-dri@kernel-bu |tj@kernel.org
                   |gs.osdl.org                 |

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
