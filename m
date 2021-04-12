Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BB235C965
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 17:06:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1089D6E5D3;
	Mon, 12 Apr 2021 15:06:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C6836E5D3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 15:06:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 7C4286134F
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 15:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618239985;
 bh=/VR3nhs3CVCfxn5JV1VES2Mj0nZaFOGJGvI+O6wsLjY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ERJOJcO1QErqNktd9LnA/xt5sckzcKtVUlQ03Uj8niTClalEM9mrvXydaRZLQ8YHb
 I5m/34kyeZL0NtgC4OlyYtEHBoQEuKN/xMmlMOYCKJ2dza6YwRnoQ+OypFkcKvIr6y
 yemRJeMt440wxYSjjJv7nBVYX8vZCvJhihwrdtJDb+rL3emNsECKbhMGWQms52+FGD
 k9QlBcgH9QCnEi7hr/68HyTcuvU0KXZ/r15NSYGDQgJxWiOfFehOkOKQaD9t5Ln7tg
 5DBgwHSYVivzKpjiFnAR77BLifVmbVRaevcIv70A7YeatJJdusWrxa/sfedWA2l+HW
 25CSYP7ovDk4g==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 78E80610C8; Mon, 12 Apr 2021 15:06:25 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212649] general protection fault, probably for non-canonical
 address 0x1856385d1408f284: 0000 [#1] SMP NOPTI, RIP:
 0010:kmem_cache_alloc_trace+0xe9/0x2f0
Date: Mon, 12 Apr 2021 15:06:25 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Memory Management
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: akpm@linux-foundation.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-212649-2300-IHepZDjFW3@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212649-2300@https.bugzilla.kernel.org/>
References: <bug-212649-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212649

Erhard F. (erhard_f@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |airlied@linux.ie,
                   |                            |dri-devel@lists.freedesktop
                   |                            |.org

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
