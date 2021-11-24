Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C2F45C9FD
	for <lists+dri-devel@lfdr.de>; Wed, 24 Nov 2021 17:27:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A51A86EA1E;
	Wed, 24 Nov 2021 16:27:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E85BF6EA1E
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 16:27:23 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id l7so6668409lja.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 08:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EZa37FHey3/1Rg/hOIu6aLGUem+HE7jKO3BHC2Y3N0k=;
 b=u1PnXNrdCxmjQI0QdbMCH8oYrdeehQqa65VUjKvrEua9/G/uyE9/sXJmNaSz4wK8M1
 T+NLgY+QrSBrmNp8cGtW4LnFnJnsuR2X1mX6tPN2st8fwy84gLfJzR9E8tMD1ONotuxn
 EXLUF8eQq/citxLdlT0FwY0rfYhl8XCpOAFb0iYpxtMZDMErqCYeMbDKFBwCirQseFKv
 IRfuepadQZx0tg2TGXmkL/TYKkDOcj9HgEZHGeN/8M5Vq6pbRYSCagoZDgTHwwIGNgeC
 2SnswQmIAC3pwhu1fFWEgIvDgd6R0aaOFyeVhiGKG23x9jXBM3/wZmzxAGtu5FyFDHzs
 fdLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EZa37FHey3/1Rg/hOIu6aLGUem+HE7jKO3BHC2Y3N0k=;
 b=UKAw3MSEBNQ1oJmqoVPpUd9RrX821F0hymCxmyMH+y0zbtxDTehoTgi5rzP2njJ5zp
 TOXotev0tdbdsObXmoRJSiC62qmXp8r3EVDxAVyHiju2D1WcCiNuF+krnZbiiYfO47bG
 Vl2035SHYjrkrKWO8uVGpaQ/U+W9uGApRmnQp+hSmRmc/UmR66RubeBvan7kVAtseZ6L
 BJ+1SOmPdh4Lzy6cjXhFCrcZDk8SNzs+qX8sP8gWyJmAMmUj9ePNeUDm+eZX6nlGlD35
 sjo6k0zXpV4HbiUmwoSjrEhznMW38BfVeMlcsLxRo2XoxXmrzAXWjtws75rMr4S8Bv7k
 J/kw==
X-Gm-Message-State: AOAM5316+D5l9+xdyOXs6HEojC7d1/XuWFuRLgP7/xSI0AUBSLZIngFa
 I62qk+I0CgwFxNIT+bDNicIWnw==
X-Google-Smtp-Source: ABdhPJx3xNwJns6eQkBJ5GNnDR3LB7KaFdgEHS9nwhOP3QaznjG/GLhJd3lUkK6ZcbA3KLrhQddumw==
X-Received: by 2002:a2e:b802:: with SMTP id u2mr16718877ljo.261.1637771242210; 
 Wed, 24 Nov 2021 08:27:22 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id o15sm25836lfk.175.2021.11.24.08.27.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Nov 2021 08:27:21 -0800 (PST)
Subject: Re: [PATCH v3 12/13] drm/msm/dsi: Add support for DSC configuration
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Rob Clark <robdclark@gmail.com>
References: <20211116062256.2417186-1-vkoul@kernel.org>
 <20211116062256.2417186-13-vkoul@kernel.org>
 <fc9885b3-1fdc-3036-4c82-4de37649420d@linaro.org>
Message-ID: <f6a35461-9ab1-ed36-2937-0ff93008fd62@linaro.org>
Date: Wed, 24 Nov 2021 19:27:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <fc9885b3-1fdc-3036-4c82-4de37649420d@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: Jonathan Marek <jonathan@marek.ca>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/11/2021 19:21, Dmitry Baryshkov wrote:
> On 16/11/2021 09:22, Vinod Koul wrote:
>> When DSC is enabled, we need to configure DSI registers accordingly and
>> configure the respective stream compression registers.
>>
>> Add support to calculate the register setting based on DSC params and
>> timing information and configure these registers.
>>
>> Signed-off-by: Vinod Koul <vkoul@kernel.org>
>> ---
>>   drivers/gpu/drm/msm/dsi/dsi.xml.h  |  10 +++
>>   drivers/gpu/drm/msm/dsi/dsi_host.c | 113 ++++++++++++++++++++++++++++-
>>   2 files changed, 122 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi.xml.h 
>> b/drivers/gpu/drm/msm/dsi/dsi.xml.h
>> index 49b551ad1bff..c1c85df58c4b 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi.xml.h
>> +++ b/drivers/gpu/drm/msm/dsi/dsi.xml.h
>> @@ -706,4 +706,14 @@ static inline uint32_t DSI_VERSION_MAJOR(uint32_t 
>> val)
>>   #define REG_DSI_CPHY_MODE_CTRL                    0x000002d4
>> +#define REG_DSI_VIDEO_COMPRESSION_MODE_CTRL            0x0000029c
>> +
>> +#define REG_DSI_VIDEO_COMPRESSION_MODE_CTRL2            0x000002a0
>> +
>> +#define REG_DSI_COMMAND_COMPRESSION_MODE_CTRL            0x000002a4
>> +
>> +#define REG_DSI_COMMAND_COMPRESSION_MODE_CTRL2            0x000002a8
>> +
>> +#define REG_DSI_COMMAND_COMPRESSION_MODE_CTRL3            0x000002ac
>> +
>>   #endif /* DSI_XML */
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c 
>> b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> index 31d385d8d834..2c14c36f0b3d 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> @@ -908,6 +908,20 @@ static void dsi_ctrl_config(struct msm_dsi_host 
>> *msm_host, bool enable,
>>           dsi_write(msm_host, REG_DSI_CPHY_MODE_CTRL, BIT(0));
>>   }
>> +static int dsi_dsc_update_pic_dim(struct msm_display_dsc_config *dsc,
>> +                  int pic_width, int pic_height)
>> +{
>> +    if (!dsc || !pic_width || !pic_height) {
>> +        pr_err("DSI: invalid input: pic_width: %d pic_height: %d\n", 
>> pic_width, pic_height);
>> +        return -EINVAL;
>> +    }
>> +
>> +    dsc->drm->pic_width = pic_width;
>> +    dsc->drm->pic_height = pic_height;
>> +
>> +    return 0;
>> +}
>> +
>>   static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool 
>> is_bonded_dsi)
>>   {
>>       struct drm_display_mode *mode = msm_host->mode;
>> @@ -940,7 +954,68 @@ static void dsi_timing_setup(struct msm_dsi_host 
>> *msm_host, bool is_bonded_dsi)
>>           hdisplay /= 2;
>>       }
>> +    if (msm_host->dsc) {
>> +        struct msm_display_dsc_config *dsc = msm_host->dsc;
>> +
>> +        /* update dsc params with timing params */
>> +        dsi_dsc_update_pic_dim(dsc, mode->hdisplay, mode->vdisplay);
>> +        DBG("Mode Width- %d x Height %d\n", dsc->drm->pic_width, 
>> dsc->drm->pic_height);
>> +
>> +        /* we do the calculations for dsc parameters here so that
>> +         * panel can use these parameters
>> +         */
>> +        dsi_populate_dsc_params(dsc);
>> +
>> +        /* Divide the display by 3 but keep back/font porch and
>> +         * pulse width same
>> +         */
>> +        h_total -= hdisplay;
>> +        hdisplay /= 3;
>> +        h_total += hdisplay;
>> +        ha_end = ha_start + hdisplay;
>> +    }
>> +
>>       if (msm_host->mode_flags & MIPI_DSI_MODE_VIDEO) {
>> +        if (msm_host->dsc) {
>> +            struct msm_display_dsc_config *dsc = msm_host->dsc;
>> +            u32 reg, intf_width, slice_per_intf;
>> +            u32 total_bytes_per_intf;
>> +
>> +            /* first calculate dsc parameters and then program
>> +             * compress mode registers
>> +             */
>> +            intf_width = hdisplay;
>> +            slice_per_intf = DIV_ROUND_UP(intf_width, 
>> dsc->drm->slice_width);
>> +
>> +            dsc->drm->slice_count = 1;
>> +            dsc->bytes_in_slice = DIV_ROUND_UP(dsc->drm->slice_width 
>> * 8, 8);
>> +            total_bytes_per_intf = dsc->bytes_in_slice * slice_per_intf;
>> +
>> +            dsc->eol_byte_num = total_bytes_per_intf % 3;
>> +            dsc->pclk_per_line =  DIV_ROUND_UP(total_bytes_per_intf, 3);
>> +            dsc->bytes_per_pkt = dsc->bytes_in_slice * 
>> dsc->drm->slice_count;
>> +            dsc->pkt_per_line = slice_per_intf / dsc->drm->slice_count;
>> +
>> +            reg = dsc->bytes_per_pkt << 16;
>> +            reg |= (0x0b << 8);    /* dtype of compressed image */
>> +
>> +            /* pkt_per_line:
>> +             * 0 == 1 pkt
>> +             * 1 == 2 pkt
>> +             * 2 == 4 pkt
>> +             * 3 pkt is not supported
>> +             * above translates to ffs() - 1
>> +             */
>> +            reg |= (ffs(dsc->pkt_per_line) - 1) << 6;
>> +
>> +            dsc->eol_byte_num = total_bytes_per_intf % 3;
>> +            reg |= dsc->eol_byte_num << 4;
>> +            reg |= 1;
>> +
>> +            dsi_write(msm_host,
>> +                  REG_DSI_VIDEO_COMPRESSION_MODE_CTRL, reg);
>> +        }
>> +
>>           dsi_write(msm_host, REG_DSI_ACTIVE_H,
>>               DSI_ACTIVE_H_START(ha_start) |
>>               DSI_ACTIVE_H_END(ha_end));
>> @@ -959,8 +1034,40 @@ static void dsi_timing_setup(struct msm_dsi_host 
>> *msm_host, bool is_bonded_dsi)
>>               DSI_ACTIVE_VSYNC_VPOS_START(vs_start) |
>>               DSI_ACTIVE_VSYNC_VPOS_END(vs_end));
>>       } else {        /* command mode */
>> +        if (msm_host->dsc) {
>> +            struct msm_display_dsc_config *dsc = msm_host->dsc;
>> +            u32 reg, reg_ctrl, reg_ctrl2;
>> +            u32 slice_per_intf, bytes_in_slice, total_bytes_per_intf;
>> +
>> +            reg_ctrl = dsi_read(msm_host, 
>> REG_DSI_COMMAND_COMPRESSION_MODE_CTRL);
>> +            reg_ctrl2 = dsi_read(msm_host, 
>> REG_DSI_COMMAND_COMPRESSION_MODE_CTRL2);
>> +
>> +            slice_per_intf = DIV_ROUND_UP(hdisplay, 
>> dsc->drm->slice_width);
>> +            bytes_in_slice = DIV_ROUND_UP(dsc->drm->slice_width *
>> +                              dsc->drm->bits_per_pixel, 8);
>> +            dsc->drm->slice_chunk_size = bytes_in_slice;
>> +            total_bytes_per_intf = dsc->bytes_in_slice * slice_per_intf;
>> +            dsc->pkt_per_line = slice_per_intf / dsc->drm->slice_count;
>> +
>> +            reg = 0x39 << 8;
>> +            reg |= ffs(dsc->pkt_per_line) << 6;
>> +
>> +            dsc->eol_byte_num = total_bytes_per_intf % 3;
>> +            reg |= dsc->eol_byte_num << 4;
>> +            reg |= 1;
>> +
>> +            reg_ctrl |= reg;
>> +            reg_ctrl2 |= bytes_in_slice;
>> +
>> +            dsi_write(msm_host, 
>> REG_DSI_COMMAND_COMPRESSION_MODE_CTRL, reg);
>> +            dsi_write(msm_host, 
>> REG_DSI_COMMAND_COMPRESSION_MODE_CTRL2, reg_ctrl2);
>> +        }
>> +
>>           /* image data and 1 byte write_memory_start cmd */
>> -        wc = hdisplay * dsi_get_bpp(msm_host->format) / 8 + 1;
>> +        if (!msm_host->dsc)
>> +            wc = hdisplay * dsi_get_bpp(msm_host->format) / 8 + 1;
>> +        else
>> +            wc = mode->hdisplay / 2 + 1;
>>           dsi_write(msm_host, REG_DSI_CMD_MDP_STREAM0_CTRL,
>>               DSI_CMD_MDP_STREAM0_CTRL_WORD_COUNT(wc) |
>> @@ -2051,9 +2158,13 @@ int msm_dsi_host_modeset_init(struct 
>> mipi_dsi_host *host,
>>   {
>>       struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
>>       const struct msm_dsi_cfg_handler *cfg_hnd = msm_host->cfg_hnd;
>> +    struct msm_drm_private *priv;
>>       int ret;
>>       msm_host->dev = dev;
>> +    priv = dev->dev_private;
>> +    priv->dsc = msm_host->dsc;
> 
> I have been thinking about this piece. I highly dislike the priv->dsc 
> field for multiple reasons.
> 
> Please correct me if I'm wrong, we use it for several reasons:
> - to check if DSC is requested at all
> - to store the dsc_mask
> 
> The DSC mask should be calculated basing on dpu_encoder_virt->hw_dsc[] 
> values, so it can be removed from msm_display_dsc_config.
> 
> To check whether DSC is enabled, I'd suggest the following:
> 
> - Add use_dsc flag to struct msm_display_info.
>    This way it would be generic to all possible encoders which can use DSC.
> 
> - Add struct msm_dsi_has_dsc_panel() function.
>    It checks whether msm_host has ->dsc data. Feel free to change the 
> name of the function to better suit your style.
> 
> - Call msm_dsi_has_dsc_panel() from _dpu_kms_initialize_dsi().
>    If DSC is requested, set info->use_dsc.
> 
> - In dpu_encoder_setup store use_dsc in struct dpu_encoder_virt() and 
> use it later instead of checking priv->dsc.

I forgot about the patch 2, which actually uses priv->dsc data. The 
overall idea would be the same, get data pointer from msm_dsi and pass 
it through the msm_display_info.

> 
> WDYT?
> 
> 
>> +
>>       ret = cfg_hnd->ops->tx_buf_alloc(msm_host, SZ_4K);
>>       if (ret) {
>>           pr_err("%s: alloc tx gem obj failed, %d\n", __func__, ret);
>>
> 
> 


-- 
With best wishes
Dmitry
