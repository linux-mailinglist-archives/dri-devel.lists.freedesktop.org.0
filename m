Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CE1571445
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 10:19:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61D2A9342E;
	Tue, 12 Jul 2022 08:19:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE36393428
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 08:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1657613970;
 bh=RZ/EJL3btc+F2hOcvq6PS/02fzcVymHrhmlsl8ctjeY=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=ZKKgHdk4YaFMgbMsNvVaXiLVHZksVveStccelbYwLSAO1e60A3khV/PVh8Fyic56X
 KSPUwZaRxPi0sQ4Sf4NJfzBa2Dq3rWeKxNuzDQP7FxyzXS/bKOHakYMaYeLaPQJ9F9
 xIMoioRu8swxC4Edn1/oCg67AVuoNgG4idDOwRFE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.185.115]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M4JmN-1oAu8J1HJh-000MJo; Tue, 12
 Jul 2022 10:19:30 +0200
Message-ID: <6e1095c7-5a7b-c71d-7d67-321214106126@gmx.de>
Date: Tue, 12 Jul 2022 10:18:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 00/10] video: fbdev: atari: Miscellaneous fixes and
 cleanups
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <cover.1657554353.git.geert@linux-m68k.org>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <cover.1657554353.git.geert@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:y6OTXSI/vDD0Tc+MGb9ohXJ9PmVo6065zAfD2JiW8O6WIvwH4b+
 qyV6iWgCcllYv3nDjW391uFKSwN/tSYAjMmG0DEyUgfMhp/mt8CcPUC32UsqUzmrI6NDW39
 ZjZ/YJXukVlZwLU1QQoZEjlhycryINuOzFlQD+1RIxgd8iSXwFw9iO+so/ZOoLJNdDNrIAk
 QTEiETWTcvvApQkisUssg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Gaa+xL1Kbec=:MZVxjw3JJRvAEL1HmzeYQF
 utKKkEXMIWs6985XNF4x510rfnNbKU8K9TGo9ckn4IMZnUadKi6nSOdTv/ZeZSMJQB1W46mM7
 +BL3IBgDiaVdLCtMHqwNDIDnktQVZYrELG5mbVx1XMw7lwe7vxZiW1Ag2cOIyL/it9VXSx3ua
 iXXM4iV1ZaSgAASszGPJaGZnoEGjbunL7nGouTxF66/NdjXMacDg/zpNnxKv8uf6hlk9Y9PSi
 XTVMxKq+JWHp9oIvcRjk0p5B2hHtsY/x6R7BBpHnYsvjegqRiVDOqxsxWlE65miJNwvNkHQlc
 ss97i/JIrtmQ14X2LBFl532JjhFy8LPS8qBEq/FzbKRFthdhzVxbNvYbrBaj6+p0yI8umhTrp
 Te/tEn7VrBqx5zy/k8DYALlKlRXzyeADo5W2EK/0B29aBmz4hw3lmk1HkjWlF/GqWF2Z6k1vH
 sQtkCLAFVeftwSQBi3bcm6BhMwta8jU8T5SO/3fH/mXeu/dBzyMrtg14w1M4BrSvYIbyH0Num
 vwbAhdagvvStKtrpkrwHI51jfWe2seSykqJYikkmSUgVGMQNtTI1uiCzzaigfIqMHaxxKCjdV
 8E+j5joAD3CDi7vjSFkHfDZ0KLVM+cQVmvmvzCkow6K6PkGtc+9vJH4GSuDpg5iJm829R3kPZ
 Fc6UE/g8Wfs8Dvd3t322tunBsVABi1oWKm3lbvpPvAADomTfqGIN7Emar0bFTQMgPKhb44ekN
 UdMnC2jeCe+XXJnrGmIXCNPgvg+vOmP1AhzMNTSzZPMLT/jSkZB4y3wtr/bl9GKPnsrT8Lh9z
 ZWZjnFQxnbIep8AJL+YGTaN+Q7RN8snv16uhieEMbVXVQSLEfdKfVyk/RI+9ER6/mhwcmrvmX
 z7nUN+5YKBEE9e4e9cTTH7lhrdm4D3m2Bcxk6dZIha6L4UdpWKM7HMw5YXUJVU1qJGiX9T2cz
 siEmGeZe8Wnl/IYuJrt0/zj2/S/6/JqLnpvcWfk/mcHvvz5ntig9ejp5zlc3yLRZfbYqaJmdk
 Yw/C+7hdm1N71OeCS2n8tP8/TOPMlFpTwcNvIsPkRdgrBDQo83kx1UF0hXWIERyXMOMRSyWYT
 9+uXkXiv/g8KAfP5XkEFClBFJgdRlQ0t7hQKTE8XOSn/GZX5TPZYSQxPA==
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
Cc: Michael Schmitz <schmitzmic@gmail.com>, linux-fbdev@vger.kernel.org,
 linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-m68k@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/11/22 17:50, Geert Uytterhoeven wrote:
> 	Hi all,
>
> This patch series contains miscellaneous fixes and cleanups for the
> Atari frame buffer device driver, which were identified while working on
> the Atari DRM driver.
>
> Most of them have been tested on ARAnyM, and should be safe to apply,

I've applied patches 1-9 to fbdev for-next git tree....

> except perhaps for the last one, which is marked RFC.

... and would like to see some thoughts/feedback from others on this one .=
..

Thanks,
Helge

>
> Thanks for your comments!
>
> Geert Uytterhoeven (10):
>   video: fbdev: atari: Simplify atafb_pan_display()
>   video: fbdev: atari: Remove bogus FB_VMODE_YWRAP flags
>   video: fbdev: atari: Fix inverse handling
>   video: fbdev: atari: Fix ext_setcolreg()
>   video: fbdev: atari: Remove unneeded casts from void *
>   video: fbdev: atari: Remove unneeded casts to void *
>   video: fbdev: atari: Fix TT High video mode vertical refresh
>   video: fbdev: atari: Fix VGA modes
>   video: fbdev: atari: Remove unused definitions and variables
>   [RFC] video: fbdev: atari: Remove backward bug-compatibility
>
>  Documentation/m68k/kernel-options.rst |   4 +-
>  drivers/video/fbdev/atafb.c           | 101 +++++++-------------------
>  2 files changed, 29 insertions(+), 76 deletions(-)
>

