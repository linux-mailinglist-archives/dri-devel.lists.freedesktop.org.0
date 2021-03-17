Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 834B333EB46
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 09:19:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EA45892A8;
	Wed, 17 Mar 2021 08:19:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8947F892A8
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 08:19:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id B086664F97
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 08:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615969172;
 bh=UEmfNhtWBuA7w5RdnqmxNTSJ1wZQQpA2PDRQ0hn2jpc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Y5gVtUch+PNI7aex+CfW0ZghlxNLEtSpBJ7VqlNFe9KT4K7UZBdU6gLVfWXBeeRTI
 J7UCe9ARrrpqLxRznHVXOj2/OImUxyjcxVC9XhaMdv1b40X5COdgiZoOy/VIU/JyOc
 xJhlDIYrWxX/mE4syjVjc7AqMLxqykn1bF3LPpFXktV3kSwOUSvidFPxkkK+fpLH7d
 73zzbVsx07Blq/8+VOKbOeCqOgCe8/XFYVL+C6fEejVQqXh+SRE50Cg/REow/4cXmy
 IZ9atdQplYRaDW4B5aDW2oiUU7kxuXP3nVw3yZ+nM2pOvrofFYVoxRMOpMhXDna5ET
 MreaegVnnDHmQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id A2AD3653C7; Wed, 17 Mar 2021 08:19:32 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212293] [amdgpu] divide error: 0000 on resume from S3
Date: Wed, 17 Mar 2021 08:19:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: contact@scrumplex.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-212293-2300-gv8poysBbT@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212293-2300@https.bugzilla.kernel.org/>
References: <bug-212293-2300@https.bugzilla.kernel.org/>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=212293

--- Comment #7 from Sefa Eyeoglu (contact@scrumplex.net) ---
I submitted a patch here:
https://lists.freedesktop.org/archives/amd-gfx/2021-March/060754.html

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
