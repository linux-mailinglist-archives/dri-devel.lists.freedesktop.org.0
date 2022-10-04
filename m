Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 945BD5F4C0A
	for <lists+dri-devel@lfdr.de>; Wed,  5 Oct 2022 00:40:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99AFB10E0A8;
	Tue,  4 Oct 2022 22:40:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CE8A10E0A8
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Oct 2022 22:40:15 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id a12so6882676ljr.7
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Oct 2022 15:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date;
 bh=0PgM4RE7Ka9gaV1G1xyTNkPxoJ/6pneJjHVAFVAbx5c=;
 b=saJFEvhIooSAWR2WTc2oGrikRH7OFdCUFFM2pHt//KkWo4qOpGPgF2Q9N16Irz6NyH
 quI4/MzTFcXZcm4ZrzzDtr3N9rC3wbZf28riKbAC5p+QeFXw83Xak5sAoXzQKY4VttiB
 LPLRq7j82hYIP0ifgyr2a4E5qjDtIrXIwZfRtc1x5dNSL+3i/oQUt/H28by4gEiSdi19
 lOtVtI9sVE/HS/+zCuvbonj42KABDbacKnw2N6QtERs+babJwSN7RWAsdUwr9FvqvlyG
 98SivY9SyEhfBYeljqrzySRnM3tU1PO+qzzvOQEh9XBiXTwjkTYyiu8jnGsDnQ7pPGHU
 An4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=0PgM4RE7Ka9gaV1G1xyTNkPxoJ/6pneJjHVAFVAbx5c=;
 b=iX5CGRJAe2raq01Ue3kIdZ0u42PqZ6a6D8c0skI9hlGPDROCHONUINv7GYdpastlZ3
 IRIFPIQX4MuJAbKJa6iGmrI+BnpMgTAQKfuj1sP21qCdwC715UU/ka5LEr+jyWvbAmAC
 1GGKAmq1uESZNxPPcibM2a9HZ+5855iU/QioOUzlptlysayNzD7mjTusG/52ga/sx2ep
 lXugabZbDTzwVOVO6JgjPno7dU/sVKizIgDy9PwUJN9HJioGkX0G0rqTsX9uS/Y25uLe
 KmZ9LiNuismYj1v9kraXSYf119+CAQKC+8evgpU5mCkBeZvKOL9T+/BB+/b88iERvz7j
 9pRQ==
X-Gm-Message-State: ACrzQf12vdC+rFDdj+8TVabi8ZoWtRW/ioPhEWrEB3PIFXyeZaNAdfRu
 VFiWrJ/DUOWBnHjy321ATQx6SA==
X-Google-Smtp-Source: AMsMyM75LdxkOgh6t89p4umpJIUVw68f4ChFfdYt0wfAfze7YlBNaRl3d3glxTAI/w8aX0Kj2tutSA==
X-Received: by 2002:a05:651c:1795:b0:261:af46:9d12 with SMTP id
 bn21-20020a05651c179500b00261af469d12mr8908592ljb.122.1664923213617; 
 Tue, 04 Oct 2022 15:40:13 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 v12-20020ac258ec000000b004a25bb4494fsm304183lfo.178.2022.10.04.15.40.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Oct 2022 15:40:13 -0700 (PDT)
Message-ID: <b47e3be7-7de1-0f0c-8aa6-054e99dcaab3@linaro.org>
Date: Wed, 5 Oct 2022 01:40:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 3/5] drm/msm/dsi: Account for DSC's bits_per_pixel having
 4 fractional bits
To: Marijn Suijten <marijn.suijten@somainline.org>,
 phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Douglas Anderson <dianders@chromium.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Marek Vasut <marex@denx.de>
References: <20221001190807.358691-1-marijn.suijten@somainline.org>
 <20221001190807.358691-4-marijn.suijten@somainline.org>
 <CAA8EJppYJ-PYCsaKn=sGDpnJJdW2QBx=MOqUr6qzY0bAZtpGxA@mail.gmail.com>
 <20221004223504.vlfmxerdv47tlkdu@SoMainline.org>
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221004223504.vlfmxerdv47tlkdu@SoMainline.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/10/2022 01:35, Marijn Suijten wrote:
> On 2022-10-04 17:45:50, Dmitry Baryshkov wrote:
>> On Sat, 1 Oct 2022 at 22:08, Marijn Suijten
>> <marijn.suijten@somainline.org> wrote:
>> [..]
>>> -       bytes_in_slice = DIV_ROUND_UP(dsc->slice_width * dsc->bits_per_pixel, 8);
>>> +       bytes_in_slice = DIV_ROUND_UP(dsc->slice_width * bpp, 8);
>>
>>
>> bytes_in_slice = DIV_ROUND_UP(dsc->slice_width * dsc->bits_per_pixel, 8 * 16); ?
> 
> Not necessarily a fan of this, it "hides" the fact that we are dealing
> with 4 fractional bits (1/16th precision, it is correct though); but
> since this is the only use of `bpp` I can change it and document this
> fact wiht a comment on top (including referencing the validation pointed
> out in dsi_populate_dsc_params()).
> 
> Alternatively we can inline the `>> 4` here?

No, I don't think so. If we shift by 4 bits, we'd loose the fractional 
part. DIV_ROUND_UP( .... , 8 * 16) ensures that we round it up rather 
than just dropping it.

> 
>>>
>>>          dsc->slice_chunk_size = bytes_in_slice;
>>>
>>> @@ -913,6 +918,7 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>>>          u32 va_end = va_start + mode->vdisplay;
>>>          u32 hdisplay = mode->hdisplay;
>>>          u32 wc;
>>> +       int ret;
>>>
>>>          DBG("");
>>>
>>> @@ -948,7 +954,9 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>>>                  /* we do the calculations for dsc parameters here so that
>>>                   * panel can use these parameters
>>>                   */
>>> -               dsi_populate_dsc_params(dsc);
>>> +               ret = dsi_populate_dsc_params(dsc);
>>> +               if (ret)
>>> +                       return;
>>>
>>>                  /* Divide the display by 3 but keep back/font porch and
>>>                   * pulse width same
>>> @@ -1229,6 +1237,10 @@ static int dsi_cmd_dma_add(struct msm_dsi_host *msm_host,
>>>          if (packet.size < len)
>>>                  memset(data + packet.size, 0xff, len - packet.size);
>>>
>>> +       if (msg->type == MIPI_DSI_PICTURE_PARAMETER_SET)
>>> +               print_hex_dump(KERN_DEBUG, "ALL:", DUMP_PREFIX_NONE,
>>> +                               16, 1, data, len, false);
>>> +
>>>          if (cfg_hnd->ops->tx_buf_put)
>>>                  cfg_hnd->ops->tx_buf_put(msm_host);
>>>
>>> @@ -1786,6 +1798,12 @@ static int dsi_populate_dsc_params(struct drm_dsc_config *dsc)
>>>          int data;
>>>          int final_value, final_scale;
>>>          int i;
>>> +       int bpp = dsc->bits_per_pixel >> 4;
>>> +
>>> +       if (dsc->bits_per_pixel & 0xf) {
>>> +               pr_err("DSI does not support fractional bits_per_pixel\n");
>>> +               return -EINVAL;
>>> +       }
>>>
>>>          dsc->rc_model_size = 8192;
>>>          dsc->first_line_bpg_offset = 12;
>>> @@ -1807,7 +1825,7 @@ static int dsi_populate_dsc_params(struct drm_dsc_config *dsc)
>>>          }
>>>
>>>          dsc->initial_offset = 6144; /* Not bpp 12 */
>>> -       if (dsc->bits_per_pixel != 8)
>>> +       if (bpp != 8)
>>>                  dsc->initial_offset = 2048;     /* bpp = 12 */
>>>
>>>          mux_words_size = 48;            /* bpc == 8/10 */
>>> @@ -1830,16 +1848,16 @@ static int dsi_populate_dsc_params(struct drm_dsc_config *dsc)
>>>           * params are calculated
>>>           */
>>>          groups_per_line = DIV_ROUND_UP(dsc->slice_width, 3);
>>> -       dsc->slice_chunk_size = dsc->slice_width * dsc->bits_per_pixel / 8;
>>> -       if ((dsc->slice_width * dsc->bits_per_pixel) % 8)
>>> +       dsc->slice_chunk_size = dsc->slice_width * bpp / 8;
>>> +       if ((dsc->slice_width * bpp) % 8)
>>
>> One can use fixed point math here too:
>>
>> dsc->slice_chunk_size = (dsc->slice_width * dsc->bits_per_pixel  + 8 *
>> 16 - 1)/ (8 * 16);
> 
> Good catch, this is effectively a DIV_ROUND_UP() that we happened to
> call bytes_in_slice above...
> 
> Shall I tackle this in the same patch, or insert another cleanup patch?

It's up to you. I usually prefer separate patches, even if just to ease 
bisecting between unrelated changes.

> 
> In fact dsi_populate_dsc_params() is called first (this comment),
> followed by dsi_update_dsc_timing(), meaning that slice_chunk_size is
> already provided and shouldn't be recomputed.
> 
>>>                  dsc->slice_chunk_size++;
>>>
>>>          /* rbs-min */
>>>          min_rate_buffer_size =  dsc->rc_model_size - dsc->initial_offset +
>>> -                               dsc->initial_xmit_delay * dsc->bits_per_pixel +
>>> +                               dsc->initial_xmit_delay * bpp +
>>>                                  groups_per_line * dsc->first_line_bpg_offset;
>>>
>>> -       hrd_delay = DIV_ROUND_UP(min_rate_buffer_size, dsc->bits_per_pixel);
>>> +       hrd_delay = DIV_ROUND_UP(min_rate_buffer_size, bpp);
>>>
>>>          dsc->initial_dec_delay = hrd_delay - dsc->initial_xmit_delay;
>>>
>>> @@ -1862,7 +1880,7 @@ static int dsi_populate_dsc_params(struct drm_dsc_config *dsc)
>>>          data = 2048 * (dsc->rc_model_size - dsc->initial_offset + num_extra_mux_bits);
>>>          dsc->slice_bpg_offset = DIV_ROUND_UP(data, groups_total);
>>>
>>> -       target_bpp_x16 = dsc->bits_per_pixel * 16;
>>> +       target_bpp_x16 = bpp * 16;
>>>
>>>          data = (dsc->initial_xmit_delay * target_bpp_x16) / 16;
>>
>> It looks like this can be replaced with the direct multiplication
>> instead, maybe with support for overflow/rounding.
> 
> Thanks, Abhinav pointed out the same in patch 1/5 which originally
> cleaned up most - but apparently not all! - of the math here.  I don't
> think this value should ever overlow, nor does this `* 16 / 16` have any
> effect on rounding (that'd be `/ 16 * 16`).

Ack

> 
>>>          final_value =  dsc->rc_model_size - data + num_extra_mux_bits;
>>> --
>>> 2.37.3
>>>
>>
>>
>> -- 
>> With best wishes
>> Dmitry

-- 
With best wishes
Dmitry

