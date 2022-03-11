Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F8B4D5C52
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 08:31:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 735D610E16E;
	Fri, 11 Mar 2022 07:31:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E74E10E16E
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Mar 2022 07:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1646983906;
 bh=GQUZaq6GsSJojbgXCQh0Wb7X4eTeX57F0lrmek8KsaM=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=eGDnypdw4O6d+Pe1RbHYSha4zeahI2WCAcfBbJUdXWUzFD5Z1R35NdK+WCaID9pYm
 u3ZtAFyS2i/IzrMFARG4iMJegln0hJHkhXG47sesjQtDW5UHL13OHDDFOT2eROh6df
 y+iR76O+rK1YnDp6nkTidrYfnShMDjJepPeIF1ck=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.134.231]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MEm27-1nLdjF3EGx-00GGma; Fri, 11
 Mar 2022 08:31:46 +0100
Message-ID: <a8107fc3-2d89-eaa1-bde6-2d1e848147fd@gmx.de>
Date: Fri, 11 Mar 2022 08:30:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] video: fbdev: kyro: make read-only array ODValues static
 const
Content-Language: en-US
To: Colin Ian King <colin.i.king@gmail.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20220308202328.104043-1-colin.i.king@gmail.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20220308202328.104043-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:LV03ComVuUBR0jQamp6N+pGB6nOG8fFeSy/QHFJ67dkesRx7BQW
 gXkt+g309PmX0PAtl8P7vkPRKPZ1PKyZaz9Ii4Zlrf/lNpzWJO2E4eVHk4g0/PdfiX6aY4r
 i8b2gwNuxE2FcWOvmFzxj5AwOTo9H7EqSpKGctEGAogdMvPWIYHLM10dEESVHm86CCvK4Vl
 bZDwL5JJCx/rBXDNPaWHg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ux0xeDo+OFw=:6QIoOuFQiOxD7cagm8Ew+6
 oSVdr+CEduW41n8cUgg/0/DZxLd5Nq73K4hJDWNP46CV98cljF07s3CcGseb5lfHflKquaopR
 Cicfng+kUaVlzxJsbuZj86Xw0DE763LPUr+84ZMFoTfeFcqL+16yBIbFWGNAZWGbSgP5cnJ/V
 pzyUsRJ+TeLAjsWB37SiYf0Ht0Qfoqa6LmqAhuLB2esxhEVnLKQYvddBAokW/Y7iHBu8KGn++
 E1YZP25zCuGxnD2yfkq7/uahuz2Al5F2KTkl0UkI3v7KbPG+JfMRsgYV6u9owPhfcGYQHrKxS
 WdiFxgA5NamDPrF4H7UHXZjx7CMrRQt4DbyUOBjDIcsXr/zee3ibDKDsFFRfn4ooxFBFwt1D7
 tWP9aQmHDZ7A4nWIm3vVaN7hpBNIUuW2AYbglOGhnIQPo82gcGhfWQoxP/ibK3DHpI/ldxrzm
 uCQj51ThCQNTmL/lBASb6+qlcqgv0jPFOFfbt8eBGvDL4cAtGvSEBazru+Qh4kC6a+AiNjga+
 CrsZjPqgnzCpntXEk42bRZYp3ELx8+eR0YTX30DeTPw0wcIO4D0RhUCU9Y2A3gBbTBwGoAC5f
 7SefA9y6muV9yy/td+Gss9F1SBlx/zwcSj9KhbakmEgWYikkIPtqqCcSKQuCQu1jN4T74z/UD
 QGY4TsYEBHrcLt+Mq/1y3/uCbLMPqJNiKJKV2STBhMRiGL19Jm1JArh3HLN0K0HQ+dwNZnbWh
 u5qvXrzGVkS5cQ/AWFWhZBwbCXddKvFN8NoR4KaEUi7NLjAyCvVvCVOd0c3yP/ndbdUqM1xDB
 dBaheBmOdQyYcOrfx8in8Eo5isHZJlHTO+J3yOm+0O41wGYXgqP1hE1BYs5y41eWmJllvQ38J
 vdZBuSuNXGOLU5NUS19wqoE9vfGBAVMOP+C16V1+Vtq6W9ztJ/0HL5nb8KkGBSoKSVAkN0QoS
 +sPYOQPXnceAA9b9dROVhWawiYX0CaGZXQ39dWjU9LH9ZTGC895nUQMIbkJ6IAHTv6fV77OuQ
 4Mv+vY+4dAESqWLw7IP+pedoSr3/VfFz7IF+6K40HgCdkEWVOW8ULpVbEeGrsGsc25YNx9CDY
 lWyVqypDlI42mU=
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/8/22 21:23, Colin Ian King wrote:
> Don't populate the read-only array ODValues on the stack but
> instead make it static const. Also makes the object code a little
> smaller.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
>
> ---
>  drivers/video/fbdev/kyro/STG4000InitDevice.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/video/fbdev/kyro/STG4000InitDevice.c b/drivers/vide=
o/fbdev/kyro/STG4000InitDevice.c
> index 21875d3c2dc2..ffeb355c8b50 100644
> --- a/drivers/video/fbdev/kyro/STG4000InitDevice.c
> +++ b/drivers/video/fbdev/kyro/STG4000InitDevice.c
> @@ -124,7 +124,7 @@ u32 ProgramClock(u32 refClock,
>  	u32 ulScore, ulPhaseScore, ulVcoScore;
>  	u32 ulTmp =3D 0, ulVCO;
>  	u32 ulScaleClockReq, ulMinClock, ulMaxClock;
> -	u32 ODValues[] =3D { 1, 2, 0 };
> +	static const u32 ODValues[] =3D { 1, 2, 0 };

applied, but I made this:
	static const unsigned char

Thanks!
Helge

>
>  	/* Translate clock in Hz */
>  	coreClock *=3D 100;	/* in Hz */

