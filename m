Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B71248DBF0
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 17:37:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27FA510E11D;
	Thu, 13 Jan 2022 16:37:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14B3610E11D
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 16:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1642091845;
 bh=yGltahdFA8voNhFKOM2y4nHCd9JPvoplrWag2WJYaGI=;
 h=X-UI-Sender-Class:Date:To:Cc:From:Subject;
 b=GH0pLxTUG/nEDu2CdmZIMKAEVvOvZLjPiFBeKW4RjdeI6wTxWsEkbZMC8OKf1nsbA
 3kVzGhKWFXsBmGdyNMaCMHdmEMl085oeg8YikNixzKnJ8ni6JJpt0zA+DUoRdadrEG
 vTxKLHH2sz9IA+XCKe/e9tzpp4G0So8LK068zg7U=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.168.79]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MwfWU-1mOSru3CNm-00yB3G; Thu, 13
 Jan 2022 17:37:24 +0100
Message-ID: <feea8303-2b83-fc36-972c-4fc8ad723bde@gmx.de>
Date: Thu, 13 Jan 2022 17:36:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: Hamza Mahfooz <someguy@effective-light.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Geert Uytterhoeven <geert@linux-m68k.org>
From: Helge Deller <deller@gmx.de>
Subject: Re: fbdev: Garbage collect fbdev scrolling acceleration
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:cc+w+B/M+wCv77nv/vrRsmWTJd6gJIA4q1SszD+FK29AhNXau+d
 nOk7unOChwYFZrcp9ozg+hzFVdon0Go6qcrjram2Pre3nRswc2oEMTotn9tiNvuyMtKYbW2
 r8O6MmHlDcsbvvfY0Yj2H9AV3sQDChAL5RnZcNABAvo/Mx0ohAy5dJrCimFPxJB2yNcJM8s
 wjxGUHbyl+LXA2xuTwrOQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ln9rN6HzNtA=:BV0hilbkS868qMf/FkNhVy
 T8B2/xTQq4avho+UuLPz08ZLcKxFJMXkgDvqljeUfsX6Ler0ac9n4WxnUQS/+CCoQ92MmUbmi
 d033fvqgyNJXd5eC6ziK57/u1PtvMfXqZ5uhF9uZq427imjDOuRxPZ6XK5dcyR/TY6bfbN0ZX
 tWuLUgA8DIuoPxu6piW6VwOWmDheMqBNYaf88NgFpfIR27bvr/Rwyy9vc8I8KIQMNganX8NuB
 Jxr6ZbTY/GwJjbPSbuZ7JHtmOl7CGOgnJ3Nk0d/4tDC+jfMqXcYH/tMxQJAcEMG5C7HjvlZLQ
 oHMPgCSUa04Ko/0PSXcCmtcRHct62fE8JPWY+nDnO1grmQmkIYawoxSrEKY5Sx0dzcEhXmU1L
 yI1zlY7Larmz+bgz6EVNDN6NvZ7TaoLa0z57qkBk0TD5uTnz4vj8+f0Wyose02iYFBmDgiBBb
 1i5LWnq0iCjELqP2lMnZncLlr3Q+hZ2DpI7nh6ehjylATMpPP3vcbss915K1MDu25NvBkXKlG
 XHZTKRmgBh3aKRYefECCIdUpDrzk0LM4VQ7Ikm7j81VqQ1vFzhda6D4YOAZPZGhEO6qE/pmMt
 6vavVt8w3+i4qe27rb+cQ8hY8z1lITswF4qua960657oVIVEzLUNikvbkmGMhUMrnv71iWZbY
 /vAIuu97ANHuVWNOtr/f3k2btakGh3cY9h1eAVBwXJqwgCMciS/TKRGNCG6iHZ0jW5Ty9TezF
 ZjGJXCBJl3Nybm5ty33pzMYOxXRBvrUMZFaH+6s4ie1ph2L03bFi4SPOn8u7Qfb35dhPye0u7
 hD4A3BdsQSaMH0NdxNDhW8yJQCayOXzFMIZ7vJs8iEd0qoW0pIksClvCEoBmxX79LnrmczuU7
 yJTV4WevNnhQChyTuo9nrbSwLX/Tn8iAim0joG70QYmIJxG/OUPn2RQMM7bnuLFnwL1vrsan3
 OUCuop2kkgkzMyZnJGN7lOgFDJsjCprCJz1t+SWtNT7B2g++TNXr3cS64itiHJRAtHlj2sIvk
 GrCljUEV4cDCjz4D/H0fAse77SOPhJzqf504OQTZIwFY8GpMlmCxFG6bwzqPCbumNOJ3mqaP5
 DUzAK3duDn1d2k=
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
Cc: Sven Schnelle <svens@stackframe.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I may have missed some discussions, but I'm objecting against this patch:

	b3ec8cdf457e5 ("fbdev: Garbage collect fbdev scrolling acceleration, part 1 (from TODO list)")

Can we please (partly) revert it and restore the scrolling behaviour,
where fbcon uses fb_copyarea() to copy the screen contents instead of
redrawing the whole screen?

I'm fine with dropping the ypan-functionality.

Maybe on fast new x86 boxes the performance difference isn't huge,
but for all old systems, or when emulated in qemu, this makes
a big difference.

Helge
