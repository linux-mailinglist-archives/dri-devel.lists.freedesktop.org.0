Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B337F0574
	for <lists+dri-devel@lfdr.de>; Sun, 19 Nov 2023 11:35:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94B5910E1C6;
	Sun, 19 Nov 2023 10:35:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailbnc103.isp.belgacom.be (mailbnc103.isp.belgacom.be
 [195.238.20.237])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B48310E050;
 Sun, 19 Nov 2023 10:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=skynet.be; i=@skynet.be; q=dns/txt; s=rmail;
 t=1700390107; x=1731926107;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=DJSB/t5n5GGI/dxxXKi1qytRE/I+6LSfk1P93/eUnwQ=;
 b=d1s23VDmz4i3ICnpjuU3k5Ha274EGM3L5P+5xovW6EUPtqLrk4g1CJlI
 g19MAExznrxx7iDbIOoPkDWdHah+Ob2mAxb5fXCph0gLZeRKZelXjVqvR
 zpXnF6Ju0awmwyUGKL2p8zEuNab2/LxYB2bLgoM8wbu4oQKL4I/6vagK1 8=;
X-ExtLoop: 1
X-IPAS-Result: =?us-ascii?q?A2EXJwAY5Fll/1jN2D5agQkJg1eBIoFdA5RkAQEEBoE/g?=
 =?us-ascii?q?yiIR5A8gWqBag8BAQEBAQEBAQEJOQsEAQEDBIR/hysnOBMBAgQBAQEBAwIDA?=
 =?us-ascii?q?QEBAQEBAwEBAQUBAQEBAQEGAwEBAQKBGYUvOQ2CVYEkgR4BAQEBAQEBAQEBA?=
 =?us-ascii?q?QEdAg1+Pi4RSClOEhSCFFmCXhSrNoE0gQGzKYFiBoFIiA0BhVmEd32BEIh5E?=
 =?us-ascii?q?gESAWAOhXYEg2iFNwcygiKDUYFqSIwYf0dwGwMHA38PKwcEMCIGCRQtIwZRB?=
 =?us-ascii?q?CghCRMSPgSDMgqBAj8PDhGCPmE2GUiCWxUMNAQ1EXYQKgQUEwRtJW4bEh43E?=
 =?us-ascii?q?RIXDQMIdB0CESM8AwUDBDMKEg0LIQUUQgNFBh8qCwMCGgUDAwSBNgUNHgIQL?=
 =?us-ascii?q?CcDAxJNAhAUAzsDAwYDCzEDMFVEDFADbh82CTwPDB8CGx4NJyUCMkIDCQoFE?=
 =?us-ascii?q?gIWAyQJDQQ4EQkLKwMvBjoCIQNEHUADC209NQYOGwagL4JhgTaBCCJPIIECN?=
 =?us-ascii?q?wQnkwmccpRqhBeMAZUiM4QBjHOGPJJVmEAgimuBdGiabYF6UT5wTSAYGoJUA?=
 =?us-ascii?q?TNSGQ9WAZZVimZ1DywCBwsBAQMJiSKBQAEB?=
IronPort-PHdr: A9a23:JO8hQh1GYM3AfLXIsmDOSwIyDhhOgF0UFjAc5pdvsb9SaKPrp82kY
 BaPo6wx0BSQA83y0LFttan/i+PaZSQ4+5GPsXQPItRndiQuroEopTEmG9OPEkbhLfTnPGQQF
 cVGU0J5rTngaRAGUMnxaEfPrXKs8DUcBgvwNRZvJuTyB4Xek9m72/q99pHNYAhEniexbLx9I
 Rm5sAnct9QdjJd/JKo21hbGrXxEdvhMy29vOVydgQv36N2q/J5k/SRQuvYh+NBFXK7nYak2T
 qFWASo/PWwt68LlqRfMTQ2U5nsBSWoWiQZHAxLE7B7hQJj8tDbxu/dn1ymbOc32Sq00WSin4
 qx2RhLklDsLOjgk+2zRl8d+jr9UoAi5qhJxw4Dafp+YOud9cKzSYdwVWHFMXtpNWyFbHo+wc
 5cDA/QHMO1Fr4f9vVwOrR6mCAeqGePg1iJDiXDo0q0g0+QuCx/J3AM+ENIIrX/Zq9H1NKYJX
 uCr16TI1jbDbvNQ2Tjj9IjEaAsuru+VUL92bMHexlUhGRnfgVWMtYzqISmV1uIVvmWb4eRsS
 OKhh3IppQ1sojahxtsgh4rLi48U1F3J6Tt0zok1K9CmSkN1YcOpHZtNui2HKYd7XsMsT3xqt
 Ssm1rELv4OwciYNyJQi3RHfavqHfpCG4hLkT+aePCl3hHd/dLK4nRay/k6twfD/WMmsyFtHr
 zRJnsPSunwQ1hHf8NaLRud980u72juC1Abe4fxaLEAwiKrbMIIhzaAqlpQOsETCHzH5lV3qg
 KKQa04q4PKn6/79bbXjvpKcMoh0hRzgPak2gcy/BPg4MhAJX2iG5eSwzL3j8lP9QLVNlvA5i
 K3Zv4vEKsQBuq61GQtV3Zwl6xqnDjem1soXnWUfIV9EZh6LlZblN0zPLfziE/uzn1ShnC1oy
 v3FJrHhB4/CLnnHkLfvZ7Z97EtcxRI3zdBe/J1UFKoMIOnwWk7xstzXEAM5PxavzOn5ENl90
 JgRVnqVAqCFKKPSrUOI5uU3LuWReIMZoCz9JOQ95/7ykX85nkcQfKau3ZsNZ3C0B+lpLFuHY
 XXyhtcMCmMKvgslTOz2k12OSzFSa2y1X6Im6TE3EJimApvbRoCxnLyB2z+2H5JRZmBcBVCAC
 G3nd4OCW/cLdSKSJNNunSIfWLilSo8hzg2utBTgx7ppNOrb5DMXuo/929hu5O3TiRYy9SRuA
 8SayWGNQHl4nnkUSD8uwKB/vUt9x0+G0admmPxXD8Vf6O5XXQckLpPcy+16C8vuWgLaZNuJR
 kymTcu4Dj4sUN0x2NwOY1p6G9W6lBzD2DCqA7ANm7yRGJM06r7c32T2J8tl1nnGzqghg0A7T
 cRRK22pmKp/+hPXB47IiEWZi72qeb4S3C7X6miM03eBs19DUA5zTaXFWmgfalHRrdTj6UPOV
 6WuBqg/Mgtd1c6CLbNHa9PzglRGQPfsItLebH+ol2itGxmI2K2DbI7xdmUZ3SXdE1QEkxsJ8
 XaILwgxGDmurH/AAzx1FlLvf0Ts8fFkpHO8VE80wFLCU0o0x72v9VsZiOKRT9sX36kYo2Ex7
 TJuExL1z9XMBJ+JoQxmYaNXbPs54UxbziTXrQFwMpG7LLxlnhgZaQsz90bjzBwyBoheucwrt
 28xigRoJK+U3UhCazSAm5fqNfmfJnPzuRyidaPS8lXfy8qNvKkV5fk0pk7goAaxUE04/DEvz
 NBE13Ka6tDGARQfVbr1U10r7F50vbzXbiQm5J/TzTtrK6bw+jvD3c85Qe4oxhepV8lQPbnCF
 wLoFcAeQc+0J6hilV+yYh8BFORT77Ivec2hbPeL3eisJukzsiihiDFj/Ys17E+W9yNxRePOl
 8IBwvuG9hCERjHxkBGrv5akysh/eTgOEz/nmmDfD4lLa/gqFbs=
IronPort-Data: A9a23:aWBpLaKZ8UzGwWZWFE+RspUlxSXFcZb7ZxGr2PjKsXjdYENShTwPz
 TMeDT/QMq2IZjfyc90jOom/9RhUupTRxoU1TFdorCE8RH9jl5HIVI+TRqvS04N+DSFioGZPt
 Zh2hgzodZ1sJpPkjk7xdOKn9xGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYHR7zil5
 5Wq/6UzBHf/g2QvaztNuvrawP9SlK2aVA0w7wRWic9j4Qe2e0k9VPo3Oay3Jn3kdYhYdsbSq
 zHrlezREsvxpn/BO/v9+lrJWhRiro36ZGBivkFrt52K2XCukARrjPlka6BFNy+7vB3S9zx54
 I0lWZVd0m7FNIWU8AgWe0Ew/y2TocSqUVIISJSymZX78qHIT5fj6+VDAEsmBIZfw+ZUBCIV/
 uUeDy4NXw/W0opawJrjIgVtrs0nJsTxIMUbs3cIITPxU6xgG8mdBf+SuJkIjF/chegXdRraT
 84YYyRHdxfRZRBTfF0aYH47tL723ySnKGYE+Tp5o4IK3kiLnCF7/YPgatXWWMWYW/gMg1yx8
 zeuE2PRR0ty2Mak4SqC6H3piuLRkCfTXIMJCKb+5rhtmlL77nwUEhJTXF29puS/gUOWX9NEN
 1dS9DAjoKQ/70+3ScG7WAe3yFaBswUVHtZdDcU+6RqR0eza+QuUCmUfTSJGcJohrsBebTAw1
 xqFks3kARRrsaaJUjST7LqZoT6pOjQSNSkFfyBsZRQM8t3qpo12gh/RQ9JLFK+uksazFyv9z
 jyHtysigK1VitQEv42//Fbak3epq5TIRyYr6QjNGGGo9AV0YMiifYPAwVfB5O5ALY2CC1WMo
 mIDnM3b6ekIBJ6AjgSDR/4BEbTv4OyKWBXZgFVvEp0s8j2353mlcKhN+zxkPwFyNdsecjLnZ
 1XctEVX6YM7FHCta7N+aJ6ZE8Et16XpCJLiTP+8RtNUb5tZdA6D8TsoaFP44oz2uEEijbt6Z
 83eK5/ySCxCVOE3nHy6VuEU1L4ggCU4yH+WQpb/zhKql7aTDJKIdYo43JK1RrhRxMu5TM/9q
 r6z6+PiJ95jvCESr8UZHUP/7bzHEJTjOa3Llg==
IronPort-HdrOrdr: A9a23:/9tLtasMSPVtgvaDavp9l3dH7skDbdV00zEX/kB9WHVpmwKj+P
 xGuM5rtyMc6QxhO03I9urrBEDtex7hHP1OgbX5X43CYOCOggLBR72KhrGN/9SPIUHDytI=
X-Talos-CUID: 9a23:y1vtUWHZOrD+hcDHqmJ32UIeCvkuNUTd73KTeEShD0F3SIyKHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AnUJ2kA5jO+u0yK6nq+zn7hwhxoxV3oT2WG0HvK4?=
 =?us-ascii?q?L4caHFzViJQrEkS6eF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-ProximusIPWarmup: true
Received: from aftr-62-216-205-88.dynamic.mnet-online.de (HELO albert.lan)
 ([62.216.205.88])
 by relay.proximus.be with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2023 11:35:01 +0100
Received: from libv by albert.lan with local (Exim 4.94.2)
 (envelope-from <libv@skynet.be>)
 id 1r4f8m-000GoA-0F; Sun, 19 Nov 2023 11:35:00 +0100
Date: Sun, 19 Nov 2023 11:34:59 +0100
From: Luc Verhaegen <libv@skynet.be>
To: xorg-devel@lists.x.org, xorg-announce@lists.freedesktop.org,
 mesa-dev@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 fosdem@lists.fosdem.org
Subject: FOSDEM graphics DevRoom CFP
Message-ID: <ZVnk04V+A+ft3van@skynet.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: graphics-devroom-manager@fosdem.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

At FOSDEM on Sunday the 4th of February, there will the 15th Graphics 
DevRoom.

URL: https://fosdem.org/2024/

The talk topics of the graphics devroom encompass:
* graphics drivers: display, 2d engines, 3d engines, at bootloader, 
  kernel and userspace levels.
* media drivers: camera/capture engines, hardware media encoders and 
  decoders on all levels.
* input drivers for bootloaders, kernels and userspace on all levels.
* windowing systems (X, wayland, others) and window managers.
* graphics toolkits (QT, GTK, others).
* 3D and Compute APIs (OpenGL, Vulkan, DirectX, others), and 3d and game 
  engines.
* Virtual reality hardware and toolkits.
* Artificial Intelligence HW acceleration.
* Media encode and decode applications.
And the tools needed to help configure and run the above.

Like with so many DevRooms, we got a surprise half a day only, so there 
will have to be 8 slots of 20 minutes (with 5 minutes of setup, and 5 
mins of Q&A) on half an hour boundaries.

Submission deadline is the 10th of december, but do not count on this 
date, once the schedule has filled with enough solid talks, we will 
accept no more.

You can submit your talk here: https://fosdem.org/submit

FOSDEM has moved away from the clunky but known quantity that was 
Pentabarf to pretalx. Accounts from Pentabarf are no longer valid, and 
you will have to create a new account.

Please put some time and effort in the title and at least abstract. 
FOSDEM is a massive and thoroughly organized event, which produces a 
printed scheduled booklet every time, and many thousand copies will be 
in the hands of many thousand visitors.

Since this an open source community event, please refrain from turning 
in a talk that is a pure corporate or product commercial. Also, this is 
a highly technical devroom on a conference aimed at developers and 
advanced users, so please only submit talks on a subject you actually 
worked on.

If you are unsure on whether you can come or not, perhaps you are unsure 
about corporate sponsorship of your travels (this is FOSDEM, why are you 
not there anyway?), wait with submitting your talk until you are certain 
that you can be present.

All talks will be recorded and made available as CC-By-Sa or CC-By. The 
FOSDEM CoC will have to be agreed as well 
(https://fosdem.org/2024/practical/conduct/)

If there are any issues, just email graphics-devroom-manager@fosdem.org, 
where you can reach the team of graphics devroom managers, Pierre 
Moreau, Arek Hiler, Martin Roukala, and myself, who will also schedule 
and review your talk submissions.

We will be keeping a keen eye on submissions and scheduling, and hope to 
see you all at FOSDEM.

Thanks!

Luc Verhaegen.
