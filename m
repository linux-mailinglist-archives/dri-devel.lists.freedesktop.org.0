Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 660683FB72E
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 15:45:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 211E389CB2;
	Mon, 30 Aug 2021 13:45:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 198BB89CB2
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 13:45:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id D6BD460E98
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 13:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630331106;
 bh=e+g5/ZSVDWDJaH6UT3SSyypDDFQXQLHzgVuqQYw82QM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=FxoaDF2mNRON8pUPXqGEGBOtICb/Rfx7b/PU6aAyvsiW8gMEXo/WsiH85ZYM2dQEB
 CrWP2A3vkY8tF16uLipN+Df187PgG6jYEoPsOoZjNEnVY232QEtB6NaxAR3fBeCb2T
 bhZS3c/2BZ84ca4Ps7OA747er9qZHr1z+Fd0AxvDXXPRiq3Y7HEwjAKjWNtEPQXcmM
 /9t+nuJiZ8q/w5r+GhYateFbyY5vHY0z4793IqgYCjUOtFmk+MLHyAEudsqro6kvLi
 affang6FIxD1QL7Dxcg0zMQIFewdICOHtKWTxOoJR8yScvUltmr4Aiz8XmpL9DAdtp
 IYjoecR6lZZ5A==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id CEB6260FC1; Mon, 30 Aug 2021 13:45:06 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214029] [NAVI] Several memory leaks in amdgpu and ttm
Date: Mon, 30 Aug 2021 13:45:06 +0000
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
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-214029-2300-RbjiXs9URR@https.bugzilla.kernel.org/>
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
 Attachment #298269|0                           |1
        is obsolete|                            |

--- Comment #3 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 298525
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298525&action=3Dedit
kernel .config (kernel 5.14, AMD FX-8370)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
