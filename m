Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLPRBdIqd2nacwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 09:50:26 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEF5859C0
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 09:50:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DA0010E3C1;
	Mon, 26 Jan 2026 08:50:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="r80gSzBU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 123C710E3C1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 08:50:21 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4801ea9bafdso16571015e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 00:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769417419; x=1770022219; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=pdhmZVlrVHW122LKlyyoEFK2L0zwsXN7gOZJ2tKesww=;
 b=r80gSzBUP7C3jRVolNFz8Xe5S9YlSz/iGL/DvFDg2myxdcJNpR6tXk0B9UYwF/f7hK
 Tfmco5DeWEXo+k4/3KO7SXKOK0CJ07MDfKKXPIuK9Oycgjj9pwRYe2NZMGFw0UTmHs+t
 THfCdTS+MKC6AFdYPu1Bz8tKL1+uYgO6dVHPlc4Iwk8cdb9VMxpCjBib21ew8XEnVksn
 j2zUTfiD+2qocX3dtcBz7AYiqblpnqA6BVwod2K+f3gKnVcEWvafuYsW9PIEUmO2w2ya
 4U2SPVH3FNVAlOfBhV8tkpWtKfFiw4KI7VANJqtAqD3L4exGuJghHPpaXngm1TEJi+ZR
 2JDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769417419; x=1770022219;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pdhmZVlrVHW122LKlyyoEFK2L0zwsXN7gOZJ2tKesww=;
 b=oHNRfZU1zgpfkJsB0vjuZQFKV2r3B+q5wJ7mww9MjglYo/7P8jJI/FTnoOHK7Nyxd3
 fm5EtmeUHclwsl9i9uVtPSoo47t1w/0Y51yzeNQaYCs9qOy15dLAk62fELz0xgN56Xas
 ILicpfZvUk7MZ8WslivuFkw69vIoHmvo+0/tM8B1WBYX7U6DZqTo80extS7SETyI0sV1
 TYgV9ANqnQZ9AnbpWWFOubPG+o38BGcWtZb/lSPZwhPGBntQxTFX0GuX4rrGKCoBRaaa
 EkXd/40K/DmcHwt+7sXeIR6UWSjyjl0a99ACAO808gPBdJXDAoExof0ZewN1r++r4SQv
 LsQw==
X-Gm-Message-State: AOJu0Yxy9qYvssCbAqh1J2wkrqUKv2851V6Tz8Yp2lLzAPSigLlhz9uf
 7116zXTjLd6YIM+76NIgjC17VUWsa2mZL2CfrK4ikHeHZNv9AwXoOnjnN6OBjfWxdCo5njUgQE0
 nqnvV
X-Gm-Gg: AZuq6aKWTshtuz8dJReNOg9S06Snc9DMHo9MPeWoOiyxOCJc/1/qgcsY3tJ7Eq+YIfN
 yT0c/8YGWtbkXpiwSoI3V5fUNXZMxXYE1Vp/92nfi4teQoZydiV5kKxCHw23rBrdNc/kqQLQnp2
 Kl7gG92qf+9jvix1HbygtO60fGjFffZIICZaBkpdDjd/b1N4t4mDHKoq3Wtgsbl16aD5a/Cs8Cy
 cetw6fxwB6MuhYRYSbX/hFng9jky3oquJwRQIyjW5KTNKT1C1nJHXvF813SChQC6XDeNMS1L6Ew
 f3chvQOjPWkiAu+EKVJipaGIDS2O4o+gjIK/WPNUM/KN8zSRYqZK7OrBvPKag8nVNRB4IPyUkZ+
 +czF6mKReS6AU++QivX2vnxQUl3gnNC4BLvrzju3HY+Zn2C8EytROxR/qNqW/reZ3iimFhsCydp
 IMuKUdvyOuC+ZIqUJovSBAZ1hgT3BuOZeAJk8HTsrhpSTYZZHRHpEUFY52KIOie2w=
X-Received: by 2002:a05:600c:35c4:b0:47e:e9c9:23bc with SMTP id
 5b1f17b1804b1-4805cf673f5mr64518225e9.30.1769417419194; 
 Mon, 26 Jan 2026 00:50:19 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:f420:4741:1891:d113?
 ([2a01:e0a:3d9:2080:f420:4741:1891:d113])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435b1c24bedsm27573525f8f.17.2026.01.26.00.50.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jan 2026 00:50:18 -0800 (PST)
Message-ID: <40ff5934-ef2a-48a6-a752-8f754557c404@linaro.org>
Date: Mon, 26 Jan 2026 09:50:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/panel: ilitek-ili9882t: Select DRM_DISPLAY_DSC_HELPER
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20260115125136.64866-1-mcanal@igalia.com>
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
In-Reply-To: <20260115125136.64866-1-mcanal@igalia.com>
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:mcanal@igalia.com,m:jesszhan0024@gmail.com,m:yelangyan@huaqin.corp-partner.google.com,m:kernel-dev@igalia.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:replyto,linaro.org:mid];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	HAS_ORG_HEADER(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[igalia.com,gmail.com,huaqin.corp-partner.google.com];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 5FEF5859C0
X-Rspamd-Action: no action

On 1/15/26 13:50, Maíra Canal wrote:
> The panel-ilitek-ili9882t driver uses drm_dsc_pps_payload_pack() which
> is provided by the DRM_DISPLAY_DSC_HELPER. Add the missing Kconfig
> select to fix the following build error:
> 
>    ERROR: modpost: "drm_dsc_pps_payload_pack" [drivers/gpu/drm/panel/panel-ilitek-ili9882t.ko] undefined!
> 
> Fixes: 65ce1f5834e9 ("drm/panel: ilitek-ili9882t: Switch Tianma TL121BVMS07 to DSC 120Hz mode")
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
>   drivers/gpu/drm/panel/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index a0fe6069e5e4..ae25f003aa33 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -280,6 +280,7 @@ config DRM_PANEL_ILITEK_ILI9882T
>   	depends on OF
>   	depends on DRM_MIPI_DSI
>   	depends on BACKLIGHT_CLASS_DEVICE
> +	select DRM_DISPLAY_DSC_HELPER
>   	help
>   	  Say Y if you want to enable support for panels based on the
>   	  Ilitek ILI9882t controller.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
