Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8768CD8D0
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 19:01:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8134E10EE9E;
	Thu, 23 May 2024 17:01:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="TIapE6M4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com
 [91.218.175.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAFC610EE9E
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 17:01:01 +0000 (UTC)
X-Envelope-To: mripard@kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1716483657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ykz7CSuGmpReMbjY7aKYP//JpEBEa/0nSh28NBFDVBU=;
 b=TIapE6M4VUR7Mt+IBvSqJF4eYiwgBL6E2freRulFfb573/OkGC3cBsleiVjezpU5O/LrP1
 lRF020YJrwQKFpNZM4J2r08fzzaqgUokU/PkR35D1Lbg9EMnRwmevbPlHxGv4TRzSSQohy
 zFuraMMuvLnJMAiiys++zLk/KyyzzFk=
X-Envelope-To: maarten.lankhorst@linux.intel.com
X-Envelope-To: tzimmermann@suse.de
X-Envelope-To: airlied@gmail.com
X-Envelope-To: daniel@ffwll.ch
X-Envelope-To: corbet@lwn.net
X-Envelope-To: hjc@rock-chips.com
X-Envelope-To: heiko@sntech.de
X-Envelope-To: wens@csie.org
X-Envelope-To: jernej.skrabec@gmail.com
X-Envelope-To: samuel@sholland.org
X-Envelope-To: andy.yan@rock-chips.com
X-Envelope-To: hverkuil@xs4all.nl
X-Envelope-To: sebastian.wick@redhat.com
X-Envelope-To: ville.syrjala@linux.intel.com
X-Envelope-To: dri-devel@lists.freedesktop.org
X-Envelope-To: linux-arm-kernel@lists.infradead.org
X-Envelope-To: linux-doc@vger.kernel.org
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: linux-media@vger.kernel.org
X-Envelope-To: linux-rockchip@lists.infradead.org
X-Envelope-To: linux-sunxi@lists.linux.dev
X-Envelope-To: dave.stevenson@raspberrypi.com
Message-ID: <1e47e26f-948b-43d1-8d9f-a15e06e816f6@linux.dev>
Date: Fri, 24 May 2024 01:00:47 +0800
MIME-Version: 1.0
Subject: Re: [v14,06/28] drm/tests: Add output bpc tests
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
 linux-sunxi@lists.linux.dev, Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20240521-kms-hdmi-connector-state-v14-6-51950db4fedb@kernel.org>
Content-Language: en-US, en-AU
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20240521-kms-hdmi-connector-state-v14-6-51950db4fedb@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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

Hi, Maxime


I love you patch, yet it generates warnning calltrace. Despite it's
just a warning but it can overwhelm when we run kunit tests. Hence,
I suggest switch to the drm_atomic_connector_get_property() function.

Logs are pasted as below for easier to ready.


  ------------[ cut here ]------------
  WARNING: CPU: 3 PID: 1264 at drivers/gpu/drm/drm_mode_object.c:354 
drm_object_property_get_value+0x2c/0x34
  Modules linked in: drm_connector_test drm_display_helper 
drm_kunit_helpers kunit rfkill ip_set nf_tables nfnetlink vfat fat uas 
usb_storage kvm efi_pstore pstore spi_loongson_pci spi_loongson_core 
fuse efivarfs [last unloaded: drm_connector_test]
  CPU: 3 PID: 1264 Comm: kunit_try_catch Tainted: G                 N 
6.9.0+ #443
  Hardware name: Loongson 
Loongson-3A6000-HV-7A2000-XA61200/Loongson-3A6000-HV-7A2000-XA61200, 
BIOS Loongson-UDK2018-V4.0.05636-stable202311 12/
  pc 9000000003469fec ra ffff80000225afdc tp 900000011fc54000 sp 
900000011fc57d80
  a0 900000010aa84658 a1 9000000104432a00 a2 900000011fc57d98 a3 
900000011fc57d98
  a4 9000000104432a4c a5 9000000003f14e98 a6 0000000000000008 a7 
fffffffffffffffe
  t0 0000000000000010 t1 900000010aa84000 t2 ffffffffffffffff t3 
ffffffffc0c0c0c0
  t4 ffffffffc0c0c0c0 t5 0000000000000220 t6 0000000000000001 t7 
0000000000107203
  t8 0000000000107303 u0 0000000000000008 s9 90000001000ebe60 s0 
900000010aa84000
  s1 90000001470679c8 s2 9000000104432a00 s3 ffff800002284000 s4 
900000010aa84658
  s5 900000010aa84618 s6 0000000000001000 s7 0000000000000001 s8 
0000000000000000
     ra: ffff80000225afdc drm_test_connector_hdmi_init_bpc_8+0xcc/0x2d0 
[drm_connector_test]
    ERA: 9000000003469fec drm_object_property_get_value+0x2c/0x34
   CRMD: 000000b0 (PLV0 -IE -DA +PG DACF=CC DACM=CC -WE)
   PRMD: 00000004 (PPLV0 +PIE -PWE)
   EUEN: 00000000 (-FPE -SXE -ASXE -BTE)
   ECFG: 00071c1c (LIE=2-4,10-12 VS=7)
  ESTAT: 000c0000 [BRK] (IS= ECode=12 EsubCode=0)
   PRID: 0014d000 (Loongson-64bit, Loongson-3A6000-HV)
  CPU: 3 PID: 1264 Comm: kunit_try_catch Tainted: G                 N 
6.9.0+ #443
  Hardware name: Loongson 
Loongson-3A6000-HV-7A2000-XA61200/Loongson-3A6000-HV-7A2000-XA61200, 
BIOS Loongson-UDK2018-V4.0.05636-stable202311 12/
  Stack : 9000000004065000 0000000000000000 9000000002ac339c 
900000011fc54000
          900000011fc579f0 900000011fc579f8 0000000000000000 
900000011fc57b38
          900000011fc57b30 900000011fc57b30 900000011fc57940 
0000000000000001
          0000000000000001 900000011fc579f8 18e7bf3ffb6e59df 
9000000100328a00
          0000000000000001 0000000000000003 0000000000000434 
4c206e6f73676e6f
          6f4c203a656d616e 00000000000d0ad3 000000000704c000 
90000001000ebe60
          0000000000000000 0000000000000000 9000000003ee6ab0 
9000000004065000
          0000000000000000 900000010aa84618 0000000000001000 
0000000000000001
          0000000000000000 0000000000000000 9000000002ac33b4 
000055557dd80078
          00000000000000b0 0000000000000004 0000000000000000 
0000000000071c1c
          ...
  Call Trace:
  [<9000000002ac33b4>] show_stack+0x5c/0x180
  [<9000000003b1ed2c>] dump_stack_lvl+0x70/0xa0
  [<9000000003b01fd8>] __warn+0x84/0xc8
  [<9000000003ad282c>] report_bug+0x19c/0x204
  [<9000000003b1fe00>] do_bp+0x264/0x2b4
  [<0000000000000000>] 0x0
  [<9000000003469fec>] drm_object_property_get_value+0x2c/0x34
  [<ffff80000225afdc>] drm_test_connector_hdmi_init_bpc_8+0xcc/0x2d0 
[drm_connector_test]
  [<ffff800002214f3c>] kunit_try_run_case+0x7c/0x18c [kunit]
  [<ffff800002216de8>] kunit_generic_run_threadfn_adapter+0x1c/0x28 [kunit]
  [<9000000002b06238>] kthread+0x124/0x130
  [<9000000002ac1248>] ret_from_kernel_thread+0xc/0xa4

  ---[ end trace 0000000000000000 ]---
  ------------[ cut here ]------------


On 5/21/24 18:13, Maxime Ripard wrote:
> Now that we're tracking the output bpc count in the connector state,
> let's add a few tests to make sure it works as expected.
> 
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/Kconfig                            |   1 +
>   drivers/gpu/drm/tests/Makefile                     |   1 +
>   drivers/gpu/drm/tests/drm_connector_test.c         | 140 +++++++
>   drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 438 +++++++++++++++++++++
>   drivers/gpu/drm/tests/drm_kunit_edid.h             | 106 +++++
>   5 files changed, 686 insertions(+)
> 

[...]

> +
> +/*
> + * Test that the registration of a connector with a maximum bpc count of
> + * 8 succeeds, registers the max bpc property, but doesn't register the
> + * HDR output metadata one.
> + */
> +static void drm_test_connector_hdmi_init_bpc_8(struct kunit *test)
> +{
> +	struct drm_connector_init_priv *priv = test->priv;
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
> +	ret = drm_object_property_get_value(&connector->base, prop, &val);


Maybe we should switch to drm_atomic_connector_get_property() instead,
as the comments of the drm_object_property_get_value() told us that
atomic drivers should never call this function directly, otherwise it
will print warnings and call trace.

> +	KUNIT_EXPECT_EQ(test, ret, 0);
> +	KUNIT_EXPECT_EQ(test, val, 8);
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
> +	ret = drm_object_property_get_value(&connector->base, prop, &val);

Ditto

> +	KUNIT_EXPECT_EQ(test, ret, 0);
> +	KUNIT_EXPECT_EQ(test, val, 10);
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
> +	ret = drm_object_property_get_value(&connector->base, prop, &val);

ret = drm_atomic_connector_get_property(connector,
  connector->state, prop, &val);

Note that this function is not exported, but I think you could export it
just like what you did in the patch 02. Thank you for the amazing works.

> +	KUNIT_EXPECT_EQ(test, ret, 0);
> +	KUNIT_EXPECT_EQ(test, val, 12);
> +
> +	prop = priv->drm.mode_config.hdr_output_metadata_property;
> +	KUNIT_ASSERT_NOT_NULL(test, prop);
> +	KUNIT_EXPECT_NOT_NULL(test, drm_mode_obj_find_prop_id(&connector->base, prop->base.id));
> +}
> +

-- 
Best regards
Sui
