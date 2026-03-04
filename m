Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id XN2VIvZfqGnPuAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 17:38:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A2C204738
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 17:38:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0750210EA6A;
	Wed,  4 Mar 2026 16:38:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="S+Am8szo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3007510EA6A
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 16:38:11 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4833115090dso72402975e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 08:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772642290; x=1773247090; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=CLBEOyTjMzhfw8iP5dMgZDHtLtMkaQoKON/T+0b+0mc=;
 b=S+Am8szo8PgQa7AkJN63J5vdn811SQ1zFRyNh0zFSgvkk9SEN87qGwZ+7QmefibzOv
 uJ6ZaEJuLE8Z5CMLygn7HrvojIMVNsqhwlfzT4exfSN+ENYSzQnLPoZ6hwFViCK9C1G6
 OwukEyE9wbcwmwAJ2sx1Pqylq8cXDR8MOljB+39rf8TUnDT8U9/KZCHHPkxHLtdsQKpt
 YYcoMuP3jlaofmYlt7HUSZ//c8X55XgY+nY5a2BkmSJmd3PC/Gaow0RqP/eRP8GMsKKX
 DHz7tfPYCPdLpYwbV6NHJKl2HoWohU1Wx2/9WjRy/nUf3KLFWdL8uLXUHBmQVSFIHsl+
 fl+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772642290; x=1773247090;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CLBEOyTjMzhfw8iP5dMgZDHtLtMkaQoKON/T+0b+0mc=;
 b=rrepCx0VD50r2n7b+K0UdU59GrOpowcg6SvSsiXBJRRpQNiW6Vsr8gerZFjb+wYdTY
 lohvfiXDPbxmlYfA10Qb3rYy6vrGylmPBaxynlPDPEkcKdibOE7K3Zs7QqRCjFo8gov4
 p3N3KxITnpne3sUa9wzZTrWpEfgOzgsFvnVnn4IgQAmTl62lFu/mMXKRpdBvFUat4Tmq
 4BnpfPM40cLNZkTC7gN9E6VMYyWDCjDdVpwA+jUih2D9JTC+C5CTsQwDMSUutFuB2c7f
 gJGZUbfwFFEfZMAiDn6MfFgKgjb43TNr6hXk5BfI5mhgsZpA9t6ke3UngK3KxPehGTL6
 BgMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+QI2NgtZtvheSdw/JFJ1pTS9VNhQIrQW/iFPyXaXuXVp9HcUYrJ/ZQb5GqKJgPSA8DubC+rssQzY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzjDr5QPIuS5WYHmssubehdJKutj2CV77BHcPB73JnYOpsACeet
 9mjmQ4lncaueXdSeMtMM7UsTOrtAZ3J5sFc7n07sNmugHjlZxrT2Lu4oGdEuoWRntz0=
X-Gm-Gg: ATEYQzzBzyctNYaM+O/Qy8LS5IvFyhzlnoPB+AqbcyMsW3d3jh6bCJpQJdFxNFbxud5
 /QSQlryVg2GRzZ3+zzkf51eBOwgb257AXFNEjSvISWI9DIGZ4LZXqN/ayrXlQXuEAF+W/3FhMwh
 z6gyy7bPHwMDhDuaw2NbX2G88GyYR+4wz2qYfy0MdNQe7ngWeQHWC6HwTwu4xI5kT/hM6QtXGvR
 NfPiEYkmiIhrM3i6utOwN7UJ0wxzHAS8FeZjZLdUpP/QT6p4VWSYT5PkojuRunU4uV/mvVVrEbw
 kjTqXxW2S11RM8lR8Xc9qXAHR92mkBvr8o9Datn3etCwI/I2fYSYJHjIroV2yHO8eY1a6Om4Vkm
 LKUoIezwkCft9HThNN26uTKbSSucQeRGWySaunThLc7/bDr9myxfvuelFxUkx1oF5ZoeLt9s4C+
 tMWGUNzgqt71HZHlprtLiSAw4/0m2H/+Mu/CM61aEY+Qq2YDYYTF2NpC7ofHyUk8Xg3rGHXbgJO
 7B6
X-Received: by 2002:a05:600c:4f95:b0:477:9814:6882 with SMTP id
 5b1f17b1804b1-48519848443mr46567695e9.5.1772642289601; 
 Wed, 04 Mar 2026 08:38:09 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:da6:dde3:e477:94d2?
 ([2a01:e0a:106d:1080:da6:dde3:e477:94d2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851887fd5asm64520675e9.11.2026.03.04.08.38.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2026 08:38:09 -0800 (PST)
Message-ID: <2da607e0-9bb6-4dd2-a647-e92038e60f8b@linaro.org>
Date: Wed, 4 Mar 2026 17:38:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/panel: ilitek-ili9882t: use gpiod_set_value_cansleep()
To: John Keeping <jkeeping@inmusicbrands.com>, dri-devel@lists.freedesktop.org
Cc: Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
References: <20260303152124.187791-1-jkeeping@inmusicbrands.com>
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
In-Reply-To: <20260303152124.187791-1-jkeeping@inmusicbrands.com>
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
X-Rspamd-Queue-Id: E3A2C204738
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jkeeping@inmusicbrands.com,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:replyto,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,inmusicbrands.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Action: no action

On 3/3/26 16:21, John Keeping wrote:
> All of these GPIO calls are in process context where they can sleep.
> Use the appropriate function call to allow use of this driver with GPIO
> controllers that might sleep.
> 
> Signed-off-by: John Keeping <jkeeping@inmusicbrands.com>
> ---
>   drivers/gpu/drm/panel/panel-ilitek-ili9882t.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c b/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
> index 8b2bfb7d36385..5f4e0d82ee673 100644
> --- a/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
> @@ -592,7 +592,7 @@ static int ili9882t_unprepare(struct drm_panel *panel)
>   {
>   	struct ili9882t *ili = to_ili9882t(panel);
>   
> -	gpiod_set_value(ili->enable_gpio, 0);
> +	gpiod_set_value_cansleep(ili->enable_gpio, 0);
>   	usleep_range(1000, 2000);
>   	regulator_disable(ili->avee);
>   	regulator_disable(ili->avdd);
> @@ -608,7 +608,7 @@ static int ili9882t_prepare(struct drm_panel *panel)
>   	struct ili9882t *ili = to_ili9882t(panel);
>   	int ret;
>   
> -	gpiod_set_value(ili->enable_gpio, 0);
> +	gpiod_set_value_cansleep(ili->enable_gpio, 0);
>   	usleep_range(1000, 1500);
>   
>   	ret = regulator_enable(ili->pp3300);
> @@ -638,11 +638,11 @@ static int ili9882t_prepare(struct drm_panel *panel)
>   	}
>   	usleep_range(1000, 2000);
>   
> -	gpiod_set_value(ili->enable_gpio, 1);
> +	gpiod_set_value_cansleep(ili->enable_gpio, 1);
>   	usleep_range(1000, 2000);
> -	gpiod_set_value(ili->enable_gpio, 0);
> +	gpiod_set_value_cansleep(ili->enable_gpio, 0);
>   	msleep(50);
> -	gpiod_set_value(ili->enable_gpio, 1);
> +	gpiod_set_value_cansleep(ili->enable_gpio, 1);
>   	usleep_range(6000, 10000);
>   
>   	ret = ili->desc->init(ili);
> @@ -652,7 +652,7 @@ static int ili9882t_prepare(struct drm_panel *panel)
>   	return 0;
>   
>   poweroff:
> -	gpiod_set_value(ili->enable_gpio, 0);
> +	gpiod_set_value_cansleep(ili->enable_gpio, 0);
>   	regulator_disable(ili->avee);
>   poweroffavdd:
>   	regulator_disable(ili->avdd);
> @@ -793,7 +793,7 @@ static int ili9882t_add(struct ili9882t *ili)
>   		return PTR_ERR(ili->enable_gpio);
>   	}
>   
> -	gpiod_set_value(ili->enable_gpio, 0);
> +	gpiod_set_value_cansleep(ili->enable_gpio, 0);
>   
>   	err = of_drm_get_panel_orientation(dev->of_node, &ili->orientation);
>   	if (err < 0) {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
