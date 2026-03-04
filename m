Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHrZC6xdqGmZtgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 17:28:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC3F204413
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 17:28:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAB1E10EA7C;
	Wed,  4 Mar 2026 16:28:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FRPRBTL7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2EAA10EA6E
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 16:28:24 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4837907f535so63434345e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 08:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772641703; x=1773246503; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=Dg0qcu5/SbUy0dMxT7Cj28YW3epV9BkKB0ZGFyZqeXw=;
 b=FRPRBTL7VEp6kweeuFySkNWKpClwL9hf89Zu6Z1ZSRCI/clZycU5yGju3+wXVzR3xn
 rYUG9PGslz9XMWzNm04z/E+fp7qPrIAe7XVrI56v9iCfOPSOJOGcfQRqX4pXGy0tZuFt
 I28WgYfGp+8adE7Em1PiqmnF8kPkG6aaoyYgpSYv6shFJvSEkpUWcep2bdv5KeQ1rGcZ
 Oq9E8AxN1nrRvvHa6bn/Kf1NhhthbfW0+aqOnVnW92TD0Je4XLerBgDj92Rt3LbDs/8J
 rrUEQl8Z/z8qZWw4VxgnFwR8p+X7/q5uEodPAMw0Rl427K/cDV2pVB38a2ytt05xk/zI
 r31w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772641703; x=1773246503;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dg0qcu5/SbUy0dMxT7Cj28YW3epV9BkKB0ZGFyZqeXw=;
 b=BXYZezTsOUOGEM0AfnKkmcV1PqzSWSEfHWoDowYxahGxllbuEaSlnFC3LRKKItuXoy
 UP0NFETzsQ8bEH6ybniXogHM0oWwtuAutuJ2EJBA7SeVVgsOT6M5BSkusAD0yRU6kzHX
 HYY0xBYtJZWH6tfbSncyfkKL4WKJV7aablnsddKoJhw1YbwYB3ZYvbmeljSjZB/1cW6q
 8fCoOUOZge8ewYg8HX0e1wtLrO3KeyfZaOyzHMmIImFgCEayB1r2HBeAgzGcdchgUSSM
 GSO44WHrH7akmm44ZQZb+doK3chbwX0lMu36lSA6gX+XjBPAuExAvPy0tUcp28moFllL
 fN8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4J4SMNZGbxVZpOdVrr10gqu1e2Pdn/GOvbWk5umXVctSBWfvPTihqtwyaJ746CYQzIo0rDZyT830=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNEnbnOVgbcDLkXeybD4ancYwo+BiPuckoa8Sgd5jjNmWXPPFv
 kXQUWzyqAHXlxKWumoo/ncPXKcC2HSXNjEni4RZgqMfBHX71zwPHwR6QmeuivCxCIHA=
X-Gm-Gg: ATEYQzyRU3mV53H+/o3Pbyxa+Enwcg8ueoU4Gs2LxS5OVDyc+8Yl4uB2rJtE242iWum
 8ezEcPJQnKFHKSKPH9mTEVsRg+EupW0guFGXQULctbO6c3PrRAlco9QTy1qOEsWXdLh41vzKRLS
 ABu151z+EWvV6agiq0oY6jU2Su00QKLBMY0QE6H0FU/Ecc7Ym/9QifigQq0ifJusDuJiAZ9rUvh
 Qsq4CUZs11mTld1aCSe0VMzZhLhCr0tY39mKe0yDMssvoQpbPTWvwLy8p3ClTJgv4+eRoNA0jC2
 bg5HpSUou74sOIe8MVbAnNNzTlu3TqVmAdVeuMqLO/wbsEuOUnxjkZiH5SHR4aZbfNdaDXOAogN
 LdAfBbyHQilKYzjinPZAEnMXCQ0qZMKyNUW+cruu8mS/58XmOlFd+faeOPQSXg2qa5b36eS7KNp
 6zNRpkdHk0GJtoDMvRBVD0Pe/E2LM5C5pZBb5gVD8r4zJMCJG1FRKjWuWCAXjJylr16FM/RN6x/
 ciD
X-Received: by 2002:a05:600c:1d05:b0:483:badb:618f with SMTP id
 5b1f17b1804b1-48519887d35mr42956055e9.25.1772641703271; 
 Wed, 04 Mar 2026 08:28:23 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:da6:dde3:e477:94d2?
 ([2a01:e0a:106d:1080:da6:dde3:e477:94d2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439abded86esm33795753f8f.6.2026.03.04.08.28.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2026 08:28:22 -0800 (PST)
Message-ID: <5aef5f76-0aa3-4ad5-9dd9-df95fca50162@linaro.org>
Date: Wed, 4 Mar 2026 17:28:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/panel: mantix: Set the pixel clocks for 60 Hz
To: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel@puri.sm, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260218-mantix-pixel-clock-v1-1-c22c034ba5c1@puri.sm>
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
In-Reply-To: <20260218-mantix-pixel-clock-v1-1-c22c034ba5c1@puri.sm>
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
X-Rspamd-Queue-Id: 8DC3F204413
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:sebastian.krzyszkowiak@puri.sm,m:agx@sigxcpu.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:kernel@puri.sm,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:replyto,puri.sm:email];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	HAS_ORG_HEADER(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[puri.sm,sigxcpu.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Action: no action

On 2/18/26 20:47, Sebastian Krzyszkowiak wrote:
> These are 60 Hz panels, but the currently set pixel clocks result in modes
> with refresh rates of 63 Hz and ~63.41 Hz.
> 
> Adjust the clocks to target 60 Hz.
> 
> Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
> ---
>   drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c b/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
> index 13352cb4ad77..3d454ac7a1ec 100644
> --- a/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
> +++ b/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
> @@ -168,7 +168,7 @@ static const struct drm_display_mode default_mode_mantix = {
>   	.vsync_start = 1440 + 130,
>   	.vsync_end   = 1440 + 130 + 8,
>   	.vtotal	     = 1440 + 130 + 8 + 106,
> -	.clock	     = 85298,
> +	.clock	     = 81237,
>   	.flags	     = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
>   	.width_mm    = 65,
>   	.height_mm   = 130,
> @@ -183,7 +183,7 @@ static const struct drm_display_mode default_mode_ys = {
>   	.vsync_start = 1440 + 175,
>   	.vsync_end   = 1440 + 175 + 8,
>   	.vtotal	     = 1440 + 175 + 8 + 50,
> -	.clock	     = 85298,
> +	.clock	     = 80706,
>   	.flags	     = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
>   	.width_mm    = 65,
>   	.height_mm   = 130,
> 
> ---
> base-commit: 2961f841b025fb234860bac26dfb7fa7cb0fb122
> change-id: 20260218-mantix-pixel-clock-7ff880cbaedf
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
