Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BAF7E8B6C
	for <lists+dri-devel@lfdr.de>; Sat, 11 Nov 2023 16:50:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A97210E0D6;
	Sat, 11 Nov 2023 15:50:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A296410E291
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 15:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1699717804; x=1700322604; i=deller@gmx.de;
 bh=veRcHHpWj+l9vHRilP7Ovc3nHrYQukMijyL68uKivQI=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
 In-Reply-To;
 b=lnFQS+tCOHN4FP1o6NCC17dXt6fhAGUkoePkfKtpf29Fh4Sk6TKCdCZDIwgX4d7y
 tdueRl9G5yXZBIw3sVXTkSt2VyBuyhTvDi7b0rRwTvnN8xCzUpohm1z2l1lVsKoxu
 hPJAxggkKON/SFhWwf30ZiYchYPt7JLU3ilBxf8oQiP5j9g15DzSK4w7Ml+Bbf5IK
 keC+p7H1p7f8sXc588oy8wkqI6ygTMC5cGOMkH3Ko1HIRL7LPQHFcenSWDCmuUSbs
 bvIYxX3t+H0RZWYUsshQQP0gdB6ka7jMKgtw910Q0Wrz5pigYnG+9OnZzaQhZL92t
 ho17ZFuvwH8bjj6GWQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.146.111]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MpUYu-1rknR21hL2-00psaS; Sat, 11
 Nov 2023 16:50:04 +0100
Message-ID: <8e87a68f-fb7d-42ed-b795-b323ce11d927@gmx.de>
Date: Sat, 11 Nov 2023 16:50:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] Fix left margin setup and code cleanup
Content-Language: en-US
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-kernel@vger.kernel.org
References: <20231111104225.136512-1-dario.binacchi@amarulasolutions.com>
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20231111104225.136512-1-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qawBQBXsCPSgx25EFgVxaigFuFnOp6u60peFFHXXoog7RCepfaR
 kp9YpHkocE+63DxlMl7pMsJoA6AX+FHvVXjV15PMu6P+jFwT1ECb+pkowhI1MEuFywrinvF
 /NhmqAysYoW9aZd9gN8lsv57A59vLd9SzOEuF48za/Px2U7pCZL+TAvsgsmGR07L4FFL0Bo
 xSg33sGo1tWzqYBRIujBQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:cH7ylQgaAGk=;VHAzHwk8fES3qjPTEYn/3Iel51y
 IKBjwUXQFm7HsFbHz7fXImecvtRwBG0c/bo0u5bbxFXHUx3KsTV+PnyhCdTnxqZTQD7qwG1bS
 2jjVXsxF5j/Pc5Wjfmtfx2LjPl4dJbAQ2UyouVMqWTMMbne416GAueh0A8OI/rjBJbM9p1RMk
 CwMuwpBQ34qLrR/u2OimImgX45zNOaWIpD53jTdNlRPRUd93pa9Id912kO4v2ytAoeOn7Yeyq
 cwF6dWq/UaUUlpMDaF+obtKZE9fmL2whz0Lg8u0oe9oKWO2xQnGxV9U66wfYuknARbo6umjlH
 Oq0HM9ZFoyEbtr5FRLwBgIEWF0u3FgWjvo/O1eR6Cic1tnK6EfcdykTZ/34bpnUSCEEQZCUKY
 Cvr4pL8iYZRUlwC9xKMR8okq0aMEx8Y9PLujCQYlRuV5tXkbOsOswU6BMx+BRDwY0mi9IDses
 rigpMKnjxNcQDO9MLh5HKOgPJq8oiXGIVmg5S54C+U+1dOX0xDX1r6YB1+3Uq3D8Pwpr/VhLE
 hd4qM48lvWvYrEt4ybcsTZjGbASEIwFpu2vAagNCfsDMUyA+GXAm0zDjyuxAlC8dWlO4xt+vH
 WP04zHKxV1A2ymUF551HgMjQ3CmHtmhkIrP/xN8edMOYnlZTxI6nEdLEvavqeKqjRc6NFcalo
 eABEE4FMMSSWHSQW6Y9alKU0f88fVJ//B4rUYoRe7TlTnziIxp1dEgPQRk9EsAO0MQzuMDCqz
 7PCIWGc0AHo9oFQDnehVInpotvbGwhwWOOZshGxLwFR7a6G6Njru34zlBGOtazCrcJ/Oe5peV
 ZpzMp1s0wpFZQK9gFNehgzpPAhV6FGVOyhCl6yZKA0ga65IugVf/mTX/sNewEsS9NQFNT1Oib
 FN6mCxYy2ibJCIVtT0iJwtLTgJgli/XLo2wxVEMvzgVV3zzyp0d38CN/2X4knjpKXDQBmpYQu
 uQXIAChhgeACojJDCpO5TO3/5FE=
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
Cc: linux-fbdev@vger.kernel.org, linux-amarula@amarulasolutions.com,
 Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Martin Kaiser <martin@kaiser.cx>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/11/23 11:41, Dario Binacchi wrote:
> This series was created with the intention of fixing the left margin
> setting. At the same time, I made some changes with the aim of making
> the code more readable, as well as removing the errors/warnings
> reported by checkpatch.

applied to fbdev for-next git tree.

Thanks!
Helge


>
> Dario Binacchi (10):
>    fbdev: imxfb: fix left margin setting
>    fbdev: imxfb: move PCR bitfields near their offset
>    fbdev: imxfb: use BIT, FIELD_{GET,PREP} and GENMASK macros
>    fbdev: imxfb: replace some magic numbers with constants
>    fbdev: imxfb: add missing SPDX tag
>    fbdev: imxfb: drop ftrace-like logging
>    fbdev: imxfb: add missing spaces after ','
>    fbdev: imxfb: Fix style warnings relating to printk()
>    fbdev: imxfb: use __func__ for function name
>    fbdev: imxfb: add '*/' on a separate line in block comment
>
>   drivers/video/fbdev/imxfb.c | 179 ++++++++++++++++++++----------------
>   1 file changed, 102 insertions(+), 77 deletions(-)
>

