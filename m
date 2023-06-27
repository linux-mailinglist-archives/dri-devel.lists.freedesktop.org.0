Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F20D573FE71
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 16:40:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35BD010E2E9;
	Tue, 27 Jun 2023 14:40:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 97F4C10E2E9
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 14:40:11 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8BxXcfK9Jpk7ycDAA--.5001S3;
 Tue, 27 Jun 2023 22:40:10 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8AxzyPJ9Jpk92EMAA--.9129S3; 
 Tue, 27 Jun 2023 22:40:09 +0800 (CST)
Message-ID: <131c6b50-5f14-9bb7-b5bd-5103f7ccc6eb@loongson.cn>
Date: Tue, 27 Jun 2023 22:40:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [26/39] drm: renesas: shmobile: Rename
 shmob_drm_connector.connector
Content-Language: en-US
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, Magnus Damm <magnus.damm@gmail.com>
References: <34065943fb616180779936aa5b1d20c3c5e06886.1687423204.git.geert+renesas@glider.be>
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <34065943fb616180779936aa5b1d20c3c5e06886.1687423204.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8AxzyPJ9Jpk92EMAA--.9129S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7tryUKw1UKr4fJr4xAF4rXrc_yoW8tF4fpF
 48A3yFyFW0qFZ8KrW7AFs7uFn8A3W5KFySkFyUWw45Cryvq347Aa15XFnxJFyDZry7KF42
 qanIgr4fAF109rXCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUBmb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
 wI0_Cr1j6rxdM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
 AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
 tVWrXwAv7VC2z280aVAFwI0_Gr1j6F4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64
 vIr41lc7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkE
 bVWUJVW8JwCFI7km07C267AKxVWUtVW8ZwC20s026c02F40E14v26r1j6r18MI8I3I0E74
 80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0
 I7IYx2IY67AKxVW5JVW7JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42
 xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8Jr0_Cr1UMIIF0xvEx4A2jsIE
 c7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxU2KZXUUUUU
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
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2023/6/22 17:21, Geert Uytterhoeven wrote:
> Rename the "connector" member of the shmob_drm_connector subclass
> structure to "base", to improve readability.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>

> ---
>   drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c | 4 ++--
>   drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.h | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> index 3f0b71253ed929c9..2c0ca802d36026f4 100644
> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> @@ -608,7 +608,7 @@ int shmob_drm_encoder_create(struct shmob_drm_device *sdev)
>   
>   static inline struct shmob_drm_connector *to_shmob_connector(struct drm_connector *connector)
>   {
> -	return container_of(connector, struct shmob_drm_connector, connector);
> +	return container_of(connector, struct shmob_drm_connector, base);
>   }
>   
>   static int shmob_drm_connector_get_modes(struct drm_connector *connector)
> @@ -669,7 +669,7 @@ shmob_drm_connector_init(struct shmob_drm_device *sdev,
>   	if (!scon)
>   		return ERR_PTR(-ENOMEM);
>   
> -	connector = &scon->connector;
> +	connector = &scon->base;
>   	info = &connector->display_info;
>   	info->width_mm = sdev->pdata->panel.width_mm;
>   	info->height_mm = sdev->pdata->panel.height_mm;
> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.h b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.h
> index 79cce0a0ada4cfce..2c6d7541427581a6 100644
> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.h
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.h
> @@ -33,7 +33,7 @@ struct shmob_drm_crtc {
>   };
>   
>   struct shmob_drm_connector {
> -	struct drm_connector connector;
> +	struct drm_connector base;
>   	struct drm_encoder *encoder;
>   	const struct videomode *mode;
>   };

-- 
Jingfeng

