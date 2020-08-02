Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 911C523A0CC
	for <lists+dri-devel@lfdr.de>; Mon,  3 Aug 2020 10:21:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8E6289101;
	Mon,  3 Aug 2020 08:20:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 347 seconds by postgrey-1.36 at gabe;
 Sun, 02 Aug 2020 04:49:37 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01A5F6E05D
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Aug 2020 04:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1596343776;
 bh=d6pa9qyO4ebYl6Gjzcm6qUkA1sR4+0nvmuHulLIEwSk=;
 h=X-UI-Sender-Class:Date:In-Reply-To:References:Subject:To:CC:From;
 b=krI6ohHsaZ+dQ7eyQfIei/F66oDXM659RvEpJP9JK9mJJeCEuPTI7Iz1Dizzo9Vc4
 X+l5LofRfhXM3Ss3YnAaJ8hKRps7GTGherF9NyjNlJxPgLtSfGZxO356uNM8GDaJ3R
 eSXfqNagdUap8n0ZMDsAb+FgNgBJath6att13grs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from frank-s9 ([217.61.158.217]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MZktZ-1kDtne0Bst-00WqYd; Sun, 02
 Aug 2020 06:42:53 +0200
Date: Sun, 02 Aug 2020 06:42:42 +0200
User-Agent: K-9 Mail for Android
In-Reply-To: <CAAOTY__7wCeTm0OY0P1VKZp-r7+d7yj=LLb79Nzr1pVVkOjy2g@mail.gmail.com>
References: <20200728111800.77641-1-frank-w@public-files.de>
 <20200728111800.77641-3-frank-w@public-files.de>
 <CAAOTY__7wCeTm0OY0P1VKZp-r7+d7yj=LLb79Nzr1pVVkOjy2g@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/5] drm/mediatek: fix boot up for 720 and 480 but 1080
To: linux-mediatek@lists.infradead.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>
From: Frank Wunderlich <frank-w@public-files.de>
Message-ID: <6F0FD8AA-A582-45FC-BE1A-06B3812B3DEF@public-files.de>
X-Provags-ID: V03:K1:KhyXaG0jr6aA9V5C1Ggsw1obPQoBRxRiw27abReqz2kmvby8piV
 XZKCGh/or/j/Foag7XjwnyyRKO19ZF9b107LB+efhVUVgTYdeJ1DxNySte2gVFUCZr7Amrq
 YGGUW1znGZm1ePEPxg5IckIDLjW5cTEyUw8lHSr7L23rkjrs1w/rU3971Pbve/bcMnqtDsl
 nSuvNyI6mQuC8pmvm51/A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:6zkFdkG3C1w=:YFu/WE8hNvMxT4W92HiV9M
 MsoH7pIA16iEvXu3SwTabPgz1iuQMaGnMxYvo4Qsfhfkf1lceBs18fFnAB4S8Tw9Q+yPknDSI
 2vfv/Sgj2KgTI6xdvXg+cYUX1v/LKZc93xHfvgFAwZYKKyMsV3O4AMNBFmhQafqAsVZxNuFov
 cCmE9AQkCLRaIAsB59NJxGe3eM6cop89Zym3c0+YlHbA77tBcY/rERQxyyS9FJbcqA6nzLviU
 9vl0IsbTseeY0I8+xg6h+5HNfxS2yFMY13f5cRAi/gW081SLvV0igKoZ7FoW+Q+qzhAKUR5Kk
 0jdd3lYJflpk9MMs8wTC1KuwYtGnqJQRuLN8vjAr/gWtBZ5JC5igx2HHK8xUxFsY4KD72hSOk
 W0XxwUkG6+pycf/iAhLNz5/DqTM76iCtekKNi7cTwuYF2p9VWpFpxeHdoUzLaa/J5rCR7C6mb
 6A0GdAWvn8baN35sOsaXwskpvc2qjePFEhLHhMWZeGWYl7OKNrZ83lfM94ZeZWz59JRKfagak
 8zbBZYJksyxZJNoZRoWqmmea880pZMUpWs3NDf8eMC/K08g2akMi2agRxUF8In5XUH6U/ayce
 e3dRG6gowkDm+gyrtLw43uPewPGOK0Nhi+UyDrCuvU3TLv20qCWQQeyFsaFo9u/9DDZNiITzs
 ppXyf89QClpfkPTfWDnIL17Xz7AeYGa+NuDNB+id60/VSXznMwofBBh8y+CP9XUWxCsiAMODp
 yT4rGQqdW9iGzOugV1esebXW282F/1ij5jLbOi2wmh2PYCM+ieLdTp5L9s3pmCK67YxwVtKVp
 uaMcEItvXUh+5DEQus3v/Ap0uwhrKTm78Y1TvvDU/KO5W5XLn7cxvih+ol67GkyPnH9yd1lKz
 wmON1hcsjZdh6EabSDb38TYKlZwmFHaLqDteYGbJl6yJdJH66P965EF0asmYsHJT6OgHe9ytd
 43nNNtDCE+zdpo8B4mXvoVaT4P9kz4SuGqY7hDBDYIhqttkdYp0GsWur2NPqAdzh8yPRVKIR+
 TP0Q1Vy9c4avz1KTWyoadCAyyvvxm1f/X5YZjd0XDidAXpNCVS9O9nk8psZFWsA7hoVR/bLEQ
 v4v9oksyMyBjLnK15bdxxf8ag8zMgjN3jLUVWE26yX9FmBXtPkxgIBSOaZsDB2oVbct2oEHfs
 sgk2gxKsf1oYD3YIe8lO9CQnjwOllQwKUInOxebjwg2WxtCJLBr+McC3WXQDUq413yaxKH8f9
 4PpOD2ZKiuOU9RInSrKiH0odgAtOuBAicAXgN/w==
X-Mailman-Approved-At: Mon, 03 Aug 2020 08:20:37 +0000
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
Cc: chunhui dai <chunhui.dai@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Am 2. August 2020 02:08:44 MESZ schrieb Chun-Kuang Hu <chunkuang.hu@kernel.org>:
>Hi, Frank:
>> - disable tmds on phy on mt2701
>> - support other resolutions like 1280x1024
>
>If this patch does two things, it should be broken into two patches.
As far as i see,it only disable tmds and so fix specific resolutions like the the one below.some other (like 1080p) does not have this Problem.

> I think every pll is default off, so you should turn on pll rather
> than disable tmds

Is disabling tmds wrong here? Which pll is needed here? What does tmds? I got only the Patches for testing....

>> without this Patch i see flickering on my TFT (1280x1024),
>> so i guess clock is wrong.

regards Frank
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
