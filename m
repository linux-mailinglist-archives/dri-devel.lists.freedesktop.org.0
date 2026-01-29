Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2L4DFeobe2msBQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 09:35:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3804AD91E
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 09:35:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E33710E1C0;
	Thu, 29 Jan 2026 08:35:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Awi1D+0C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55B7410E1C0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 08:35:50 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4805ef35864so5191275e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 00:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769675749; x=1770280549; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=LLJo4p207VCq5w7vEIL+AFmewJQJE6XG7weT5mAvfDM=;
 b=Awi1D+0C42LflmUCKS1jeNWydRjtmyE9yWiDh+GqSyzrXH36sinNZ9E9ftojBtkRXf
 0XLbPyXAm+X0Jv7l/e5MAHIjheEHfpqr0F2PT/RsTzy+fwvse4P814VqNTgyQ5L0Tbla
 JG6sHK8tw8UHUn9uE3Rqn6VsACP5K+3WMWCyETWQK+gSOlIC6OXEBUtkrBNcOZSpVUr2
 G9cFE1R6uUCQxPwrVhd4CQ2FtdMehDeXcIPhwuI4fJxXKQnNYcHk20+RWtb9XOZKuQKa
 VR7PmO3JKyQ5tPjuxc7BZvEhBV7mmsft8S1JcXIp9rfWDfm4GalEK57pF0VM48V0mf7l
 /AMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769675749; x=1770280549;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LLJo4p207VCq5w7vEIL+AFmewJQJE6XG7weT5mAvfDM=;
 b=mWIthSYycN0CtjKOTG0lfuw6xV5kXxZYLwwQSw3vPc6r9m2ADjOOMwV+pU9CMM8/dy
 OI1x+/n0UtE1EbAY9wTtXsvYyYN7MD/T6XVvSZ5kkExug6VjXKrCg/QfB93S0Olfgk6Q
 CaT062reP7fBvjycgm9YKKIpOpUXYymo73Xvwk1F1bSUu0I/mZLIJZXlkGuPKLyz9Dxk
 FlfkgvfOL1ifppxpU6CIXZO8tOkx1rdwNzVprjevR9cNxyMI04D4NWTWQfwBqs+mhVe9
 uxUSQ4F0Ohs/KGq/n6UQoUfDcsB6uHwjGJdp4HC3EhD/8MmPr5Ch+ZFmrwm1DDmHqCdo
 hIHw==
X-Gm-Message-State: AOJu0Yy5/P35ILkkXSpUW/ChEZZRad9GTY/XUdrreiqydhpMSBqzrbgB
 PbRxh89YpEd4PvpCng1gmdBWN7c+QU4pY7L60rseDRRklGrIaFtFO5BWmQwHPlSMQDw=
X-Gm-Gg: AZuq6aI+cXrQk5V+YJh7En10gxxZiAlahpQfKa9ga2DAL71C3qJ1WQuWomEwfB6KUy5
 AkH5R4dbSeAi5LwajAvMtVP4+wqUIttZtUnN4PJcNlVPQN8xQKjipQS42WBOeJup+wbMZOMs2Hu
 P271u/ZRTmYeEZ3By1bg4GAREXZ5BrZt+5IgC4MEITEIoVlbftMGKc9b9dP6rP4sRgLESf0LBgl
 7ztFhGjANUIpoq2V6UlrZdo2ftasHPr3gcuSN6LfFX0UVZN3VOEVUosKB+SwzT7j3u9P64vzhQZ
 XdEhLXUs1VsoUgT1yx/qofSaWOyvKaqVm+msCk75Ok6rRYxoEwE0O/KLIZlCoM4balNANZzmtBF
 Iz3gAQ/TdZGQmeUPwr1h2KfVObMYJx181tY/J2BNLm3sZGy8F/IJhixdEkLxQ4yzDz5UqOIe4YG
 SWoIzfKLOwAA/BcNtGZEXiokWYvgSQWjzaMPs0L4nfqXo67ceOVb+518m5bTOMBs0=
X-Received: by 2002:a05:600c:474d:b0:480:1d0b:2d15 with SMTP id
 5b1f17b1804b1-48069c53fdbmr85904995e9.27.1769675748622; 
 Thu, 29 Jan 2026 00:35:48 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:ae8a:f349:da93:8d6e?
 ([2a01:e0a:3d9:2080:ae8a:f349:da93:8d6e])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48066c40e04sm180119335e9.13.2026.01.29.00.35.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jan 2026 00:35:48 -0800 (PST)
Message-ID: <9042eca8-8b44-4804-9013-c21f1fc0d2b7@linaro.org>
Date: Thu, 29 Jan 2026 09:35:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: display: lt9611: Support single Port
 B input
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Roger Shimizu <rosh@debian.org>
References: <20260128-rubikpi-next-20260116-v2-0-ba51ce8d2bd2@thundersoft.com>
 <20260128-rubikpi-next-20260116-v2-1-ba51ce8d2bd2@thundersoft.com>
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
In-Reply-To: <20260128-rubikpi-next-20260116-v2-1-ba51ce8d2bd2@thundersoft.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hongyang.zhao@thundersoft.com,m:andrzej.hajda@intel.com,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:rosh@debian.org,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[thundersoft.com,intel.com,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,ffwll.ch,linux.intel.com,suse.de];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:replyto,linaro.org:mid,thundersoft.com:email,0.0.0.1:email];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.2:email];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: B3804AD91E
X-Rspamd-Action: no action

On 1/28/26 12:15, Hongyang Zhao wrote:
> The LT9611 has two DSI input ports (Port A and Port B). Update the
> binding to clearly document the port mapping and allow using Port B
> alone when DSI is physically connected to Port B only.
> 
> Changes:
> - Clarify port@0 corresponds to DSI Port A input
> - Clarify port@1 corresponds to DSI Port B input
> - Change port requirement from mandatory port@0 to anyOf port@0/port@1,
>    allowing either port to be used independently
> 
> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> Reviewed-by: Roger Shimizu <rosh@debian.org>
> ---
>   .../bindings/display/bridge/lontium,lt9611.yaml           | 15 +++++++++++----
>   1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
> index 655db8cfdc25..429a06057ae8 100644
> --- a/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
> @@ -44,21 +44,28 @@ properties:
>         port@0:
>           $ref: /schemas/graph.yaml#/properties/port
>           description:
> -          Primary MIPI port-1 for MIPI input
> +          DSI Port A input. directly drives the display, or works in
> +          combination with Port B for higher resolution displays.
>   
>         port@1:
>           $ref: /schemas/graph.yaml#/properties/port
>           description:
> -          Additional MIPI port-2 for MIPI input, used in combination
> -          with primary MIPI port-1 to drive higher resolution displays
> +          DSI Port B input. Can be used alone if DSI is physically
> +          connected to Port B, or in combination with Port A for higher
> +          resolution displays.
>   
>         port@2:
>           $ref: /schemas/graph.yaml#/properties/port
>           description:
>             HDMI port for HDMI output
>   
> +    anyOf:
> +      - required:
> +          - port@0
> +      - required:
> +          - port@1
> +
>       required:
> -      - port@0
>         - port@2
>   
>   required:
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
