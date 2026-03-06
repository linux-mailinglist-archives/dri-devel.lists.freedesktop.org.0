Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKCvAf6iqml6UwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 10:48:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD1221E34A
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 10:48:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4BB310ECC8;
	Fri,  6 Mar 2026 09:48:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wkmCLTYd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B07E910ECC2
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 09:48:39 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-483487335c2so75913585e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 01:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772790518; x=1773395318; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=A0skaQly3xu/7Pfp3EqIaGvuhPoNwqKJaplDt4EGHzs=;
 b=wkmCLTYd9Ip43GyWP9j+suDtPdaGMoXXlHoqGr0A6+m5Vb9MlFb4vgAkyCBU/88wFp
 RJKZ1me4hN0sS+tQQvy6buLwHoLMWNJ3ZU8TqRFLRDXr9NtdFA7yBKEoOKVf34BdyET8
 j0UFx7OAXDasFehyim/ce1WNe03cSy1Am+kvGJ43essW4mMEQlIbo019uj1oh1IiFmUO
 vO8ScmY6siHI5D1aCrnR0JxJbJ5Dhta7p4hWIhxETxtBz1K8GLvKHq3ih4NJnQ87MeH7
 stcgQdSq0H4fMQdTLSf5LCDIHzvlUTnpFH3Zi0RhJs4cZ3BFB6AxrWMmAYlxRVRyKkvH
 godA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772790518; x=1773395318;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A0skaQly3xu/7Pfp3EqIaGvuhPoNwqKJaplDt4EGHzs=;
 b=H9jwKxBjyw0HgMSZgGQPpkbi0D4i456NLi7un2FfOPuTyo2NemuMBE+xw+yftyAK5t
 Tx4Jq/V1kT6g3fot92N6HSWLzW39I/518wYCF2nf7bdgheEJTbGDD3zGkDxKDAQkhO6A
 5mWAElTJMFUDu2RKNqAmdDjdUT8a1vaKgJbwgMJNbyTkbA55T9lF5MAhcr+aGOWM9Yx8
 7mJyr073115XCKKgeNIk4dNaTkCeTazqr1a5pZa9fKDcLgRxtgf1eLHJqQgPueZYkjFV
 zIUjBkCGpNHRKQwg0P2fB5AfMVjNRCgiGnedwthJjokIpDpJg0PpBvEgdIX0/Gdo51QV
 9DdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX46rOypPWHP92MfJ7/6RMtsOWV3s2Jq+Wh30dlZbvolTGdgUEkNO6UMwkJcTpJX8J6ihFe/UYH4Pg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxMcJxGGPmSc4JhjN3yteOZLmfmqaK/VL72W/dSek7CK1bxhiEE
 Ed/I0Ea9ICvTmqQMd8zIhheRqMMN5wfyC/IZ3ozVQDe3JuuZy5p67DAuunLdg12pr0w=
X-Gm-Gg: ATEYQzyXO60+lsS+E+Jne5zdVwN3OPtllGilhg4jXudw1Z4OkkKh6np6JizbmVfbNqH
 jMYSIj8Lfl+Xaak7tcsuo6QwoRiSjwMdaKpCosaWrc+uh4fj6ltGh33Q6AVzbNo6KEL5Abg8c17
 9Wobv1mwdDNwvuaVOaENLpMd7Pd6VzCaUFm8gGUafrTvxpifyUkgF6gsZWbgG7+6Q8j9bAh6d5j
 AqF34jPUJpUbz7/mZTcQY83IX8HTgMesc/vsbnAZ+EHX7HU84PNqvcmQFslTXaRNSgq+5gvnN01
 7+C7b6rJ1xg9xcF637c5xOT4K2wdSspe62+ar+xPge7DpqjwtKll5/XZuoG4twFpGxXglIrKLtr
 3Dfa14qg0yLzXtAFMPoKpMLnan7roNeA5g7r/8RfZ9FbIRCF8MBekNnH2jNnNaYgDjx/zpj6Z+X
 aQYrrwuUBQ+uoP6zdZPvxuRNOWqdV2nCr/8BiY2LI95V2UTUYjMAa7G969GSVICiNx8lKrMbBU9
 +Ceb8F0KY6ycJs=
X-Received: by 2002:a05:600c:8705:b0:483:7ce6:1efb with SMTP id
 5b1f17b1804b1-48526969371mr21439055e9.17.1772790517583; 
 Fri, 06 Mar 2026 01:48:37 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:cbfe:649:7f17:8b95?
 ([2a01:e0a:106d:1080:cbfe:649:7f17:8b95])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851fad27e6sm124724355e9.3.2026.03.06.01.48.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Mar 2026 01:48:37 -0800 (PST)
Message-ID: <4902bc08-a5af-42a8-8655-8debcd31576a@linaro.org>
Date: Fri, 6 Mar 2026 10:48:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm: bridge: anx7625: enforce CONFIG_USB_ROLE_SWITCH
 dependency
To: Arnd Bergmann <arnd@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Xin Ji <xji@analogixsemi.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Ayushi Makhija <quic_amakhija@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Chen-Yu Tsai <wenst@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260304083604.724519-1-arnd@kernel.org>
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
In-Reply-To: <20260304083604.724519-1-arnd@kernel.org>
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
X-Rspamd-Queue-Id: 7BD1221E34A
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
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:arnd@kernel.org,m:andrzej.hajda@intel.com,m:rfoss@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:dmitry.baryshkov@oss.qualcomm.com,m:heikki.krogerus@linux.intel.com,m:xji@analogixsemi.com,m:arnd@arndb.de,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:quic_amakhija@quicinc.com,m:dianders@chromium.org,m:luca.ceresoli@bootlin.com,m:loic.poulain@oss.qualcomm.com,m:wenst@chromium.org,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,intel.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,analogixsemi.com];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[arndb.de,ideasonboard.com,kwiboo.se,gmail.com,quicinc.com,chromium.org,bootlin.com,oss.qualcomm.com,lists.freedesktop.org,vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Action: no action

On 3/4/26 09:35, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> When CONFIG_TYPEC is enabled, but USB_ROLE_SWITCH=m, the anx7625 driver
> fails to link as built-in:
> 
> aarch64-linux-ld: drivers/gpu/drm/bridge/analogix/anx7625.o: in function `anx7625_i2c_remove':
> anx7625.c:(.text+0x6ec): undefined reference to `usb_role_switch_put'
> aarch64-linux-ld: drivers/gpu/drm/bridge/analogix/anx7625.o: in function `anx7625_typec_set_status':
> anx7625.c:(.text+0x3080): undefined reference to `usb_role_switch_set_role'
> aarch64-linux-ld: drivers/gpu/drm/bridge/analogix/anx7625.o: in function `anx7625_i2c_probe':
> anx7625.c:(.text+0x5368): undefined reference to `fwnode_usb_role_switch_get'
> 
> The problem is that both dependencies are optional in the sense of allowing
> the anx7625 driver to call the exported interfaces to be used from a loadable
> module, but cannot work for built-in drivers. It would be possible to handle
> all nine combinations of the CONFIG_TYPEC and CONFIG_USB_ROLE_SWITCH tristate
> options, but that does add a lot of complexity that seems unnecessary when
> in reality any user of this driver would have both enabled anyway.
> 
> Turn both dependencies into hard 'depends on' here to only allow configurations
> where it's possible to actually use them, and remove the misguided IS_REACHABLE()
> check that did nothing here.
> 
> Fixes: f81455b2d332 ("drm: bridge: anx7625: implement minimal Type-C support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/gpu/drm/bridge/analogix/Kconfig   |  3 ++-
>   drivers/gpu/drm/bridge/analogix/anx7625.c | 17 -----------------
>   2 files changed, 2 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/Kconfig b/drivers/gpu/drm/bridge/analogix/Kconfig
> index f3448b0631fe..03dc7ffe824a 100644
> --- a/drivers/gpu/drm/bridge/analogix/Kconfig
> +++ b/drivers/gpu/drm/bridge/analogix/Kconfig
> @@ -34,7 +34,8 @@ config DRM_ANALOGIX_ANX7625
>   	tristate "Analogix Anx7625 MIPI to DP interface support"
>   	depends on DRM
>   	depends on OF
> -	depends on TYPEC || !TYPEC
> +	depends on TYPEC
> +	depends on USB_ROLE_SWITCH
>   	select DRM_DISPLAY_DP_HELPER
>   	select DRM_DISPLAY_HDCP_HELPER
>   	select DRM_DISPLAY_HELPER
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index c43519097a45..ec4b24481987 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -1483,7 +1483,6 @@ static void anx7625_start_dp_work(struct anx7625_data *ctx)
>   	DRM_DEV_DEBUG_DRIVER(dev, "Secure OCM version=%02x\n", ret);
>   }
>   
> -#if IS_REACHABLE(CONFIG_TYPEC)
>   static u8 anx7625_checksum(u8 *buf, u8 len)
>   {
>   	u8 ret = 0;
> @@ -1635,22 +1634,6 @@ static void anx7625_typec_unregister(struct anx7625_data *ctx)
>   	usb_role_switch_put(ctx->role_sw);
>   	typec_unregister_port(ctx->typec_port);
>   }
> -#else
> -static void anx7625_typec_set_status(struct anx7625_data *ctx,
> -				     unsigned int intr_status,
> -				     unsigned int intr_vector)
> -{
> -}
> -
> -static int anx7625_typec_register(struct anx7625_data *ctx)
> -{
> -	return 0;
> -}
> -
> -static void anx7625_typec_unregister(struct anx7625_data *ctx)
> -{
> -}
> -#endif
>   
>   static int anx7625_read_hpd_status_p0(struct anx7625_data *ctx)
>   {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
