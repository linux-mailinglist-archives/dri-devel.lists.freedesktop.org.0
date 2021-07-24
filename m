Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAC23D4843
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jul 2021 17:14:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40C3A6E120;
	Sat, 24 Jul 2021 15:14:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50C5B6E120
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jul 2021 15:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1627139666;
 bh=4noc/sQzclIW/kkrihBjzzi6QwizoNZ8djRM4lvM73g=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=lWuupqZvPp60MW1gvccIpZbpV3BV0Y2OPov5Sl7JQNykMOhs0y4XHb1aDQI+3W1EK
 72fg87aV0FYCm4bkVOA9evD72G4d/VsyO/Ht1TCD87QWTwuK9Kb+Dc5okPtIpoAa47
 j3MOZRZoXmKxy9/DfQEYjAA37pXuK+eszRe+JCto=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([83.52.228.41]) by mail.gmx.net
 (mrgmx005 [212.227.17.184]) with ESMTPSA (Nemesis) id
 1N0oBr-1lBVhf04W5-00wpiS; Sat, 24 Jul 2021 17:14:26 +0200
From: Len Baker <len.baker@gmx.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 0/3] Remove all strcpy() uses
Date: Sat, 24 Jul 2021 17:14:08 +0200
Message-Id: <20210724151411.9531-1-len.baker@gmx.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:CF3KTYSkqaOEngOglxyMd9EaNlUb1/dUGyEAN5GU0u03js5doC/
 EM/4b9OWhbjKSd8ru2UsL197JEJVkoJ01uJW+UCo8Ib0nVE/Kjg6/LwqUCSKrPRwG8tshkb
 nYwzaM44pjBoeFei5eLsV4sr1WCEw82bY3EGORYXF2KyoMTwfX22dqSBeoZuYNPF0q7qS3e
 FkZkqVqZaZAfI7lSgoHtQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:RqDB3YaQbQo=:uDk5LDovtG0+MYOzDQ8jE0
 XYwmMu2BOsBt4QV3A+LIE5bBK1CCjII05VUvqKg/Mq+SnYY15OFAcCDoU4oqr6KG4l9/SduzR
 oMVr2yCtPStMkFyLWSc6iLgDOCYNWC3f1Asi/OrmeHPzY29i79LYyxQMCqs/qwgp/iCo7MFwz
 qxBwtbbssO9Eo3VEfBuBJ7eQQ4JNYj5pf9ZWfz8+Rai4TmVKqaSidvF1DODPSaQ+G7sASDqiq
 yUATZhIyeyvq/syvBrhP0838+PavDK5tAmwoJOTLY4uXKjXG/p0koYD7JY/778lej8wa+FIOB
 tVeV20NTaqxbXR7N0EXRASQPsbEWGWIq4NbZUD4Xs84Hyp3X2dwBjrTJW7wr77Si/tAigRzT5
 GEEV2vSGQ1EkakyTcgQ8p8cGXPvFK4cZ+Rg4g5h2b+Zu9CgO/Xcf9WLLVmbvHprjqdBh6jX8L
 fGJ9Yq0urLwgLy2KFQ06TCCtxNSmM9ImwRO7SkR19l0jyCbI8vPTA+Ptd+gjPcSnc3W12LtId
 8m0vRazFbAKbllGDQIpdm1AEJbdRHHYg3TG1KPqXB04cInnWMAyFKf53abFuOzOZ5oWMHaNCV
 Q0nw+vpdAhASPyViMtyrZCnGw4DIzD0DYpqPHf/F0JMaMKcFXzZULFk2DukSMOIrTXfAl61uJ
 6AHTitFA+GghNqzceTrTtPf9kU/TC946QIMGpLYUDpa3pLGddyamwITInCUAok2uuC6JMUVO3
 Y42G7fIfR94JzSAhrE4+eoMthLKzr6Lu2n/LXhK99VIKhQ6Vo7cB8ZEXwMf1wPLRKp9fXjxd+
 u3ldvZgzvpDxNDU2jn9GjlBJLbUfnbJ8bzEDA5yB2E9Bgzp+IGTLM5TwBYni4miJMaX/KUFRE
 ZXb7/6smxzV5yy5fXMhBUOqvpLuv6JndVpdmSkNtt5HAFhubtaqrlxr/lUK7RAuUm/9tL4BxF
 Uq3mrkPa7MmCoEXO5hih8fo7AKMFHzLazw9tJdlU2SVZaKDCX0+Gjnm5yDDK28cAXkoMxG1qS
 ZG/vDRP9unJ2v4wiNdCU4v0D+PWjeXJJ53wfspsATd9hFnYnK6Qs7LFdFU0f8wOmy4ZmxnpEo
 w8RBvQq3A2+RAHE6Q4cl4G8Q3dJoN1P6UY2
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
Cc: linux-fbdev@vger.kernel.org, Phil Reid <preid@electromag.com.au>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Len Baker <len.baker@gmx.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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

Len Baker (3):
  staging/fbtft: Remove all strcpy() uses
  staging/fbtft: Remove unnecessary variable initialization
  staging/fbtft: Fix braces coding style

 drivers/staging/fbtft/fbtft-core.c | 30 +++++++++++++-----------------
 1 file changed, 13 insertions(+), 17 deletions(-)

=2D-
2.25.1

