Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 695883A0829
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 02:11:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87FB76E830;
	Wed,  9 Jun 2021 00:11:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBD226E7EC
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 00:11:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id A2234610F8
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 00:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623197495;
 bh=YyU4b04toIGPMlU4DPVZoTV7Pk3JCX489RImmaSpKLo=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=h2iTu6YX5shQM0HCKenyBD+P1S4dAAOzy6a/pHcexa/8bnHX/XizFlEe+3/5Y2BR5
 l0OeZd+88AqmjGenSIimU/eQ5NrEtyVderHiqNgRmhNYkYSAsJSqFzFmG4zUYYkZ1t
 vHKlBMZdDnCdlflGPZvb+OTKDR1LIwRqpwuO42aWukkZq+6fzId+KVcicYLm5KNTkn
 b6GvwKknEuf5RsIszNASNzct02Zt6BoyrIg/s9J6IHXGRgTnOYHeDRxmsVJH45XffM
 JpbNGMIZGtQk85VCgX5Erao1Z0+ddAeNAVA09aUKxUwwpNBzKLfypq6aO8G8OAnAYh
 eUnicw+gWW6hg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 9E339610D2; Wed,  9 Jun 2021 00:11:35 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213373] [drm] [radeon] memory leak at parsing
 radeon_atombios_parse_power_table
Date: Wed, 09 Jun 2021 00:11:35 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-213373-2300-nibwYENcyk@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213373-2300@https.bugzilla.kernel.org/>
References: <bug-213373-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213373

--- Comment #2 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 297251
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D297251&action=3Dedit
kernel .config (5.13-rc5, eMachines E620)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
