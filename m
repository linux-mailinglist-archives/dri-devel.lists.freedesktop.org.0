Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFDB624E62
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 00:22:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C07410E118;
	Thu, 10 Nov 2022 23:22:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2CFD10E11B
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 23:22:19 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-12c8312131fso3848991fac.4
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 15:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=usp.br; s=usp-google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WTsHZbpz3r5TSBiZ8Duso7cKW7h6bP2qiZJWu5aAceg=;
 b=gA80x5Inh8pnbYQCdkgl/+QGlxZR4kAiUKQYrH1GHLjqtoSHZQZaQ6KP+Xo32TXiKa
 70fnToNyrjJcQm0lWVDGsvJtk4dap4t3sHBTUVFN5u/2Q9brkuBPPTFq+EMeFiCqYiCm
 ILPhMos9wHca7Zu/KOhXPD8ck8dQ5Vu0MgFV+Hf8v4WZN3+RBH41DRvAEuXxw7Be1CsC
 icj+TJ7fRx2oEJfUDFn05lIKhG7SVlwbcEAbVcArVNQttE8w92AZ6LLr/SdWXaVLdU84
 ErctRB8iXQuFRsKivFBFNjyqFwlKjd9EdYcIYnRMaJ5c9WVzzRCsgq88gRLAvylqxh5+
 p4RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WTsHZbpz3r5TSBiZ8Duso7cKW7h6bP2qiZJWu5aAceg=;
 b=APeHUkB1QaB2czKnbtehYR6xAYVVsStdnakEU1fVCNF230V+/aX+O06SGqK95LF8vg
 A8gySJw3jMt0PP4oHXwxiJTax8x16ia2XB+WCBLEaklb7hVqM44PkAX76XCgA1dIuJ2S
 vFI9et/cPamDdVPFgT9NLi8iJkbtcqRyKbgk+uzF1oQpVLZVpwTfsP57MhsXcAfHYqOu
 8/nTdVsJQDJE/mpjjoGUXHAyQYQZ02TW1rksl8jpEbuvDFNVVUmzdDrQfKDPw2Wzeb2Q
 QpUSA45NkEemTQ91+TRGh5ON+ZMIDPqdtgRB7hEW2sBkd2mEVhMM9PCzdlQYL3iDMkJH
 WxWg==
X-Gm-Message-State: ACrzQf1uA+g6w4Nzyr3w7Cb9kruRYVjsg81WzbGZvEvLBtNcmWf5SGd1
 +gTkHE7vPLU86jwXLxkmkePCIQ==
X-Google-Smtp-Source: AMsMyM4AP92chJNKRFJq0mHkoCSo8vs0uuTTJ15oRQLmlOVBcUQEYYqmZdvTpWjowK3JTlcJSJargw==
X-Received: by 2002:a05:6870:2e0e:b0:132:8335:64ba with SMTP id
 oi14-20020a0568702e0e00b00132833564bamr2475140oab.284.1668122538912; 
 Thu, 10 Nov 2022 15:22:18 -0800 (PST)
Received: from ?IPV6:2804:14d:8084:84c6:fe26:c42d:aab9:fa8a?
 ([2804:14d:8084:84c6:fe26:c42d:aab9:fa8a])
 by smtp.gmail.com with ESMTPSA id
 128-20020a4a0d86000000b004805b00b2cdsm283380oob.28.2022.11.10.15.22.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Nov 2022 15:22:18 -0800 (PST)
Message-ID: <cb0a7e11-da00-ee3c-bf51-c007d16550a7@usp.br>
Date: Thu, 10 Nov 2022 20:22:09 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v8 16/24] drm/modes: Introduce more named modes
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Karol Herbst
 <kherbst@redhat.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lyude Paul <lyude@redhat.com>,
 Samuel Holland <samuel@sholland.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Ben Skeggs <bskeggs@redhat.com>
References: <20220728-rpi-analog-tv-properties-v8-0-09ce1466967c@cerno.tech>
 <20220728-rpi-analog-tv-properties-v8-16-09ce1466967c@cerno.tech>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <maira.canal@usp.br>
In-Reply-To: <20220728-rpi-analog-tv-properties-v8-16-09ce1466967c@cerno.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-sunxi@lists.linux.dev,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On 11/10/22 08:07, Maxime Ripard wrote:
> Now that we can easily extend the named modes list, let's add a few more
> analog TV modes that were used in the wild, and some unit tests to make
> sure it works as intended.
> 
> Tested-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> 
> ---
> Changes in v6:
> - Renamed the tests to follow DRM test naming convention
> 
> Changes in v5:
> - Switched to KUNIT_ASSERT_NOT_NULL
> ---
>  drivers/gpu/drm/drm_modes.c                     |  2 +
>  drivers/gpu/drm/tests/drm_client_modeset_test.c | 54 +++++++++++++++++++++++++
>  2 files changed, 56 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
> index d3f0a3559812..855569a269b8 100644
> --- a/drivers/gpu/drm/drm_modes.c
> +++ b/drivers/gpu/drm/drm_modes.c
> @@ -2272,7 +2272,9 @@ struct drm_named_mode {
>  
>  static const struct drm_named_mode drm_named_modes[] = {
>  	NAMED_MODE("NTSC", 13500, 720, 480, DRM_MODE_FLAG_INTERLACE, DRM_MODE_TV_MODE_NTSC),
> +	NAMED_MODE("NTSC-J", 13500, 720, 480, DRM_MODE_FLAG_INTERLACE, DRM_MODE_TV_MODE_NTSC_J),
>  	NAMED_MODE("PAL", 13500, 720, 576, DRM_MODE_FLAG_INTERLACE, DRM_MODE_TV_MODE_PAL),
> +	NAMED_MODE("PAL-M", 13500, 720, 480, DRM_MODE_FLAG_INTERLACE, DRM_MODE_TV_MODE_PAL_M),
>  };
>  
>  static int drm_mode_parse_cmdline_named_mode(const char *name,
> diff --git a/drivers/gpu/drm/tests/drm_client_modeset_test.c b/drivers/gpu/drm/tests/drm_client_modeset_test.c
> index 768e8efb2f52..cf38e7cf0f08 100644
> --- a/drivers/gpu/drm/tests/drm_client_modeset_test.c
> +++ b/drivers/gpu/drm/tests/drm_client_modeset_test.c
> @@ -133,6 +133,32 @@ static void drm_test_pick_cmdline_named_ntsc(struct kunit *test)
>  	KUNIT_EXPECT_TRUE(test, drm_mode_equal(drm_mode_analog_ntsc_480i(drm), mode));
>  }
>  
> +static void drm_test_pick_cmdline_named_ntsc_j(struct kunit *test)
> +{
> +	struct drm_client_modeset_test_priv *priv = test->priv;
> +	struct drm_device *drm = priv->drm;
> +	struct drm_connector *connector = &priv->connector;
> +	struct drm_cmdline_mode *cmdline_mode = &connector->cmdline_mode;
> +	struct drm_display_mode *mode;
> +	const char *cmdline = "NTSC-J";
> +	int ret;
> +
> +	KUNIT_ASSERT_TRUE(test,
> +			  drm_mode_parse_command_line_for_connector(cmdline,
> +								    connector,
> +								    cmdline_mode));
> +
> +	mutex_lock(&drm->mode_config.mutex);
> +	ret = drm_helper_probe_single_connector_modes(connector, 1920, 1080);
> +	mutex_unlock(&drm->mode_config.mutex);
> +	KUNIT_ASSERT_GT(test, ret, 0);
> +
> +	mode = drm_connector_pick_cmdline_mode(connector);
> +	KUNIT_ASSERT_NOT_NULL(test, mode);
> +
> +	KUNIT_EXPECT_TRUE(test, drm_mode_equal(drm_mode_analog_ntsc_480i(drm), mode));
> +}
> +
>  static void drm_test_pick_cmdline_named_pal(struct kunit *test)
>  {
>  	struct drm_client_modeset_test_priv *priv = test->priv;
> @@ -159,10 +185,38 @@ static void drm_test_pick_cmdline_named_pal(struct kunit *test)
>  	KUNIT_EXPECT_TRUE(test, drm_mode_equal(drm_mode_analog_pal_576i(drm), mode));
>  }
>  
> +static void drm_test_pick_cmdline_named_pal_m(struct kunit *test)
> +{
> +	struct drm_client_modeset_test_priv *priv = test->priv;
> +	struct drm_device *drm = priv->drm;
> +	struct drm_connector *connector = &priv->connector;
> +	struct drm_cmdline_mode *cmdline_mode = &connector->cmdline_mode;
> +	struct drm_display_mode *mode;
> +	const char *cmdline = "PAL-M";
> +	int ret;
> +
> +	KUNIT_ASSERT_TRUE(test,
> +			  drm_mode_parse_command_line_for_connector(cmdline,
> +								    connector,
> +								    cmdline_mode));
> +
> +	mutex_lock(&drm->mode_config.mutex);
> +	ret = drm_helper_probe_single_connector_modes(connector, 1920, 1080);
> +	mutex_unlock(&drm->mode_config.mutex);
> +	KUNIT_ASSERT_GT(test, ret, 0);
> +
> +	mode = drm_connector_pick_cmdline_mode(connector);
> +	KUNIT_ASSERT_NOT_NULL(test, mode);
> +
> +	KUNIT_EXPECT_TRUE(test, drm_mode_equal(drm_mode_analog_ntsc_480i(drm), mode));
> +}
> +
>  static struct kunit_case drm_test_pick_cmdline_tests[] = {
>  	KUNIT_CASE(drm_test_pick_cmdline_res_1920_1080_60),
>  	KUNIT_CASE(drm_test_pick_cmdline_named_ntsc),
> +	KUNIT_CASE(drm_test_pick_cmdline_named_ntsc_j),
>  	KUNIT_CASE(drm_test_pick_cmdline_named_pal),
> +	KUNIT_CASE(drm_test_pick_cmdline_named_pal_m),

As the tests drm_test_pick_cmdline_named_ntsc,
drm_test_pick_cmdline_named_ntsc_j, drm_test_pick_cmdline_named_pal and
drm_test_pick_cmdline_named_pal_m follow a pretty similar structure, it
would be nice to parametrize those tests.

Best Regards,
- Maíra Canal


>  	{}
>  };
>  
> 
