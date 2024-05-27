Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E338D05A6
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 17:15:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B350510E13F;
	Mon, 27 May 2024 15:14:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from zg8tmty1ljiyny4xntqumjca.icoremail.net
 (zg8tmty1ljiyny4xntqumjca.icoremail.net [165.227.154.27])
 by gabe.freedesktop.org (Postfix) with ESMTP id 93C2A10E13F
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 15:14:54 +0000 (UTC)
Received: from [172.38.8.164] (unknown [219.141.235.82])
 by mail (Coremail) with SMTP id AQAAfwDHqORFo1RmpnoKAA--.2132S2;
 Mon, 27 May 2024 23:14:15 +0800 (CST)
Message-ID: <37aa6f1b-5946-4199-91a5-ef12047f4fc0@bosc.ac.cn>
Date: Mon, 27 May 2024 23:14:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v15,06/29] drm/tests: Add output bpc tests
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Andy Yan <andy.yan@rock-chips.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Dave Stevenson
 <dave.stevenson@raspberrypi.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20240527-kms-hdmi-connector-state-v15-6-c5af16c3aae2@kernel.org>
Content-Language: en-US, en-AU
From: Sui Jingfeng <suijingfeng@bosc.ac.cn>
Organization: bosc
In-Reply-To: <20240527-kms-hdmi-connector-state-v15-6-c5af16c3aae2@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAfwDHqORFo1RmpnoKAA--.2132S2
X-Coremail-Antispam: 1UD129KBjvAXoWftrWUXFy8ur13CFWrZry8uFg_yoW5WFWxGo
 W3Jw1Fka1rK348X39rtFy7Ka1a9a1rK3W3J3s8K3yDXFZFkw429F1Ig34UXFZ3Jr1rtryI
 qa4qva40qwn7ta1kn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjp_UUUYx7k0a2IF6w4kM7kC6x804xWl14x267AKxVW5JVWrJwAFc2x0
 x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj4
 1l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0
 I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I
 8E87Iv6xkF7I0E14v26r4j6r4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
 0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
 1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7
 MxkIecxEwVAFwVW5WwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s
 026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_
 GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20x
 vEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE
 14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf
 9x07bF2NtUUUUU=
X-CM-SenderInfo: xvxlyxpqjiv03j6e02nfoduhdfq/
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



On 5/27/24 21:57, Maxime Ripard wrote:
> Now that we're tracking the output bpc count in the connector state,
> let's add a few tests to make sure it works as expected.
> 
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>   drivers/gpu/drm/Kconfig                            |   1 +
>   drivers/gpu/drm/tests/Makefile                     |   1 +
>   drivers/gpu/drm/tests/drm_connector_test.c         | 155 ++++++++
>   drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 438 +++++++++++++++++++++
>   drivers/gpu/drm/tests/drm_kunit_edid.h             | 106 +++++
>   5 files changed, 701 insertions(+)
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 026444eeb5c6..9703429de6b9 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -77,10 +77,11 @@ config DRM_KUNIT_TEST_HELPERS
>   config DRM_KUNIT_TEST
>   	tristate "KUnit tests for DRM" if !KUNIT_ALL_TESTS
>   	depends on DRM && KUNIT && MMU
>   	select DRM_BUDDY
>   	select DRM_DISPLAY_DP_HELPER
> +	select DRM_DISPLAY_HDMI_STATE_HELPER
>   	select DRM_DISPLAY_HELPER
>   	select DRM_EXEC
>   	select DRM_EXPORT_FOR_TESTS if m
>   	select DRM_GEM_SHMEM_HELPER
>   	select DRM_KUNIT_TEST_HELPERS
> diff --git a/drivers/gpu/drm/tests/Makefile b/drivers/gpu/drm/tests/Makefile
> index d6183b3d7688..56dab563abd7 100644
> --- a/drivers/gpu/drm/tests/Makefile
> +++ b/drivers/gpu/drm/tests/Makefile
> @@ -12,10 +12,11 @@ obj-$(CONFIG_DRM_KUNIT_TEST) += \
>   	drm_exec_test.o \
>   	drm_format_helper_test.o \
>   	drm_format_test.o \
>   	drm_framebuffer_test.o \
>   	drm_gem_shmem_test.o \
> +	drm_hdmi_state_helper_test.o \
>   	drm_managed_test.o \
>   	drm_mm_test.o \
>   	drm_modes_test.o \
>   	drm_plane_helper_test.o \
>   	drm_probe_helper_test.o \
> diff --git a/drivers/gpu/drm/tests/drm_connector_test.c b/drivers/gpu/drm/tests/drm_connector_test.c
> index 2661eb64a5cd..9465fa33f3b6 100644
> --- a/drivers/gpu/drm/tests/drm_connector_test.c
> +++ b/drivers/gpu/drm/tests/drm_connector_test.c
> @@ -10,10 +10,12 @@
>   #include <drm/drm_drv.h>
>   #include <drm/drm_kunit_helpers.h>
>   
>   #include <kunit/test.h>
>   
> +#include "../drm_crtc_internal.h"
> +
>   struct drm_connector_init_priv {
>   	struct drm_device drm;
>   	struct drm_connector connector;
>   	struct i2c_adapter ddc;
>   };
> @@ -204,10 +206,158 @@ static void drm_test_connector_hdmi_init_null_ddc(struct kunit *test)
>   				       NULL,
>   				       8);
>   	KUNIT_EXPECT_EQ(test, ret, 0);
>   }
>   
> +/*
> + * Test that the registration of a connector with an invalid maximum bpc
> + * count fails.
> + */
> +static void drm_test_connector_hdmi_init_bpc_invalid(struct kunit *test)
> +{
> +	struct drm_connector_init_priv *priv = test->priv;
> +	int ret;
> +
> +	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
> +				       &dummy_funcs,
> +				       DRM_MODE_CONNECTOR_HDMIA,
> +				       &priv->ddc,
> +				       9);
> +	KUNIT_EXPECT_LT(test, ret, 0);
> +}
> +
> +/*
> + * Test that the registration of a connector with a null maximum bpc
> + * count fails.
> + */
> +static void drm_test_connector_hdmi_init_bpc_null(struct kunit *test)
> +{
> +	struct drm_connector_init_priv *priv = test->priv;
> +	int ret;
> +
> +	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
> +				       &dummy_funcs,
> +				       DRM_MODE_CONNECTOR_HDMIA,
> +				       &priv->ddc,
> +				       0);
> +	KUNIT_EXPECT_LT(test, ret, 0);
> +}
> +
> +/*
> + * Test that the registration of a connector with a maximum bpc count of
> + * 8 succeeds, registers the max bpc property, but doesn't register the
> + * HDR output metadata one.
> + */
> +static void drm_test_connector_hdmi_init_bpc_8(struct kunit *test)
> +{
> +	struct drm_connector_init_priv *priv = test->priv;
> +	struct drm_connector_state *state;
> +	struct drm_connector *connector = &priv->connector;
> +	struct drm_property *prop;
> +	uint64_t val;
> +	int ret;
> +
> +	ret = drmm_connector_hdmi_init(&priv->drm, connector,
> +				       &dummy_funcs,
> +				       DRM_MODE_CONNECTOR_HDMIA,
> +				       &priv->ddc,
> +				       8);
> +	KUNIT_EXPECT_EQ(test, ret, 0);
> +
> +	prop = connector->max_bpc_property;
> +	KUNIT_ASSERT_NOT_NULL(test, prop);
> +	KUNIT_EXPECT_NOT_NULL(test, drm_mode_obj_find_prop_id(&connector->base, prop->base.id));
> +
> +	ret = drm_object_property_get_default_value(&connector->base, prop, &val);
> +	KUNIT_EXPECT_EQ(test, ret, 0);
> +	KUNIT_EXPECT_EQ(test, val, 8);
> +
> +	state = connector->state;
> +	KUNIT_EXPECT_EQ(test, state->max_bpc, 8);
> +	KUNIT_EXPECT_EQ(test, state->max_requested_bpc, 8);
> +
> +	prop = priv->drm.mode_config.hdr_output_metadata_property;
> +	KUNIT_ASSERT_NOT_NULL(test, prop);
> +	KUNIT_EXPECT_NULL(test, drm_mode_obj_find_prop_id(&connector->base, prop->base.id));
> +}
> +
> +/*
> + * Test that the registration of a connector with a maximum bpc count of
> + * 10 succeeds and registers the max bpc and HDR output metadata
> + * properties.
> + */
> +static void drm_test_connector_hdmi_init_bpc_10(struct kunit *test)
> +{
> +	struct drm_connector_init_priv *priv = test->priv;
> +	struct drm_connector_state *state;
> +	struct drm_connector *connector = &priv->connector;
> +	struct drm_property *prop;
> +	uint64_t val;
> +	int ret;
> +
> +	ret = drmm_connector_hdmi_init(&priv->drm, connector,
> +				       &dummy_funcs,
> +				       DRM_MODE_CONNECTOR_HDMIA,
> +				       &priv->ddc,
> +				       10);
> +	KUNIT_EXPECT_EQ(test, ret, 0);
> +
> +	prop = connector->max_bpc_property;
> +	KUNIT_ASSERT_NOT_NULL(test, prop);
> +	KUNIT_EXPECT_NOT_NULL(test, drm_mode_obj_find_prop_id(&connector->base, prop->base.id));
> +
> +	ret = drm_object_property_get_default_value(&connector->base, prop, &val);
> +	KUNIT_EXPECT_EQ(test, ret, 0);
> +	KUNIT_EXPECT_EQ(test, val, 10);
> +
> +	state = connector->state;
> +	KUNIT_EXPECT_EQ(test, state->max_bpc, 10);
> +	KUNIT_EXPECT_EQ(test, state->max_requested_bpc, 10);
> +
> +	prop = priv->drm.mode_config.hdr_output_metadata_property;
> +	KUNIT_ASSERT_NOT_NULL(test, prop);
> +	KUNIT_EXPECT_NOT_NULL(test, drm_mode_obj_find_prop_id(&connector->base, prop->base.id));
> +}
> +
> +/*
> + * Test that the registration of a connector with a maximum bpc count of
> + * 12 succeeds and registers the max bpc and HDR output metadata
> + * properties.
> + */
> +static void drm_test_connector_hdmi_init_bpc_12(struct kunit *test)
> +{
> +	struct drm_connector_init_priv *priv = test->priv;
> +	struct drm_connector_state *state;
> +	struct drm_connector *connector = &priv->connector;
> +	struct drm_property *prop;
> +	uint64_t val;
> +	int ret;
> +
> +	ret = drmm_connector_hdmi_init(&priv->drm, connector,
> +				       &dummy_funcs,
> +				       DRM_MODE_CONNECTOR_HDMIA,
> +				       &priv->ddc,
> +				       12);
> +	KUNIT_EXPECT_EQ(test, ret, 0);
> +
> +	prop = connector->max_bpc_property;
> +	KUNIT_ASSERT_NOT_NULL(test, prop);
> +	KUNIT_EXPECT_NOT_NULL(test, drm_mode_obj_find_prop_id(&connector->base, prop->base.id));
> +
> +	ret = drm_object_property_get_default_value(&connector->base, prop, &val);
> +	KUNIT_EXPECT_EQ(test, ret, 0);
> +	KUNIT_EXPECT_EQ(test, val, 12);
> +
> +	state = connector->state;
> +	KUNIT_EXPECT_EQ(test, state->max_bpc, 12);
> +	KUNIT_EXPECT_EQ(test, state->max_requested_bpc, 12);
> +
> +	prop = priv->drm.mode_config.hdr_output_metadata_property;
> +	KUNIT_ASSERT_NOT_NULL(test, prop);
> +	KUNIT_EXPECT_NOT_NULL(test, drm_mode_obj_find_prop_id(&connector->base, prop->base.id));
> +}
> +
>   /*
>    * Test that the registration of an HDMI connector with an HDMI
>    * connector type succeeds.
>    */
>   static void drm_test_connector_hdmi_init_type_valid(struct kunit *test)
> @@ -282,10 +432,15 @@ KUNIT_ARRAY_PARAM(drm_connector_hdmi_init_type_invalid,
>   		  drm_connector_hdmi_init_type_invalid_tests,
>   		  drm_connector_hdmi_init_type_desc);
>   
>   static struct kunit_case drmm_connector_hdmi_init_tests[] = {
>   	KUNIT_CASE(drm_test_connector_hdmi_init_valid),
> +	KUNIT_CASE(drm_test_connector_hdmi_init_bpc_8),
> +	KUNIT_CASE(drm_test_connector_hdmi_init_bpc_10),
> +	KUNIT_CASE(drm_test_connector_hdmi_init_bpc_12),
> +	KUNIT_CASE(drm_test_connector_hdmi_init_bpc_invalid),
> +	KUNIT_CASE(drm_test_connector_hdmi_init_bpc_null),
>   	KUNIT_CASE(drm_test_connector_hdmi_init_null_ddc),
>   	KUNIT_CASE_PARAM(drm_test_connector_hdmi_init_type_valid,
>   			 drm_connector_hdmi_init_type_valid_gen_params),
>   	KUNIT_CASE_PARAM(drm_test_connector_hdmi_init_type_invalid,
>   			 drm_connector_hdmi_init_type_invalid_gen_params),
> diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> new file mode 100644
> index 000000000000..3ecae50ef47f
> --- /dev/null
> +++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> @@ -0,0 +1,438 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/*
> + * Kunit test for drm_hdmi_state_helper functions
> + */
> +
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_state_helper.h>
> +#include <drm/drm_atomic_uapi.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_edid.h>
> +#include <drm/drm_connector.h>
> +#include <drm/drm_fourcc.h>
> +#include <drm/drm_kunit_helpers.h>
> +#include <drm/drm_managed.h>
> +#include <drm/drm_modeset_helper_vtables.h>
> +#include <drm/drm_print.h>
> +#include <drm/drm_probe_helper.h>
> +
> +#include <drm/display/drm_hdmi_state_helper.h>
> +
> +#include "../drm_crtc_internal.h"
> +
> +#include <kunit/test.h>
> +
> +#include "drm_kunit_edid.h"
> +
> +struct drm_atomic_helper_connector_hdmi_priv {
> +	struct drm_device drm;
> +	struct drm_plane *plane;
> +	struct drm_crtc *crtc;
> +	struct drm_encoder encoder;
> +	struct drm_connector connector;
> +
> +	const char *current_edid;
> +	size_t current_edid_len;
> +};
> +
> +#define connector_to_priv(c) \
> +	container_of_const(c, struct drm_atomic_helper_connector_hdmi_priv, connector)
> +
> +static struct drm_display_mode *find_preferred_mode(struct drm_connector *connector)
> +{
> +	struct drm_device *drm = connector->dev;
> +	struct drm_display_mode *mode, *preferred;
> +
> +	mutex_lock(&drm->mode_config.mutex);
> +	preferred = list_first_entry(&connector->modes, struct drm_display_mode, head);
> +	list_for_each_entry(mode, &connector->modes, head)
> +		if (mode->type & DRM_MODE_TYPE_PREFERRED)
> +			preferred = mode;
> +	mutex_unlock(&drm->mode_config.mutex);
> +
> +	return preferred;
> +}
> +
> +static int light_up_connector(struct kunit *test,
> +			      struct drm_device *drm,
> +			      struct drm_crtc *crtc,
> +			      struct drm_connector *connector,
> +			      struct drm_display_mode *mode,
> +			      struct drm_modeset_acquire_ctx *ctx)
> +{
> +	struct drm_atomic_state *state;
> +	struct drm_connector_state *conn_state;
> +	struct drm_crtc_state *crtc_state;
> +	int ret;
> +
> +	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
> +
> +	conn_state = drm_atomic_get_connector_state(state, connector);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
> +
> +	ret = drm_atomic_set_crtc_for_connector(conn_state, crtc);
> +	KUNIT_EXPECT_EQ(test, ret, 0);
> +
> +	crtc_state = drm_atomic_get_crtc_state(state, crtc);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
> +
> +	ret = drm_atomic_set_mode_for_crtc(crtc_state, mode);
> +	KUNIT_EXPECT_EQ(test, ret, 0);
> +
> +	crtc_state->enable = true;
> +	crtc_state->active = true;
> +
> +	ret = drm_atomic_commit(state);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	return 0;
> +}
> +
> +static int set_connector_edid(struct kunit *test, struct drm_connector *connector,
> +			      const char *edid, size_t edid_len)
> +{
> +	struct drm_atomic_helper_connector_hdmi_priv *priv =
> +		connector_to_priv(connector);
> +	struct drm_device *drm = connector->dev;
> +	int ret;
> +
> +	priv->current_edid = edid;
> +	priv->current_edid_len = edid_len;
> +
> +	mutex_lock(&drm->mode_config.mutex);
> +	ret = connector->funcs->fill_modes(connector, 4096, 4096);
> +	mutex_unlock(&drm->mode_config.mutex);
> +	KUNIT_ASSERT_GT(test, ret, 0);
> +
> +	return 0;
> +}
> +
> +static int dummy_connector_get_modes(struct drm_connector *connector)
> +{
> +	struct drm_atomic_helper_connector_hdmi_priv *priv =
> +		connector_to_priv(connector);
> +	const struct drm_edid *edid;
> +	unsigned int num_modes;
> +
> +	edid = drm_edid_alloc(priv->current_edid, priv->current_edid_len);
> +	if (!edid)
> +		return -EINVAL;
> +
> +	drm_edid_connector_update(connector, edid);
> +	num_modes = drm_edid_connector_add_modes(connector);
> +
> +	drm_edid_free(edid);
> +
> +	return num_modes;
> +}
> +
> +static const struct drm_connector_helper_funcs dummy_connector_helper_funcs = {
> +	.atomic_check	= drm_atomic_helper_connector_hdmi_check,
> +	.get_modes	= dummy_connector_get_modes,
> +};
> +
> +static void dummy_hdmi_connector_reset(struct drm_connector *connector)
> +{
> +	drm_atomic_helper_connector_reset(connector);
> +	__drm_atomic_helper_connector_hdmi_reset(connector, connector->state);
> +}
> +
> +static const struct drm_connector_funcs dummy_connector_funcs = {
> +	.atomic_destroy_state	= drm_atomic_helper_connector_destroy_state,
> +	.atomic_duplicate_state	= drm_atomic_helper_connector_duplicate_state,
> +	.fill_modes		= drm_helper_probe_single_connector_modes,
> +	.reset			= dummy_hdmi_connector_reset,
> +};
> +
> +static
> +struct drm_atomic_helper_connector_hdmi_priv *
> +drm_atomic_helper_connector_hdmi_init(struct kunit *test,
> +				      unsigned int max_bpc)
> +{
> +	struct drm_atomic_helper_connector_hdmi_priv *priv;
> +	struct drm_connector *conn;
> +	struct drm_encoder *enc;
> +	struct drm_device *drm;
> +	struct device *dev;
> +	int ret;
> +
> +	dev = drm_kunit_helper_alloc_device(test);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
> +
> +	priv = drm_kunit_helper_alloc_drm_device(test, dev,
> +						 struct drm_atomic_helper_connector_hdmi_priv, drm,
> +						 DRIVER_MODESET | DRIVER_ATOMIC);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv);
> +	test->priv = priv;
> +
> +	drm = &priv->drm;
> +	priv->plane = drm_kunit_helper_create_primary_plane(test, drm,
> +							    NULL,
> +							    NULL,
> +							    NULL, 0,
> +							    NULL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->plane);
> +
> +	priv->crtc = drm_kunit_helper_create_crtc(test, drm,
> +						  priv->plane, NULL,
> +						  NULL,
> +						  NULL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->crtc);
> +
> +	enc = &priv->encoder;
> +	ret = drmm_encoder_init(drm, enc, NULL, DRM_MODE_ENCODER_TMDS, NULL);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	enc->possible_crtcs = drm_crtc_mask(priv->crtc);
> +
> +	conn = &priv->connector;
> +	ret = drmm_connector_hdmi_init(drm, conn,
> +				       &dummy_connector_funcs,
> +				       DRM_MODE_CONNECTOR_HDMIA,
> +				       NULL,
> +				       max_bpc);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	drm_connector_helper_add(conn, &dummy_connector_helper_funcs);
> +	drm_connector_attach_encoder(conn, enc);
> +
> +	drm_mode_config_reset(drm);
> +
> +	ret = set_connector_edid(test, conn,
> +				 test_edid_hdmi_1080p_rgb_max_200mhz,
> +				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_max_200mhz));
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	return priv;
> +}
> +
> +/*
> + * Test that if we change the maximum bpc property to a different value,
> + * we trigger a mode change on the connector's CRTC, which will in turn
> + * disable/enable the connector.
> + */
> +static void drm_test_check_output_bpc_crtc_mode_changed(struct kunit *test)
> +{
> +	struct drm_atomic_helper_connector_hdmi_priv *priv;
> +	struct drm_modeset_acquire_ctx *ctx;
> +	struct drm_connector_state *old_conn_state;
> +	struct drm_connector_state *new_conn_state;
> +	struct drm_crtc_state *crtc_state;
> +	struct drm_atomic_state *state;
> +	struct drm_display_mode *preferred;
> +	struct drm_connector *conn;
> +	struct drm_device *drm;
> +	struct drm_crtc *crtc;
> +	int ret;
> +
> +	priv = drm_atomic_helper_connector_hdmi_init(test, 10);
> +	KUNIT_ASSERT_NOT_NULL(test, priv);
> +
> +	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> +
> +	conn = &priv->connector;
> +	preferred = find_preferred_mode(conn);
> +	KUNIT_ASSERT_NOT_NULL(test, preferred);
> +
> +	drm = &priv->drm;
> +	crtc = priv->crtc;
> +	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
> +
> +	new_conn_state = drm_atomic_get_connector_state(state, conn);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_conn_state);
> +
> +	old_conn_state = drm_atomic_get_old_connector_state(state, conn);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, old_conn_state);
> +
> +	new_conn_state->hdmi.output_bpc = 8;
> +
> +	KUNIT_ASSERT_NE(test,
> +			old_conn_state->hdmi.output_bpc,
> +			new_conn_state->hdmi.output_bpc);
> +
> +	ret = drm_atomic_check_only(state);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	old_conn_state = drm_atomic_get_old_connector_state(state, conn);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, old_conn_state);
> +
> +	new_conn_state = drm_atomic_get_new_connector_state(state, conn);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_conn_state);
> +
> +	KUNIT_ASSERT_NE(test,
> +			old_conn_state->hdmi.output_bpc,
> +			new_conn_state->hdmi.output_bpc);
> +
> +	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
> +	KUNIT_EXPECT_TRUE(test, crtc_state->mode_changed);
> +}
> +
> +/*
> + * Test that if we set the output bpc property to the same value, we
> + * don't trigger a mode change on the connector's CRTC and leave the
> + * connector unaffected.
> + */
> +static void drm_test_check_output_bpc_crtc_mode_not_changed(struct kunit *test)
> +{
> +	struct drm_atomic_helper_connector_hdmi_priv *priv;
> +	struct drm_modeset_acquire_ctx *ctx;
> +	struct drm_connector_state *old_conn_state;
> +	struct drm_connector_state *new_conn_state;
> +	struct drm_crtc_state *crtc_state;
> +	struct drm_atomic_state *state;
> +	struct drm_display_mode *preferred;
> +	struct drm_connector *conn;
> +	struct drm_device *drm;
> +	struct drm_crtc *crtc;
> +	int ret;
> +
> +	priv = drm_atomic_helper_connector_hdmi_init(test, 10);
> +	KUNIT_ASSERT_NOT_NULL(test, priv);
> +
> +	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> +
> +	conn = &priv->connector;
> +	preferred = find_preferred_mode(conn);
> +	KUNIT_ASSERT_NOT_NULL(test, preferred);
> +
> +	drm = &priv->drm;
> +	crtc = priv->crtc;
> +	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
> +
> +	new_conn_state = drm_atomic_get_connector_state(state, conn);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_conn_state);
> +
> +	old_conn_state = drm_atomic_get_old_connector_state(state, conn);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, old_conn_state);
> +
> +	KUNIT_ASSERT_EQ(test,
> +			new_conn_state->hdmi.output_bpc,
> +			old_conn_state->hdmi.output_bpc);
> +
> +	ret = drm_atomic_check_only(state);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	old_conn_state = drm_atomic_get_old_connector_state(state, conn);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, old_conn_state);
> +
> +	new_conn_state = drm_atomic_get_new_connector_state(state, conn);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_conn_state);
> +
> +	KUNIT_EXPECT_EQ(test,
> +			old_conn_state->hdmi.output_bpc,
> +			new_conn_state->hdmi.output_bpc);
> +
> +	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
> +	KUNIT_EXPECT_FALSE(test, crtc_state->mode_changed);
> +}
> +
> +static struct kunit_case drm_atomic_helper_connector_hdmi_check_tests[] = {
> +	KUNIT_CASE(drm_test_check_output_bpc_crtc_mode_changed),
> +	KUNIT_CASE(drm_test_check_output_bpc_crtc_mode_not_changed),
> +	{ }
> +};
> +
> +static struct kunit_suite drm_atomic_helper_connector_hdmi_check_test_suite = {
> +	.name		= "drm_atomic_helper_connector_hdmi_check",
> +	.test_cases	= drm_atomic_helper_connector_hdmi_check_tests,
> +};
> +
> +/*
> + * Test that if the connector was initialised with a maximum bpc of 8,
> + * the value of the max_bpc and max_requested_bpc properties out of
> + * reset are also set to 8, and output_bpc is set to 0 and will be
> + * filled at atomic_check time.
> + */
> +static void drm_test_check_bpc_8_value(struct kunit *test)
> +{
> +	struct drm_atomic_helper_connector_hdmi_priv *priv;
> +	struct drm_connector_state *conn_state;
> +	struct drm_connector *conn;
> +
> +	priv = drm_atomic_helper_connector_hdmi_init(test, 8);
> +	KUNIT_ASSERT_NOT_NULL(test, priv);
> +
> +	conn = &priv->connector;
> +	conn_state = conn->state;
> +	KUNIT_EXPECT_EQ(test, conn_state->max_bpc, 8);
> +	KUNIT_EXPECT_EQ(test, conn_state->max_requested_bpc, 8);
> +	KUNIT_EXPECT_EQ(test, conn_state->hdmi.output_bpc, 0);
> +}
> +
> +/*
> + * Test that if the connector was initialised with a maximum bpc of 10,
> + * the value of the max_bpc and max_requested_bpc properties out of
> + * reset are also set to 10, and output_bpc is set to 0 and will be
> + * filled at atomic_check time.
> + */
> +static void drm_test_check_bpc_10_value(struct kunit *test)
> +{
> +	struct drm_atomic_helper_connector_hdmi_priv *priv;
> +	struct drm_connector_state *conn_state;
> +	struct drm_connector *conn;
> +
> +	priv = drm_atomic_helper_connector_hdmi_init(test, 10);
> +	KUNIT_ASSERT_NOT_NULL(test, priv);
> +
> +	conn = &priv->connector;
> +	conn_state = conn->state;
> +	KUNIT_EXPECT_EQ(test, conn_state->max_bpc, 10);
> +	KUNIT_EXPECT_EQ(test, conn_state->max_requested_bpc, 10);
> +	KUNIT_EXPECT_EQ(test, conn_state->hdmi.output_bpc, 0);
> +}
> +
> +/*
> + * Test that if the connector was initialised with a maximum bpc of 12,
> + * the value of the max_bpc and max_requested_bpc properties out of
> + * reset are also set to 12, and output_bpc is set to 0 and will be
> + * filled at atomic_check time.
> + */
> +static void drm_test_check_bpc_12_value(struct kunit *test)
> +{
> +	struct drm_atomic_helper_connector_hdmi_priv *priv;
> +	struct drm_connector_state *conn_state;
> +	struct drm_connector *conn;
> +
> +	priv = drm_atomic_helper_connector_hdmi_init(test, 12);
> +	KUNIT_ASSERT_NOT_NULL(test, priv);
> +
> +	conn = &priv->connector;
> +	conn_state = conn->state;
> +	KUNIT_EXPECT_EQ(test, conn_state->max_bpc, 12);
> +	KUNIT_EXPECT_EQ(test, conn_state->max_requested_bpc, 12);
> +	KUNIT_EXPECT_EQ(test, conn_state->hdmi.output_bpc, 0);
> +}
> +
> +static struct kunit_case drm_atomic_helper_connector_hdmi_reset_tests[] = {
> +	KUNIT_CASE(drm_test_check_bpc_8_value),
> +	KUNIT_CASE(drm_test_check_bpc_10_value),
> +	KUNIT_CASE(drm_test_check_bpc_12_value),
> +	{ }
> +};
> +
> +static struct kunit_suite drm_atomic_helper_connector_hdmi_reset_test_suite = {
> +	.name		= "drm_atomic_helper_connector_hdmi_reset",
> +	.test_cases 	= drm_atomic_helper_connector_hdmi_reset_tests,
> +};
> +
> +kunit_test_suites(
> +	&drm_atomic_helper_connector_hdmi_check_test_suite,
> +	&drm_atomic_helper_connector_hdmi_reset_test_suite,
> +);
> +
> +MODULE_AUTHOR("Maxime Ripard <mripard@kernel.org>");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/gpu/drm/tests/drm_kunit_edid.h b/drivers/gpu/drm/tests/drm_kunit_edid.h
> new file mode 100644
> index 000000000000..0366dd29c820
> --- /dev/null
> +++ b/drivers/gpu/drm/tests/drm_kunit_edid.h
> @@ -0,0 +1,106 @@
> +#ifndef DRM_KUNIT_EDID_H_
> +#define DRM_KUNIT_EDID_H_
> +
> +/*
> + * edid-decode (hex):
> + *
> + * 00 ff ff ff ff ff ff 00 31 d8 2a 00 00 00 00 00
> + * 00 21 01 03 81 a0 5a 78 02 00 00 00 00 00 00 00
> + * 00 00 00 20 00 00 01 01 01 01 01 01 01 01 01 01
> + * 01 01 01 01 01 01 02 3a 80 18 71 38 2d 40 58 2c
> + * 45 00 40 84 63 00 00 1e 00 00 00 fc 00 54 65 73
> + * 74 20 45 44 49 44 0a 20 20 20 00 00 00 fd 00 32
> + * 46 1e 46 0f 00 0a 20 20 20 20 20 20 00 00 00 10
> + * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 92
> + *
> + * 02 03 1b 81 e3 05 00 20 41 10 e2 00 4a 6d 03 0c
> + * 00 12 34 00 28 20 00 00 00 00 00 00 00 00 00 00
> + * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> + * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> + * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> + * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> + * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> + * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 d0
> + *
> + * ----------------
> + *
> + * Block 0, Base EDID:
> + *   EDID Structure Version & Revision: 1.3
> + *   Vendor & Product Identification:
> + *     Manufacturer: LNX
> + *     Model: 42
> + *     Made in: 2023
> + *   Basic Display Parameters & Features:
> + *     Digital display
> + *     DFP 1.x compatible TMDS
> + *     Maximum image size: 160 cm x 90 cm
> + *     Gamma: 2.20
> + *     Monochrome or grayscale display
> + *     First detailed timing is the preferred timing
> + *   Color Characteristics:
> + *     Red  : 0.0000, 0.0000
> + *     Green: 0.0000, 0.0000
> + *     Blue : 0.0000, 0.0000
> + *     White: 0.0000, 0.0000
> + *   Established Timings I & II:
> + *     DMT 0x04:   640x480    59.940476 Hz   4:3     31.469 kHz     25.175000 MHz
> + *   Standard Timings: none
> + *   Detailed Timing Descriptors:
> + *     DTD 1:  1920x1080   60.000000 Hz  16:9     67.500 kHz    148.500000 MHz (1600 mm x 900 mm)
> + *                  Hfront   88 Hsync  44 Hback  148 Hpol P
> + *                  Vfront    4 Vsync   5 Vback   36 Vpol P
> + *     Display Product Name: 'Test EDID'
> + *     Display Range Limits:
> + *       Monitor ranges (GTF): 50-70 Hz V, 30-70 kHz H, max dotclock 150 MHz
> + *     Dummy Descriptor:
> + *   Extension blocks: 1
> + * Checksum: 0x92
> + *
> + * ----------------
> + *
> + * Block 1, CTA-861 Extension Block:
> + *   Revision: 3
> + *   Underscans IT Video Formats by default
> + *   Native detailed modes: 1
> + *   Colorimetry Data Block:
> + *     sRGB
> + *   Video Data Block:
> + *     VIC  16:  1920x1080   60.000000 Hz  16:9     67.500 kHz    148.500000 MHz
> + *   Video Capability Data Block:
> + *     YCbCr quantization: No Data
> + *     RGB quantization: Selectable (via AVI Q)
> + *     PT scan behavior: No Data
> + *     IT scan behavior: Always Underscanned
> + *     CE scan behavior: Always Underscanned
> + *   Vendor-Specific Data Block (HDMI), OUI 00-0C-03:
> + *     Source physical address: 1.2.3.4
> + *     Maximum TMDS clock: 200 MHz
> + *     Extended HDMI video details:
> + * Checksum: 0xd0  Unused space in Extension Block: 100 bytes
> + */
> +static const unsigned char test_edid_hdmi_1080p_rgb_max_200mhz[] = {
> +  0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00, 0x31, 0xd8, 0x2a, 0x00,
> +  0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x01, 0x03, 0x81, 0xa0, 0x5a, 0x78,
> +  0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20,
> +  0x00, 0x00, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
> +  0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x02, 0x3a, 0x80, 0x18, 0x71, 0x38,
> +  0x2d, 0x40, 0x58, 0x2c, 0x45, 0x00, 0x40, 0x84, 0x63, 0x00, 0x00, 0x1e,
> +  0x00, 0x00, 0x00, 0xfc, 0x00, 0x54, 0x65, 0x73, 0x74, 0x20, 0x45, 0x44,
> +  0x49, 0x44, 0x0a, 0x20, 0x20, 0x20, 0x00, 0x00, 0x00, 0xfd, 0x00, 0x32,
> +  0x46, 0x00, 0x00, 0xc4, 0x00, 0x0a, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,
> +  0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x41, 0x02, 0x03, 0x1b, 0x81,
> +  0xe3, 0x05, 0x00, 0x20, 0x41, 0x10, 0xe2, 0x00, 0x4a, 0x6d, 0x03, 0x0c,
> +  0x00, 0x12, 0x34, 0x00, 0x28, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +  0x00, 0x00, 0x00, 0xd0
> +};
> +
> +#endif // DRM_KUNIT_EDID_H_

-- 
Best regards
Sui Jingfeng

