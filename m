Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE23756A25
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 19:24:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EDEF10E28B;
	Mon, 17 Jul 2023 17:24:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 88CA310E28B
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 17:24:31 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8DxRvFOebVk+AoGAA--.16107S3;
 Tue, 18 Jul 2023 01:24:30 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxriNNebVke7oxAA--.31760S3; 
 Tue, 18 Jul 2023 01:24:29 +0800 (CST)
Message-ID: <c1184f26-ac80-8138-6501-de0609d16004@loongson.cn>
Date: Tue, 18 Jul 2023 01:24:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [09/11] drm/vc4: tests: pv-muxing: Switch to managed locking init
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>
References: <20230710-kms-kunit-actions-rework-v1-9-722c58d72c72@kernel.org>
From: suijingfeng <suijingfeng@loongson.cn>
In-Reply-To: <20230710-kms-kunit-actions-rework-v1-9-722c58d72c72@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8CxriNNebVke7oxAA--.31760S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW3XFW7KF4rZFy8tF4DXF43Arc_yoW3Jw45pr
 1kJFyUKFW5Jr4kWasrJayv9r9akw4UtryfKr97Ww4SvF1jgFyYy3Wvq34UZFW5ArZ5XFs3
 Aw1ayw15Xw4DAwbCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUvYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
 Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
 8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AK
 xVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
 AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
 14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIx
 kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
 wI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F
 4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j5WrAU
 UUUU=
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
> The new helper to init the locking context allows to remove some
> boilerplate.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>   drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c | 42 ++++++++++++--------------
>   1 file changed, 19 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c b/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c
> index 776a7b01608f..ff1deaed0cab 100644
> --- a/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c
> +++ b/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c
> @@ -20,7 +20,6 @@
>   
>   struct pv_muxing_priv {
>   	struct vc4_dev *vc4;
> -	struct drm_modeset_acquire_ctx ctx;
>   	struct drm_atomic_state *state;
>   };
>   
> @@ -725,6 +724,7 @@ static void drm_vc4_test_pv_muxing_invalid(struct kunit *test)
>   static int vc4_pv_muxing_test_init(struct kunit *test)
>   {
>   	const struct pv_muxing_param *params = test->param_value;
> +	struct drm_modeset_acquire_ctx *ctx;
>   	struct drm_atomic_state *state;
>   	struct pv_muxing_priv *priv;
>   	struct drm_device *drm;
> @@ -738,13 +738,14 @@ static int vc4_pv_muxing_test_init(struct kunit *test)
>   	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, vc4);
>   	priv->vc4 = vc4;
>   
> -	drm_modeset_acquire_init(&priv->ctx, 0);
> +	ctx = drm_kunit_helper_acquire_ctx_alloc(test);

> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
>   

The pointer returned by drm_kunit_helper_acquire_ctx_alloc() function 
can't be NULL,

if ctx is NULL, the current kthread will be terminated by the 
KUNIT_ASSERT_NOT_NULL() in the drm_kunit_helper_acquire_ctx_alloc().

so only a PTR_ERR is possible, right?

If so, probably invent a KUNIT_ASSERT_NOT_ERR() function to call is enough.

I'm fine with this patch, but I feel the checking if the ctx is NULL is 
redundant.

>   	drm = &vc4->base;
>   	state = drm_atomic_state_alloc(drm);
>   	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
>   
> -	state->acquire_ctx = &priv->ctx;
> +	state->acquire_ctx = ctx;
>   
>   	priv->state = state;
>   
> @@ -757,8 +758,6 @@ static void vc4_pv_muxing_test_exit(struct kunit *test)
>   	struct drm_atomic_state *state = priv->state;
>   
>   	drm_atomic_state_put(state);
> -	drm_modeset_drop_locks(&priv->ctx);
> -	drm_modeset_acquire_fini(&priv->ctx);
>   }
>   
>   static struct kunit_case vc4_pv_muxing_tests[] = {
> @@ -798,7 +797,7 @@ static struct kunit_suite vc5_pv_muxing_test_suite = {
>    */
>   static void drm_test_vc5_pv_muxing_bugs_subsequent_crtc_enable(struct kunit *test)
>   {
> -	struct drm_modeset_acquire_ctx ctx;
> +	struct drm_modeset_acquire_ctx *ctx;
>   	struct drm_atomic_state *state;
>   	struct vc4_crtc_state *new_vc4_crtc_state;
>   	struct vc4_hvs_state *new_hvs_state;
> @@ -811,13 +810,14 @@ static void drm_test_vc5_pv_muxing_bugs_subsequent_crtc_enable(struct kunit *tes
>   	vc4 = vc5_mock_device(test);
>   	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, vc4);
>   
> -	drm_modeset_acquire_init(&ctx, 0);
> +	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
>   
>   	drm = &vc4->base;
>   	state = drm_atomic_state_alloc(drm);
>   	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
>   
> -	state->acquire_ctx = &ctx;
> +	state->acquire_ctx = ctx;
>   
>   	ret = vc4_mock_atomic_add_output(test, state, VC4_ENCODER_TYPE_HDMI0);
>   	KUNIT_ASSERT_EQ(test, ret, 0);
> @@ -844,7 +844,7 @@ static void drm_test_vc5_pv_muxing_bugs_subsequent_crtc_enable(struct kunit *tes
>   	state = drm_atomic_state_alloc(drm);
>   	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
>   
> -	state->acquire_ctx = &ctx;
> +	state->acquire_ctx = ctx;
>   
>   	ret = vc4_mock_atomic_add_output(test, state, VC4_ENCODER_TYPE_HDMI1);
>   	KUNIT_ASSERT_EQ(test, ret, 0);
> @@ -866,13 +866,11 @@ static void drm_test_vc5_pv_muxing_bugs_subsequent_crtc_enable(struct kunit *tes
>   	KUNIT_EXPECT_NE(test, hdmi0_channel, hdmi1_channel);
>   
>   	drm_atomic_state_put(state);
> -	drm_modeset_drop_locks(&ctx);
> -	drm_modeset_acquire_fini(&ctx);
>   }
>   
>   static void drm_test_vc5_pv_muxing_bugs_stable_fifo(struct kunit *test)
>   {
> -	struct drm_modeset_acquire_ctx ctx;
> +	struct drm_modeset_acquire_ctx *ctx;
>   	struct drm_atomic_state *state;
>   	struct vc4_crtc_state *new_vc4_crtc_state;
>   	struct vc4_hvs_state *new_hvs_state;
> @@ -885,13 +883,14 @@ static void drm_test_vc5_pv_muxing_bugs_stable_fifo(struct kunit *test)
>   	vc4 = vc5_mock_device(test);
>   	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, vc4);
>   
> -	drm_modeset_acquire_init(&ctx, 0);
> +	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
>   
>   	drm = &vc4->base;
>   	state = drm_atomic_state_alloc(drm);
>   	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
>   
> -	state->acquire_ctx = &ctx;
> +	state->acquire_ctx = ctx;
>   
>   	ret = vc4_mock_atomic_add_output(test, state, VC4_ENCODER_TYPE_HDMI0);
>   	KUNIT_ASSERT_EQ(test, ret, 0);
> @@ -929,7 +928,7 @@ static void drm_test_vc5_pv_muxing_bugs_stable_fifo(struct kunit *test)
>   	state = drm_atomic_state_alloc(drm);
>   	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
>   
> -	state->acquire_ctx = &ctx;
> +	state->acquire_ctx = ctx;
>   
>   	ret = vc4_mock_atomic_del_output(test, state, VC4_ENCODER_TYPE_HDMI0);
>   	KUNIT_ASSERT_EQ(test, ret, 0);
> @@ -954,14 +953,12 @@ static void drm_test_vc5_pv_muxing_bugs_stable_fifo(struct kunit *test)
>   	}
>   
>   	drm_atomic_state_put(state);
> -	drm_modeset_drop_locks(&ctx);
> -	drm_modeset_acquire_fini(&ctx);
>   }
>   
>   static void
>   drm_test_vc5_pv_muxing_bugs_subsequent_crtc_enable_too_many_crtc_state(struct kunit *test)
>   {
> -	struct drm_modeset_acquire_ctx ctx;
> +	struct drm_modeset_acquire_ctx *ctx;
>   	struct drm_atomic_state *state;
>   	struct vc4_crtc_state *new_vc4_crtc_state;
>   	struct drm_device *drm;
> @@ -971,13 +968,14 @@ drm_test_vc5_pv_muxing_bugs_subsequent_crtc_enable_too_many_crtc_state(struct ku
>   	vc4 = vc5_mock_device(test);
>   	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, vc4);
>   
> -	drm_modeset_acquire_init(&ctx, 0);
> +	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
>   
>   	drm = &vc4->base;
>   	state = drm_atomic_state_alloc(drm);
>   	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
>   
> -	state->acquire_ctx = &ctx;
> +	state->acquire_ctx = ctx;
>   
>   	ret = vc4_mock_atomic_add_output(test, state, VC4_ENCODER_TYPE_HDMI0);
>   	KUNIT_ASSERT_EQ(test, ret, 0);
> @@ -993,7 +991,7 @@ drm_test_vc5_pv_muxing_bugs_subsequent_crtc_enable_too_many_crtc_state(struct ku
>   	state = drm_atomic_state_alloc(drm);
>   	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
>   
> -	state->acquire_ctx = &ctx;
> +	state->acquire_ctx = ctx;
>   
>   	ret = vc4_mock_atomic_add_output(test, state, VC4_ENCODER_TYPE_HDMI1);
>   	KUNIT_ASSERT_EQ(test, ret, 0);
> @@ -1006,8 +1004,6 @@ drm_test_vc5_pv_muxing_bugs_subsequent_crtc_enable_too_many_crtc_state(struct ku
>   	KUNIT_EXPECT_NULL(test, new_vc4_crtc_state);
>   
>   	drm_atomic_state_put(state);
> -	drm_modeset_drop_locks(&ctx);
> -	drm_modeset_acquire_fini(&ctx);
>   }
>   
>   static struct kunit_case vc5_pv_muxing_bugs_tests[] = {

