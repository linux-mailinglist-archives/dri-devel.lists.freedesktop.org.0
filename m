Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C1A338C13
	for <lists+dri-devel@lfdr.de>; Fri, 12 Mar 2021 12:58:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98BB16F5B4;
	Fri, 12 Mar 2021 11:58:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FE156F5B4
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 11:58:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id E6B6664FF5
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 11:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615550286;
 bh=VWgaiu65Ke+8GdWhMFd7enmtrnmPwqm4vzplyura+AE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=bkbUtMZHhIxBzWXAwKsqcZj55uGWPdKMD8fUYnVOzJVVyaOhlr+M/LIxReWdJK03n
 Q+vaLQqIPtWe7HlN4XiH9fIx9/JDHxzhdgfa6HpR2C/L9pw7blVe7C6+S2BNRowgzC
 Nt2RocfcvBUxlUBjIAQdNYTSu7cEPNI6dk0w8YnWWPuyXs8wCdHbakUaAV/xeNJdS8
 wOpIuc0wTVaOqqwcZjdxlK+Ww/+aDHdx+a4hH1MDnd8t3ttbrghHm5we/wMLzxp/nv
 TsmErVEgxRj+DGdC6SHeWwYBIDXZ39gSS9IGeuaWjsXVsmYE7SbHZ08C/xdMfDETxd
 +9t2fz3fUn1ZQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id D43036537D; Fri, 12 Mar 2021 11:58:06 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212229] STM32F469: vblank wait timed out on output to
 /sys/class/graphics/fb0/pan
Date: Fri, 12 Mar 2021 11:58:06 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Console/Framebuffers
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: eugentoo@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: jsimmons@infradead.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-212229-2300-9nSx44xaMc@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212229-2300@https.bugzilla.kernel.org/>
References: <bug-212229-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212229

--- Comment #3 from Yauheni Saldatsenka (eugentoo@gmail.com) ---
Created attachment 295809
  --> https://bugzilla.kernel.org/attachment.cgi?id=295809&action=edit
/sys/kernel/debug/dri/0/state

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
