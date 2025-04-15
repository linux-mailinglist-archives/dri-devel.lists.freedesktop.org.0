Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B5DA89E87
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 14:47:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7EF410E77A;
	Tue, 15 Apr 2025 12:47:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="A1dsYZt2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DED7710E77A
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 12:47:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7B8F443B10;
 Tue, 15 Apr 2025 12:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1744721257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=CR77hhjvg8b36xm+9nFR179moy1ZekzWZl1juxtEIZI=;
 b=A1dsYZt2SiQv3FoWSbx/Do7Av5GQJaSRFAAi0eCTo9LiAqaLiOZ7bT9JIZ3L3aoyC+Y9QI
 p5sNDrM9C+7pA+1LV3xKuX8vN4LSzEPJMsrlIjB15DubI+wmbFj5XQroYrLDlzlD52buc4
 1Pv2TBwXlUlGC2KHPWyBtzGOq0V3eO0ek3hDkNY936L80YOq92ZlvpvGBoJ/ZLYYVKrdvh
 gJkSSf5AYyDG4D/I9Wmzwipx6j/Piceg0ksQJLntbtG8c+K6MCn62sQLVv9KjQvHZ6NHIM
 7tXqLFaW1J+RDdvZqAP+pDRGFrPQIhgbb1BMujA78mXSEyaH58JmsPJOOqjXBQ==
Message-ID: <c9935c0c-b173-4914-9976-e583de9f2a47@bootlin.com>
Date: Tue, 15 Apr 2025 14:47:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 14/16] drm/vkms: Allow to configure connector status
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250407081425.6420-1-jose.exposito89@gmail.com>
 <20250407081425.6420-15-jose.exposito89@gmail.com>
Content-Language: en-US
From: Louis Chauvet <louis.chauvet@bootlin.com>
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <20250407081425.6420-15-jose.exposito89@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdefheefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeekieevtdefgedtkeehteehtddttdefhffhgeejleejjeeluddvhfdugedvkeehveenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrddtrddvtdgnpdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepjhhoshgvrdgvgihpohhsihhtohekleesghhmrghilhdrtghomhdprhgtphhtthhopehhrghmohhhrghmmhgvugdrshgrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopehmvghlihhsshgrrdhsrhifsehgmhgrihhlrdgtohhmpdhrtghpthhtohepm
 hgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomh
X-GND-Sasl: louis.chauvet@bootlin.com
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



Le 07/04/2025 à 10:14, José Expósito a écrit :
> Allow to store the connector status in vkms_config_connector and add a
> getter and a setter functions as well a KUnit test.
> 
> This change only adds the configuration, the connector status is not
> used yet.
> 
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

> ---
>   drivers/gpu/drm/vkms/tests/vkms_config_test.c | 24 +++++++++++++++++
>   drivers/gpu/drm/vkms/vkms_config.c            |  8 ++++--
>   drivers/gpu/drm/vkms/vkms_config.h            | 26 +++++++++++++++++++
>   3 files changed, 56 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
> index ff4566cf9925..3574a829a6ed 100644
> --- a/drivers/gpu/drm/vkms/tests/vkms_config_test.c
> +++ b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
> @@ -916,6 +916,29 @@ static void vkms_config_test_connector_get_possible_encoders(struct kunit *test)
>   	vkms_config_destroy(config);
>   }
>   
> +static void vkms_config_test_connector_status(struct kunit *test)
> +{
> +	struct vkms_config *config;
> +	struct vkms_config_connector *connector_cfg;
> +	enum drm_connector_status status;
> +
> +	config = vkms_config_create("test");
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
> +
> +	connector_cfg = vkms_config_create_connector(config);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, connector_cfg);
> +
> +	status = vkms_config_connector_get_status(connector_cfg);
> +	KUNIT_EXPECT_EQ(test, status, connector_status_connected);
> +
> +	vkms_config_connector_set_status(connector_cfg,
> +					 connector_status_disconnected);
> +	status = vkms_config_connector_get_status(connector_cfg);
> +	KUNIT_EXPECT_EQ(test, status, connector_status_disconnected);
> +
> +	vkms_config_destroy(config);
> +}
> +
>   static struct kunit_case vkms_config_test_cases[] = {
>   	KUNIT_CASE(vkms_config_test_empty_config),
>   	KUNIT_CASE_PARAM(vkms_config_test_default_config,
> @@ -937,6 +960,7 @@ static struct kunit_case vkms_config_test_cases[] = {
>   	KUNIT_CASE(vkms_config_test_plane_get_possible_crtcs),
>   	KUNIT_CASE(vkms_config_test_encoder_get_possible_crtcs),
>   	KUNIT_CASE(vkms_config_test_connector_get_possible_encoders),
> +	KUNIT_CASE(vkms_config_test_connector_status),
>   	{}
>   };
>   
> diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
> index a1df5659b0fb..f8394a063ecf 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.c
> +++ b/drivers/gpu/drm/vkms/vkms_config.c
> @@ -361,8 +361,11 @@ static int vkms_config_show(struct seq_file *m, void *data)
>   	vkms_config_for_each_encoder(vkmsdev->config, encoder_cfg)
>   		seq_puts(m, "encoder\n");
>   
> -	vkms_config_for_each_connector(vkmsdev->config, connector_cfg)
> -		seq_puts(m, "connector\n");
> +	vkms_config_for_each_connector(vkmsdev->config, connector_cfg) {
> +		seq_puts(m, "connector:\n");
> +		seq_printf(m, "\tstatus=%d\n",
> +			   vkms_config_connector_get_status(connector_cfg));
> +	}
>   
>   	return 0;
>   }
> @@ -588,6 +591,7 @@ struct vkms_config_connector *vkms_config_create_connector(struct vkms_config *c
>   		return ERR_PTR(-ENOMEM);
>   
>   	connector_cfg->config = config;
> +	connector_cfg->status = connector_status_connected;
>   	xa_init_flags(&connector_cfg->possible_encoders, XA_FLAGS_ALLOC);
>   
>   	list_add_tail(&connector_cfg->link, &config->connectors);
> diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
> index 0118e3f99706..e202b5a84ddd 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.h
> +++ b/drivers/gpu/drm/vkms/vkms_config.h
> @@ -7,6 +7,8 @@
>   #include <linux/types.h>
>   #include <linux/xarray.h>
>   
> +#include <drm/drm_connector.h>
> +
>   #include "vkms_drv.h"
>   
>   /**
> @@ -99,6 +101,7 @@ struct vkms_config_encoder {
>    *
>    * @link: Link to the others connector in vkms_config
>    * @config: The vkms_config this connector belongs to
> + * @status: Status (connected, disconnected...) of the connector
>    * @possible_encoders: Array of encoders that can be used with this connector
>    * @connector: Internal usage. This pointer should never be considered as valid.
>    *             It can be used to store a temporary reference to a VKMS connector
> @@ -109,6 +112,7 @@ struct vkms_config_connector {
>   	struct list_head link;
>   	struct vkms_config *config;
>   
> +	enum drm_connector_status status;
>   	struct xarray possible_encoders;
>   
>   	/* Internal usage */
> @@ -434,4 +438,26 @@ int __must_check vkms_config_connector_attach_encoder(struct vkms_config_connect
>   void vkms_config_connector_detach_encoder(struct vkms_config_connector *connector_cfg,
>   					  struct vkms_config_encoder *encoder_cfg);
>   
> +/**
> + * vkms_config_connector_get_status() - Return the status of the connector
> + * @connector_cfg: Connector to get the status from
> + */
> +static inline enum drm_connector_status
> +vkms_config_connector_get_status(struct vkms_config_connector *connector_cfg)
> +{
> +	return connector_cfg->status;
> +}
> +
> +/**
> + * vkms_config_crtc_set_writeback() - If a writeback connector will be created
> + * @crtc_cfg: Target CRTC
> + * @writeback: Enable or disable the writeback connector
> + */
> +static inline void
> +vkms_config_connector_set_status(struct vkms_config_connector *connector_cfg,
> +				 enum drm_connector_status status)
> +{
> +	connector_cfg->status = status;
> +}
> +
>   #endif /* _VKMS_CONFIG_H_ */

I think we should have a way to fire a hot

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

