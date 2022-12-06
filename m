Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B843B644A8C
	for <lists+dri-devel@lfdr.de>; Tue,  6 Dec 2022 18:44:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B623810E335;
	Tue,  6 Dec 2022 17:44:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88F1D10E154
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Dec 2022 17:44:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 20419617EB
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Dec 2022 17:44:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 84DDCC433D6
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Dec 2022 17:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670348689;
 bh=hqp6+Rpqj5jg76ZId4Ma2W1eaqhSxJyih0cElpvOl+Q=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ci2zwlK1xQf+za6Wyy/HdS7AOK4M/NG7xY4PPjP1VKCqfkdSQKZfKDELSnd7HO/Xy
 FXtThTlhO709DA2ECDnjx7/pUavGPjmXb4sJZPiXVjzePRwM2zuIEennX34uyLGfFm
 lcfnmIj00FR+1MW5kaKtBFVPXwcww8jJlL1QA6HV0UBWiaWZ4uLd0bEMN32sZxar/i
 e3ZUdMD1AFfI7WiPVnNxR6p615YCUOVEB66Y+KXoTB6DPpeuppRuxQanIkD3GWs119
 TCHNKOaKNcORFQ9De49+UklL9QYLy+drsIQ/+fxIUbeNMcpH5tL2FY4klLyzAk7BLI
 2gzeOeRYvYtsA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 73056C433E7; Tue,  6 Dec 2022 17:44:49 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216780] problem of Mesa drawing boxes after resume from suspend
 with Geforce4 420 Go
Date: Tue, 06 Dec 2022 17:44:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: estellnb@elstel.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216780-2300-idSnlZXwDe@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216780-2300@https.bugzilla.kernel.org/>
References: <bug-216780-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216780

--- Comment #5 from Elmar Stellnberger (estellnb@elstel.org) ---
done: https://gitlab.freedesktop.org/drm/nouveau/-/issues/194

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
