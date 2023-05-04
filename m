Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDC16F680D
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 11:12:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8DC910E405;
	Thu,  4 May 2023 09:12:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94FD610E405
 for <dri-devel@lists.freedesktop.org>; Thu,  4 May 2023 09:12:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BEB3C63264
 for <dri-devel@lists.freedesktop.org>; Thu,  4 May 2023 09:12:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2CD9AC4339B
 for <dri-devel@lists.freedesktop.org>; Thu,  4 May 2023 09:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683191560;
 bh=dxDxhqJj5oJzPcNKID9FM1lrgaOWk/NIb3hBWHPnZMg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=RlPmxNcXS2qaVkSelmJsBuQlifdSkMpwFdWboZ1Itw7K5H7KE7KltyElBeUIyBJ0v
 v73LGESRE1e5KDpXtf3EV94BsPgQIsgp7K0kmqCa+0Q8UNq8FyHetB715vY0QumYXk
 fjcK1FmZlOswFIdJsIjjDge1MX+ZgjPLgGrho/BOHpCM0cKPoZ7I6GHREsubNJJxqW
 I1X7XAXhSuoH6C669Jk33K0FDKVzRut1zKrlv49v9obLTD1iaIfcu6UIFOyvHpiKUx
 muaXtdO77bGPrVuDeKyPmaE/bXT910s5knwANS+zS3SpMXrqkFRyHMDE6LJqLVThGp
 2N+az9ec4d3hQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 13608C43144; Thu,  4 May 2023 09:12:40 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217398] amdgpu module loading breaks display output - no signal
Date: Thu, 04 May 2023 09:12:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: a1bert@atlas.cz
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217398-2300-VUjY9lqRKd@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217398-2300@https.bugzilla.kernel.org/>
References: <bug-217398-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217398

--- Comment #2 from a1bert (a1bert@atlas.cz) ---
Comment on attachment 304212
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304212
dmesg 6.3.1

non working 6.3.1 kernel

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
