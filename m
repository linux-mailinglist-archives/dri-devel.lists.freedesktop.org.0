Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eE43Alk/k2kg2wEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 17:01:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 313AE145DB0
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 17:01:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C57510E3C1;
	Mon, 16 Feb 2026 16:01:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zuuUg2MI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4759B10E3BD
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 16:01:22 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id
 4fb4d7f45d1cf-65c01595276so1398993a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 08:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771257681; x=1771862481; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=QUAlu6XYigsGBemijuVDswvQMOiLK2+waYYTQNmfMck=;
 b=zuuUg2MIXqcpnPdP2RdZSgA0BK84D6s+qoUzGA20nTH20Rq+Kh1g6lJrvNfdsm/tXJ
 +vn1d2tlyR0e/3uzd97Qbp/2HeChsK3qN5DFbIRb8tgew69yVWKTYeKroXPZ8nj2Sa0z
 VUZillg43cVN91kGZWHcLdMEOLlUGvzO8HcmyXfvZ5zOTLApOQ33UfLfadk3+Utg3eSG
 I5rc5QZw8oWyeVC0hdAflTMTgZ+5wGfUMM/kBRwKgJmmTJbMBCvHsa8ndjWhXEoKLaHN
 ptHRtH9yneLceVhwk1Qi6abthrzBlAfYG/ibmvh7is40bcaa+9Cu6NYQZ9my9gVCUn61
 CImQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771257681; x=1771862481;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QUAlu6XYigsGBemijuVDswvQMOiLK2+waYYTQNmfMck=;
 b=e1g+1HuO+h4+DAxWeldRUPZAOHAuPhl5ZjEeW3my6MFsMRqf9LQ24WeV2NeTLnZ1V9
 JQmUNFwoFk3zoOsDdSmnaV6s6jIxM3NEC9UTh4Z9Fh98VdcbTRc1CJ2741PgaQHijtvA
 kAPGR/sKQ53j1Pzu7WO0Bxer6BuyDD1iyWqJ/3F+phdr6dwRI2qpi/hxxA2fvnCSKp3H
 oOW3m+1V59IFB64FFHufkoH8GbLLhJf5v+e6EHYZHvmsZz2p46qHSZ1ZDrBXXKrFCwKJ
 9zF+1NTMbDc3NYoMmHEbABJ5qe5r463yKSYbKCnNt3jdTqazbdTpNoStgV4GcK/+VL8b
 db/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCvHB42HrKv8IHetkPEcmGksAlBuy7PQlw9Nxfc2s49Oq09mEywP6AcpZxYuSWBNpUUoHSoTRrvY4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwKj4O2kpQEDIHwz4aSVaH0DXnLOcJj7FHaJUZh/ugTnVzytQWf
 lO2qgh0FGggkWxdCGgmKQg9/JZDa5KA8wbUZA/LBHbDAqFXPqQsHK3VjA/L3STHPmDU=
X-Gm-Gg: AZuq6aKbJqZF9PTPwxifyQZIK2HSp5CWDPR7fOeXRFBM3S/CTjIPtHMJaqmtyCJlWw4
 ZiJnfyJ1ElwCdwL6mJiGmllD6NpVbTvw/58d83ERoaSnARYIbe8QUj/bYX6m3an2XSpGNOKWstd
 fRPhWq/9NzfSpuqb20EpBlQyEMW8ZWeBuPxu7xOTBbHocPCxYyPihk6VdpK2+Oy1NvEEmfYkhGq
 4x5k18+nWWm57P2WOxOhKAWjtbWJjwhZn4LdA0bGXz/B3fAeDIhTaW4+zkUh6oIcfv+UZ29+yQI
 7SUqjRIbFWnOOoEkrcr/l+QvY8mvUce96pMw1y6WbsxmBwJ9jdBghEVi2w1RE690pVPLR/RyBQI
 ezyCn7iM0MajtAe2Ov3TJjIBMLadG6mdfFQPFdL5kvWtPA9kKdH8I6O7VHQ6W3j0GJENDFh/aTa
 8glXfLHAnMmFICoxOuSvMIPRwexw7/mxri8XKt5AU48RK55GbIPaWlIiqTc8078MKUxE53LMKmB
 Clmhg==
X-Received: by 2002:a17:907:6d22:b0:b88:505d:2ac with SMTP id
 a640c23a62f3a-b8fc38f90eamr352340766b.1.1771257680468; 
 Mon, 16 Feb 2026 08:01:20 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:80b4:8b51:72a6:9e2a?
 ([2a01:e0a:106d:1080:80b4:8b51:72a6:9e2a])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8fc76c7015sm259165666b.66.2026.02.16.08.01.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Feb 2026 08:01:20 -0800 (PST)
Message-ID: <b10bf126-d664-42e4-a333-10657eca6d94@linaro.org>
Date: Mon, 16 Feb 2026 17:01:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 1/2] drm/panel: simple: Add Waveshare 13.3" panel
 support
To: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 dri-devel@lists.freedesktop.org
Cc: Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Simona Vetter <simona@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260117005028.126361-1-marek.vasut+renesas@mailbox.org>
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
In-Reply-To: <20260117005028.126361-1-marek.vasut+renesas@mailbox.org>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:marek.vasut+renesas@mailbox.org,m:conor+dt@kernel.org,m:airlied@gmail.com,m:geert+renesas@glider.be,m:jesszhan0024@gmail.com,m:krzk+dt@kernel.org,m:maarten.lankhorst@linux.intel.com,m:magnus.damm@gmail.com,m:mripard@kernel.org,m:robh@kernel.org,m:sam@ravnborg.org,m:simona@ffwll.ch,m:thierry.reding@gmail.com,m:tzimmermann@suse.de,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:marek.vasut@mailbox.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,m:magnusdamm@gmail.com,m:thierryreding@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,glider.be,linux.intel.com,ravnborg.org,ffwll.ch,suse.de,vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,renesas,dt];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 313AE145DB0
X-Rspamd-Action: no action

On 1/17/26 01:49, Marek Vasut wrote:
> Add WaveShare 13.3inch 1920x1080 DSI Capacitive Touch Display support.
> 
> While the panel is described as DPI panel, it is part of a larger unit
> in non-removable metal casing, so the actual internal configuration is
> not known. The panel is attached to "waveshare,dsi2dpi" bridge via DT.
> It is likely that internally, this panel is an LVDS panel, connected to
> ICN6211 DSI-to-DPI bridge and then another unknown DPI-to-LVDS bridge.
> 
> Current device link is at https://www.waveshare.com/13.3inch-dsi-lcd.htm
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Jessica Zhang <jesszhan0024@gmail.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> V3: New patch. Note that the compatible string is already part of
>      Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 30 ++++++++++++++++++++++++++++
>   1 file changed, 30 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 91ab280869bac..40a73c32b0b17 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -4998,6 +4998,33 @@ static const struct panel_desc vl050_8048nt_c01 = {
>   	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE,
>   };
>   
> +static const struct drm_display_mode waveshare_133inch_mode = {
> +	.clock = 148500,
> +	.hdisplay = 1920,
> +	.hsync_start = 1920 + 88,
> +	.hsync_end = 1920 + 88 + 44,
> +	.htotal = 1920 + 88 + 44 + 148,
> +	.vdisplay = 1080,
> +	.vsync_start = 1080 + 4,
> +	.vsync_end = 1080 + 4 + 5,
> +	.vtotal = 1080 + 4 + 5 + 36,
> +	.flags = DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PHSYNC,
> +};
> +
> +static const struct panel_desc waveshare_133inch = {
> +	.modes = &waveshare_133inch_mode,
> +	.num_modes = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 293,
> +		.height = 163,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> +	.connector_type = DRM_MODE_CONNECTOR_DPI,
> +	.bus_flags = DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE |
> +		     DRM_BUS_FLAG_SYNC_SAMPLE_POSEDGE,
> +};
> +
>   static const struct drm_display_mode winstar_wf35ltiacd_mode = {
>   	.clock = 6410,
>   	.hdisplay = 320,
> @@ -5598,6 +5625,9 @@ static const struct of_device_id platform_of_match[] = {
>   	}, {
>   		.compatible = "vxt,vl050-8048nt-c01",
>   		.data = &vl050_8048nt_c01,
> +	}, {
> +		.compatible = "waveshare,13.3inch-panel",
> +		.data = &waveshare_133inch,
>   	}, {
>   		.compatible = "winstar,wf35ltiacd",
>   		.data = &winstar_wf35ltiacd,

LGTM


Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
