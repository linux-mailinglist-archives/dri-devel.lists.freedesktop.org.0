Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F90A3891D6
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 16:47:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABEF56EDD9;
	Wed, 19 May 2021 14:47:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 634D06EDD9
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 14:47:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 3BF8F6105A
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 14:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621435669;
 bh=sCzfQNkAXkCdrh/BVBFiVXmSJC3f4ct721BcgzXMlCk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Amz0i4I8JSafJKnMeKEar2es29zzGSzNjjuqmqCTtQC31gcoWpH+D1ktiab8LbpQH
 PUpMjbSXXeJiBNOYtcxddAqSwHzarj5j7ZPYPJWdmR88SIlm8WjlGlX3+vLGQ8xbRb
 L2JmcGSpOM/AfgzHS6cgqfljOALKx8Okn3+gIloR8QlzQWaDRq4/L1HPPnNMgF8P/d
 bx9Xnha9/76eRR6KyaLMNEz6vyecHXrtLajUSnRjtW7522voR8zVSmZuKCdh5K6S+g
 wZ5fLa6Z8QpsN3IOY0tiFYMyFulMU2SCIxV6CcfTY/0iuKJH7F2T/xAgJk8Qsa73Fj
 jkj2ACspnULsQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 385CD6125F; Wed, 19 May 2021 14:47:49 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213145] AMDGPU resets, timesout and crashes after "*ERROR*
 Waiting for fences timed out!"
Date: Wed, 19 May 2021 14:47:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: tgayoso@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-213145-2300-y0WGPV31ib@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213145-2300@https.bugzilla.kernel.org/>
References: <bug-213145-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213145

--- Comment #2 from Tomas Gayoso (tgayoso@gmail.com) ---
Created attachment 296871
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D296871&action=3Dedit
kernel configuration

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
