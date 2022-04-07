Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5764F883C
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 21:50:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8344510ECF3;
	Thu,  7 Apr 2022 19:50:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C873E10ECF9
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 19:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1649361045;
 bh=N6/FEyVpcVAz4B+dz6VLJs5njSr6wfG1FKLDFl/Zz78=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=B7n6TIwYu1+DHeTm1GOKoTSqRG7BNXJ08AfDv7yBwGMRBJ1k0F89222hSG71s3aNg
 er0OHo5kj1Fdsg47uo46MLzJYujcTWaY8Hlci7B+HYwhX9Q1vhOzu2NIIEW1VVR0ZA
 Lmb4FkKu9KCmSjyTiWg9sCAqAQdeJDCIrBdLVCEA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.161.122]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M2f9h-1nYRQ20Y2B-004BOi; Thu, 07
 Apr 2022 21:50:45 +0200
Message-ID: <eb2edc5a-afad-f0c9-012f-9b9f226d2e5a@gmx.de>
Date: Thu, 7 Apr 2022 21:49:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/7] video: fbdev: i740fb: Error out if 'pixclock' equals
 zero
Content-Language: en-US
To: Zheyu Ma <zheyuma97@gmail.com>
References: <20220404084723.79089-1-zheyuma97@gmail.com>
 <20220404084723.79089-2-zheyuma97@gmail.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20220404084723.79089-2-zheyuma97@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:XxvmZy8oYHEoPKTe6X2SYk0Pjr8XeAjoK1SV6d6GPPRKYzfl92j
 4mENiOhlREipIcFBpaEyuyq4T/upzS8fU2vT8q0RJJMgI4yc5/vQWvPaWZvMmu6Cm2xlZXy
 6nDRqB2J2mlNs05MzmcULprxcIGyOVwxdD4TnYt3q088BbkH56pExHZjsdgwhWzLlBCpYU4
 QIykXMIP/DCNAllnteMnQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:qdHYM8OnE48=:qEnD3vzrrt/xa8J/oGWqb2
 rjIuCiOSC74K14DfwC7cKIum8WcExtTdU9kP2n1qCm09xDVvRw0T4zxHJ9E++K7xjoosHTmI3
 TPvyYObhmBkKPqjWlNdrDKXoYf7x0h2xx3vRqCCI9aIFAzzrXGJtsLhmw5d+vzD5x/7TMmq1i
 fcVN4g1P48mkbqo393Fqf/G2+2m8McqCKIqDtFos1cZtNBzZwlYYmxro4/CGJKyOlZqDXT166
 nVc9tIYTxZRqvDAIyOL+VTj6CEBtHFiOvXhZGeu8uYY3Rjm71mSaXYj8gMAHDfzdyj7yEdm50
 DWGZ8DunOtsO1KGeE1TrBJzfh8MPFzr6vrS4YQZWDwRpRvHv58WwznqKMlkACRapZNVUx+zmM
 cakzhU3NlKUcNQueRmDdBL8DpwhvTa0QiWeYO+YCQl6GuRZBTkxv32/WaMIhWzpjvQUpICRdD
 Dut4LSsNDUjgnen63+TaT2PmZqXz9ZHWc0+Eoo2pdirB84bxM93MJNDfxJWmINmhLEShKoKgf
 lzWFcaeexaxXhANunWJjYLQEUJq6VXHp0AZTIbf2aVoaDoAb1a1CPuPtVU+O1bGysTTYWqmMn
 hJ6OagmGdfnSt0FMfGG2X0+WSf/XJ+FuBb64oGDS5w0Gl+TFpVQsXLWwKQDrv48PYdzl0CX87
 ATUL+lFU3Ptif+3szFz2S6gxgsdK1o8lwgMgAkrnbXB34hwm8Ikpf+vaheus4Hr3ckILY8WM0
 ITgc4lcS8Z2ZMXo1kYz0JgoFUONc/WJo+MZACs0zelFaYSY4zNwd3rYI0sVgki+JXeXdJbyjL
 /1VB9AzSA73r1/mi0wbixwE8lvuy2U2IB1dQwT1KVOoZ0dCYDw6BZXTQxptrjQNweTI2uwbK0
 zMMMiyA7BsDO7awekZvnwf1iT65CgrqFgNrPPK1/dBmzIVoHhcpTsj6jp4wovsYjBHo0s68DG
 KPnHMo9t3nBjR4CEPO+C5YDSrHSgPqwDXzevz+6ypLn7AgKGCd7VJXl/nXvHRuICOezUOdGaY
 Ragujj36VfajOtXd0xey1xA8j2t1kX94WtUM8d1Q9ABTl9MpTi2CZlm/P/fRtr/+5UPmjWgJR
 rgVq3PVjXQY+/A=
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

On 4/4/22 10:47, Zheyu Ma wrote:
> The userspace program could pass any values to the driver through
> ioctl() interface. If the driver doesn't check the value of 'pixclock',
> it may cause divide error.
>
> Fix this by checking whether 'pixclock' is zero in the function
> i740fb_check_var().
>
> The following log reveals it:
>
> divide error: 0000 [#1] PREEMPT SMP KASAN PTI
> RIP: 0010:i740fb_decode_var drivers/video/fbdev/i740fb.c:444 [inline]
> RIP: 0010:i740fb_set_par+0x272f/0x3bb0 drivers/video/fbdev/i740fb.c:739
> Call Trace:
>     fb_set_var+0x604/0xeb0 drivers/video/fbdev/core/fbmem.c:1036
>     do_fb_ioctl+0x234/0x670 drivers/video/fbdev/core/fbmem.c:1112
>     fb_ioctl+0xdd/0x130 drivers/video/fbdev/core/fbmem.c:1191
>     vfs_ioctl fs/ioctl.c:51 [inline]
>     __do_sys_ioctl fs/ioctl.c:874 [inline]
>
> Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>

Hello Zheyu,

I've applied the patches #2-#7 of this series, but left
out this specific patch (for now).
As discussed on the mailing list we can try to come up with a
better fix (to round up the pixclock when it's invalid).
If not, I will apply this one later.

Thanks!
Helge


> ---
>  drivers/video/fbdev/i740fb.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/video/fbdev/i740fb.c b/drivers/video/fbdev/i740fb.c
> index 52cce0db8bd3..b595437a5752 100644
> --- a/drivers/video/fbdev/i740fb.c
> +++ b/drivers/video/fbdev/i740fb.c
> @@ -657,6 +657,9 @@ static int i740fb_decode_var(const struct fb_var_scr=
eeninfo *var,
>
>  static int i740fb_check_var(struct fb_var_screeninfo *var, struct fb_in=
fo *info)
>  {
> +	if (!var->pixclock)
> +		return -EINVAL;
> +
>  	switch (var->bits_per_pixel) {
>  	case 8:
>  		var->red.offset	=3D var->green.offset =3D var->blue.offset =3D 0;

