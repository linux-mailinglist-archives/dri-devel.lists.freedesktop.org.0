Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A337B41532C
	for <lists+dri-devel@lfdr.de>; Thu, 23 Sep 2021 00:05:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 113426E057;
	Wed, 22 Sep 2021 22:05:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 259E76E057
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 22:05:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id F2ADF61100
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 22:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632348333;
 bh=qkuDVsY9skOb2VrpGjhzZ27mza97R03aQkDtEj3Q8L8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=tEM4ivRRXREurNubZ8sQ0j/r6zSshCRO5kJx1aTosGSS/543jfWj3PRIUTO1m97p6
 Ir6TqQNdXAlnhbcI0aKuCjLUqPeUzRrdmktwjz9EcvNnJW9JrBRgrsDAiVCJU0ofU/
 QXcenXHCDAJM/IwiDkz7zF5QYTq9B6IQu9uyaIUBeEK7xA5wc7mpNQ7/PNnMHAuVnx
 7Tnrpqg5TRd2bS/ujH7X74rKURX9xNjTpW0YFP7IfL9vGJQIVcKef9UkkpfmYPiOdX
 wTSCZFYmLFmbTpT/zJ4cz9qjChePzLRx2xQutq7Vhp2LDDDLUQ8GmeQM9+vEeiqoz7
 +FzQK87Y7RGzg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id EF62D60FC4; Wed, 22 Sep 2021 22:05:32 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214029] [bisected] [amdgpu] Several memory leaks in amdgpu and
 ttm
Date: Wed, 22 Sep 2021 22:05:32 +0000
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
X-Bugzilla-Changed-Fields: short_desc
Message-ID: <bug-214029-2300-lXUq9Lz43I@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214029-2300@https.bugzilla.kernel.org/>
References: <bug-214029-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214029

Erhard F. (erhard_f@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|[bisected] [NAVI] Several   |[bisected] [amdgpu] Several
                   |memory leaks in amdgpu and  |memory leaks in amdgpu and
                   |ttm                         |ttm

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
