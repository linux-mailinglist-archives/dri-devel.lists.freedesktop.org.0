Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0978C533C84
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 14:18:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EDCF10E9EB;
	Wed, 25 May 2022 12:18:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61FB910E9EB
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 12:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1653481072;
 bh=Vbm1SuMqsvu1xxnR71QHy05C7RZ8+ByUzJkNcUNCG2k=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=GDYRz4IFhZeVP1/SPpAim6g7Hj3ghkhZpboJyS3GLTb148pOf3n1n67EDxA9CYg9U
 P66YfR8/H8LRZNcPT0Oevh3SpjxdIqrRHtTfoCYjr+LisaHOG/ksKMJD1RGdI3yWoO
 HEZtDETxq2q0AbExORS22kxPNk+Fz2Of2XBwSq54=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.168.145]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MulqD-1ncAW43rT1-00rmvB; Wed, 25
 May 2022 14:17:52 +0200
Message-ID: <10ce14c0-f502-4c26-3f7a-8f470822e6f3@gmx.de>
Date: Wed, 25 May 2022 14:17:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] xen: remove setting of 'transp' parameter
Content-Language: en-US
To: Tom Rix <trix@redhat.com>, tzimmermann@suse.de, javierm@redhat.com,
 boris.ostrovsky@oracle.com, jgross@suse.com
References: <20220521195942.645048-1-trix@redhat.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20220521195942.645048-1-trix@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:mlFct5aFdpB21j52ArLdUq5BZfKowCmBVVSbPpzviDYy2hrRcW4
 vGyxCxF2WUhgakMM4uEpHs4e0x+fk40WnTG+BYLKGRO3TEzp9dGbDu52oFl76W9ly65wgDW
 1iYVg+KrloxB/SpdLAaJXGyCYNlq1GsOSdEWKvuPlcr/xfq9r2h4AhK4yUKHXMDyocVbOwJ
 Rmuk978py+loL3+KkzBdw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:yDBz1vJ8Z2k=:LCNTO4XQUvlPm9I4w3/04S
 8EHOqTys/m5GMDzYtAzFiMkknT9GlXtJQsbKamEQixlfAxaRIGK0PyL3SWDFkvt50clHs1Nj3
 TRrwy5CUlEfOxcP38Iq9ZsWa6DbBfv6CqHgB2OAN/5AmoSaLFzExtN3U1WGhuQ/RvUqT6zpzj
 bqHF82hbAhCCOkdgrP+EGg04HjwU3D8ZlYFRPP5n2ak2aRfHdXJN6LKN3EGETywvqZsPe4oBE
 r6zboPwoAjjkSYkul0DyWuKAcNioCa5j9+MYnPCxM/BhMwAFG7W+MAMs0wgGoQrNpo4Lw+Mqm
 LtFX2EwtPgsQoObWjk/BuzeLH461BtxthiEqFwEW9AvwljQmEialWsRX4/6ojfHGetw1DiqgY
 GuySmSwIw7G2hwyWaLsW/zy/97D+7s4o+uCJNoLAorY87cKiiIiMSiwiNQ3JJUARVQ4hCQnG3
 70Bh2kFN4ZrOM8PfoF0GBxdck+qzeg36n+qzsRjNgb/L1/4t2K1eNi2Gi7ndoGgBBh0+EMKsP
 CkKoM1DKZekXDHLgaycJOwV1Pu07DjKl84mTQWA3dhGfr5fvkJEvZwmlHfQMWp72cpow7eU9a
 +6XFupX9BObwmce8MuoXBdoPOu7v1HAdxWT64clc+0+e3RNnf2MZipmtWsab0UTfZgeJWoZhH
 D2f0ozQD6ew2SlR6CoOZ5eXKSA0ybUtowcX+S3tqgfDfU3BIuK9/2+AUoDVJ+07LLI9FFf/pS
 mvw+ylVRWRnO6VUVUZAz3Kmpb4FcsviEuXz32W9uB/pfVFOzdHwNRIX4Ari5ta2YkkJLHQX+A
 eLzvqjGBVm7O7pi61ub/YrB23KHLDITyDRieTjneH9Wkw8Wd7G5zyMojjpQL6gsJBWE169cSe
 SnaTLChTFFlHs9uS4nMHixWSdcn6HORGrst8A7zLhfQeu31PAI9tMfP1q+L2FPB6+aqQW9SfK
 nKULIJexj1dtWuDxV/DcWSky5lzeduRbkbm0FGxd9HPvufAT+ElDw6weuOriRKgGS+hKgDqmf
 MWA9eRfsgPXWrBXcVxl9MPswaAI1SW0E6qa6OrCfjWRIm3PhWoSbrgAnEUetY3Ms7GG6brb3z
 rf0DmXZD0zqn44yboe1VkUd9xLQd2q7S+5tSnG5GRooTK4WmsrcRrY2BQ==
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

On 5/21/22 21:59, Tom Rix wrote:
> cppcheck reports
> [drivers/video/fbdev/xen-fbfront.c:226]: (style) Assignment of function =
parameter has no effect outside the function.
>
> The value parameter 'transp' is not used, so setting it can be removed.
>
> Signed-off-by: Tom Rix <trix@redhat.com>

applied to the fbdev tree.
Thanks!
Helge

> ---
>  drivers/video/fbdev/xen-fbfront.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/video/fbdev/xen-fbfront.c b/drivers/video/fbdev/xen=
-fbfront.c
> index 3bed357a9870..4d2694d904aa 100644
> --- a/drivers/video/fbdev/xen-fbfront.c
> +++ b/drivers/video/fbdev/xen-fbfront.c
> @@ -223,7 +223,6 @@ static int xenfb_setcolreg(unsigned regno, unsigned =
red, unsigned green,
>  	red =3D CNVT_TOHW(red, info->var.red.length);
>  	green =3D CNVT_TOHW(green, info->var.green.length);
>  	blue =3D CNVT_TOHW(blue, info->var.blue.length);
> -	transp =3D CNVT_TOHW(transp, info->var.transp.length);
>  #undef CNVT_TOHW
>
>  	v =3D (red << info->var.red.offset) |

