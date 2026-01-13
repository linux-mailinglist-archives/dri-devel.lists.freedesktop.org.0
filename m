Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CD2D1760E
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 09:50:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40D9C10E474;
	Tue, 13 Jan 2026 08:50:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dnEnfPTM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB5EA10E474
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 08:50:15 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-432d2c7dd52so3718618f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 00:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768294214; x=1768899014; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=btYBQPxGZ6/zTkhNRnpWbOMv4rzD+TuRmul2jGF/OfU=;
 b=dnEnfPTMro8+ZHESqjTYiIqw/A5GcNOuc84E63/mLU2kk4qXFTRNO82+JXzhFZbrZP
 jnEbPgT0oWdbD4KWzKgmtvno6RmrENoQOinOqAu/kgHa6rkPJTTQZujxJ5DZb+cqbqiq
 qrhtkEeEC+yvOjRqav/yJrGpJDT5YGCS7nbjB1rRvoJZyi8TVRCgc0vMd4nzwSRCzLgT
 r1DV6EZHe54NKzZKhUb9uwB97KHhRSzto54SSNb2lqkLEUidVeGcNAMMwIOW3Cy3pVw7
 uzsHqtky/xpEsXjUB91qg9fBbsWR82TL1w0XrKAzrSAGxwDEc0kcPB9XeJYY8OP42f+V
 eV2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768294214; x=1768899014;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=btYBQPxGZ6/zTkhNRnpWbOMv4rzD+TuRmul2jGF/OfU=;
 b=r7gPGREOCxtukad45pHaLuYk9BlujRNf4023Gf9SlnWDF3/yKrUZohVw0AjFOYjkG2
 inIwvADAIR1QEe1YNckxo0iAWF/Ey7Mi2Bk3Ar0qzHDRUZTTK1dPebz2kvFIL2+1MdyF
 l1/vY9OILk/zXTvqq+lPMDpE20geEu+OsK84nDO19/MehyLFTG8xIUq7n9F3hLBLUETT
 fYIuCcX1qPcHOkH+zGetct6w6lBiWT0a3ouC/ZbxxMKBE0YfLgDlL8ymeQdBfUjS+w3p
 w56CPDXmY2Qv+WeOt81clZl0NNr/ZCZ0jv8iTOxNxdPQG8vsU6216hVUOs93ImAoDFvD
 WQvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUc4rTLsQx89R+1bX1z2XaYT+qma0pN1hDtlTw1ou+8PiLIcq2l/LLJtW6yRBJhIfoLLTlsxcWlVLs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywv1KHKCE1+g3C8AA3vvrH+/mN/aSanTfWjNYxSBN4PHbURR+/k
 YfqubAGeW2yWrRrmFTNL1C9yDIy5i8Zj4YP3nvkw9Qs7lDynWqP8/3hpsGVwlBkdKjw=
X-Gm-Gg: AY/fxX7nFpxwSBOWeAN6PrSgnwWNnXOVwDoSioHyudYIm16rmoQ7IreEW6TwRD9Jilt
 VmWt8jSBiI+iKfx8O2pa8K/s1EkOoElS4VIHKUfA9LzgYzJhJWcDwvoOgIK1gzgz/DTdFsedaRe
 +Ja4YNuID7U4BiTAmHDc13BC6VhacgsmbG2/ubwySW8xAdoIMuEzqO0z64kcGMjdhVYn/J0y5sU
 txm2Uuce5PfBILP4tGHNjRambt0R1e3AQ4kXjHlAw0VM8LvvwDtVGxA3yGplp603XIqsjV/SRsL
 HYwXDHZYOmOSIOFE+tTCa7qciobzQfqVQhOhVHWvgYhv8GjoQ32yIu0az8rWeFZ8JvIBZ5Lqzhf
 ovEVjlvuPBBw4qo//BuszNOCLt/wHvfPoqn38Gi/ielFNgoyoae5q08g2ZaDyQI13DVTtp51pyR
 o7NMwHJLFSU8X8Zq4LHesYeTLvNAfxvUF3m7NVARQ=
X-Google-Smtp-Source: AGHT+IE+MQbkpYrvA0T2ZzGjjsds5XFNW4TeVrgSjdmTMTa+faZuX0qzbNC2EWiMZ4q5qzjkCGlbyQ==
X-Received: by 2002:a05:6000:184a:b0:430:ff8b:fdc2 with SMTP id
 ffacd0b85a97d-432c37a9a6amr22821175f8f.60.1768294213934; 
 Tue, 13 Jan 2026 00:50:13 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080::fa42:7768?
 ([2a01:e0a:3d9:2080::fa42:7768]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd5ff0b2sm42889241f8f.42.2026.01.13.00.50.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jan 2026 00:50:13 -0800 (PST)
Message-ID: <6fcc46b7-2e22-471e-a26a-c0c79f2bdc40@linaro.org>
Date: Tue, 13 Jan 2026 09:50:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH RESEND] drm/panel: ilitek-ili9882t: Switch Tianma
 TL121BVMS07 to DSC 120Hz mode
To: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>,
 jesszhan0024@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dianders@chromium.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251216075530.1966327-1-yelangyan@huaqin.corp-partner.google.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20251216075530.1966327-1-yelangyan@huaqin.corp-partner.google.com>
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/16/25 08:55, Langyan Ye wrote:
> Migrate the TL121BVMS07 panel from non-DSC 60 Hz to DSC-enabled 120 Hz,
> including updated init sequence, DSC configuration, and display timings.
> 
> Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
> ---
>   drivers/gpu/drm/panel/panel-ilitek-ili9882t.c | 147 ++++++++++++++++--
>   1 file changed, 136 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c b/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
> index c52f20863fc7..370424ddfc80 100644
> --- a/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
> @@ -8,6 +8,8 @@
>   #include <linux/of.h>
>   #include <linux/regulator/consumer.h>
>   
> +#include <drm/display/drm_dsc.h>
> +#include <drm/display/drm_dsc_helper.h>
>   #include <drm/drm_connector.h>
>   #include <drm/drm_crtc.h>
>   #include <drm/drm_mipi_dsi.h>
> @@ -15,6 +17,8 @@
>   
>   #include <video/mipi_display.h>
>   
> +#define DSC_BPG_OFFSET(x)	((u8)((x) & DSC_RANGE_BPG_OFFSET_MASK))
> +
>   struct ili9882t;
>   
>   /*
> @@ -23,6 +27,7 @@ struct ili9882t;
>    */
>   struct panel_desc {
>   	const struct drm_display_mode *modes;
> +	const struct drm_dsc_config *dsc;
>   	unsigned int bpc;
>   
>   	/**
> @@ -52,6 +57,8 @@ struct ili9882t {
>   	struct regulator *avee;
>   	struct regulator *avdd;
>   	struct gpio_desc *enable_gpio;
> +
> +	struct drm_dsc_config dsc;
>   };
>   
>   /* ILI9882-specific commands, add new commands as you decode them */
> @@ -68,6 +75,67 @@ struct ili9882t {
>   	mipi_dsi_dcs_write_seq_multi(ctx, IL79900A_DCS_SWITCH_PAGE, \
>   				     0x5a, 0xa5, (page))
>   
> +static const struct drm_dsc_config tianma_il79900a_dsc = {
> +	.dsc_version_major = 1,
> +	.dsc_version_minor = 2,
> +	.slice_height = 8,
> +	.slice_width = 800,
> +	.slice_count = 2,
> +	.bits_per_component = 8,
> +	.bits_per_pixel = 8 << 4,
> +	.block_pred_enable = true,
> +	.native_420 = false,
> +	.native_422 = false,
> +	.simple_422 = false,
> +	.vbr_enable = false,
> +	.rc_model_size = DSC_RC_MODEL_SIZE_CONST,
> +	.pic_width = 1600,
> +	.pic_height = 2560,
> +	.convert_rgb = 0,
> +	.vbr_enable = 0,
> +	.rc_buf_thresh = {14, 28, 42, 56, 70, 84, 98, 105, 112, 119, 121, 123, 125, 126},
> +	.rc_model_size = DSC_RC_MODEL_SIZE_CONST,
> +	.rc_edge_factor = DSC_RC_EDGE_FACTOR_CONST,
> +	.rc_tgt_offset_high = DSC_RC_TGT_OFFSET_HI_CONST,
> +	.rc_tgt_offset_low = DSC_RC_TGT_OFFSET_LO_CONST,
> +	.mux_word_size = DSC_MUX_WORD_SIZE_8_10_BPC,
> +	.line_buf_depth = 9,
> +	.first_line_bpg_offset = 12,
> +	.initial_xmit_delay = 512,
> +	.initial_offset = 6144,
> +	.rc_quant_incr_limit0 = 11,
> +	.rc_quant_incr_limit1 = 11,
> +	.nfl_bpg_offset = 1402,
> +	.rc_range_params = {
> +		{ 0,  4, DSC_BPG_OFFSET(2)},
> +		{ 0,  4, DSC_BPG_OFFSET(0)},
> +		{ 1,  5, DSC_BPG_OFFSET(0)},
> +		{ 1,  6, DSC_BPG_OFFSET(-2)},
> +		{ 3,  7, DSC_BPG_OFFSET(-4)},
> +		{ 3,  7, DSC_BPG_OFFSET(-6)},
> +		{ 3,  7, DSC_BPG_OFFSET(-8)},
> +		{ 3,  8, DSC_BPG_OFFSET(-8)},
> +		{ 3,  9, DSC_BPG_OFFSET(-8)},
> +		{ 3, 10, DSC_BPG_OFFSET(-10)},
> +		{ 5, 10, DSC_BPG_OFFSET(-10)},
> +		{ 5, 11, DSC_BPG_OFFSET(-12)},
> +		{ 5, 11, DSC_BPG_OFFSET(-12)},
> +		{ 9, 12, DSC_BPG_OFFSET(-12)},
> +		{12, 13, DSC_BPG_OFFSET(-12)},
> +	},
> +	.initial_scale_value = 32,
> +	.slice_chunk_size = 800,
> +	.initial_dec_delay = 657,
> +	.final_offset = 4320,
> +	.scale_increment_interval = 222,
> +	.scale_decrement_interval = 11,
> +	.initial_scale_value = 32,
> +	.nfl_bpg_offset = 3511,
> +	.slice_bpg_offset = 2179,
> +	.flatness_max_qp = 12,
> +	.flatness_min_qp = 3,
> +};
> +
>   static int starry_ili9882t_init(struct ili9882t *ili)
>   {
>   	struct mipi_dsi_multi_context ctx = { .dsi = ili->dsi };
> @@ -423,22 +491,72 @@ static int starry_ili9882t_init(struct ili9882t *ili)
>   static int tianma_il79900a_init(struct ili9882t *ili)
>   {
>   	struct mipi_dsi_multi_context ctx = { .dsi = ili->dsi };
> +	struct drm_dsc_picture_parameter_set pps;
>   
>   	mipi_dsi_usleep_range(&ctx, 5000, 5100);
>   
>   	il79900a_switch_page(&ctx, 0x06);
>   	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3e, 0x62);
>   
> +	il79900a_switch_page(&ctx, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb0, 0x00);
> +
>   	il79900a_switch_page(&ctx, 0x02);
> -	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1b, 0x20);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1b, 0x00);
>   	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5d, 0x00);
>   	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5e, 0x40);
>   
> +	il79900a_switch_page(&ctx, 0x05);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0X9e, 0xe9);
> +
>   	il79900a_switch_page(&ctx, 0x07);
> -	mipi_dsi_dcs_write_seq_multi(&ctx, 0X29, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0X29, 0x01);
> +
> +	il79900a_switch_page(&ctx, 0x17);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x12, 0x00,
> +				     0x00, 0x89, 0x30, 0x80, 0x0a, 0x00, 0x06, 0x40, 0x00,
> +				     0x08, 0x03, 0x20, 0x03, 0x20, 0x02, 0x00, 0x02, 0x91,
> +				     0x00, 0x20, 0x00, 0xde, 0x00, 0x0b, 0x00, 0x0c, 0x0d,
> +				     0xb7, 0x08, 0x83, 0x18, 0x00, 0x10, 0xe0, 0x03, 0x0c,
> +				     0x20, 0x00, 0x06, 0x0b, 0x0b, 0x33, 0x0e, 0x1c, 0x2a,
> +				     0x38, 0x46, 0x54, 0x62, 0x69, 0x70, 0x77, 0x79, 0x7b,
> +				     0x7d, 0x7e, 0x01, 0x02, 0x01, 0x00, 0x09, 0x40, 0x09,
> +				     0xbe, 0x19, 0xfc, 0x19, 0xfa, 0x19, 0xf8, 0x1a, 0x38,
> +				     0x1a, 0x78, 0x1a, 0xb6, 0x2a, 0xb6, 0x2a, 0xf4, 0x2a,
> +				     0xf4, 0x4b, 0x34, 0x63, 0x74);
>   
>   	il79900a_switch_page(&ctx, 0x06);
> -	mipi_dsi_dcs_write_seq_multi(&ctx, 0x92, 0x22);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0x91, 0x45);
> +
> +	il79900a_switch_page(&ctx, 0x16);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0x03, 0x4b);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0x04, 0x73);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0x05, 0xdf);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0x00, 0x01);
> +
> +	il79900a_switch_page(&ctx, 0x10);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0x12, 0x8c);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0x14, 0x3c);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0x15, 0x3d);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1d, 0xfc);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0x25, 0x9d);
> +
> +	il79900a_switch_page(&ctx, 0x0e);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xc0, 0x18);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2a, 0x0e);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0x38, 0xcd);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0x80, 0x53);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0x81, 0x0e);
> +
> +	il79900a_switch_page(&ctx, 0x1e);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0x61, 0x5c);
> +
> +	drm_dsc_pps_payload_pack(&pps, &tianma_il79900a_dsc);
> +
> +	mipi_dsi_picture_parameter_set_multi(&ctx, &pps);
> +
> +	mipi_dsi_compression_mode_ext_multi(&ctx, true,
> +					    MIPI_DSI_COMPRESSION_DSC, 1);
>   
>   	il79900a_switch_page(&ctx, 0x00);
>   	mipi_dsi_dcs_exit_sleep_mode_multi(&ctx);
> @@ -447,9 +565,9 @@ static int tianma_il79900a_init(struct ili9882t *ili)
>   
>   	mipi_dsi_dcs_set_display_on_multi(&ctx);
>   
> -	mipi_dsi_msleep(&ctx, 80);
> +	mipi_dsi_msleep(&ctx, 20);
>   
> -	return 0;
> +	return ctx.accum_err;
>   };
>   
>   static inline struct ili9882t *to_ili9882t(struct drm_panel *panel)
> @@ -569,15 +687,15 @@ static const struct drm_display_mode starry_ili9882t_default_mode = {
>   };
>   
>   static const struct drm_display_mode tianma_il79900a_default_mode = {
> -	.clock = 264355,
> +	.clock = 543850,
>   	.hdisplay = 1600,
>   	.hsync_start = 1600 + 20,
> -	.hsync_end = 1600 + 20 + 4,
> -	.htotal = 1600 + 20 + 4 + 20,
> +	.hsync_end = 1600 + 20 + 2,
> +	.htotal = 1600 + 20 + 2 + 20,
>   	.vdisplay = 2560,
> -	.vsync_start = 2560 + 82,
> -	.vsync_end = 2560 + 82 + 2,
> -	.vtotal = 2560 + 82 + 2 + 36,
> +	.vsync_start = 2560 + 62,
> +	.vsync_end = 2560 + 62 + 2,
> +	.vtotal = 2560 + 62 + 2 + 136,
>   	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
>   };
>   
> @@ -597,6 +715,7 @@ static const struct panel_desc starry_ili9882t_desc = {
>   
>   static const struct panel_desc tianma_tl121bvms07_desc = {
>   	.modes = &tianma_il79900a_default_mode,
> +	.dsc = &tianma_il79900a_dsc,
>   	.bpc = 8,
>   	.size = {
>   		.width_mm = 163,
> @@ -716,6 +835,12 @@ static int ili9882t_probe(struct mipi_dsi_device *dsi)
>   	dsi->mode_flags = desc->mode_flags;
>   	ili->desc = desc;
>   	ili->dsi = dsi;
> +
> +	if (desc->dsc) {
> +		ili->dsc = *desc->dsc;
> +		dsi->dsc = &ili->dsc;
> +	}
> +
>   	ret = ili9882t_add(ili);
>   	if (ret < 0)
>   		return ret;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
