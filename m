Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C592896EFB
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 14:39:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BC521126AF;
	Wed,  3 Apr 2024 12:39:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="o1jn1zlr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69CC61126AE
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 12:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1712147965; x=1712752765; i=deller@gmx.de;
 bh=0/9OdsPnme8O0cpxK4rPy0u9rcwm1H6E5gohpds0soA=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
 In-Reply-To;
 b=o1jn1zlr/rYsUH2MpvLx2y0B1px41rzkQlAjwdeStqioZNNEPSjQgx6TxTsw+Dq+
 +CGLAxyGzW3y/k2/O/VS/AXxE+9qp+8t3TbdIyR9/YbHrumG1kJsMuL48uU1QcuZL
 2dNLTfmj5vog6xqPVgIL15ed0dS0gD0VjpgWV9e4unNjnsmJrfR+PTAsE7LWsmKiW
 5sZrK25N8a/sKnLFBOINnKoGTCRHo5ET9f0jxVShlnNwUJ43+me2LM3HPFh6DwuZj
 xMDBDeAvQ/QLfPSylIXHELHlSm3UiOMf9CyYoALfqsGTZMb2sT5DGBrl+M3a/3NrU
 ORlDUJiSGDwkYt1TCQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.198.194] ([109.43.112.31]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1McpNy-1sRssh0qqQ-00ZwMO; Wed, 03
 Apr 2024 14:39:25 +0200
Message-ID: <b431cd44-c436-4884-b0a9-bfe6fdcaf5cc@gmx.de>
Date: Wed, 3 Apr 2024 14:39:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/34] sisfb: hide unused variables
To: Arnd Bergmann <arnd@kernel.org>, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20240403080702.3509288-1-arnd@kernel.org>
 <20240403080702.3509288-14-arnd@kernel.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20240403080702.3509288-14-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Lx2iS+6fuDjSKNR2GqFB9k4UHT8MreBYU97WpDd9RYtV8AeNTZX
 mKtbUsRmHbk6aZv9UgQG6o3RrFF3ItQt8dhXDvOKNSAkZGZyPbYZ1qLj67AOvkCh8cjvDQv
 pH0uSzUaD6UpkiLx8b4dbux6tca8cNq3JKe+qXsS+RqdjfaawBLkViWfasUd/k2f3fPE6dP
 Z23POdapr2vYGX/xPjq1A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:e4hjhPC57HM=;h4TZ7lfky2lEiiT1p1qctQVX3NZ
 eZwHgrYzY2xWragaHQgtRZGIs14uu+JA5kMGZr38jYdCsnPunnuct/AbQIHR45i71vx8cBw2Y
 baUHuzjhLssTPDBpRh3V6v/FHn8liYPy4AqEDSh3QeOczfZdiv02TkyUoOqX3+TcoImbmEsAt
 g2Z7NL+32U9EhX2CenIuMBqJNNA6Ep1XYLwVUzyii/MUmJYi9hOuGoI1kU12Oohprdq7FVvv3
 GREMYrEDt4qZuYSibvmai6g0GqYL6Zg/AuzD8fEs7gqbEIiARK6FQh/OaQpX7OP++V7jffy7t
 yilGQdE6qNS5ihYDKn+1x772Y7FfrP59cjGfbLWALu625uDdJV70s4RmdJ2uZI3zgww6vJeBy
 ojolxI6ZvNQMoyN5JuBMhdDr3prQevy3KJ/dgoiMAJRFX7NMSNfd5LClGNyF8Mt243O86kxUg
 J/wcyj5oyr5dccUCzdcfNYuSbgQA/LosDSDl19eWzWXUKXl2Qps6/WpS7q5kjKDILG8M4dhLd
 8TPejJ0f2aeyP8+22WS1A4yMtyxfXdpRZGc8YbGhWXEQimEllnwR2mJpQCqdYRqK0ClgicRPT
 PfKzv4U9BlCw6cQEA6XT/vMDWQ2iy7/z4WRsEmbCIT4GBXG8KlZkEXlgYqWblA3w6VKw9tUEh
 7H6It967BX37GMAz3hh7PkrWUMWi8d2PXyTT2c6qEyrBJL+rPmtzK/xHKQmutBax0/1W+9xBL
 S09sTimJP8WaJYAEFwx11N9NGIBuMOZ+PTCcXXTHRV9XKpambJfKmypSCF9liiiFvSOYPAM8E
 hik0cdLWWTCh/Qc6qSvRIRw616WyNzFeXwiVvNzJ+AuOw=
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

On 4/3/24 10:06, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> Building with W=3D1 shows that a couple of variables in this driver are =
only
> used in certain configurations:
>
> drivers/video/fbdev/sis/init301.c:239:28: error: 'SiS_Part2CLVX_6' defin=
ed but not used [-Werror=3Dunused-const-variable=3D]
> ...
> Fixes: 5908986ef348 ("video: fbdev: sis: avoid mismatched prototypes")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/video/fbdev/sis/init301.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)

applied to fbdev git tree.

Thanks!
Helge
