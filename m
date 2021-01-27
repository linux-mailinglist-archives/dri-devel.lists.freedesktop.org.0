Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E983070D3
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 09:15:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FD1C6E8FB;
	Thu, 28 Jan 2021 08:15:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB2E66E870
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 17:29:16 +0000 (UTC)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1611768552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=cN2Z9LvCGTTOhizcUgJh03KpxedivXPDN0q6QKgYWQY=;
 b=2vF0dK5CfuRvKFBgKucLK7ObsPGrmjeXD+7Bb0KTfL0bYVsdMpH0YLJ1310sxfcXsbTEML
 Q+vgYIF/gs0C0ZbpayCwZ3M4n1yHsySDbDJ2miL/A0AmtX1dt8t/LmXvIQpjzkkk8TSKNc
 6ZrkGLvx9KanW3790a98ngFJ64wac9fGzDATX/+Qxc/KiQ1OOxXH9IooPrKwZgpzOyS6av
 i6zgU8RXTpcMMIXTz1qzjmgtXlW5kKkCsRNtrdSmljVSEMM0J6UmxMqxFeutTBQxCIVQlp
 xosN6TtDEWuy2a9RiRWfeMwtSaWf7FyBOyuh6ekah2E6UtkGUwf4THN9Jvx2YQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1611768552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=cN2Z9LvCGTTOhizcUgJh03KpxedivXPDN0q6QKgYWQY=;
 b=MWfwVJGOtV0YLFJd2H3hxYas73+1SxUPwMZJxDCSuaWl11/XkjpK9DYLNszUPOzLPhBHBc
 NFb9w0xh+M9jwBCQ==
To: linux-omap@vger.kernel.org
Subject: [PATCH 0/2] video: omap*: Remove in_interrupt() usage.
Date: Wed, 27 Jan 2021 18:29:00 +0100
Message-Id: <20210127172902.145335-1-bigeasy@linutronix.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 Jan 2021 08:15:36 +0000
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
Cc: linux-fbdev@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Folks,

in the discussion about preempt count consistency across kernel
configurations:

 https://lore.kernel.org/r/20200914204209.256266093@linutronix.de/

it was concluded that the usage of in_interrupt() and related context
checks should be removed from non-core code.

In the long run, usage of 'preemptible, in_*irq etc.' should be banned from
driver code completely.

This series targets the video subsystem.

Sebastian

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
