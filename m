Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD81F962AEE
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 16:59:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2D7310E550;
	Wed, 28 Aug 2024 14:59:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ee0mtNBQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19AA410E550
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 14:59:14 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-428f5c0833bso4436915e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 07:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724857152; x=1725461952; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=KO/kUq3HaX92Ly9XzMaKjjt6nL2ysMBapj0XMvCm3k8=;
 b=ee0mtNBQkQslMJpEaDeNcOS/Dea3fyZ7gJTsVatI1T6HZi+cU12ZLkFSPFyphXQJ/g
 7XedHXI61uwpezNBOdTtNvNfBo+Fwe5q0daxDluAPVSlYtTtSMZsIv4hmqekrfIX5XH3
 OKcvqUr0UkOxSKV0UP9/FleT5mbVftRwVAb46eANBnEP0Dg1mP/DL6vDJYPytCGZHuHs
 y+97t9lSR5hiAU464/boB5wGsgXsbOtuza2tO8bDicllWHeKiQS4t/jL8F5brKa1dcfH
 9n2RthSvFv7D9iYiDnr/Zoz7K8D6yT7K7DDWdjxYE+K4JQqX5qBdQ0QBDhbdglkV9TIK
 Q4yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724857152; x=1725461952;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=KO/kUq3HaX92Ly9XzMaKjjt6nL2ysMBapj0XMvCm3k8=;
 b=G9RxV6uhDj6fe65vIKyXez7CLs+H+vd4KzGI8+Q4ekjqPKRMR3QxRYSZ8mVfjA9UVY
 I8fgJ1DJ/Y44vgvaxPC8inPJ76yso/IYo8eSokXhm4bbGXLDGmy+urN3aOCEODWbj6QL
 xkKQgvxu5D3ITe99uDRS27RqltJVQ21a0psrU4+7iaVCcTCSOttNI9+U6TMuFWRuz/6I
 56hALHsUVWBnDF+tLlCxuwMiHjjm7ZkUUu/InBBWmVviF3gynK8LCNUkt7dqiuWvD8UO
 4veIZ9Wt0PsS6XJydiHoamOBkN4ucHe9mUbBzhBvFVje76qkrY3Jf17xz77F0CrXXlb/
 u59A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNJ0FOVpUJcfwD1itd2q0uD6/fdYfbswXQWjo0oZYlDyhGhSvT0t+Z6JJECx7I+M23yNqTPmpiccs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx9jGNTE4TBzZIC917jzbuqIMw6hXXj0Oe7noa4aSsZDq/WX1vD
 O8vWI1fJk+m3LCWIfWWkZwMjlIeqc4KYGTkjGP3ANgDfkXPft12le7HkjwZGcAQ=
X-Google-Smtp-Source: AGHT+IGpYyl2oFuEHSkvy/FLwK15pAaH4MgP4JJbb6daH2SnrD/XOuBjv4Vd9IkQ8xwpgzVSDO+D3w==
X-Received: by 2002:a05:600c:4fc8:b0:427:abfd:4432 with SMTP id
 5b1f17b1804b1-42ba5708dd6mr14626585e9.12.1724857152032; 
 Wed, 28 Aug 2024 07:59:12 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:765d:64ff:5f38:550?
 ([2a01:e0a:982:cbb0:765d:64ff:5f38:550])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42baf7fa745sm4356805e9.31.2024.08.28.07.59.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Aug 2024 07:59:11 -0700 (PDT)
Message-ID: <35ab4327-4736-41e8-afaf-c2dea58f0406@linaro.org>
Date: Wed, 28 Aug 2024 16:59:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/2] drm/panel: add BOE tv101wum-ll2 panel driver
To: Doug Anderson <dianders@chromium.org>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240828-topic-sdm450-upstream-tbx605f-panel-v2-0-0a039d064e13@linaro.org>
 <20240828-topic-sdm450-upstream-tbx605f-panel-v2-2-0a039d064e13@linaro.org>
 <CAD=FV=WqmdjrM3jgpGEX=DqrJLYySpgQ9w+zK0mR=os_5wA35g@mail.gmail.com>
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
In-Reply-To: <CAD=FV=WqmdjrM3jgpGEX=DqrJLYySpgQ9w+zK0mR=os_5wA35g@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28/08/2024 16:11, Doug Anderson wrote:
> Hi,
> 
> On Wed, Aug 28, 2024 at 2:22 AM Neil Armstrong
> <neil.armstrong@linaro.org> wrote:
>>
>> +static int boe_tv101wum_ll2_off(struct boe_tv101wum_ll2 *ctx)
>> +{
>> +       struct mipi_dsi_device *dsi = ctx->dsi;
>> +       struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
>> +
>> +       dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
>> +
>> +       mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
>> +
>> +       mipi_dsi_msleep(&dsi_ctx, 70);
>> +
>> +       mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
>> +
>> +       mipi_dsi_msleep(&dsi_ctx, 20);
>> +
>> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x04, 0x5a);
>> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x05, 0x5a);
>> +
>> +       mipi_dsi_msleep(&dsi_ctx, 150);
>> +
>> +       return dsi_ctx.accum_err;
>> +}
> 
> optional nit: now that the single caller of this function isn't
> looking at the error code, you could make boe_tv101wum_ll2_off()
> return "void".

Indeed, I'll spin a v3 with this and you review and apply it

> 
> In any case, this looks good.
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Thanks!
Neil

