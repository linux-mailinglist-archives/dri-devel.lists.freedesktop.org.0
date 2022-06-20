Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B0F5518E6
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 14:30:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4975910E178;
	Mon, 20 Jun 2022 12:30:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9985710E178
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 12:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1655728210;
 bh=SZC9i4q3AjIEWvQPjldbgNfTeLSSyLLWj2cIL0ok6tE=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=ESxmXJBXF29ue2WM996LDEofYVL8qgdDy8Kc5KeQKJIVJpZuZAu1g6etkO1fkitNA
 gUtCki3E/brH7kYIlbt2xxK8dbct22dtXAWRESWoO2jsRVfbihNeCz62DxsanJnEnB
 8u++8ZHovS0/msTnUqifdL7NGcFo42dB/ibuV0kU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.174.149]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N5VDE-1nbGNE0UMk-016v4B; Mon, 20
 Jun 2022 14:30:10 +0200
Message-ID: <abd53f06-1347-8b85-1b73-53073eb76e51@gmx.de>
Date: Mon, 20 Jun 2022 14:29:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] fbdev: Fix syntax errors in comments
Content-Language: en-US
To: Xiang wangx <wangxiang@cdjrlc.com>
References: <20220605085913.11682-1-wangxiang@cdjrlc.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20220605085913.11682-1-wangxiang@cdjrlc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:NgguLeVq+BxBdHFUz6YBPO/hwxZVjad8WT7Ol47Nn/6wqQr+af8
 aKcSyrj0PLjMCghSVexAxbi8NH/0ExXjt1RMLigUfPrJ5nuET0KobGVPDQ4+xVBxunz9djX
 dbwZTpy8cpm5HQB2DsQt6HEz2G9G5wWF7TkKjp3x4x4iOeGHt3nfMFpgkqE86OQRgDo8CEi
 A10N4SuzBcOhldK/tA4XQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:f006Hje8nhE=:2SGZwaEvza7qPSflngyc0r
 VEMo+AFxVvA/9Bs/D8vYfZF3KhYVm+u7YfZvUayPniLd+Hq4QflCavtAj608fLilhsnmgoqAX
 7kWuteWH4bdDXSCPG53gLNyE7mt1JL7Qo+GHm7nY55U+3H4LXPMbWxUpfsxRBXw5egnk+nYbE
 HktGXtt+qCh51r4ah/D6rZjmjaHjr2yR6YMzaCzCkLAPL1+2WTEdwAGZqR7HHTOLRvpZY4xgT
 MC4/lUt7poFJCmBIWyc4yEK3Nx5nMzKV3uOsC5A8XGHKgfR+ysc1IfEEIHHVsG/TcCjtySkAv
 oBAsdWSZKnsUN8RT+syfqF3Y0ryxCzqWdO6Vat5+L2blxjeyyxbG16Kbi8fD9sZ2CNNw5RhWE
 IVohJz5bELlM2+Yv+L//mGsdJTna0Q6dyTsowpFfLuDHpllHozSrmWfpVaNrPD/2qWMPiIaE1
 8hDjT+Ez8uDotm1XUTxsVcHOL3Cf/L18T1Fe5McMuVoxy0dQlz9yd62MFHsKd5em75t2eWivP
 XJqbtXdZil4Yfx+4nCEeESF+P+3mADu14nZx8XPaP6aLyVUzpsnRan9bHYHsnEczRiSM9QDtX
 rtbZWzMAE0E9UNSlBXyGIZhCJtaC9eprAiLF93yXZwAJdCgBiElPOUyTF7YwRJqe0hrLupbV5
 uzGfsqW1jrWxaWteK3fSNBY7EHbzKcjfiB86zLTke8BHih8H4to1zPXDf7vuJ7tM2jTfa7nLG
 FFcDFgCQUBfqdxl7tZyD2S3P+xEDy9FkBmf8SQyYm4MSijSbD99yTR6w25tgkx7XN0bpOb2kX
 GlLetfNiXbvOrEKPS4/PLgv2Wk2PupRdlXOQdNQR1Tl0QEqDztkOBm/XulMHXfrKn/Sfb+5xz
 uQFNOKVZuiecqy46Z25onGDes5u0fnVT6cK4KyEsRMRsTdGJaU7ChO0tEWKa7jU8/86weoaPy
 hNthyWUWKM1sqzVOmM0AkfrgiyF/0NAUGut5W9xk9V06yu9d5BgkX4+NY4V2tfAQNRExassUM
 BXsb1cFMQkOyy2lr80TjtRdD8NjdL/SdHVRAOur4brU4OEIhs7KF9w73rMtRzkHWaG4512TTu
 6N9adN044+x9jg1tvpYBAaRdpsFBva42LZSgfZnQ59Puv5nLzOuGVdkpQ==
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/5/22 10:59, Xiang wangx wrote:
> Delete the redundant word 'its'.
>
> Signed-off-by: Xiang wangx <wangxiang@cdjrlc.com>

applied to fbdev tree.

Thanks!
Helge

> ---
>  drivers/video/fbdev/skeletonfb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/video/fbdev/skeletonfb.c b/drivers/video/fbdev/skel=
etonfb.c
> index bcacfb6934fa..3d4d78362ede 100644
> --- a/drivers/video/fbdev/skeletonfb.c
> +++ b/drivers/video/fbdev/skeletonfb.c
> @@ -96,7 +96,7 @@ static const struct fb_fix_screeninfo xxxfb_fix =3D {
>
>      /*
>       * 	Modern graphical hardware not only supports pipelines but some
> -     *  also support multiple monitors where each display can have its
> +     *  also support multiple monitors where each display can have
>       *  its own unique data. In this case each display could be
>       *  represented by a separate framebuffer device thus a separate
>       *  struct fb_info. Now the struct xxx_par represents the graphics

