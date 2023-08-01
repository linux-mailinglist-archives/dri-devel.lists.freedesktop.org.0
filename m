Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B6F76AAEE
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 10:27:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FF7A10E34D;
	Tue,  1 Aug 2023 08:27:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58F2210E329
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 08:26:58 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3110ab7110aso5530908f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Aug 2023 01:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690878416; x=1691483216;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=+nRWq/96dxS9n2YgnBMagUisRdHMaBpUSasoWYOjHMo=;
 b=IqKMeTr3bFTNFBkho9ygyZ1jRUPbElHs+p9G1g+zG/bOf5K3a0uTrzde/Y0q6LHSoo
 VCwWFr/lstkVOMxwK6js/apwEzn9OlJUgiSdBEa/6sjFivPh6X6vEPnKb3ksf6ufhVuq
 wf8ojj3w6n3NXqP6ilVF5x9dHW+U+ev+xuDhvnInai74cehiXFB4eCrPbVSNfTuwLgxb
 OFJ7UnwemrdwCQbIo9aWNqH4XU6SdyqG9KCXLAP7iQHgRoY4RFbiHC5V/FatsjTNj/nA
 af67+uWjb/iZ8AoU+2EhKnNuVwSK1l9lEpNWWch3J8NaGFvfT2cbnjS/qkx7XjMq2Moo
 UFxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690878416; x=1691483216;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+nRWq/96dxS9n2YgnBMagUisRdHMaBpUSasoWYOjHMo=;
 b=NByzZvEOxpb5jMdKX6eBmBxn603S4I63cmg+hW5etW3hpQvDV+qe4ne+jkIP32EPBy
 BVwUp73WrTgb8eoaFnvOB52dQWGbZu7/j8jbypKycfToNrpRMeZFyn+UEmsw3+ISOMm8
 ohK9QoW3jPDX8BfWo3lW5Z7xKC14wDoH3ZIhacXsEu3VgAe815hbXWTQXv3kOyb5jBec
 18KYqT7vkysy3lbYF5uZJCpOYACoP1D5ltbgHhhNk/higXLNjAz1K3fyaAg4h3o7/KCK
 WB+I+MyJx6hNZm0yJy/KcEoLlJHOBXpRdnnVJc+kBtfsCLwBsFPLzu2qKjmx3uXevkrN
 nPZw==
X-Gm-Message-State: ABy/qLbXS/guipXzfwJEl81e+7YbBm3x0uBSf9ZPWhA9lY+00lG5YUgR
 u5+OKBfL7d4LdE++ah7JyAyL6g==
X-Google-Smtp-Source: APBJJlGzOpuW6TY0UwgTTC3QzJ1OrugfkPTBkP7S/s+Gc/Gp3RhNyBtF3IIYqFCoMFJYeSOU9t8d2w==
X-Received: by 2002:a5d:6391:0:b0:315:7d2f:fc36 with SMTP id
 p17-20020a5d6391000000b003157d2ffc36mr1790495wru.20.1690878416496; 
 Tue, 01 Aug 2023 01:26:56 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:b92a:81a9:df6e:1e3?
 ([2a01:e0a:982:cbb0:b92a:81a9:df6e:1e3])
 by smtp.gmail.com with ESMTPSA id
 s6-20020a5d6a86000000b003143add4396sm15383146wru.22.2023.08.01.01.26.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Aug 2023 01:26:55 -0700 (PDT)
Message-ID: <70875c10-9f9d-a084-d0f0-aaf80f56cb1e@linaro.org>
Date: Tue, 1 Aug 2023 10:26:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2] drm/panel: Enable DSC and CMD mode for Visionox
 VTDR6130 panel
Content-Language: en-US
To: Jessica Zhang <quic_jesszhan@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Paloma Arellano <quic_parellan@quicinc.com>
References: <20230728012623.22991-1-quic_parellan@quicinc.com>
 <CAA8EJpqPgzd4ZSP948MQW=f4EVBHxajj4nwYq5s-OConBP7Vvg@mail.gmail.com>
 <a03e4ec2-0516-7d4c-180f-e0916c83373b@quicinc.com>
Organization: Linaro Developer Services
In-Reply-To: <a03e4ec2-0516-7d4c-180f-e0916c83373b@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Reply-To: neil.armstrong@linaro.org
Cc: sam@ravnborg.org, freedreno@lists.freedesktop.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, linux-arm-msm@vger.kernel.org,
 marijn.suijten@somainline.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28/07/2023 23:44, Jessica Zhang wrote:
> 
> 
> On 7/28/2023 2:37 AM, Dmitry Baryshkov wrote:
>> On Fri, 28 Jul 2023 at 04:26, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>>>
>>> Enable display compression (DSC v1.2) and CMD mode for 1080x2400 Visionox
>>> VTDR6130 AMOLED DSI panel. In addition, this patch will set the default
>>> to command mode with DSC enabled.
>>>
>>> Note: This patch has only been validated DSC over command mode as DSC over
>>> video mode has never been validated for the MSM driver before.
>>>
>>> Depends on: "Add prepare_prev_first flag to Visionox VTDR6130" [1]
>>>
>>> Changes since v1:
>>>   - Changed from email address
>>>
>>> [1] https://patchwork.freedesktop.org/series/121337/
>>>
>>> Suggested-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
>>> ---
>>>   .../gpu/drm/panel/panel-visionox-vtdr6130.c   | 77 ++++++++++++++++++-
>>>   1 file changed, 73 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
>>> index e1363e128e7e..5658d39a3a6b 100644
>>> --- a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
>>> +++ b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
>>> @@ -9,6 +9,7 @@
>>>   #include <linux/of.h>
>>>
>>>   #include <drm/display/drm_dsc.h>
>>> +#include <drm/display/drm_dsc_helper.h>
>>>   #include <drm/drm_mipi_dsi.h>
>>>   #include <drm/drm_modes.h>
>>>   #include <drm/drm_panel.h>
>>> @@ -20,7 +21,8 @@ struct visionox_vtdr6130 {
>>>          struct mipi_dsi_device *dsi;
>>>          struct gpio_desc *reset_gpio;
>>>          struct regulator_bulk_data supplies[3];
>>> -       bool prepared;
>>> +       bool prepared, enabled;
>>> +       bool video_mode;
>>>   };
>>>
>>>   static inline struct visionox_vtdr6130 *to_visionox_vtdr6130(struct drm_panel *panel)
>>> @@ -50,12 +52,18 @@ static int visionox_vtdr6130_on(struct visionox_vtdr6130 *ctx)
>>>          if (ret)
>>>                  return ret;
>>>
>>> +       mipi_dsi_dcs_write_seq(dsi, 0x03, 0x01);
>>>          mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x20);
>>>          mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_DISPLAY_BRIGHTNESS, 0x00, 0x00);
>>>          mipi_dsi_dcs_write_seq(dsi, 0x59, 0x09);
>>>          mipi_dsi_dcs_write_seq(dsi, 0x6c, 0x01);
>>>          mipi_dsi_dcs_write_seq(dsi, 0x6d, 0x00);
>>> -       mipi_dsi_dcs_write_seq(dsi, 0x6f, 0x01);
>>> +
>>> +       if (ctx->video_mode)
>>> +               mipi_dsi_dcs_write_seq(dsi, 0x6f, 0x01);
>>> +       else
>>> +               mipi_dsi_dcs_write_seq(dsi, 0x6f, 0x02);
>>> +
>>>          mipi_dsi_dcs_write_seq(dsi, 0x70,
>>>                                 0x12, 0x00, 0x00, 0xab, 0x30, 0x80, 0x09, 0x60, 0x04,
>>>                                 0x38, 0x00, 0x28, 0x02, 0x1c, 0x02, 0x1c, 0x02, 0x00,
>>> @@ -214,6 +222,42 @@ static const struct drm_display_mode visionox_vtdr6130_mode = {
>>>          .height_mm = 157,
>>>   };
>>>
>>> +static int visionox_vtdr6130_enable(struct drm_panel *panel)
>>> +{
>>> +       struct visionox_vtdr6130 *ctx = to_visionox_vtdr6130(panel);
>>> +       struct mipi_dsi_device *dsi = ctx->dsi;
>>> +       struct drm_dsc_picture_parameter_set pps;
>>> +       int ret;
>>> +
>>> +       if (ctx->enabled)
>>> +               return 0;
>>> +
>>> +       if (!dsi->dsc) {
>>> +               dev_err(&dsi->dev, "DSC not attached to DSI\n");
>>> +               return -ENODEV;
>>> +       }
>>
>> The error message is misleading. Also, if you don't want to enable DSC
>> for the video mode, this will break.
>>
>>> +
>>> +       drm_dsc_pps_payload_pack(&pps, dsi->dsc);
>>> +       ret = mipi_dsi_picture_parameter_set(dsi, &pps);
>>> +       if (ret) {
>>> +               dev_err(&dsi->dev, "Failed to set PPS\n");
>>> +               return ret;
>>> +       }
>>> +
>>> +       ctx->enabled = true;
>>
>> Do we need this refcount just for PPS upload? What will happen if PPS
>> is uploaded several times?
>>
>>> +
>>> +       return 0;
>>> +}
>>> +
>>> +static int visionox_vtdr6130_disable(struct drm_panel *panel)
>>> +{
>>> +       struct visionox_vtdr6130 *ctx = to_visionox_vtdr6130(panel);
>>> +
>>> +       ctx->enabled = false;
>>> +
>>> +       return 0;
>>> +}
>>> +
>>>   static int visionox_vtdr6130_get_modes(struct drm_panel *panel,
>>>                                         struct drm_connector *connector)
>>>   {
>>> @@ -237,6 +281,8 @@ static const struct drm_panel_funcs visionox_vtdr6130_panel_funcs = {
>>>          .prepare = visionox_vtdr6130_prepare,
>>>          .unprepare = visionox_vtdr6130_unprepare,
>>>          .get_modes = visionox_vtdr6130_get_modes,
>>> +       .enable = visionox_vtdr6130_enable,
>>> +       .disable = visionox_vtdr6130_disable,
>>>   };
>>>
>>>   static int visionox_vtdr6130_bl_update_status(struct backlight_device *bl)
>>> @@ -269,11 +315,31 @@ static int visionox_vtdr6130_probe(struct mipi_dsi_device *dsi)
>>>   {
>>>          struct device *dev = &dsi->dev;
>>>          struct visionox_vtdr6130 *ctx;
>>> +       struct drm_dsc_config *dsc;
>>>          int ret;
>>>
>>>          ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
>>>          if (!ctx)
>>>                  return -ENOMEM;
>>> +
>>> +       ctx->video_mode = of_property_read_bool(dev->of_node, "enforce-video-mode");
>>
>> Please also add a DT bindings patch.
>>
>>> +
>>> +       dsc = devm_kzalloc(dev, sizeof(*dsc), GFP_KERNEL);
>>> +       if (!dsc)
>>> +               return -ENOMEM;
>>
>> You can add struct drm_dsc_config to struct visionox_vtdr6130 instead
>> of allocating it.
>>
>>> +
>>> +       /* Set DSC params */
>>> +       dsc->dsc_version_major = 0x1;
>>> +       dsc->dsc_version_minor = 0x2;
>>> +
>>> +       dsc->slice_height = 40;
>>> +       dsc->slice_width = 540;
>>> +       dsc->slice_count = 2;
>>> +       dsc->bits_per_component = 8;
>>> +       dsc->bits_per_pixel = 8 << 4;
>>> +       dsc->block_pred_enable = true;
>>> +
>>> +       dsi->dsc = dsc;
>>
>> Only in command mode?
> 
> Hi Dmitry,
> 
> The intention of the patch wasn't to enable DSC for only command mode.
> 
> We didn't want to limit DSC to only command mode because, while the MSM DPU driver isn't able to validate DSC on video mode, other vendors might have already validated DSC on video mode and would benefit from this patch.
> 
> FWIW, inital driver commit [1] notes that the panel is meant to work with compressed streams in general and DSC support was tob be added later on.

The panel supports Video, Video+DSC, CMD, CMD+DSC, so it would be great to be able to
select any of the supported modes, including the non-compressed ones.

So enforce-video-mode is great, but an enforce-uncompressed-mode would be necessary
aswell.

Neil

> 
> Thanks,
> 
> Jessica Zhang
> 
> [1] https://patchwork.freedesktop.org/patch/517483/?series=112369&rev=2
> 
>>
>>>
>>>          ctx->supplies[0].supply = "vddio";
>>>          ctx->supplies[1].supply = "vci";
>>> @@ -294,8 +360,11 @@ static int visionox_vtdr6130_probe(struct mipi_dsi_device *dsi)
>>>
>>>          dsi->lanes = 4;
>>>          dsi->format = MIPI_DSI_FMT_RGB888;
>>> -       dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_NO_EOT_PACKET |
>>> -                         MIPI_DSI_CLOCK_NON_CONTINUOUS;
>>> +
>>> +       dsi->mode_flags = MIPI_DSI_MODE_NO_EOT_PACKET | MIPI_DSI_CLOCK_NON_CONTINUOUS;
>>
>> Keep the line split please.
>>
>>> +       if (ctx->video_mode)
>>> +               dsi->mode_flags |= MIPI_DSI_MODE_VIDEO;
>>> +
>>>          ctx->panel.prepare_prev_first = true;
>>>
>>>          drm_panel_init(&ctx->panel, dev, &visionox_vtdr6130_panel_funcs,
>>> -- 
>>> 2.41.0
>>>
>>
>>
>> -- 
>> With best wishes
>> Dmitry

