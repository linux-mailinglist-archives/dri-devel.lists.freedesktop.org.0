Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEC31B155F
	for <lists+dri-devel@lfdr.de>; Mon, 20 Apr 2020 21:08:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A7616E10A;
	Mon, 20 Apr 2020 19:07:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B2AD6E10A
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 19:07:57 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id z26so11270535ljz.11
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 12:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZKq6Q8RhG/Mknjv1EO22iG+3+Ph0W9R1eR/bro3elSs=;
 b=eTgQdJ96yAD9MGh67Fz2Mpvt4RUaEAZn0Dg64jYvO5oSIh/WhYWEBImunfq/KHu7dD
 fvniThbiwsBYZKoqRbLAm+EuMp5EpEN3uUqjNNyDBTWygAKFq5QmuPujRSOrTOs05S3Z
 8ELLNt1+Y7ThGLP5r7gfvObrDf6zx8upb+Fozm4udX8fTa9OQW62VBO4EidSSobsjV0E
 k4RgOwJ47glE1wcQ4d71IyTc5kO9ajWzbbk4k1CmFOfDBWFBZrrk5jTVvAy2zfdTWTbx
 SOCtynl04DsVxsMAFFOGb2WI4deujt1VkzfYFgN0xwU63Yayg9CeXW0RPVmzsJFZGCa9
 yDLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZKq6Q8RhG/Mknjv1EO22iG+3+Ph0W9R1eR/bro3elSs=;
 b=onrpp3DJfHNbxvpqZHUXiN/SJnP9EH6pmfSj03iHqBRskk9zVRPxhmJm39XeSeXLR0
 OpL9zinYGd41IIrATyI3rtsanqqv4/mEgwbYR1/cFORTJ2VcMgoby3QXCiX2pR5Ht0hj
 RPMrhxMBWOo1khr6GtV2SKvER5zbEaZ7nNLtv2JZ4pBIS/m/4v3YExuVk0JSKucKG76e
 CAFDkeYnWgbpj3zze38roTnos5Cr6UQZexd63NLbp+Jw+9ogWY7ZxHplsDKTXsUrZEJ1
 7k8n0e8qnOP0840cEGqB/V969Dm5C0DfsPoUbsBMZVHW47OUHNQObunNOuR46npgAZcp
 t9Ag==
X-Gm-Message-State: AGi0PuavjuWIpzmwcjCWDSH57Oi4iulG6CcA2Ob/W29yrysz7Jj1DnKG
 5Sb3U9AI5qZlJywV+Q05ha/ZOXH6lAA4s2p7jNQ=
X-Google-Smtp-Source: APiQypLW+2UdJ0x7VeiX1LKbTlJvtnn3T3NW3BJKudSf2fJB1rTDEuD1N8+coV7y+K+FCVGbWmWpTJHHCskavdkVs3I=
X-Received: by 2002:a2e:7e03:: with SMTP id z3mr11116664ljc.200.1587409675138; 
 Mon, 20 Apr 2020 12:07:55 -0700 (PDT)
MIME-Version: 1.0
References: <1587406337-32317-1-git-send-email-jrdr.linux@gmail.com>
In-Reply-To: <1587406337-32317-1-git-send-email-jrdr.linux@gmail.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Mon, 20 Apr 2020 21:07:44 +0200
Message-ID: <CAMeQTsbDWopyaYbJt-T1jVUvFezQ6xtSuQhYiXpUuLP3kOeXPg@mail.gmail.com>
Subject: Re: [PATCH] drm/gma500: Remove dead code
To: Souptick Joarder <jrdr.linux@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 20, 2020 at 8:04 PM Souptick Joarder <jrdr.linux@gmail.com> wrote:
>
> These are dead code since 3.7. If there is no plan to use them further,
> these can be removed forever.

Thanks. Will apply to drm-misc-next.

Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>

>
> Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
> ---
>  drivers/gpu/drm/gma500/cdv_intel_dp.c        | 31 +--------
>  drivers/gpu/drm/gma500/cdv_intel_lvds.c      | 83 -----------------------
>  drivers/gpu/drm/gma500/mdfld_intel_display.c | 31 ---------
>  drivers/gpu/drm/gma500/psb_intel_sdvo.c      | 99 ----------------------------
>  4 files changed, 1 insertion(+), 243 deletions(-)
>
> diff --git a/drivers/gpu/drm/gma500/cdv_intel_dp.c b/drivers/gpu/drm/gma500/cdv_intel_dp.c
> index 5772b2d..a9ed372 100644
> --- a/drivers/gpu/drm/gma500/cdv_intel_dp.c
> +++ b/drivers/gpu/drm/gma500/cdv_intel_dp.c
> @@ -1271,37 +1271,8 @@ static void cdv_intel_dp_commit(struct drm_encoder *encoder)
>         return ((l >> s) & 3) << DP_TRAIN_PRE_EMPHASIS_SHIFT;
>  }
>
> -
> -#if 0
> -static char    *voltage_names[] = {
> -       "0.4V", "0.6V", "0.8V", "1.2V"
> -};
> -static char    *pre_emph_names[] = {
> -       "0dB", "3.5dB", "6dB", "9.5dB"
> -};
> -static char    *link_train_names[] = {
> -       "pattern 1", "pattern 2", "idle", "off"
> -};
> -#endif
> -
>  #define CDV_DP_VOLTAGE_MAX         DP_TRAIN_VOLTAGE_SWING_LEVEL_3
> -/*
> -static uint8_t
> -cdv_intel_dp_pre_emphasis_max(uint8_t voltage_swing)
> -{
> -       switch (voltage_swing & DP_TRAIN_VOLTAGE_SWING_MASK) {
> -       case DP_TRAIN_VOLTAGE_SWING_400:
> -               return DP_TRAIN_PRE_EMPHASIS_6;
> -       case DP_TRAIN_VOLTAGE_SWING_600:
> -               return DP_TRAIN_PRE_EMPHASIS_6;
> -       case DP_TRAIN_VOLTAGE_SWING_800:
> -               return DP_TRAIN_PRE_EMPHASIS_3_5;
> -       case DP_TRAIN_VOLTAGE_SWING_1200:
> -       default:
> -               return DP_TRAIN_PRE_EMPHASIS_0;
> -       }
> -}
> -*/
> +
>  static void
>  cdv_intel_get_adjust_train(struct gma_encoder *encoder)
>  {
> diff --git a/drivers/gpu/drm/gma500/cdv_intel_lvds.c b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
> index ea0a5d9..dffb86e 100644
> --- a/drivers/gpu/drm/gma500/cdv_intel_lvds.c
> +++ b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
> @@ -72,89 +72,6 @@ static u32 cdv_intel_lvds_get_max_backlight(struct drm_device *dev)
>         return retval;
>  }
>
> -#if 0
> -/*
> - * Set LVDS backlight level by I2C command
> - */
> -static int cdv_lvds_i2c_set_brightness(struct drm_device *dev,
> -                                       unsigned int level)
> -{
> -       struct drm_psb_private *dev_priv = dev->dev_private;
> -       struct psb_intel_i2c_chan *lvds_i2c_bus = dev_priv->lvds_i2c_bus;
> -       u8 out_buf[2];
> -       unsigned int blc_i2c_brightness;
> -
> -       struct i2c_msg msgs[] = {
> -               {
> -                       .addr = lvds_i2c_bus->slave_addr,
> -                       .flags = 0,
> -                       .len = 2,
> -                       .buf = out_buf,
> -               }
> -       };
> -
> -       blc_i2c_brightness = BRIGHTNESS_MASK & ((unsigned int)level *
> -                            BRIGHTNESS_MASK /
> -                            BRIGHTNESS_MAX_LEVEL);
> -
> -       if (dev_priv->lvds_bl->pol == BLC_POLARITY_INVERSE)
> -               blc_i2c_brightness = BRIGHTNESS_MASK - blc_i2c_brightness;
> -
> -       out_buf[0] = dev_priv->lvds_bl->brightnesscmd;
> -       out_buf[1] = (u8)blc_i2c_brightness;
> -
> -       if (i2c_transfer(&lvds_i2c_bus->adapter, msgs, 1) == 1)
> -               return 0;
> -
> -       DRM_ERROR("I2C transfer error\n");
> -       return -1;
> -}
> -
> -
> -static int cdv_lvds_pwm_set_brightness(struct drm_device *dev, int level)
> -{
> -       struct drm_psb_private *dev_priv = dev->dev_private;
> -
> -       u32 max_pwm_blc;
> -       u32 blc_pwm_duty_cycle;
> -
> -       max_pwm_blc = cdv_intel_lvds_get_max_backlight(dev);
> -
> -       /*BLC_PWM_CTL Should be initiated while backlight device init*/
> -       BUG_ON((max_pwm_blc & PSB_BLC_MAX_PWM_REG_FREQ) == 0);
> -
> -       blc_pwm_duty_cycle = level * max_pwm_blc / BRIGHTNESS_MAX_LEVEL;
> -
> -       if (dev_priv->lvds_bl->pol == BLC_POLARITY_INVERSE)
> -               blc_pwm_duty_cycle = max_pwm_blc - blc_pwm_duty_cycle;
> -
> -       blc_pwm_duty_cycle &= PSB_BACKLIGHT_PWM_POLARITY_BIT_CLEAR;
> -       REG_WRITE(BLC_PWM_CTL,
> -                 (max_pwm_blc << PSB_BACKLIGHT_PWM_CTL_SHIFT) |
> -                 (blc_pwm_duty_cycle));
> -
> -       return 0;
> -}
> -
> -/*
> - * Set LVDS backlight level either by I2C or PWM
> - */
> -void cdv_intel_lvds_set_brightness(struct drm_device *dev, int level)
> -{
> -       struct drm_psb_private *dev_priv = dev->dev_private;
> -
> -       if (!dev_priv->lvds_bl) {
> -               DRM_ERROR("NO LVDS Backlight Info\n");
> -               return;
> -       }
> -
> -       if (dev_priv->lvds_bl->type == BLC_I2C_TYPE)
> -               cdv_lvds_i2c_set_brightness(dev, level);
> -       else
> -               cdv_lvds_pwm_set_brightness(dev, level);
> -}
> -#endif
> -
>  /**
>   * Sets the backlight level.
>   *
> diff --git a/drivers/gpu/drm/gma500/mdfld_intel_display.c b/drivers/gpu/drm/gma500/mdfld_intel_display.c
> index 4fff110..aae2d35 100644
> --- a/drivers/gpu/drm/gma500/mdfld_intel_display.c
> +++ b/drivers/gpu/drm/gma500/mdfld_intel_display.c
> @@ -658,16 +658,6 @@ static int mdfld_crtc_mode_set(struct drm_crtc *crtc,
>
>         dev_dbg(dev->dev, "pipe = 0x%x\n", pipe);
>
> -#if 0
> -       if (pipe == 1) {
> -               if (!gma_power_begin(dev, true))
> -                       return 0;
> -               android_hdmi_crtc_mode_set(crtc, mode, adjusted_mode,
> -                       x, y, old_fb);
> -               goto mrst_crtc_mode_set_exit;
> -       }
> -#endif
> -
>         ret = check_fb(crtc->primary->fb);
>         if (ret)
>                 return ret;
> @@ -918,14 +908,6 @@ static int mdfld_crtc_mode_set(struct drm_crtc *crtc,
>                 }
>                 dpll = 0;
>
> -#if 0 /* FIXME revisit later */
> -               if (ksel == KSEL_CRYSTAL_19 || ksel == KSEL_BYPASS_19 ||
> -                                               ksel == KSEL_BYPASS_25)
> -                       dpll &= ~MDFLD_INPUT_REF_SEL;
> -               else if (ksel == KSEL_BYPASS_83_100)
> -                       dpll |= MDFLD_INPUT_REF_SEL;
> -#endif /* FIXME revisit later */
> -
>                 if (is_hdmi)
>                         dpll |= MDFLD_VCO_SEL;
>
> @@ -935,20 +917,7 @@ static int mdfld_crtc_mode_set(struct drm_crtc *crtc,
>                 /* compute bitmask from p1 value */
>                 dpll |= (1 << (clock.p1 - 2)) << 17;
>
> -#if 0 /* 1080p30 & 720p */
> -               dpll = 0x00050000;
> -               fp = 0x000001be;
> -#endif
> -#if 0 /* 480p */
> -               dpll = 0x02010000;
> -               fp = 0x000000d2;
> -#endif
>         } else {
> -#if 0 /*DBI_TPO_480x864*/
> -               dpll = 0x00020000;
> -               fp = 0x00000156;
> -#endif /* DBI_TPO_480x864 */ /* get from spec. */
> -
>                 dpll = 0x00800000;
>                 fp = 0x000000c1;
>         }
> diff --git a/drivers/gpu/drm/gma500/psb_intel_sdvo.c b/drivers/gpu/drm/gma500/psb_intel_sdvo.c
> index 264d7ad..68fb3d7 100644
> --- a/drivers/gpu/drm/gma500/psb_intel_sdvo.c
> +++ b/drivers/gpu/drm/gma500/psb_intel_sdvo.c
> @@ -864,36 +864,6 @@ static bool psb_intel_sdvo_set_avi_infoframe(struct psb_intel_sdvo *psb_intel_sd
>         DRM_INFO("HDMI is not supported yet");
>
>         return false;
> -#if 0
> -       struct dip_infoframe avi_if = {
> -               .type = DIP_TYPE_AVI,
> -               .ver = DIP_VERSION_AVI,
> -               .len = DIP_LEN_AVI,
> -       };
> -       uint8_t tx_rate = SDVO_HBUF_TX_VSYNC;
> -       uint8_t set_buf_index[2] = { 1, 0 };
> -       uint64_t *data = (uint64_t *)&avi_if;
> -       unsigned i;
> -
> -       intel_dip_infoframe_csum(&avi_if);
> -
> -       if (!psb_intel_sdvo_set_value(psb_intel_sdvo,
> -                                 SDVO_CMD_SET_HBUF_INDEX,
> -                                 set_buf_index, 2))
> -               return false;
> -
> -       for (i = 0; i < sizeof(avi_if); i += 8) {
> -               if (!psb_intel_sdvo_set_value(psb_intel_sdvo,
> -                                         SDVO_CMD_SET_HBUF_DATA,
> -                                         data, 8))
> -                       return false;
> -               data++;
> -       }
> -
> -       return psb_intel_sdvo_set_value(psb_intel_sdvo,
> -                                   SDVO_CMD_SET_HBUF_TXRATE,
> -                                   &tx_rate, 1);
> -#endif
>  }
>
>  static bool psb_intel_sdvo_set_tv_format(struct psb_intel_sdvo *psb_intel_sdvo)
> @@ -1227,75 +1197,6 @@ static bool psb_intel_sdvo_get_capabilities(struct psb_intel_sdvo *psb_intel_sdv
>         return true;
>  }
>
> -/* No use! */
> -#if 0
> -struct drm_connector* psb_intel_sdvo_find(struct drm_device *dev, int sdvoB)
> -{
> -       struct drm_connector *connector = NULL;
> -       struct psb_intel_sdvo *iout = NULL;
> -       struct psb_intel_sdvo *sdvo;
> -
> -       /* find the sdvo connector */
> -       list_for_each_entry(connector, &dev->mode_config.connector_list, head) {
> -               iout = to_psb_intel_sdvo(connector);
> -
> -               if (iout->type != INTEL_OUTPUT_SDVO)
> -                       continue;
> -
> -               sdvo = iout->dev_priv;
> -
> -               if (sdvo->sdvo_reg == SDVOB && sdvoB)
> -                       return connector;
> -
> -               if (sdvo->sdvo_reg == SDVOC && !sdvoB)
> -                       return connector;
> -
> -       }
> -
> -       return NULL;
> -}
> -
> -int psb_intel_sdvo_supports_hotplug(struct drm_connector *connector)
> -{
> -       u8 response[2];
> -       u8 status;
> -       struct psb_intel_sdvo *psb_intel_sdvo;
> -       DRM_DEBUG_KMS("\n");
> -
> -       if (!connector)
> -               return 0;
> -
> -       psb_intel_sdvo = to_psb_intel_sdvo(connector);
> -
> -       return psb_intel_sdvo_get_value(psb_intel_sdvo, SDVO_CMD_GET_HOT_PLUG_SUPPORT,
> -                                   &response, 2) && response[0];
> -}
> -
> -void psb_intel_sdvo_set_hotplug(struct drm_connector *connector, int on)
> -{
> -       u8 response[2];
> -       u8 status;
> -       struct psb_intel_sdvo *psb_intel_sdvo = to_psb_intel_sdvo(connector);
> -
> -       psb_intel_sdvo_write_cmd(psb_intel_sdvo, SDVO_CMD_GET_ACTIVE_HOT_PLUG, NULL, 0);
> -       psb_intel_sdvo_read_response(psb_intel_sdvo, &response, 2);
> -
> -       if (on) {
> -               psb_intel_sdvo_write_cmd(psb_intel_sdvo, SDVO_CMD_GET_HOT_PLUG_SUPPORT, NULL, 0);
> -               status = psb_intel_sdvo_read_response(psb_intel_sdvo, &response, 2);
> -
> -               psb_intel_sdvo_write_cmd(psb_intel_sdvo, SDVO_CMD_SET_ACTIVE_HOT_PLUG, &response, 2);
> -       } else {
> -               response[0] = 0;
> -               response[1] = 0;
> -               psb_intel_sdvo_write_cmd(psb_intel_sdvo, SDVO_CMD_SET_ACTIVE_HOT_PLUG, &response, 2);
> -       }
> -
> -       psb_intel_sdvo_write_cmd(psb_intel_sdvo, SDVO_CMD_GET_ACTIVE_HOT_PLUG, NULL, 0);
> -       psb_intel_sdvo_read_response(psb_intel_sdvo, &response, 2);
> -}
> -#endif
> -
>  static bool
>  psb_intel_sdvo_multifunc_encoder(struct psb_intel_sdvo *psb_intel_sdvo)
>  {
> --
> 1.9.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
