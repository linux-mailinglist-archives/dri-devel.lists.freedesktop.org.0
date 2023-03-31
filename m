Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D573E6D1BB1
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 11:14:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F096110F16B;
	Fri, 31 Mar 2023 09:14:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C858210F16B
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 09:14:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3596C62618
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 09:14:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9ACB2C433A0
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 09:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680254087;
 bh=o41F68z/qDpqxSBwGyLpSCtVfTtulL9ZRWD5pVbo++w=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=CfItLcuLF/ngxIuRP4WRUc5h/dpGdtkwz9+GlmvOW/om8Wp8w5rmcrqulqRZ5CQda
 /JauW98SQypadZ/3FEoKqONGBZlyqobxvmS78pcRCWwqJy359oMGbDOVJuOI7qG6y5
 8AyeqxTJx/tI1oLdShHsQ+nnO1PICS0u9fvXBaEkszCuhY7+soZ82zsBJqvSU09mvS
 6u0SUa6t75onSoTpmb087TKrlzVySd7s/ukYgKBiuuMnnoVdfo16RajQcFVLNt2HiS
 i3GVFlxag4dlTVcPON6xv6qyxbyX0ZGaNlfaH4z/OnOVYPBSAo52leH5VnhSJlFuGr
 Mb5tYMDZLXehw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 800C3C43143; Fri, 31 Mar 2023 09:14:47 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217278] ast 0000:03:00.0: PM: **** DPM device timeout ****
 during S4 resuming
Date: Fri, 31 Mar 2023 09:14:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: wendy.wang@intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217278-2300-Clw34Qt9Mj@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217278-2300@https.bugzilla.kernel.org/>
References: <bug-217278-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217278

--- Comment #2 from wendy.wang@intel.com ---
Needs time to check mainline v6.1 fail or not.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
