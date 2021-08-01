Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE8D3DCACF
	for <lists+dri-devel@lfdr.de>; Sun,  1 Aug 2021 10:52:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8B5D6E530;
	Sun,  1 Aug 2021 08:52:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E6226E530
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Aug 2021 08:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1627807929;
 bh=SOIFLquzf5Zz0SDbbcnVJ8DB5eWL4PtOwemIlXPqT4Y=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=TIvReMHWhYORyqwjmEayuO3kZj96KrTT6tPaJrN8yXIw6eD/m5W6wWw84DAWhNlGg
 rhKsgV/ewp5X/zEylKgITozYp5logbjbF3xwFU0HiI66L0+zwRdGDKOuPY/tjd62yu
 0nj63ST6oys2hyDHR1CiZX3RRrgNujV/bAWP9sCI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([79.150.72.99]) by mail.gmx.net
 (mrgmx005 [212.227.17.184]) with ESMTPSA (Nemesis) id
 1Mlf4S-1mrfPm3VHW-00igu5; Sun, 01 Aug 2021 10:52:09 +0200
From: Len Baker <len.baker@gmx.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Len Baker <len.baker@gmx.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Phil Reid <preid@electromag.com.au>,
 Geert Uytterhoeven <geert@linux-m68k.org>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] Remove all strcpy() uses
Date: Sun,  1 Aug 2021 10:51:52 +0200
Message-Id: <20210801085155.3170-1-len.baker@gmx.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:srW7+QTLXJ7EzVaF4TWVA9WepIXkUL0J7UT9FQCJ+SLKR7a2RRI
 rvW1K1KbCC1tyLMlihI/G9Ic6pVfq0/0cB6y4kXzkQUbPadtlnkAKW42Aj8ySG9JMH6YsjR
 ZTGcToRcth60QTmJ95v3NjRHI7PID8nI5N2fnvzbTslnUuY1HC1LlIqr49kNnNKxPWQB+77
 oF5+ZQO1kMyGMe9Z0TZNA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:LiJhGubXC8I=:IWp5R7iGCVjZjY2qtZYuTM
 LQuvyE6104hlATg3VwkYJqq19W+690jJ8RUru0rTfmZRebtnSeYzyNwlM16IqEsEgXDEjQX66
 JgmbADBujwRhlAZIHRpsdnN8/v68Xh2Qs778w+5yyW1H+Tsju0UdOBLx9E8QTxf3wJyN9NLXw
 zX39DNbMTTHirS4w7UTSGY/K62msTs0bQVM+4F49Dpn/J0FSZUAQmCDc/n7KZ+BYebZPvCnLP
 yH0el+mNFzKKosSf4RC1YpohXFEGF1gxsy0fn2QUzRiR/b53O3Hh0ZFHXdHKS4vn/dql7ET3u
 86VPvLwjMZXf/SychaXrxpfADPtzTioX1rbRlXaR4qG4MWtt2AJCVwMjC/RVQQW/9PuO+xUhC
 B8hvG6lCYi2N/bLrkaVrUWTFF9kwTYk7oU/Xw/qr1pqFF4YyST+0rexNDNgqD8iPXBKVg/V82
 /x3+K17SFxkHPkSCHncNGdE3ZrpwbS8wPPkGRnQjXsuYXDEKgXRK0zfGRaoRvmPP4Lnu09XOd
 qkNbaoCxXiXQlqCq4IR6UvUkG7os0qLYghcYFdAqhhsSuOcRpio6nnBP58PWBbP7CcWu1QvUR
 SRsicuygLf8L+QDlm/yviB8Y8t7lZYmtpKeUehW8m/YVlbPGybSGDhQ+9RwXJ8n570chaz9gl
 weow9eQh6sDND3why5IMYXtiCPUArAM3F+iMJkzpb3a8rLeFBCVkg6CJnEm+KmqRwoE94Jaed
 ut4C9gSlKf/OZ6p2IDrXhrLrDdFIppgHPDXcHB/lVk6pJ24Rge2RIKcv03L/mix/W9TtpqTel
 6UZ31HkZBQJL3WATn/oha6acC9JsHCH4284c4sXvq+m5mkzFIJ9O/+unFAuYjB45x4SjQxWcW
 WHh/O7HrqONLhKDHmjBxiaOfQzdpm56BqfDUbRWmuZ/ZC97FBW7IZIygdNskirAGAj77LwMVl
 6Q/jjkrIz0hhtjtRSVzZ+br/L/Bn8O7zoNwDJYq11tLVeZJy7Id3jrUuZ8bfi6pyjesqpETA1
 xRqhbMuSv3CkT+JjMi5F4xpAmFG+otaNeFK0xzl89J41zPkQ696l0ZmkLhUn2pvq7KN7IC3Hq
 Z6JnzWFpLpXIJFiBsUyxAdxmotE8ZM3uxmo
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

strcpy() performs no bounds checking on the destination buffer. This
could result in linear overflows beyond the end of the buffer, leading
to all kinds of misbehaviors. So, this serie removes all strcpy uses
from the "staging/fbtft" subsystem.

Also, refactor the code a bit to follow the kernel coding-style and
avoid unnecessary variable initialization.

Changelog v1 -> v2
- Add two new commits to clean the code.
- Use the "%*ph" format specifier instead of strscpy() function (Geert
  Uytterhoeven)

Changelog v2 -> v3
- Change the initialization of the "j" variable in the "for" loop and
  update the code accordingly (Andy Shevchenko).
- Improve the commit message to inform that the "%*ph" replacement
  won't cut output earlier than requested (Andy Shevchenko).
- Don't remove the braces in the "if" statement due to the presence of
  the comment (Geert Uytterhoeven).

Len Baker (3):
  staging/fbtft: Remove all strcpy() uses
  staging/fbtft: Remove unnecessary variable initialization
  staging/fbtft: Fix braces coding style

 drivers/staging/fbtft/fbtft-core.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

=2D-
2.25.1

