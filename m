Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC6F962BE4
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 17:17:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09BA910E583;
	Wed, 28 Aug 2024 15:17:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="y9ZJquIi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C10910E584
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 15:17:25 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-429e29933aaso57935455e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 08:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724858244; x=1725463044; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=gng1ZgMc5S3va5Tba/oPrz8hBvroXYB6sfW0lPcnX0k=;
 b=y9ZJquIiQWip0eP9URRRno//NFJJHkDO2EclvBqkzG61XS7PECD4ablijBk33nwyK2
 Gb9pyxw5fR4D08kNlfjWREjJHYc/krRebMoz2CigaKYjTTZz36XrOeVo6IXsOlMAJhf6
 MKOOEBfUa4mFcHHhNKrTN0EA5WFpyDdueVXgRAw/5ekel3QvN8c1Sxz/RXEPtzJzjh4R
 xZ/HN2MmHaBw4/qVJC7/1mRwpffvIfMXWi3McCmn6YsCXHEW5Z67sKUQA6sgaoGPiNKK
 TWLztbshY6JhlNluOSB1mUzqumDgvpI/zQujACAbvvL1eO1IFKXtFsDy0s5IH0OieNse
 XyeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724858244; x=1725463044;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=gng1ZgMc5S3va5Tba/oPrz8hBvroXYB6sfW0lPcnX0k=;
 b=XpOv58np2Yalb8K+kiU5j7ioupvwMEikK7tIwtp3Y9wf+YKL9vpeaGXQs7RMBKmcE6
 rRxWGRVl1rzJtINm+/kxVX1ubPB8kC7KGfAmSXE0OSgFM5iQ+YpI9P4FKalzpjPIajbY
 gnW8TrRdV2k9Ht7GwNhwSHbApo8W5TE1o65zyJMDmB0ZRalGc19fEqv7p8RC5lSma+PQ
 L69uo9X64lpmqPQR7fTLr4mCl4xABMfsg17I+Nv22LjX8YbIswhC3QeusOykBNOOB75C
 IO1YIPiRh1Jn/TXwMwuqxgP1GK5KedLhmnuQzMQ7F4/bnH+owRovRHF4uvr9tCiJAFXK
 7xjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWn9N+VJPwyhNCtkwyga+LNoMB++gwWCs7zJn/lCUFi9kqqtGfv8ZHlLpXC0HCIT0r/FH+j9BiYfm8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw731ni4ndA+LoBKB9VIPSG0r5i4n/LgSOMaPczxi04RVgYCd+e
 jQTC0QdubfhRJME3YRIiJuPQo5OPcinonlYRYJEIaQG0SSnUp9yr/qiyTwnuWCM=
X-Google-Smtp-Source: AGHT+IH7g2kz7lBgihcoIqRe72zbZhYm+lS1FXgFI/JN6kBglDGstg7/Vb8VhUk86dJ2Wg5PUbkZbQ==
X-Received: by 2002:a05:600c:1908:b0:429:994:41ae with SMTP id
 5b1f17b1804b1-42acd6164e6mr113807635e9.2.1724858243079; 
 Wed, 28 Aug 2024 08:17:23 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:765d:64ff:5f38:550?
 ([2a01:e0a:982:cbb0:765d:64ff:5f38:550])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ba63d789csm24887425e9.33.2024.08.28.08.17.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Aug 2024 08:17:22 -0700 (PDT)
Message-ID: <692b0afa-a9fe-4c31-bb3d-1fabfdbb67eb@linaro.org>
Date: Wed, 28 Aug 2024 17:17:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] drm/panel: nv3051d: Transition to
 mipi_dsi_dcs_write_seq_multi
To: Abhishek Tamboli <abhishektamboli9@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch
Cc: quic_jesszhan@quicinc.com, skhan@linuxfoundation.org,
 rbmarliere@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240827152504.30586-1-abhishektamboli9@gmail.com>
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
In-Reply-To: <20240827152504.30586-1-abhishektamboli9@gmail.com>
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
Reply-To: neil.armstrong@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27/08/2024 17:25, Abhishek Tamboli wrote:
> Replace deprecated 'mipi_dsi_dcs_write_seq()' macro
> to 'mipi_dsi_dcs_write_seq_multi' macro in
> panel_nv3051d_init_sequence function.
> 
> Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
> ---
>   .../gpu/drm/panel/panel-newvision-nv3051d.c   | 367 +++++++++---------
>   1 file changed, 184 insertions(+), 183 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-newvision-nv3051d.c b/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
> index 94d89ffd596b..5d115ecd5dd4 100644
> --- a/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
> +++ b/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
> @@ -47,195 +47,196 @@ static inline struct panel_nv3051d *panel_to_panelnv3051d(struct drm_panel *pane
>   static int panel_nv3051d_init_sequence(struct panel_nv3051d *ctx)
>   {
>   	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
> +	struct mipi_dsi_multi_context dsi_ctx = {.dsi = dsi};
> 
>   	/*
>   	 * Init sequence was supplied by device vendor with no
>   	 * documentation.
>   	 */
> 
> -	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x30);
> -	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x52);
> -	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x01);
> -	mipi_dsi_dcs_write_seq(dsi, 0xE3, 0x00);
> -	mipi_dsi_dcs_write_seq(dsi, 0x03, 0x40);
> -	mipi_dsi_dcs_write_seq(dsi, 0x04, 0x00);
> -	mipi_dsi_dcs_write_seq(dsi, 0x05, 0x03);
> -	mipi_dsi_dcs_write_seq(dsi, 0x24, 0x12);
> -	mipi_dsi_dcs_write_seq(dsi, 0x25, 0x1E);
> -	mipi_dsi_dcs_write_seq(dsi, 0x26, 0x28);
> -	mipi_dsi_dcs_write_seq(dsi, 0x27, 0x52);
> -	mipi_dsi_dcs_write_seq(dsi, 0x28, 0x57);
> -	mipi_dsi_dcs_write_seq(dsi, 0x29, 0x01);
> -	mipi_dsi_dcs_write_seq(dsi, 0x2A, 0xDF);
> -	mipi_dsi_dcs_write_seq(dsi, 0x38, 0x9C);
> -	mipi_dsi_dcs_write_seq(dsi, 0x39, 0xA7);
> -	mipi_dsi_dcs_write_seq(dsi, 0x3A, 0x53);
> -	mipi_dsi_dcs_write_seq(dsi, 0x44, 0x00);
> -	mipi_dsi_dcs_write_seq(dsi, 0x49, 0x3C);
> -	mipi_dsi_dcs_write_seq(dsi, 0x59, 0xFE);
> -	mipi_dsi_dcs_write_seq(dsi, 0x5C, 0x00);
> -	mipi_dsi_dcs_write_seq(dsi, 0x91, 0x77);
> -	mipi_dsi_dcs_write_seq(dsi, 0x92, 0x77);
> -	mipi_dsi_dcs_write_seq(dsi, 0xA0, 0x55);
> -	mipi_dsi_dcs_write_seq(dsi, 0xA1, 0x50);
> -	mipi_dsi_dcs_write_seq(dsi, 0xA4, 0x9C);
> -	mipi_dsi_dcs_write_seq(dsi, 0xA7, 0x02);
> -	mipi_dsi_dcs_write_seq(dsi, 0xA8, 0x01);
> -	mipi_dsi_dcs_write_seq(dsi, 0xA9, 0x01);
> -	mipi_dsi_dcs_write_seq(dsi, 0xAA, 0xFC);
> -	mipi_dsi_dcs_write_seq(dsi, 0xAB, 0x28);
> -	mipi_dsi_dcs_write_seq(dsi, 0xAC, 0x06);
> -	mipi_dsi_dcs_write_seq(dsi, 0xAD, 0x06);
> -	mipi_dsi_dcs_write_seq(dsi, 0xAE, 0x06);
> -	mipi_dsi_dcs_write_seq(dsi, 0xAF, 0x03);
> -	mipi_dsi_dcs_write_seq(dsi, 0xB0, 0x08);
> -	mipi_dsi_dcs_write_seq(dsi, 0xB1, 0x26);
> -	mipi_dsi_dcs_write_seq(dsi, 0xB2, 0x28);
> -	mipi_dsi_dcs_write_seq(dsi, 0xB3, 0x28);
> -	mipi_dsi_dcs_write_seq(dsi, 0xB4, 0x33);
> -	mipi_dsi_dcs_write_seq(dsi, 0xB5, 0x08);
> -	mipi_dsi_dcs_write_seq(dsi, 0xB6, 0x26);
> -	mipi_dsi_dcs_write_seq(dsi, 0xB7, 0x08);
> -	mipi_dsi_dcs_write_seq(dsi, 0xB8, 0x26);
> -	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x30);
> -	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x52);
> -	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x02);
> -	mipi_dsi_dcs_write_seq(dsi, 0xB1, 0x0E);
> -	mipi_dsi_dcs_write_seq(dsi, 0xD1, 0x0E);
> -	mipi_dsi_dcs_write_seq(dsi, 0xB4, 0x29);
> -	mipi_dsi_dcs_write_seq(dsi, 0xD4, 0x2B);
> -	mipi_dsi_dcs_write_seq(dsi, 0xB2, 0x0C);
> -	mipi_dsi_dcs_write_seq(dsi, 0xD2, 0x0A);
> -	mipi_dsi_dcs_write_seq(dsi, 0xB3, 0x28);
> -	mipi_dsi_dcs_write_seq(dsi, 0xD3, 0x28);
> -	mipi_dsi_dcs_write_seq(dsi, 0xB6, 0x11);
> -	mipi_dsi_dcs_write_seq(dsi, 0xD6, 0x0D);
> -	mipi_dsi_dcs_write_seq(dsi, 0xB7, 0x32);
> -	mipi_dsi_dcs_write_seq(dsi, 0xD7, 0x30);
> -	mipi_dsi_dcs_write_seq(dsi, 0xC1, 0x04);
> -	mipi_dsi_dcs_write_seq(dsi, 0xE1, 0x06);
> -	mipi_dsi_dcs_write_seq(dsi, 0xB8, 0x0A);
> -	mipi_dsi_dcs_write_seq(dsi, 0xD8, 0x0A);
> -	mipi_dsi_dcs_write_seq(dsi, 0xB9, 0x01);
> -	mipi_dsi_dcs_write_seq(dsi, 0xD9, 0x01);
> -	mipi_dsi_dcs_write_seq(dsi, 0xBD, 0x13);
> -	mipi_dsi_dcs_write_seq(dsi, 0xDD, 0x13);
> -	mipi_dsi_dcs_write_seq(dsi, 0xBC, 0x11);
> -	mipi_dsi_dcs_write_seq(dsi, 0xDC, 0x11);
> -	mipi_dsi_dcs_write_seq(dsi, 0xBB, 0x0F);
> -	mipi_dsi_dcs_write_seq(dsi, 0xDB, 0x0F);
> -	mipi_dsi_dcs_write_seq(dsi, 0xBA, 0x0F);
> -	mipi_dsi_dcs_write_seq(dsi, 0xDA, 0x0F);
> -	mipi_dsi_dcs_write_seq(dsi, 0xBE, 0x18);
> -	mipi_dsi_dcs_write_seq(dsi, 0xDE, 0x18);
> -	mipi_dsi_dcs_write_seq(dsi, 0xBF, 0x0F);
> -	mipi_dsi_dcs_write_seq(dsi, 0xDF, 0x0F);
> -	mipi_dsi_dcs_write_seq(dsi, 0xC0, 0x17);
> -	mipi_dsi_dcs_write_seq(dsi, 0xE0, 0x17);
> -	mipi_dsi_dcs_write_seq(dsi, 0xB5, 0x3B);
> -	mipi_dsi_dcs_write_seq(dsi, 0xD5, 0x3C);
> -	mipi_dsi_dcs_write_seq(dsi, 0xB0, 0x0B);
> -	mipi_dsi_dcs_write_seq(dsi, 0xD0, 0x0C);
> -	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x30);
> -	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x52);
> -	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x03);
> -	mipi_dsi_dcs_write_seq(dsi, 0x00, 0x2A);
> -	mipi_dsi_dcs_write_seq(dsi, 0x01, 0x2A);
> -	mipi_dsi_dcs_write_seq(dsi, 0x02, 0x2A);
> -	mipi_dsi_dcs_write_seq(dsi, 0x03, 0x2A);
> -	mipi_dsi_dcs_write_seq(dsi, 0x04, 0x61);
> -	mipi_dsi_dcs_write_seq(dsi, 0x05, 0x80);
> -	mipi_dsi_dcs_write_seq(dsi, 0x06, 0xC7);
> -	mipi_dsi_dcs_write_seq(dsi, 0x07, 0x01);
> -	mipi_dsi_dcs_write_seq(dsi, 0x08, 0x82);
> -	mipi_dsi_dcs_write_seq(dsi, 0x09, 0x83);
> -	mipi_dsi_dcs_write_seq(dsi, 0x30, 0x2A);
> -	mipi_dsi_dcs_write_seq(dsi, 0x31, 0x2A);
> -	mipi_dsi_dcs_write_seq(dsi, 0x32, 0x2A);
> -	mipi_dsi_dcs_write_seq(dsi, 0x33, 0x2A);
> -	mipi_dsi_dcs_write_seq(dsi, 0x34, 0x61);
> -	mipi_dsi_dcs_write_seq(dsi, 0x35, 0xC5);
> -	mipi_dsi_dcs_write_seq(dsi, 0x36, 0x80);
> -	mipi_dsi_dcs_write_seq(dsi, 0x37, 0x23);
> -	mipi_dsi_dcs_write_seq(dsi, 0x40, 0x82);
> -	mipi_dsi_dcs_write_seq(dsi, 0x41, 0x83);
> -	mipi_dsi_dcs_write_seq(dsi, 0x42, 0x80);
> -	mipi_dsi_dcs_write_seq(dsi, 0x43, 0x81);
> -	mipi_dsi_dcs_write_seq(dsi, 0x44, 0x11);
> -	mipi_dsi_dcs_write_seq(dsi, 0x45, 0xF2);
> -	mipi_dsi_dcs_write_seq(dsi, 0x46, 0xF1);
> -	mipi_dsi_dcs_write_seq(dsi, 0x47, 0x11);
> -	mipi_dsi_dcs_write_seq(dsi, 0x48, 0xF4);
> -	mipi_dsi_dcs_write_seq(dsi, 0x49, 0xF3);
> -	mipi_dsi_dcs_write_seq(dsi, 0x50, 0x02);
> -	mipi_dsi_dcs_write_seq(dsi, 0x51, 0x01);
> -	mipi_dsi_dcs_write_seq(dsi, 0x52, 0x04);
> -	mipi_dsi_dcs_write_seq(dsi, 0x53, 0x03);
> -	mipi_dsi_dcs_write_seq(dsi, 0x54, 0x11);
> -	mipi_dsi_dcs_write_seq(dsi, 0x55, 0xF6);
> -	mipi_dsi_dcs_write_seq(dsi, 0x56, 0xF5);
> -	mipi_dsi_dcs_write_seq(dsi, 0x57, 0x11);
> -	mipi_dsi_dcs_write_seq(dsi, 0x58, 0xF8);
> -	mipi_dsi_dcs_write_seq(dsi, 0x59, 0xF7);
> -	mipi_dsi_dcs_write_seq(dsi, 0x7E, 0x02);
> -	mipi_dsi_dcs_write_seq(dsi, 0x7F, 0x80);
> -	mipi_dsi_dcs_write_seq(dsi, 0xE0, 0x5A);
> -	mipi_dsi_dcs_write_seq(dsi, 0xB1, 0x00);
> -	mipi_dsi_dcs_write_seq(dsi, 0xB4, 0x0E);
> -	mipi_dsi_dcs_write_seq(dsi, 0xB5, 0x0F);
> -	mipi_dsi_dcs_write_seq(dsi, 0xB6, 0x04);
> -	mipi_dsi_dcs_write_seq(dsi, 0xB7, 0x07);
> -	mipi_dsi_dcs_write_seq(dsi, 0xB8, 0x06);
> -	mipi_dsi_dcs_write_seq(dsi, 0xB9, 0x05);
> -	mipi_dsi_dcs_write_seq(dsi, 0xBA, 0x0F);
> -	mipi_dsi_dcs_write_seq(dsi, 0xC7, 0x00);
> -	mipi_dsi_dcs_write_seq(dsi, 0xCA, 0x0E);
> -	mipi_dsi_dcs_write_seq(dsi, 0xCB, 0x0F);
> -	mipi_dsi_dcs_write_seq(dsi, 0xCC, 0x04);
> -	mipi_dsi_dcs_write_seq(dsi, 0xCD, 0x07);
> -	mipi_dsi_dcs_write_seq(dsi, 0xCE, 0x06);
> -	mipi_dsi_dcs_write_seq(dsi, 0xCF, 0x05);
> -	mipi_dsi_dcs_write_seq(dsi, 0xD0, 0x0F);
> -	mipi_dsi_dcs_write_seq(dsi, 0x81, 0x0F);
> -	mipi_dsi_dcs_write_seq(dsi, 0x84, 0x0E);
> -	mipi_dsi_dcs_write_seq(dsi, 0x85, 0x0F);
> -	mipi_dsi_dcs_write_seq(dsi, 0x86, 0x07);
> -	mipi_dsi_dcs_write_seq(dsi, 0x87, 0x04);
> -	mipi_dsi_dcs_write_seq(dsi, 0x88, 0x05);
> -	mipi_dsi_dcs_write_seq(dsi, 0x89, 0x06);
> -	mipi_dsi_dcs_write_seq(dsi, 0x8A, 0x00);
> -	mipi_dsi_dcs_write_seq(dsi, 0x97, 0x0F);
> -	mipi_dsi_dcs_write_seq(dsi, 0x9A, 0x0E);
> -	mipi_dsi_dcs_write_seq(dsi, 0x9B, 0x0F);
> -	mipi_dsi_dcs_write_seq(dsi, 0x9C, 0x07);
> -	mipi_dsi_dcs_write_seq(dsi, 0x9D, 0x04);
> -	mipi_dsi_dcs_write_seq(dsi, 0x9E, 0x05);
> -	mipi_dsi_dcs_write_seq(dsi, 0x9F, 0x06);
> -	mipi_dsi_dcs_write_seq(dsi, 0xA0, 0x00);
> -	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x30);
> -	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x52);
> -	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x02);
> -	mipi_dsi_dcs_write_seq(dsi, 0x01, 0x01);
> -	mipi_dsi_dcs_write_seq(dsi, 0x02, 0xDA);
> -	mipi_dsi_dcs_write_seq(dsi, 0x03, 0xBA);
> -	mipi_dsi_dcs_write_seq(dsi, 0x04, 0xA8);
> -	mipi_dsi_dcs_write_seq(dsi, 0x05, 0x9A);
> -	mipi_dsi_dcs_write_seq(dsi, 0x06, 0x70);
> -	mipi_dsi_dcs_write_seq(dsi, 0x07, 0xFF);
> -	mipi_dsi_dcs_write_seq(dsi, 0x08, 0x91);
> -	mipi_dsi_dcs_write_seq(dsi, 0x09, 0x90);
> -	mipi_dsi_dcs_write_seq(dsi, 0x0A, 0xFF);
> -	mipi_dsi_dcs_write_seq(dsi, 0x0B, 0x8F);
> -	mipi_dsi_dcs_write_seq(dsi, 0x0C, 0x60);
> -	mipi_dsi_dcs_write_seq(dsi, 0x0D, 0x58);
> -	mipi_dsi_dcs_write_seq(dsi, 0x0E, 0x48);
> -	mipi_dsi_dcs_write_seq(dsi, 0x0F, 0x38);
> -	mipi_dsi_dcs_write_seq(dsi, 0x10, 0x2B);
> -	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x30);
> -	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x52);
> -	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x00);
> -	mipi_dsi_dcs_write_seq(dsi, 0x36, 0x02);
> -	mipi_dsi_dcs_write_seq(dsi, 0x3A, 0x70);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xFF, 0x30);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xFF, 0x52);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xFF, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xE3, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x03, 0x40);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x04, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x05, 0x03);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x24, 0x12);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x25, 0x1E);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x26, 0x28);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x27, 0x52);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x28, 0x57);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x29, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2A, 0xDF);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x38, 0x9C);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x39, 0xA7);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3A, 0x53);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x44, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x49, 0x3C);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x59, 0xFE);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5C, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x91, 0x77);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x92, 0x77);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xA0, 0x55);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xA1, 0x50);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xA4, 0x9C);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xA7, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xA8, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xA9, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xAA, 0xFC);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xAB, 0x28);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xAC, 0x06);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xAD, 0x06);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xAE, 0x06);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xAF, 0x03);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xB0, 0x08);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xB1, 0x26);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xB2, 0x28);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xB3, 0x28);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xB4, 0x33);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xB5, 0x08);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xB6, 0x26);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xB7, 0x08);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xB8, 0x26);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xFF, 0x30);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xFF, 0x52);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xFF, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xB1, 0x0E);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xD1, 0x0E);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xB4, 0x29);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xD4, 0x2B);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xB2, 0x0C);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xD2, 0x0A);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xB3, 0x28);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xD3, 0x28);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xB6, 0x11);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xD6, 0x0D);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xB7, 0x32);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xD7, 0x30);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xC1, 0x04);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xE1, 0x06);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xB8, 0x0A);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xD8, 0x0A);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xB9, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xD9, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xBD, 0x13);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xDD, 0x13);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xBC, 0x11);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xDC, 0x11);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xBB, 0x0F);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xDB, 0x0F);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xBA, 0x0F);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xDA, 0x0F);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xBE, 0x18);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xDE, 0x18);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xBF, 0x0F);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xDF, 0x0F);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xC0, 0x17);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xE0, 0x17);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xB5, 0x3B);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xD5, 0x3C);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xB0, 0x0B);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xD0, 0x0C);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xFF, 0x30);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xFF, 0x52);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xFF, 0x03);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x2A);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x01, 0x2A);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x02, 0x2A);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x03, 0x2A);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x04, 0x61);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x05, 0x80);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x06, 0xC7);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x07, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x08, 0x82);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x09, 0x83);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x30, 0x2A);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x31, 0x2A);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x32, 0x2A);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x33, 0x2A);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x34, 0x61);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x35, 0xC5);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x36, 0x80);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x37, 0x23);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x40, 0x82);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x41, 0x83);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x42, 0x80);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x43, 0x81);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x44, 0x11);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x45, 0xF2);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x46, 0xF1);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x47, 0x11);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x48, 0xF4);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x49, 0xF3);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x50, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x51, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x52, 0x04);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x53, 0x03);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x54, 0x11);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x55, 0xF6);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x56, 0xF5);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x57, 0x11);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x58, 0xF8);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x59, 0xF7);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7E, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7F, 0x80);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xE0, 0x5A);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xB1, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xB4, 0x0E);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xB5, 0x0F);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xB6, 0x04);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xB7, 0x07);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xB8, 0x06);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xB9, 0x05);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xBA, 0x0F);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xC7, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xCA, 0x0E);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xCB, 0x0F);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xCC, 0x04);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xCD, 0x07);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xCE, 0x06);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xCF, 0x05);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xD0, 0x0F);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x81, 0x0F);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x84, 0x0E);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x85, 0x0F);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x86, 0x07);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x87, 0x04);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x88, 0x05);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x89, 0x06);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x8A, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x97, 0x0F);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x9A, 0x0E);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x9B, 0x0F);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x9C, 0x07);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x9D, 0x04);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x9E, 0x05);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x9F, 0x06);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xA0, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xFF, 0x30);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xFF, 0x52);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xFF, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x01, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x02, 0xDA);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x03, 0xBA);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x04, 0xA8);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x05, 0x9A);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x06, 0x70);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x07, 0xFF);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x08, 0x91);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x09, 0x90);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0A, 0xFF);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0B, 0x8F);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0C, 0x60);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0D, 0x58);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0E, 0x48);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0F, 0x38);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x10, 0x2B);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xFF, 0x30);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xFF, 0x52);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xFF, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x36, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3A, 0x70);
> 
>   	dev_dbg(ctx->dev, "Panel init sequence done\n");
> 
> --
> 2.34.1
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
