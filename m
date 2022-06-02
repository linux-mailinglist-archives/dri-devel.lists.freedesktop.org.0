Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B231653B87D
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 14:00:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACC1110E44D;
	Thu,  2 Jun 2022 12:00:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43B2410E44D
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 12:00:55 +0000 (UTC)
Received: from [192.168.41.62] ([46.114.149.130]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MOAJt-1o86QH1lVZ-00ObLP; Thu, 02 Jun 2022 14:00:44 +0200
Message-ID: <aa1394b5-18af-4184-236d-45f44ad44e2e@i2se.com>
Date: Thu, 2 Jun 2022 14:00:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v5 3/6] drm/v3d: Add support for bcm2711
Content-Language: en-US
To: Peter Robinson <pbrobinson@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 bcm-kernel-feedback-list@broadcom.com, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Emma Anholt <emma@anholt.net>,
 Florian Fainelli <f.fainelli@gmail.com>, javierm@redhat.com,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 maxime@cerno.tech, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Melissa Wen <melissa.srw@gmail.com>
References: <20220601110249.569540-1-pbrobinson@gmail.com>
 <20220601110249.569540-4-pbrobinson@gmail.com>
From: Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <20220601110249.569540-4-pbrobinson@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:gVbcJazyhpBT2gwYUqXBcasMDMtpBOxRBVKJ4H/vqm8XDB9Luk1
 WVGb9ZqoH+8nUwL3BbzLkNLejFgPysduaM+CmSGTD+kLf+EsAGIzHNuj30fuUFoauDQ1+x0
 kWwq3ZrhhjA2fORNZDRHB2nzGFlgGWpVohxN02aatE4sdis9nDvXtQ3P0NSZ4pjnoZBL5zN
 +3k0COO/63GWOBhvBF8hQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:guZ2XnrCvDs=:X+jf3Hhp9u0X0/wnFPiBcs
 7e8isVSVr7FNQgjRT9OZvAubD7tZ0ZZkU+dTfLQzICczoVGayi+79Od+Pffa8MXuDoqjgl9WC
 ZUESuAltpomBCmRe8QZmJmBwqKRLqErZc8G8N5YaC69n89QUir/2VzhQcTpsbCXDZSV4FsGeS
 lwFJPcoKT0MUzs0jiJ97KerVyksmGUho281yqj5NrhU2lpOMXNWpIPeIdJA3TDO+r9Bm188kW
 p1bNu43+RfeSJjchLuuZPfUBq6O+JLZNDfyMqKMdcWc0Oi1Z7CsLOQ9ZJ+JKO2aOrsKPjz91n
 /vgGQYnGJilYmdYSPsOrCzgRVQ3IF3nzYYlvc0THFbDXkD/YuzI5yJp/WGl9CauNwB0pD5ckP
 P3jSEiPs8xCrpvizEuhbMggrgByZftQpNfJYC/Ul5AD9mTQX/kHvqai4EDn17wKlzSfFalY4T
 gish1b7sIZYkjJks4djF5yjLQojjPgsoPxB2KXLSylhWlSnprS+cuYzMpqVLUlj0edrJlsoc8
 u+jdyoVbrcolIogztM3iObx7U7icQENRbwpsBJ1L/fLUr484dbY3VahxRjOaSJ9b/KYfEvPmL
 6sg9etLiU3mXA+XrSpgAj1L0LMq3neR/zDwOlLLYyAzIzK+jMMjBMiUZY+pY3+WE2r1tUCsk4
 OaOPrmyGrwBh05DnL21F+UD7TX0AOXAAPB7I+fuCMkHbHHS/8//+3PdUegOdqkD1m16khRrwN
 dFKFwCkBCwBfgHeBNpQlF6ivaWcS8pnVUsNwfB3en2rWVa8U2nXF7vNV5MA=
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
Cc: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[add Melissa]

Am 01.06.22 um 13:02 schrieb Peter Robinson:
> Add compatible string and Kconfig options for bcm2711.
>
> Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
Reviewed-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---
> Changes since v5:
> - Change compatible to align downstream and othee HW, reorder to suit
>
>   drivers/gpu/drm/v3d/Kconfig   | 2 +-
>   drivers/gpu/drm/v3d/v3d_drv.c | 1 +
>   2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/v3d/Kconfig b/drivers/gpu/drm/v3d/Kconfig
> index e973ec487484..01d91c829107 100644
> --- a/drivers/gpu/drm/v3d/Kconfig
> +++ b/drivers/gpu/drm/v3d/Kconfig
> @@ -1,7 +1,7 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   config DRM_V3D
>   	tristate "Broadcom V3D 3.x and newer"
> -	depends on ARCH_BCM || ARCH_BRCMSTB || COMPILE_TEST
> +	depends on ARCH_BCM || ARCH_BRCMSTB || ARCH_BCM2835 || COMPILE_TEST
>   	depends on DRM
>   	depends on COMMON_CLK
>   	depends on MMU
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
> index 56d5f831e48b..8c7f910daa28 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.c
> +++ b/drivers/gpu/drm/v3d/v3d_drv.c
> @@ -191,6 +191,7 @@ static const struct drm_driver v3d_drm_driver = {
>   };
>   
>   static const struct of_device_id v3d_of_match[] = {
> +	{ .compatible = "brcm,2711-v3d" },
>   	{ .compatible = "brcm,7268-v3d" },
>   	{ .compatible = "brcm,7278-v3d" },
>   	{},
