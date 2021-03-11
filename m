Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8312E33707E
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 11:51:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44E276EB9C;
	Thu, 11 Mar 2021 10:51:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C48B6EB9C
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 10:51:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 0FB7B64FC3
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 10:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615459881;
 bh=HkJUDF0gM1hl7mHZTbDawEUDaxK5RmrWi653c862yxA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=IuQrWKSit1C0oALQyLVNekXYKM8BVy8NCJd1/t5qYkwzpYAeQLJPhxymCjljY57lY
 MnVUg1undy2z7rrhcvD9Z6Vnxl7rKjWT08RQPYovEtlKfAyLDcrdOwrH+W6FVT2PLn
 wtJcfOEgSPTkOCOWh5oJg0tyqYhP75sfW7uR/Dp8Gl93jpd1uviXE55jqj5JbRRopE
 ZL1LGNNva8ch9YefAr3hCFu5qOS24GsBAxdn9FmPJrxHbGf07R/3Ovk001diADsJCY
 aguftGsJbn/0XnhfNu9P7Wb7glsAOFMdjkovUaLM0svX1PQG11776OrZ3Bm2OGbhZD
 L0tRTp+/FP4Dw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id E9500653BD; Thu, 11 Mar 2021 10:51:20 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212229] STM32F469: vblank wait timed out on output to
 /sys/class/graphics/fb0/pan
Date: Thu, 11 Mar 2021 10:51:20 +0000
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
X-Bugzilla-Changed-Fields: cf_kernel_version
Message-ID: <bug-212229-2300-YJyGpOY1BR@https.bugzilla.kernel.org/>
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

Yauheni Saldatsenka (eugentoo@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
     Kernel Version|Linux version 5.9.16        |Linux version 5.9.16
                   |(ygenks@xps)                |(arm-buildroot-uclinux-ucli
                   |(arm-buildroot-uclinux-ucli |bcgnueabi-gcc.br_real
                   |bcgnueabi-gcc.br_real       |(Buildroot
                   |(Buildroot                  |2020.11.2-87-g0611b1a4ab)
                   |2020.11.2-87-g0611b1a4ab)   |9.3.0, GNU ld (GNU
                   |9.3.0, GNU ld (GNU          |Binutils) 2.32) #3 PREEMPT
                   |Binutils) 2.32) #3 PREEMPT  |Thu Mar 11 12:39:46 +03
                   |Thu Mar 11 12:39:46 +03     |2021
                   |2021                        |

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
