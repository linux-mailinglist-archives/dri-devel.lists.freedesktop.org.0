Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F727569D6
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 19:08:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8351A10E287;
	Mon, 17 Jul 2023 17:08:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2261010E28F
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 17:08:14 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8AxEvB9dbVkowgGAA--.14963S3;
 Tue, 18 Jul 2023 01:08:13 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxviN8dbVkMLcxAA--.31462S3; 
 Tue, 18 Jul 2023 01:08:12 +0800 (CST)
Message-ID: <fbbc08de-043a-2622-7cd4-fa485129edaf@loongson.cn>
Date: Tue, 18 Jul 2023 01:08:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [05/11] drm/tests: helpers: Create an helper to allocate a
 locking ctx
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>
References: <20230710-kms-kunit-actions-rework-v1-5-722c58d72c72@kernel.org>
From: suijingfeng <suijingfeng@loongson.cn>
In-Reply-To: <20230710-kms-kunit-actions-rework-v1-5-722c58d72c72@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8DxviN8dbVkMLcxAA--.31462S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxur1DGF43AF1DXw1rJF4xGrX_yoW5AF4UpF
 4UAa4vkrWUtFZxCw1Iva4DZa4Skw1xJr4xWr97Zr45ZFWYgFnxua1Dtr13urW5Gr4DXF4I
 vF1avryUua1qkrXCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUU92b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
 Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
 8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AK
 xVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
 AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AK
 xVWUtVW8ZwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67
 AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI
 42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMI
 IF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVF
 xhVjvjDU0xZFpf9x07j5WrAUUUUU=
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023/7/10 15:47, Maxime Ripard wrote:
> As we get more and more tests, the locking context initialisation
> creates more and more boilerplate, both at creation and destruction.
>
> Let's create a helper that will allocate, initialise a context, and
> register kunit actions to clean up once the test is done.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>   drivers/gpu/drm/tests/drm_kunit_helpers.c | 41 +++++++++++++++++++++++++++++++
>   include/drm/drm_kunit_helpers.h           |  2 ++
>   2 files changed, 43 insertions(+)
>
> diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/tests/drm_kunit_helpers.c
> index 38211fea9ae6..40a27c78d692 100644
> --- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
> +++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
> @@ -124,5 +124,46 @@ __drm_kunit_helper_alloc_drm_device_with_driver(struct kunit *test,
>   }
>   EXPORT_SYMBOL_GPL(__drm_kunit_helper_alloc_drm_device_with_driver);
>   
> +static void action_drm_release_context(void *ptr)
> +{
> +	struct drm_modeset_acquire_ctx *ctx = ptr;
> +
> +	drm_modeset_drop_locks(ctx);
> +	drm_modeset_acquire_fini(ctx);
> +}
> +
> +/**
> + * drm_kunit_helper_context_alloc - Allocates an acquire context
> + * @test: The test context object
> + *
> + * Allocates and initializes a modeset acquire context.
> + *
> + * The context is tied to the kunit test context, so we must not call
> + * drm_modeset_acquire_fini() on it, it will be done so automatically.
> + *
> + * Returns:
> + * An ERR_PTR on error, a pointer to the newly allocated context otherwise
> + */
> +struct drm_modeset_acquire_ctx *
> +drm_kunit_helper_acquire_ctx_alloc(struct kunit *test)
> +{
> +	struct drm_modeset_acquire_ctx *ctx;
> +	int ret;
> +
> +	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);

Because kunit_kzalloc() is also managed,

Is there any possibility that kfree(ctx) get called before 
action_drm_release_context(ctx) ?

Currently, I can't find where the order is guaranteed.

> +	KUNIT_ASSERT_NOT_NULL(test, ctx);
> +
> +	drm_modeset_acquire_init(ctx, 0);
> +
> +	ret = kunit_add_action_or_reset(test,
> +					action_drm_release_context,
> +					ctx);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return ctx;
> +}
> +EXPORT_SYMBOL_GPL(drm_kunit_helper_acquire_ctx_alloc);
> +
>   MODULE_AUTHOR("Maxime Ripard <maxime@cerno.tech>");
>   MODULE_LICENSE("GPL");
> diff --git a/include/drm/drm_kunit_helpers.h b/include/drm/drm_kunit_helpers.h
> index ed013fdcc1ff..4ba5e10653c6 100644
> --- a/include/drm/drm_kunit_helpers.h
> +++ b/include/drm/drm_kunit_helpers.h
> @@ -87,5 +87,7 @@ __drm_kunit_helper_alloc_drm_device(struct kunit *test,
>   						      sizeof(_type),		\
>   						      offsetof(_type, _member),	\
>   						      _feat))
> +struct drm_modeset_acquire_ctx *
> +drm_kunit_helper_acquire_ctx_alloc(struct kunit *test);
>   
>   #endif // DRM_KUNIT_HELPERS_H_

