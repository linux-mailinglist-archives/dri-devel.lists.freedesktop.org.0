Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4IeeOuafqmlLUgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 10:35:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF5521E06B
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 10:35:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F3E310E04F;
	Fri,  6 Mar 2026 09:35:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IBbDNiLL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79E4D10E04F
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 09:35:30 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4807068eacbso75723185e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 01:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772789728; x=1773394528; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=zbMGGT1kF6t3+bFIFcPUGd6crSsN+zT1VK5fRmHGscE=;
 b=IBbDNiLLc/wvYtznMnCtxsf/RaP/2BBKuqpjHsJFa1PuP/0DeR7te8xxvRuZ213R1N
 +ZCKdYNITCMoc7cjGRUZH8HbU8zDK7tX5iUJmOUcb1twHLxyKZzqUEVA4PgGIZ+heCJM
 M214M9GWO9NKCVr/SJOYl0ZpHOCfQysU9NnqYmCQj1inBswjdnmQsPOKQm99we3hMmn4
 IpTps40Fs92OFhtjg1REqlvdKnUA3RB4sTsI2u/hHwOn3Jh4wPdyXLU/aGMJLvDRx8CF
 z/wEAtbwSITRjWurQvlvR90Ec8Dc6QQJ9eofUXNAPlyBBJ5qArhPB5/tnyEpvcq6SlNy
 9mdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772789728; x=1773394528;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zbMGGT1kF6t3+bFIFcPUGd6crSsN+zT1VK5fRmHGscE=;
 b=FOO7H2H6wZs23x578j82zGX3gLyJ9msgNyzGU5AS+hGNflUEBPhbFG6gHDtsQltG3f
 e44U2kZ/0KcI4RZI0oQpQmU4T3pUL9/d/G+uCgdAiV37pVuy2I0Epc4PWtRLV14O6y0n
 Uj9D5XbnB7hOrc1fry3swgT2JVbUouOXBcw93gzfHK5/8x6ElUN5uc13ufW/hrZRUf93
 qrc1IZja7GsXzs6dChktOkQif+iXOv8VFKhvBjdUYk2Jhy20XMxaEKyzQ0bZyF3lyQd4
 vmGTdrHkVycsMKDXf1a+Bj11mtK6jxS8sebF3+WNSjqUfutQeFD0wHaG2DTvhSMx2b6U
 TKFg==
X-Gm-Message-State: AOJu0YwjEZrwPacZSA0D0mBKErSsnlVOM6L7KsCiMOclvL83nPaS46YA
 zgWrj2fnAQQpS6L5lanAqbfF8SyYLBOySW1eWoxnb2fBcndaOWapDwIRu0xZzxWAOx4=
X-Gm-Gg: ATEYQzxLOMT2UFsUKfI2fODDL9HSc0WL8Ejei0Ew8DJBPTjrlLmOwpdmtZ99iFTz0MB
 5zKE4WGgaXaRiAKX1aU3WcfDpY1nWCgKH9cDeqWicmaeCs1A/+9cjYNdLjp3dVe+DgvvkL/juXy
 1dFAkgRR9vz71rvujGlzNX84HKgCaUokq3n8wnUFTYZWFBmKtwq5dtgK6+A/9tvFpInXBGBDrSc
 Xamj+8dsaHwZi4aZ+VaKs6VUSCCDVBK1OxKEvhszVcUIt2hclnTL7pInFiou6xonjHHCWF7aqpG
 WcZtEkFJFHTK8ItatnrB3Ci4CA1IZzIDXjiYR4m7UBWcZTQmLfZ02SZNWco2dO2hJUD6ieLOxtv
 W1BLOC/CaifIxeSDJA4nqjElObYIrqnOlSnFwbDmKY8ZKANrZKnDEJMFDqznjSBzo1RyCdRxQA1
 fM9/fVXuw+7HXZksu6h0NdTPaa5dX5fsNjvTw8bUpXq/pMMWF/b8rK/oMU0gbfo6llW+tVZ9m6X
 /jA
X-Received: by 2002:a05:600c:a4a:b0:480:690e:f14a with SMTP id
 5b1f17b1804b1-4852691e00dmr20839155e9.14.1772789728143; 
 Fri, 06 Mar 2026 01:35:28 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:cbfe:649:7f17:8b95?
 ([2a01:e0a:106d:1080:cbfe:649:7f17:8b95])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485237ec557sm22098555e9.2.2026.03.06.01.35.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Mar 2026 01:35:27 -0800 (PST)
Message-ID: <1480c79c-8e66-4ee0-85a0-1a1fe0bf9228@linaro.org>
Date: Fri, 6 Mar 2026 10:35:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm: bridge: anx7625: don't crash if Type-C port is not
 used
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Xin Ji <xji@analogixsemi.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Salendarsingh Gaud <sgaud@qti.qualcomm.com>,
 Amit Kucheria <akucheri@qti.qualcomm.com>
References: <20260215-anx-fix-no-typec-v1-1-75172a5ca88b@oss.qualcomm.com>
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
In-Reply-To: <20260215-anx-fix-no-typec-v1-1-75172a5ca88b@oss.qualcomm.com>
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
X-Rspamd-Queue-Id: 3CF5521E06B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:andrzej.hajda@intel.com,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:heikki.krogerus@linux.intel.com,m:xji@analogixsemi.com,m:linux-kernel@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:sgaud@qti.qualcomm.com,m:akucheri@qti.qualcomm.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,intel.com,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,analogixsemi.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Action: no action

On 2/15/26 02:30, Dmitry Baryshkov wrote:
> From: Loic Poulain <loic.poulain@oss.qualcomm.com>
> 
> The typec_set_*() functions do not tolerate being passed the NULL
> typec_port instance. However, if CONFIG_TYPEC is enabled, but anx7625
> DT node doesn't have the usb-c connector fwnode, then typec_port remains
> NULL, crashing the kernel. Prevent calling typec_set_foo() functions by
> checking that ctx->typec_port is not NULL in anx7625_typec_set_status().
> 
>   Call trace:
>    typec_set_orientation+0x18/0x68 (P)
>    anx7625_typec_set_status+0x108/0x13c
>    anx7625_work_func+0x124/0x438
>    process_one_work+0x214/0x648
>    worker_thread+0x1b4/0x358
>    kthread+0x14c/0x214
>    ret_from_fork+0x10/0x20
>   Code: 910003fd a90153f3 aa0003f3 2a0103f4 (f9431400)
> 
> Fixes: f81455b2d332 ("drm: bridge: anx7625: implement minimal Type-C support")
> Reported-by: Salendarsingh Gaud <sgaud@qti.qualcomm.com>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> [db: dropped chunk anx7625_typec_unregister(), wrote commit message]
> Cc: Amit Kucheria <akucheri@qti.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/bridge/analogix/anx7625.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index c43519097a45..7f943b6548f3 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -1567,6 +1567,9 @@ static void anx7625_typec_set_status(struct anx7625_data *ctx,
>   				     unsigned int intr_status,
>   				     unsigned int intr_vector)
>   {
> +	if (!ctx->typec_port)
> +		return;
> +
>   	if (intr_vector & CC_STATUS)
>   		anx7625_typec_set_orientation(ctx);
>   	if (intr_vector & DATA_ROLE_STATUS) {
> 
> ---
> base-commit: 400a84e1f7a3681ef24d58d49b5d07e81c14f4e9
> change-id: 20260215-anx-fix-no-typec-4437cb7e54d2
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
