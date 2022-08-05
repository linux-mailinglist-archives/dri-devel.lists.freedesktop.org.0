Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B14958AE5F
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 18:48:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CDDBB87C3;
	Fri,  5 Aug 2022 16:48:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE4D1B8801
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Aug 2022 16:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1659718077;
 bh=BwxgXFyMoX6LG4RcXS/FAfwlY+oHnVTND2orTGFFzTg=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=VY4XvpIbVvbOGQNhkoQViFXEx1DZaUvp6CDdqM9Z8ieXT/ri0Aas/wsOqzvzjYKhW
 wGWlmGB1bYJI1eR9QI4KDJ3aWyAg7Yxw6H7FN45lSVGBJ581oJ5446zPxHrRwFNSx9
 c9Hx+f3QACVCuV2XUQCsev9DWfiirimdssBJdcaw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.139.128]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MJVHU-1o08Bh2wEC-00JuGH; Fri, 05
 Aug 2022 18:47:57 +0200
Message-ID: <98c1755d-5b67-70f7-c569-431e650ece70@gmx.de>
Date: Fri, 5 Aug 2022 18:47:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/3] Fix bugs in *_set_par() caused by user input
Content-Language: en-US
To: Zheyu Ma <zheyuma97@gmail.com>, adaplas@gmail.com,
 santiago@crfreenet.org, akpm@linux-foundation.org
References: <20220804124125.3506755-1-zheyuma97@gmail.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20220804124125.3506755-1-zheyuma97@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:k9hWd321fIJId4w8JA+DmGPit3IfSkp0j0DDxrSaFTDDz5RI90+
 rgYRcegevBKruvpsas6YTNL7Sd/n5FS79ygEB8ZjRG1Irc6fe/UruUExSw6XHsBnIcjCFhE
 mNWteMGBNNBGslWubvmFTWBCXvw5wcK8Zb1F1A0QZWgrGN3s9QkBiQAZpxcmn1iz7E65bQT
 3i+DL97ehXko+KCj9jU0Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:flE13ZOQYvs=:2QDXygMtVdgKv5Y2vuUzR0
 M5KIRzzFTezbFLNsDpJQ5LG+juFdRUQgvBjsRGWPtRO5tkuWCV1vg82Sik9gsmFgl2EV8wJYf
 yxv0RYGeY1WZ+Z/puTueVm8i52U6XY5b816czI9oJqdfa5Kxe6TyXOid+nYtZhBGmQBZS7J2y
 6FYcbcZszrYilAwRCd41jM2/irzI6ahtpDj2Vk+6AVLFA3TyryTZwbZJx0qHEE6yUXeJgth6t
 CKEJCKLyZzk6pk8ZZTIAMAHORcVpoiP4ZtKRLxoMSfoqOEdITacEDsRudb7T8XqkmaXRnlqDs
 DcGnLFCXn5vqz5OVvSyTRpz7h5wq0bIy9n2hqx/U78qmSZf+ixIWct2roQbnd+aQJVZTwd5FE
 g88nuB1U9s5gRv9KRRqAsm/moGG4QGQbRPYB+LwxQNGNT7psUu8B0xX42IUz2BRiDa88+oTMF
 d3f1sMVMyOZiLuyG+jkf6GNXsCE7kflIlzTa/y7VJ+7fwIn/GlYhke2L1izcfqWu1S6+0uJc6
 VG7tW2i6z5b1C2uia0IW656WOleUh6UiBuM7hNKwgZqfQpv/mIlQ+joI3NEK11bV3ezv74XCL
 d4PrCa/BJ85hXp5ahUSl8qZtGGcvLz8RqkKOx23fSIdutWcGdGur3I0ED5c2XDmY3l6PtVhK/
 NtOk0Bse+3UnkCPQqTd5AW/s5kZBD4qB/HDjrPMosRtmwg8uPuSCXKw82yWa9p854y2G44NYH
 M/8RPpmlzneK//ZCxm9QgFKW3yK9KBQ7n/eswO029z5R65YZq9UeHyl2Yl/s1RU0vaVEaQGmX
 XgwfeBtqcvO2LBNzdS7yQFjXUy1jsUveUvMQPH3S81kfw03VGAHh5IXVOfsjP1t25kX1GEBYH
 zEmnwdbKHIFl6QzDGds40n/GYHCzAVlt2k82MT20zohKYSwMuCUbnIdoCEfcSFzvgks/VtAo+
 0fzzvznvlnqiBUPvMR5OOxPKvwRsajZpaQJQLM4vsN6jv7pgzzQxb86qyTU+QHp7QLU3/rUzf
 Y87R3BluQnWr4zfzxLlfOSukmkGMxZZZu64SYXGaV9kuX4BUOW5N5LwoaIRlTEetj74czxAPZ
 pZex8fmT9uFxIv00ASynq8Nws47fX20o8HUE1d8qYxeqvkvuJFWr8ifxQ==
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/4/22 14:41, Zheyu Ma wrote:
> In the function *_set_par(), the value of 'screen_size' is
> calculated by the user input. If the user provides the improper value,
> the value of 'screen_size' may larger than 'info->screen_size', which
> may cause a bug in the memset_io().
>
> Zheyu Ma (3):
>   video: fbdev: vt8623fb: Check the size of screen before memset_io()
>   video: fbdev: arkfb: Check the size of screen before memset_io()
>   video: fbdev: s3fb: Check the size of screen before memset_io()

applied all 3 patches to fbdev git tree.

Thanks!
Helge

>
>  drivers/video/fbdev/arkfb.c    | 2 ++
>  drivers/video/fbdev/s3fb.c     | 2 ++
>  drivers/video/fbdev/vt8623fb.c | 2 ++
>  3 files changed, 6 insertions(+)
>

