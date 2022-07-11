Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFE256694C
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 13:31:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E600510E474;
	Tue,  5 Jul 2022 11:30:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 743B110E033
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jul 2022 07:17:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7621FB815AB
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jul 2022 22:59:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 42610C3411E
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jul 2022 22:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656975588;
 bh=0RPYtCHS++yZX9CBj4UvFgXy8hJeUb2rK1iPtbG5ncQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=QeT+jOb4mf0ONGWSv+sAtDxYWQVMuU1+2PC7eegdOWMpY9i1J+nMtBhgiJvwWQKJh
 GIEAlH+1jlH/nBIsX0NZvjrIQRWDz3apEgRkxY3LBX+uO6bygAgRuKp9RUVQi11iXN
 K7CigoapKiJrWs6SV5+TSDHxilmDxneVhcXZy/1fAQWrWD6okK8z6orHe8bLIeXKfW
 OV1Oc8EIAjE0WehBDCdhR7C3yuoh2Lrblj0p6yQEX2LL7xnplRxni5nQ3JOKSPrxXp
 5lGD7w9L6E4c2/+QQAEh9yclQMvkDzOB/b3JEk1eSkVrdl91Hi3X8rbOkNm7CJffaP
 80kIkXIqXGspQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 2E302C05FF5; Mon,  4 Jul 2022 22:59:48 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216200] AMDGPU hung after enabling HIP for gpu acceleration in
 Blender Cycles 3.2
Date: Mon, 04 Jul 2022 22:59:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-216200-2300-SMKdRkauiL@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216200-2300@https.bugzilla.kernel.org/>
References: <bug-216200-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216200

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #2 from Artem S. Tashkinov (aros@gmx.com) ---
Please report here: https://gitlab.freedesktop.org/drm/amd/-/issues

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
