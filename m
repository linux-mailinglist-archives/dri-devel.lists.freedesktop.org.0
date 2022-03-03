Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 441BD4CB924
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 09:35:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EC7610EF56;
	Thu,  3 Mar 2022 08:35:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D0ED10EF56
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 08:35:27 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id u1so6551391wrg.11
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Mar 2022 00:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=I1B6ygUReaJp7qNNX9Q2LucZAvkyncinrYhRNb5+1rU=;
 b=6fowOsS6R5dDBoWI0BrhDgO1A/21Hd5ZzHOKHFHyg0D14bHar1d3swvRVlNRpEtdWV
 JWqLvCrfYE1hTjX4D7e39b+Ucixrb8QVUqMVuvXTjiYYBApUlIPArGgZqt0RbG+L3S+R
 nvflxNAGF0zYggUMytc9n/XDhUYYo1fVZtwJEZTEXPzShul9DxEL80jlfMyKSTKy7pUQ
 gxvD7CkWaYKdh5AeiChKpmeFjVO81a3Nw2d/8jx6KiIlobZPrJVpwfhdW8rQOxs1DJuV
 Pl7w1ukzMdIc0Mad+93hMZc5Hp/y9MZO/auuw8zkV3mc+Y5wGTeiy5N5cPo23kVw11l3
 FicQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=I1B6ygUReaJp7qNNX9Q2LucZAvkyncinrYhRNb5+1rU=;
 b=M9AslMJmECv6Qxb93E2mDu7I7mIVdhDL9ln+QSiKVHTg7Taulba9cHbKueky2ax/1s
 EwVi/CbpfUNJmCLtXHVetL8sgtqDcAiQxwgP2mMUEBHUBT0vnRt7FnvgEAJORKPcksz2
 f0IHvNHU9gchiPge4/6jfQLJqwVUHB/fWSXoJqtQmVcBotAhw4F/ExzwmyU6YVIKoV+l
 wpqr5mU+PYYQTmScE9MmIWh/bUTR6wYpDdxUGG3Cm1q72fnH1D6LFFRmub3y59sTnC3U
 LpzC9Eg310Q8TDqY1ejNtWebMa60QtRFXuZALlc4ZiDUhdV1CnAV1DPaVvH3Islk73XV
 P68w==
X-Gm-Message-State: AOAM530+KJLZzBfYVmuhASS6Fh+3ax5cx/YwEGEBtXBQ50HoubbS/OuN
 rNqnO/McJ+zh3IxQNaZQAdklJg==
X-Google-Smtp-Source: ABdhPJzTrarHRkrM5BCXd1lKPH7mYkrTOni9PYJDoym7DKV1ujIjisxPBc9ROXR+9FXYqC+ZdVBFKg==
X-Received: by 2002:a05:6000:1846:b0:1ea:7f4d:c56f with SMTP id
 c6-20020a056000184600b001ea7f4dc56fmr25707189wri.25.1646296525414; 
 Thu, 03 Mar 2022 00:35:25 -0800 (PST)
Received: from ?IPV6:2001:861:44c0:66c0:37d4:6d61:9015:27a5?
 ([2001:861:44c0:66c0:37d4:6d61:9015:27a5])
 by smtp.gmail.com with ESMTPSA id
 q23-20020a1cf317000000b003815206a638sm8311491wmq.15.2022.03.03.00.35.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Mar 2022 00:35:25 -0800 (PST)
Message-ID: <3625b23b-9718-640a-1aac-0b30773a26ab@baylibre.com>
Date: Thu, 3 Mar 2022 09:35:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v16 4/4] drm/bridge: dw-hdmi: fix bus formats negotiation
 for 8 bit modes
Content-Language: en-US
To: "H. Nikolaus Schaller" <hns@goldelico.com>
References: <cover.1645895582.git.hns@goldelico.com>
 <169afe64b4985c3f420177cd6f4e1e72feeb2449.1645895582.git.hns@goldelico.com>
 <5da069b6-8a99-79c2-109c-c85715165857@baylibre.com>
 <E0D3B7E8-0C8D-4119-8267-0556AB921B24@goldelico.com>
 <fca28594-8d4e-dd2f-93a0-a052cb888d90@baylibre.com>
 <75CBD357-577A-402D-9E3B-DBE82A84BC43@goldelico.com>
 <4cb08b5d-c1ec-f2b4-a107-63a771146ec0@baylibre.com>
 <598F3A49-9CE2-4C59-95D4-CDA888A3B3BF@goldelico.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <598F3A49-9CE2-4C59-95D4-CDA888A3B3BF@goldelico.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Paul Boddie <paul@boddie.org.uk>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 linux-mips <linux-mips@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Paul Cercueil <paul@crapouillou.net>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 02/03/2022 23:24, H. Nikolaus Schaller wrote:
> Hi Neil,
> 
>> Am 02.03.2022 um 15:34 schrieb Neil Armstrong <narmstrong@baylibre.com>:
>>
>> Hi,
>>
>>> (cross-checked: RGB mode still works if I force hdmi->sink_is_hdmi = false)
>>
>> I don't understand what's wrong, can you try to make the logic select MEDIA_BUS_FMT_YUV8_1X24 instead of DRM_COLOR_FORMAT_YCBCR422 ?
> 
> I have forced hdmi->sink_is_hdmi = false and replaced
> 
>   	/* Default 8bit RGB fallback */
> -	output_fmts[i++] = MEDIA_BUS_FMT_RGB888_1X24;
> +	output_fmts[i++] = MEDIA_BUS_FMT_YUV8_1X24;
> 
> And then screen remains black. MEDIA_BUS_FMT_RGB888_1X24 works.
> (MEDIA_BUS_FMT_VUY8_1X24 doesn't work either).
> 
> So this indicates that YUV conversion is not working properly. Maybe missing some special
> setup.
> 
> What I have to test if it works on a different monitor. Not that this specific panel
> (a 7 inch waveshare touch with HDMIinput) is buggy and reports YUV capabilities
> but does not handle them...
> 
> On the other hand this panel works on RasPi and OMAP5 (where I admit I do not know in
> which mode).

Pretty sure they don't support YUV HDMI output.

If you can try on a certified HDMI devices like a TV, it would here figuring out where comes the issue.

> 
>> If your CSC is broken, we'll need to disable it on your platform.
> 
> Indeed.
> 
> So it seems as if we need a mechanism to overwrite dw_hdmi_bridge_atomic_get_output_bus_fmts()
> in our ingenic-dw-hdmi platform specialization [1] to always return MEDIA_BUS_FMT_RGB888_1X24.
> 
> Or alternatively set sink_is_hdmi = false there (unfortunately there is no direct access to
> struct dw_hdmi in a specialization drivers).
> 
> Is this already possible or how can it be done?

It's not handled yet, but we may add the logic to handle the lack of CSC config bit and
add a glue config bit to override this like we already did for CEC.

I wrote an initial support to disable CSC (only compile-tested), could you try on your platform with setting disable_csc = 1 in your dw-hdmi glue code ?

================><=======================================
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 54d8fdad395f..d345166a69aa 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -158,6 +158,8 @@ struct dw_hdmi {
  	struct hdmi_data_info hdmi_data;
  	const struct dw_hdmi_plat_data *plat_data;

+	bool csc_available;		/* indicates if the CSC engine is usable */
+
  	int vic;

  	u8 edid[HDMI_EDID_LEN];
@@ -1009,9 +1011,10 @@ static int is_color_space_interpolation(struct dw_hdmi *hdmi)

  static bool is_csc_needed(struct dw_hdmi *hdmi)
  {
-	return is_color_space_conversion(hdmi) ||
-	       is_color_space_decimation(hdmi) ||
-	       is_color_space_interpolation(hdmi);
+	return hdmi->csc_available &&
+	       (is_color_space_conversion(hdmi) ||
+	        is_color_space_decimation(hdmi) ||
+	        is_color_space_interpolation(hdmi));
  }

  static void dw_hdmi_update_csc_coeffs(struct dw_hdmi *hdmi)
@@ -1064,6 +1067,9 @@ static void hdmi_video_csc(struct dw_hdmi *hdmi)
  	int interpolation = HDMI_CSC_CFG_INTMODE_DISABLE;
  	int decimation = 0;

+	if (!hdmi->csc_available)
+		return;
+
  	/* YCC422 interpolation to 444 mode */
  	if (is_color_space_interpolation(hdmi))
  		interpolation = HDMI_CSC_CFG_INTMODE_CHROMA_INT_FORMULA1;
@@ -2663,6 +2669,7 @@ static u32 *dw_hdmi_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
  					u32 output_fmt,
  					unsigned int *num_input_fmts)
  {
+	struct dw_hdmi *hdmi = bridge->driver_private;
  	u32 *input_fmts;
  	unsigned int i = 0;

@@ -2681,62 +2688,81 @@ static u32 *dw_hdmi_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
  	/* 8bit */
  	case MEDIA_BUS_FMT_RGB888_1X24:
  		input_fmts[i++] = MEDIA_BUS_FMT_RGB888_1X24;
-		input_fmts[i++] = MEDIA_BUS_FMT_YUV8_1X24;
-		input_fmts[i++] = MEDIA_BUS_FMT_UYVY8_1X16;
+		if (hdmi->csc_available) {
+			input_fmts[i++] = MEDIA_BUS_FMT_YUV8_1X24;
+			input_fmts[i++] = MEDIA_BUS_FMT_UYVY8_1X16;
+		}
  		break;
  	case MEDIA_BUS_FMT_YUV8_1X24:
  		input_fmts[i++] = MEDIA_BUS_FMT_YUV8_1X24;
-		input_fmts[i++] = MEDIA_BUS_FMT_UYVY8_1X16;
-		input_fmts[i++] = MEDIA_BUS_FMT_RGB888_1X24;
+		if (hdmi->csc_available) {
+			input_fmts[i++] = MEDIA_BUS_FMT_UYVY8_1X16;
+			input_fmts[i++] = MEDIA_BUS_FMT_RGB888_1X24;
+		}
  		break;
  	case MEDIA_BUS_FMT_UYVY8_1X16:
  		input_fmts[i++] = MEDIA_BUS_FMT_UYVY8_1X16;
-		input_fmts[i++] = MEDIA_BUS_FMT_YUV8_1X24;
-		input_fmts[i++] = MEDIA_BUS_FMT_RGB888_1X24;
+		if (hdmi->csc_available) {
+			input_fmts[i++] = MEDIA_BUS_FMT_YUV8_1X24;
+			input_fmts[i++] = MEDIA_BUS_FMT_RGB888_1X24;
+		}
  		break;

  	/* 10bit */
  	case MEDIA_BUS_FMT_RGB101010_1X30:
  		input_fmts[i++] = MEDIA_BUS_FMT_RGB101010_1X30;
-		input_fmts[i++] = MEDIA_BUS_FMT_YUV10_1X30;
-		input_fmts[i++] = MEDIA_BUS_FMT_UYVY10_1X20;
+		if (hdmi->csc_available) {
+			input_fmts[i++] = MEDIA_BUS_FMT_YUV10_1X30;
+			input_fmts[i++] = MEDIA_BUS_FMT_UYVY10_1X20;
+		}
  		break;
  	case MEDIA_BUS_FMT_YUV10_1X30:
  		input_fmts[i++] = MEDIA_BUS_FMT_YUV10_1X30;
-		input_fmts[i++] = MEDIA_BUS_FMT_UYVY10_1X20;
-		input_fmts[i++] = MEDIA_BUS_FMT_RGB101010_1X30;
+		if (hdmi->csc_available) {
+			input_fmts[i++] = MEDIA_BUS_FMT_UYVY10_1X20;
+			input_fmts[i++] = MEDIA_BUS_FMT_RGB101010_1X30;
+		}
  		break;
  	case MEDIA_BUS_FMT_UYVY10_1X20:
  		input_fmts[i++] = MEDIA_BUS_FMT_UYVY10_1X20;
-		input_fmts[i++] = MEDIA_BUS_FMT_YUV10_1X30;
-		input_fmts[i++] = MEDIA_BUS_FMT_RGB101010_1X30;
+		if (hdmi->csc_available) {
+			input_fmts[i++] = MEDIA_BUS_FMT_YUV10_1X30;
+			input_fmts[i++] = MEDIA_BUS_FMT_RGB101010_1X30;
+		}
  		break;

  	/* 12bit */
  	case MEDIA_BUS_FMT_RGB121212_1X36:
  		input_fmts[i++] = MEDIA_BUS_FMT_RGB121212_1X36;
-		input_fmts[i++] = MEDIA_BUS_FMT_YUV12_1X36;
-		input_fmts[i++] = MEDIA_BUS_FMT_UYVY12_1X24;
+		if (hdmi->csc_available) {
+			input_fmts[i++] = MEDIA_BUS_FMT_YUV12_1X36;
+			input_fmts[i++] = MEDIA_BUS_FMT_UYVY12_1X24;
+		}
  		break;
  	case MEDIA_BUS_FMT_YUV12_1X36:
  		input_fmts[i++] = MEDIA_BUS_FMT_YUV12_1X36;
-		input_fmts[i++] = MEDIA_BUS_FMT_UYVY12_1X24;
-		input_fmts[i++] = MEDIA_BUS_FMT_RGB121212_1X36;
+		if (hdmi->csc_available) {
+			input_fmts[i++] = MEDIA_BUS_FMT_UYVY12_1X24;
+			input_fmts[i++] = MEDIA_BUS_FMT_RGB121212_1X36;
+		}
  		break;
  	case MEDIA_BUS_FMT_UYVY12_1X24:
  		input_fmts[i++] = MEDIA_BUS_FMT_UYVY12_1X24;
-		input_fmts[i++] = MEDIA_BUS_FMT_YUV12_1X36;
-		input_fmts[i++] = MEDIA_BUS_FMT_RGB121212_1X36;
+		if (hdmi->csc_available) {
+			input_fmts[i++] = MEDIA_BUS_FMT_YUV12_1X36;
+			input_fmts[i++] = MEDIA_BUS_FMT_RGB121212_1X36;
+		}
  		break;

  	/* 16bit */
  	case MEDIA_BUS_FMT_RGB161616_1X48:
  		input_fmts[i++] = MEDIA_BUS_FMT_RGB161616_1X48;
-		input_fmts[i++] = MEDIA_BUS_FMT_YUV16_1X48;
+		if (hdmi->csc_available)
+			input_fmts[i++] = MEDIA_BUS_FMT_YUV16_1X48;
  		break;
  	case MEDIA_BUS_FMT_YUV16_1X48:
-		input_fmts[i++] = MEDIA_BUS_FMT_YUV16_1X48;
-		input_fmts[i++] = MEDIA_BUS_FMT_RGB161616_1X48;
+		if (hdmi->csc_available)
+			input_fmts[i++] = MEDIA_BUS_FMT_YUV16_1X48;
  		break;

  	/*YUV 4:2:0 */
@@ -2765,15 +2791,24 @@ static int dw_hdmi_bridge_atomic_check(struct drm_bridge *bridge,
  {
  	struct dw_hdmi *hdmi = bridge->driver_private;

-	hdmi->hdmi_data.enc_out_bus_format =
-			bridge_state->output_bus_cfg.format;
+	if (!hdmi->csc_available &&
+	    bridge_state->output_bus_cfg.format != bridge_state->input_bus_cfg.format) {
+		dev_warn(hdmi->dev, "different input format 0x%04x & output format 0x%04x while CSC isn't usable, fallback to safe format\n",
+			 bridge_state->input_bus_cfg.format,
+			 bridge_state->output_bus_cfg.format);
+		hdmi->hdmi_data.enc_out_bus_format = MEDIA_BUS_FMT_FIXED;
+		hdmi->hdmi_data.enc_in_bus_format = MEDIA_BUS_FMT_FIXED;
+	} else {
+		hdmi->hdmi_data.enc_out_bus_format =
+				bridge_state->output_bus_cfg.format;

-	hdmi->hdmi_data.enc_in_bus_format =
-			bridge_state->input_bus_cfg.format;
+		hdmi->hdmi_data.enc_in_bus_format =
+				bridge_state->input_bus_cfg.format;

-	dev_dbg(hdmi->dev, "input format 0x%04x, output format 0x%04x\n",
-		bridge_state->input_bus_cfg.format,
-		bridge_state->output_bus_cfg.format);
+		dev_dbg(hdmi->dev, "input format 0x%04x, output format 0x%04x\n",
+			bridge_state->input_bus_cfg.format,
+			bridge_state->output_bus_cfg.format);
+	}

  	return 0;
  }
@@ -3479,6 +3514,9 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
  		hdmi->cec = platform_device_register_full(&pdevinfo);
  	}

+	/* Get CSC useability from config0 register and permit override for platforms */
+	hdmi->csc_available = !plat_data->disable_csc || (config0 & HDMI_CONFIG0_CSC);
+
  	drm_bridge_add(&hdmi->bridge);

  	return hdmi;
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h
index 1999db05bc3b..279722e4d189 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h
@@ -541,6 +541,7 @@ enum {

  /* CONFIG0_ID field values */
  	HDMI_CONFIG0_I2S = 0x10,
+	HDMI_CONFIG0_CSC = 0x04,
  	HDMI_CONFIG0_CEC = 0x02,

  /* CONFIG1_ID field values */
diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
index 2a1f85f9a8a3..b2f689cbe864 100644
--- a/include/drm/bridge/dw_hdmi.h
+++ b/include/drm/bridge/dw_hdmi.h
@@ -157,6 +157,7 @@ struct dw_hdmi_plat_data {
  			     unsigned long mpixelclock);

  	unsigned int disable_cec : 1;
+	unsigned int disable_csc : 1;
  };

  struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
=================><==============================================================

Neil

> 
> BR and thanks,
> Nikolaus
> 
> [1]: https://lore.kernel.org/all/24a27226a22adf5f5573f013e5d7d89b0ec73664.1645895582.git.hns@goldelico.com/

