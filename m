Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8618D90CB17
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 14:07:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50C4810E0EE;
	Tue, 18 Jun 2024 12:07:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="tqP0i+xZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 312 seconds by postgrey-1.36 at gabe;
 Tue, 18 Jun 2024 12:07:45 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFDDB10E0EE
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 12:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1718712464; x=1719317264; i=deller@gmx.de;
 bh=KazL8lPyZjhl9SQQly3zXXFrIFGEDfdAjzeR5tlpaJk=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=tqP0i+xZSPQqxjvwNxzLOAIt0d5QyVrxe0dt4YLJKwtB0fI0AxA0++VAqSz8rcNU
 ECZMUgFbnANoiBw95cSGxIuDFHZ7hB36d5dKuxRiPOFFVaw1RtjQRUPLEpIQbLnPK
 QbAIaenN1tUhvWHH6WzbFRZkNbNsFXp1xpvXkByNXto8Bgxb9syZvsBn/JnPN5ip5
 9tLw4EZaAivTv7leMdlVAm+sF67lmzVJZzQq4VSD21Kr0zzQ9B191XFGXWzy+jM0z
 WEVy/VaG8B4i2qEeyB++LlM70Iii9QPSMRHhhPqj5fh634w9C0b9ZY93KSZyoLL7h
 Y/6F1JdaHQCnqxec5g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [10.8.0.6] ([78.94.87.245]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mn2W5-1slPS008AR-00hJdM; Tue, 18
 Jun 2024 14:02:27 +0200
Message-ID: <edf45156-4ce4-4ab1-a3b8-32d1628feb66@gmx.de>
Date: Tue, 18 Jun 2024 14:02:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: amifb: add missing MODULE_DESCRIPTION() macro
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20240617-md-m68k-drivers-video-fbdev-amifb-v1-1-85f74746ecd4@quicinc.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20240617-md-m68k-drivers-video-fbdev-amifb-v1-1-85f74746ecd4@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:nzU49krb0P0srJ9sw/bU4rEepCemcESpPIGap0VolZSYs0A5kns
 ITa1oudBheWDHYSOTYWouEQ76Pr0A7Ql24A5LY2lo/QSLhb2lmqjmFVBB9/g2D+yyJD2x2Q
 K+oocN03dL3OqfAoX6baAMKe+glAgES6csWq9NWiwWX/nozz4j2Jc6+J1muBRd2/x6MM5hQ
 r7LFf8WTUd8EhtjI30IBw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:W1P8Z+qjTTQ=;VZoj/GFbPQCIqjX0ahMz4ULXnqz
 3V1R4k4JHfq0S6ISBowJTxoBR0yCc7u2prKf+A55eEPz8irFrc7FEMwMhrggv5dNK9QyYkmzC
 sUNlhr3L2Kj21Mluvbj52aorEQXjSH1aa0VPXzmzynYDy0voYX33GPEc++mLj2SHRP2RHjnVS
 VlHdoXxRRyENA9j8l6DOcQzQ7LWeF++UkpVU5+mrQ8SG5oyVFaAVWmDrulMNMxbV3gM3Uqw5I
 vj/xeBpglR3pJK06bkgY0tI6vdmRYaegO1I6I4R0OGiCnU+Kp+5ygSOqRVzTnC4vnkFx9SYnu
 hYdqOMIHezU+htm/g9uSqiWozHuI5Yi3N92JKHJh/Beg6CmY6tjrom02IpEuSnkYOYi0ML2iY
 NqZQUAdXwvgufjyxvZD6CEKsZ34OIl7EiiN2OFs2SMMoMvt9yy9tU0rF5+aYD/8NabxZh/UvA
 knbE3AwOKmb6EpS0akieWnL6DSH8Qw2y67iKqc3z5+sEBk57LPeEB5ryNTU33Xs7pYAxN7WOb
 NBJ8cuhjGQ4YQr4RuYXXuIPvDFBK4qYWlu4ypN0mhQmuNlawF8yf87RMf2m/atknwg4XFuDjx
 Tf+Hqc+FO5SCyfUjUPlpSx5eNH6e+taYx3aLtObksZWxcR0VdbyAUqN5TAJaXm46HvM6baLDP
 8n0JLAVJc02Qr1odkKBPK0Q2/VYSApPtJ7+lMkDrjJIzz35cL+AHPPLMBAeIDgDj/PxCKs0pl
 dR4524CAsZge2gKAqxL+u+Fv9WHfRfdHS0oIbhOf78H8Zj6cTW/JXJIe1mBBOKbYZpKfY1pAV
 YHQlZZi5snDdgE7pXrLAGBPe7lSVaiJtoPLrMC7pk2stU=
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

On 6/18/24 05:14, Jeff Johnson wrote:
> With ARCH=3Dm68k, make allmodconfig && make W=3D1 C=3D1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/video/fbdev/am=
ifb.o
>
> Add the missing invocation of the MODULE_DESCRIPTION() macro.
>
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

both patches applied.

Thanks!
Helge

> ---
>   drivers/video/fbdev/amifb.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/video/fbdev/amifb.c b/drivers/video/fbdev/amifb.c
> index 305f396c764c..132638240521 100644
> --- a/drivers/video/fbdev/amifb.c
> +++ b/drivers/video/fbdev/amifb.c
> @@ -3782,5 +3782,6 @@ static struct platform_driver amifb_driver __refda=
ta =3D {
>
>   module_platform_driver_probe(amifb_driver, amifb_probe);
>
> +MODULE_DESCRIPTION("Amiga builtin chipset frame buffer driver");
>   MODULE_LICENSE("GPL");
>   MODULE_ALIAS("platform:amiga-video");
>
> ---
> base-commit: 6ba59ff4227927d3a8530fc2973b80e94b54d58f
> change-id: 20240617-md-m68k-drivers-video-fbdev-amifb-3f65d4a6ed79
>

