Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 567C57DB923
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 12:41:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63C8010E0AD;
	Mon, 30 Oct 2023 11:41:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19F5F10E277
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 10:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=s31663417; t=1698660110; x=1699264910; i=wahrenst@gmx.net;
 bh=U6aXOU8MjaQJrPBLw3WQSy7ktbaB1Objuy/SnhKF4Fo=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
 In-Reply-To;
 b=ASTxbsVL29kXM1jX8qVX30wEL/tgqu2fG4JXexXlNhzva7MVIX4dabUGSsIYmb8G
 e4WLZThCXPwukzqQyT8YdGcpS3vdPacyNRPE3P1PMK3+OHxtsj1TNLLYAn4/NTczs
 PzVffwIpjMs6fsirz2AKptOCJ9Z7bQ4Hq3DnJ17V4hOMNkSWC2oppSc16vG8O1Ote
 tbPNVUFpittzKDvAOWocUv/ftg0eryG3AAaoAnQYeqCDlrqeVNoRE9UunQcsgYFG5
 4lMQgRYOJxRNd1b48OR6Sf+QT3pk85s3k9C1jlIc/kYUMMUMhaN18eKAXgRKUZ8a/
 KaATUFDYhrOIcDIeVw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.129] ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MvK4f-1rnzg43R1l-00rJuO; Mon, 30
 Oct 2023 11:01:49 +0100
Message-ID: <515d8a40-c997-415c-9d05-38d9ca2e40a0@gmx.net>
Date: Mon, 30 Oct 2023 11:01:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] drm/v3d: add brcm,2712-v3d as a compatible V3D
 device
Content-Language: en-US
To: Iago Toral Quiroga <itoral@igalia.com>, Maira Canal <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org
References: <20231030082858.30321-1-itoral@igalia.com>
 <20231030082858.30321-5-itoral@igalia.com>
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20231030082858.30321-5-itoral@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:5sNmlY1E6PZLNebbpNxEJl2kwoRQXeFRtlFATl3wcBHuOgh+kLA
 CWT0yClmfB5k3sGcdhCSiz1+iij/Wwx0BBpQx6qp94j6FBokZmIBFWjsEXYr23OO0a5mJZB
 +FRS9Hf49Ukk+y46UtYoZiyZoUqoDrEgrlVv48QnWh4IwbYzpk6ZTreADsnb0kjDFrP3jkx
 S7i3pJysLsvgiKsbnQP0A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:9qmRT17Cy6M=;tXBmkEk+fii/Cp1D4+y1BcVhABX
 hIZ0jf0m6Jw3/QWG3MHaeeRNHbPyx/e/Mr3uHtgMFCYodpUm/cHRVjyIcTqRe2JbWX3VbdFhV
 r7LKJEvka457Ofj/+AfXiqI/7q9zsbOI+Pxi/rPnjJXOBODFzOduNExjskLzgVxOQftn1jwId
 uaQXlpu0lZ5fY7EiKefZzuZ1JZB+0ANNLKSO3jXDGdhP55louFONxE6TnixW+qAVb2GpKe2L6
 Re6/GtqIH4mjqc1IFjbeFX8YNWsppydTeRHaOzBFRRoHk4VlF0fubMbsHrG1Cshw00opeRtUM
 S1v+Y7ACiYZ8PRkwlFGnqSd/8K278FmxCAbqPc0THFCkWGDgRXujkRRnXMy6DqFDltZBsqwsH
 4IAYzDCwnvjbGAiJQ2b3p8bDB8IZ2g8YNmS77Jk4oBa5N+vdQi0VC18T3wBB6HSdnKoh3PD1g
 4NwWn2qPpA19qfVEAhQd7QMDvVJdd1GWT9v1kUXomAdAAFRox8qr2zY3LMRCzT/ptRIhT3/3p
 aWE0F7u35nffmczUFZiJps2xCFWTBDNQGGsRFrPkD+3bn5Iox8AobPuFsal/fmpv99fs7YElk
 uj3XRgcrtk610rhM0tLO/7cMsIYy1cuMJAy0MgkQg5odqRNEfWZWnSoZuUGeW0ixLdvGWPIpP
 F7n2OvzvDFx63iQJ/oYeqKn46EtfCiu8sqk5/kK0S9viPU/xfzY2QYjwagBy7vItyfKk22VIK
 0B1z4YApIf7dOuTmq9VakBCoxmXpMBf7at4kixM4zj5jgS1MPsHmOxFKTs4PE0/S3wPKFPzNn
 NiZDGdRLUF+OzvmsWZ7mdeKdcM/c/rmVcYQY+Wr0ZapOK3BoXZ4SmZBtC95C2bNHq15QwP/e/
 znqbSIwjZIkwOlou9AJ7i0CDPnrZ4qQ9aygYwQTZe+toN68JkEJEWkkG4KzHV49Y9Menq5w+W
 S8QBbXnRf/rbtjlyqu6DPhM1RjM=
X-Mailman-Approved-At: Mon, 30 Oct 2023 11:41:13 +0000
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
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>, Emma Anholt <emma@anholt.net>,
 Melissa Wen <mwen@igalia.com>, Rob Herring <robh+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Iago,

Am 30.10.23 um 09:28 schrieb Iago Toral Quiroga:
> This is required to get the V3D module to load with Raspberry Pi 5.
>
> v2:
>   - added s-o-b and commit message. (Ma=C3=ADra)
>   - keep order of compatible strings. (Stefan Wahren)
as in the other patch, please move the changelog below --- or in the
cover letter.

Except of this:

Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
>
> Signed-off-by: Iago Toral Quiroga <itoral@igalia.com>
> ---
>   drivers/gpu/drm/v3d/v3d_drv.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv=
.c
> index ffbbe9d527d3..1ab46bdf8ad7 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.c
> +++ b/drivers/gpu/drm/v3d/v3d_drv.c
> @@ -187,6 +187,7 @@ static const struct drm_driver v3d_drm_driver =3D {
>
>   static const struct of_device_id v3d_of_match[] =3D {
>   	{ .compatible =3D "brcm,2711-v3d" },
> +	{ .compatible =3D "brcm,2712-v3d" },
>   	{ .compatible =3D "brcm,7268-v3d" },
>   	{ .compatible =3D "brcm,7278-v3d" },
>   	{},

