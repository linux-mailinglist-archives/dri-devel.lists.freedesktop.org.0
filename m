Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D35C5523B9
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 20:18:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 516218905A;
	Mon, 20 Jun 2022 18:18:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 542CA10F28E
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 18:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1655749110;
 bh=nDybV39t6Bl2Ro8KUpVT1iVcktYwIEWjKEfFqm5iuzE=;
 h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
 b=dua/itfsyJR4VfJ6JC3yK7eKZyUATPZsQMHr4XcrrY4Xh7RPvLe/N0AYu1mfd5xw6
 piNmzoguBMBwcUsR3Cem7FfELjfelIDaJI/Ycj5GrVFYGHkMYZUi2mJMhBawoopBX3
 2p2QlsGiR2wAgH7VhvEeIuElbvjlp93L08IRXY/s=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.174.149]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MGQnP-1ntfj91gRJ-00Gt4g; Mon, 20
 Jun 2022 20:18:30 +0200
Message-ID: <6c572704-b39d-34cf-345f-9bd21a18be5b@gmx.de>
Date: Mon, 20 Jun 2022 20:18:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] video: fbdev: au1100fb: Check before some function not
 needed
Content-Language: en-US
To: Yihao Han <hanyihao@vivo.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20220608114658.37105-1-hanyihao@vivo.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20220608114658.37105-1-hanyihao@vivo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:T0HtqgGBU9PMtL1wyCaJaVllY7W3Te23wRGH4P80xKWO2e9DmIs
 rKNvATaut5ZAvA15JabqNo4LV3cpjzOR4C+PcZYvh4z5AJ66bFZvBjE+I0e65AfTJgzc3oj
 U6/i1fLJFDQ5W8/9ph84QbnK/R27xRrB+U6ORcRf2wJ4aEwTkCm8Kw/Y/Y5yuPIYciHnDPx
 rsNxLoovcieoJC291tXGA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:WhJrOly8xXA=:EJTzvpjHRGxf9y/PfX/OYX
 bItf/PbMzBg9TJTR3wcWdU/0RdgHCBfBL0BWBlRIZj9ZIXN4ia33UWQ9Q4svWCfpb0RLFvu0n
 JpmmCVeSooAsrG8T/ADmv0Y/tmV27YowJw9uohPw3DgoN66jfjouBnp/Ucd8mwLE6R+sAKH/i
 8u8Lcz6zTwTmxY50hDkr1FKvou/h5PX2jdK1cgN32kxnnWIV3PAKPj1i+GfSrCo1aSL9wJJah
 P2PCbmgrb26DYWdWf5m79JPTQrlrIMNNz6TBo4GZ1depgvUvQYYghsw1vN8XVM/gaYaGgBKmt
 Qf+nrp7LrEbh+CoRtlkgUvrsZuEB7cUSpCXHL2YvC/HTfCrLUdKxd6LER12PORUs3MZ36KYRN
 Y9lePxSv5vXBLuQDgMYpC4FRXsiIuGOsaU82VTYyED4Lsw3x8pBdkmkmzaDsISFww3x+z6A4Z
 TxTFuXGZWb33Bc74YFmRvNLpFC6L+tJKCrKsVLpjaHG5nO//FqmtUyFbDP72WNocqnwCPbh+S
 H5QcbsL3eP1wBw9GQ313/yGvbRQzUa9xVqyW/5g2XyIPjjpW5K6B5/wPuqOa8EPfSx78qEeuD
 WUij41E2uQAJaQO0JtHmkeotBMqce2JooOJKJqq0EgdQm/lKikp6SUxOd8ZF2AkzhI5EfSwRk
 5UL41kUydTaJksXKJq/MrPA7jGsL5QjaEjlWow7nIoNIEfMCmnZyQQ7ffYD9MSMeSk6sXPW5c
 IcWozPgZh80NHxhHIcEldBzjnKbCckzFvoeBgfhEpYP4AeJH4/cEtxrJX5inWKJSXSdZKHaCP
 iNx24ZEik5yMTvh61SdzFpgRJDfDGrTAtKHY4UkPF3UP3S+xPhtKdOCVYdVRv4ssRN/jSbUVR
 Sc84pnLaA9mktMkEdX8KLDJSGLEuUPZHXZFfdti2FTFyA07jOTN0Tmlldx/nJR2dRQVzH1x5I
 BgQJy0lE9o+hJ/I3WCx/V5uOYuy0aWT91jjK0s+7G1q6VH582iZaOk7n7zTU4UFbTUlDhait2
 5I2JvxqDI5x+ZaeczlU0v3/l1jsGffXUicPQpv7vcN1WMusudx7+BmM5ac9B8afMpmmFlQE1t
 y08Bs/gbBCJllusYZAq76fxlL4xkIIcCAkabTUL68I3RXY77MqCQQfPsg==
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

On 6/8/22 13:43, Yihao Han wrote:
> clk_disable() already checks the clk ptr using IS_ERR_OR_NULL(clk)
> and clk_enable() checks the clk ptr using !clk, so there is no
> need to check clk ptr again before calling them.
>
> Signed-off-by: Yihao Han <hanyihao@vivo.com>

applied to fbdev tree.

Thanks!
Helge

> ---
>  drivers/video/fbdev/au1100fb.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/video/fbdev/au1100fb.c b/drivers/video/fbdev/au1100=
fb.c
> index 52f731a61482..519313b8bb00 100644
> --- a/drivers/video/fbdev/au1100fb.c
> +++ b/drivers/video/fbdev/au1100fb.c
> @@ -560,8 +560,7 @@ int au1100fb_drv_suspend(struct platform_device *dev=
, pm_message_t state)
>  	/* Blank the LCD */
>  	au1100fb_fb_blank(VESA_POWERDOWN, &fbdev->info);
>
> -	if (fbdev->lcdclk)
> -		clk_disable(fbdev->lcdclk);
> +	clk_disable(fbdev->lcdclk);
>
>  	memcpy(&fbregs, fbdev->regs, sizeof(struct au1100fb_regs));
>
> @@ -577,8 +576,7 @@ int au1100fb_drv_resume(struct platform_device *dev)
>
>  	memcpy(fbdev->regs, &fbregs, sizeof(struct au1100fb_regs));
>
> -	if (fbdev->lcdclk)
> -		clk_enable(fbdev->lcdclk);
> +	clk_enable(fbdev->lcdclk);
>
>  	/* Unblank the LCD */
>  	au1100fb_fb_blank(VESA_NO_BLANKING, &fbdev->info);

