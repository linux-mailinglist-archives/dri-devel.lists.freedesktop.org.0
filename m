Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A05B0580C3E
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 09:18:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 153A111B229;
	Tue, 26 Jul 2022 07:18:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 936A911B209
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 07:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1658819919;
 bh=ZPKphOeqfUw9WDoxNukLO0XgQuydZuPrmVSi1WhjzL0=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=I4GxEmbkCE75KR9vBC9vuzgAS7DnwJcFXtw4wbeLRpdzQM4cFd9CzOGbn82y/z5Sw
 ORuEcPu167u79eXuU42E7wQor8PHxf/kl+sB3+6FYsUfw3Luf0oRHnG6CqBOQqWi0I
 9fGuaFWYSCMg5vd8d2rLp8VBmMO6r+3qkC7A1Vqs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.186.181]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MeU4y-1nfnch1Et2-00aY10; Tue, 26
 Jul 2022 09:18:39 +0200
Message-ID: <954de293-cd67-2f79-0529-cf7682279ae4@gmx.de>
Date: Tue, 26 Jul 2022 09:17:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] video/fbdev/sis: fix typos in SiS_GetModeID()
Content-Language: en-US
To: Rustam Subkhankulov <subkhankulov@ispras.ru>,
 Thomas Winischhofer <thomas@winischhofer.net>
References: <20220718124344.46338-1-subkhankulov@ispras.ru>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20220718124344.46338-1-subkhankulov@ispras.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:P5mZADKMLRDWe3X4DmUtFoBv9opTumb0nFI36Uuvewk9/mngzVd
 Z/dJrhiSv1ZxtOtlsg/WRmvBg/rKy1cjRwdhZg4ttzxCD/c8Db5EUZvW4U+giGeJQ+BaePA
 kOdzkpAiCW5F2SR1m5gH5JVC1Fap1tvHBz4OV0mpKQm2FS4wZ4wqP29Kh6twEtthZEvtmcI
 n3QiYZgCikPaaQJawJMJA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:/Bf6EBdHyyE=:7AV0ibN9HDfgns0V0wMIDK
 XNOny6vfwYjaQn7SXLbxYVpy2lN1aNQZ7Or+9OVnHJ84oSzWUXgrGInhcyWvVMtfwZMaS3whT
 o0pybl1uYo9AcF0sLRwiCh1IG4Q+W5xPlNB1EQdwvBVnCix6kLuAKCBt1D0cii9/42rObWnsI
 E7jdZnPkawhxOj0LZFDz//cpIkRjCXFN2BN6lQC3Yx0onHjYvpgKZmri4j5RlQ/Jaa5k0OGbI
 5zEV4njXELZ1XbxMS/ZLtTUIIKA80AD4I/KCG0Ue906WZhumOkcbP5aktlOH0Po3+++6b/tAQ
 bPOBELuxg03Rw8HeAIZv7tBoEbrVH7A1ZYxarU+E+vsrg49cOtLTXTdrpIFeYAMzUFqGE61o3
 fq1sisKyRvjWYWgdtlMhQNxJ5iO3oiO8fIpwna8Tx5knQAqdswBaFO70u5psOr7t9sXEgfRNF
 lP4z9rA4o222XvnVRMhpcQRwQw0lgN9e7N/CweQ8WkkhIh8ymHZyoln5pqrwA0gtniPx9YoyW
 Uz23A5uZHIiKrxrDylxQpMpr+uUyCfi+AH5I2W0NX3ZSwvn0TPLaLwRNaQ6p9n27Jl2PoyYU1
 VJd29zGsZkcOQ13172Q86DqAXJCz1I4JkaG4h9wgce9tvy0qcAM2CCel6cClw/+EucthivnyJ
 ++vNVuRMP8iewYlSnpZHRJSfrFfNRJrHRetpQSD/jpNFNzb0VTinZibFa4OnMQtbsXvGOY2vf
 ByM8YJpBn6ruOBGDiA063KMfgymQxXnaRF9GqOZPzUIsQU074wVFIC0sE9W2UgSAfHXXAhjcT
 ekI53prxcNtZoMSjN9ZTBrXmVrIAeuwqZ3YhmGmHYknc3x35unWIrHZDgVMcRrzl+Gu6BbRWa
 oomeC2Wj5dLyE13Vw58LjhOoKEga7gqMZrSvR6BuGDlPk777UGuF9sJXmELEffIDJW4EGsYlh
 eAXYph4Kz0bjcsj5l9O9EG7vHSW69bB2vMBPNSZslCm2+bXJN7F4W5iOAU96Rv5F7qML060b4
 o0AMkCHa7lJ3rMR+JQrlpmujTd0+vaD+t7HFMpLfgV1PWGUzO6G0Qj0KwLjPykJFlFCoWPQB/
 PQwr5eXl4qxVGLhJht4hMz8ibqmBHY96o3C+Nd2G8Hfd1W1mUMbjucMIg==
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
Cc: Alexey Khoroshilov <khoroshilov@ispras.ru>, ldv-project@linuxtesting.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/18/22 14:43, Rustam Subkhankulov wrote:
> The second operand of a '&&' operator has no impact on expression
> result for cases 400 and 512 in SiS_GetModeID().
>
> Judging by the logic and the names of the variables, in both cases a
> typo was made.
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>
> Signed-off-by: Rustam Subkhankulov <subkhankulov@ispras.ru>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")

applied to fbdev git tree.

Thanks!
Helge


> ---
>  drivers/video/fbdev/sis/init.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/video/fbdev/sis/init.c b/drivers/video/fbdev/sis/in=
it.c
> index b568c646a76c..2ba91d62af92 100644
> --- a/drivers/video/fbdev/sis/init.c
> +++ b/drivers/video/fbdev/sis/init.c
> @@ -355,12 +355,12 @@ SiS_GetModeID(int VGAEngine, unsigned int VBFlags,=
 int HDisplay, int VDisplay,
>  		}
>  		break;
>  	case 400:
> -		if((!(VBFlags & CRT1_LCDA)) || ((LCDwidth >=3D 800) && (LCDwidth >=3D=
 600))) {
> +		if((!(VBFlags & CRT1_LCDA)) || ((LCDwidth >=3D 800) && (LCDheight >=
=3D 600))) {
>  			if(VDisplay =3D=3D 300) ModeIndex =3D ModeIndex_400x300[Depth];
>  		}
>  		break;
>  	case 512:
> -		if((!(VBFlags & CRT1_LCDA)) || ((LCDwidth >=3D 1024) && (LCDwidth >=
=3D 768))) {
> +		if((!(VBFlags & CRT1_LCDA)) || ((LCDwidth >=3D 1024) && (LCDheight >=
=3D 768))) {
>  			if(VDisplay =3D=3D 384) ModeIndex =3D ModeIndex_512x384[Depth];
>  		}
>  		break;

