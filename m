Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKd2MjegqmlLUgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 10:36:55 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC7421E0D1
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 10:36:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07DDC10E20D;
	Fri,  6 Mar 2026 09:36:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="uIxphJaj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9065610E20D
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 09:36:51 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4836f363d0dso80168335e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 01:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772789810; x=1773394610; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=B0FYNp3iUTBt4BnwGEXvA3JaqeHyPg5uieiSbleRNMA=;
 b=uIxphJajrN99s8A607Xij3JdwxrzEgeR3Rv/BS/J9bIBoqz1dNwlIDSrQwHgwGywvq
 a5BgHcQRZNtn6OI6TO+5wtHlVEBBo2mh5gQWoo/ktrYTHpKvNHaGOVZVQaNXNid4q+m8
 +zIsEPGGOrp/Noh843smUEijDsvh+MSUvLT4O7UjvHtK3kt3FI7ywZwIDJAIsHol6W3T
 lqG+3tYm0kAra+JySqS0+Hm0WW6YyDlY/3n/i5DX0Zgok62djGrLnKYURriNSY70JMlf
 pcMjC2essXUtwhRtTXRQ0uz+PrczZHIc29sWR5HVkVLMrAiIwzw9sU1wV7QnLfzv0lC3
 pqEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772789810; x=1773394610;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B0FYNp3iUTBt4BnwGEXvA3JaqeHyPg5uieiSbleRNMA=;
 b=SiCLEFQgldqban8dphTOtL8FqUuf+dqyq1Etx8a+VLP7BNyDzs/Dw/xbpGZMWAmgFk
 sJ9xn1qEaK+vOqm16yS/DjfUR8KIkO3OCXQNKSbiPwMO1T2RKF3xVsZwXqM3nrQMkG5R
 JNkOtRsremt2HH7nbDT8V5DJjFbO+GwoBB48FD/o8fnf0YdOHL6lLlqDegYMu6eE7IoT
 +qGKpviln3ybQOXo3Mdk5h0PL79SKfS4nG30sDI948vDxUOzpaoACHgBRS+9yNCrjSh9
 4RpX2AA18fUgtga5NBtb6gvGK1PnmB2GysAYWaFEKt4/2SiJ4rLGLPv7ArefU4aJo4lN
 D59w==
X-Gm-Message-State: AOJu0YyBTzyWjqRdEVG21vukz2zRevpEqIQdDdjqx3D41IV0ZxovJ5Ib
 U3NSWciEvisvVWR/rBM5XWNSxtaCKkfCW4nvDXpz4Tc8T8Ihf5obnAkgIprcXkr6L6Y=
X-Gm-Gg: ATEYQzxA1oK4BQdZOqBj6o7SZUGHsMLu+2nDxYC/KjoWfZT2AB7lSABA+73Gi6tX8wa
 UDc9x8+wn5hueLn1V4HIQEgiW6DDOmMxfBuqZmCWZrI5VRtdBYcUwPtn2LtlsMyN9FTuSCultxU
 Mov7rVGdwqGsvWaM48mjiITgwY6Cwo4w1bX2gulA6/D3RuwPJy8Ut3FYtaAYt2JxgiMwp8tvuL0
 mEMQ4eUwB5hXdMF7pkV7pfM0fof3J5QRXywc1US6xMHmv/7MDyFTDz9e6ztXsukTrsbLCUF9SXT
 DMfzBdCe/q5tsH+vyFpyVm7CxLmTqk6J+YbIp30UeJBBBgHjSTDll/Ae5jM2Da3mwFQHqlzF86O
 TMXbQqtdFF/RpSRbdZYVSt4+tAnjlGclNLh2z14wbpREyH/RGj4O39YG8R+1FSG5UinvFUNkMJe
 NrugXaZvolXTOt2ym9Hr2uR13UmG2T/R4sMdW5og+1WJfOsDLKWMGH5XTdoLM229OKmPjr4RCnM
 u2/
X-Received: by 2002:a05:600c:8b26:b0:480:1c85:88bf with SMTP id
 5b1f17b1804b1-4852697a5c1mr21181895e9.27.1772789809706; 
 Fri, 06 Mar 2026 01:36:49 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:cbfe:649:7f17:8b95?
 ([2a01:e0a:106d:1080:cbfe:649:7f17:8b95])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851fad27dbsm87385335e9.2.2026.03.06.01.36.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Mar 2026 01:36:49 -0800 (PST)
Message-ID: <ab15e9e1-1328-446a-abba-3f9e257454ef@linaro.org>
Date: Fri, 6 Mar 2026 10:36:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm: bridge: anx7625: correctly detect if PD can be
 disabled
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Xin Ji <xji@analogixsemi.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260211-anx7625-fix-pd-v1-1-1dd31451b06f@oss.qualcomm.com>
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
In-Reply-To: <20260211-anx7625-fix-pd-v1-1-1dd31451b06f@oss.qualcomm.com>
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
X-Rspamd-Queue-Id: 1FC7421E0D1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:andrzej.hajda@intel.com,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:xji@analogixsemi.com,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,intel.com,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,analogixsemi.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:replyto,qualcomm.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo];
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
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Action: no action

On 2/11/26 10:17, Dmitry Baryshkov wrote:
> During initial checks the ANX7625 bridge can be powered on before
> setting up the Type-C port. At this point, when
> anx7625_ocm_loading_check() checks if it can disable PD or not, it will
> notice that typec_port is not set and disable PD, breaking orientation
> and HPD handling. Unify the check between anx7625_ocm_loading_check()
> anx7625_i2c_probe() and anx7625_typec_register() and check for the
> presence of the "connector" node.
> 
> Fixes: 8ad0f7d2e6fd ("drm: bridge: anx7625: implement message sending")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/bridge/analogix/anx7625.c | 21 ++++++++++++++-------
>   1 file changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index c43519097a45..1157a58cf1b1 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -1363,6 +1363,18 @@ static void anx7625_configure_hpd(struct anx7625_data *ctx)
>   	anx7625_hpd_timer_config(ctx);
>   }
>   
> +static bool anx7625_need_pd(struct anx7625_data *ctx)
> +{
> +	struct fwnode_handle *fwnode;
> +
> +	fwnode = device_get_named_child_node(ctx->dev, "connector");
> +	if (!fwnode)
> +		return false;
> +
> +	fwnode_handle_put(fwnode);
> +	return true;
> +}
> +
>   static int anx7625_ocm_loading_check(struct anx7625_data *ctx)
>   {
>   	int ret;
> @@ -1378,7 +1390,7 @@ static int anx7625_ocm_loading_check(struct anx7625_data *ctx)
>   	if ((ret & FLASH_LOAD_STA_CHK) != FLASH_LOAD_STA_CHK)
>   		return -ENODEV;
>   
> -	if (!ctx->typec_port)
> +	if (!anx7625_need_pd(ctx))
>   		anx7625_disable_pd_protocol(ctx);
>   	anx7625_configure_hpd(ctx);
>   
> @@ -2924,12 +2936,7 @@ static int anx7625_i2c_probe(struct i2c_client *client)
>   	}
>   
>   	if (!platform->pdata.low_power_mode) {
> -		struct fwnode_handle *fwnode;
> -
> -		fwnode = device_get_named_child_node(dev, "connector");
> -		if (fwnode)
> -			fwnode_handle_put(fwnode);
> -		else
> +		if (!anx7625_need_pd(platform))
>   			anx7625_disable_pd_protocol(platform);
>   
>   		anx7625_configure_hpd(platform);
> 
> ---
> base-commit: 400a84e1f7a3681ef24d58d49b5d07e81c14f4e9
> change-id: 20260211-anx7625-fix-pd-792609132331
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
