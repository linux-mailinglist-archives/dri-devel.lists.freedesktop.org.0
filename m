Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GtECTuuqmluVQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 11:36:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACEA821EDC0
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 11:36:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46C4A10ECCE;
	Fri,  6 Mar 2026 10:36:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TT/GQ24B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1524410ECCE
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 10:36:36 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-439afc58ac7so6109028f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 02:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772793395; x=1773398195; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=3EGe3SmyrzPtlbWZhEG6oNZxtdM4EE/DcJpAMXyPYQ4=;
 b=TT/GQ24BpIxW4C/4Mq6TmvsJ4wclOKNRaMtn65MQfHXzBYiI2Og2U1V26VEy0L8/Ar
 8RwVseP7SjXjY1eYWKYn/5rnPJhGox/N0p5+muKC2VboQfIHlEzL8cfXpL34o3h4lpa9
 Qo+RWxbha0vhYG1Sf/r4Ixs9z/QlpuP7/P2suIrF7hyiePPP3cBdTiV44pncdlsxUryB
 +dEbzY3IXnAHh1OqbuVHav7nAbHH/Rf71dg8eaKNR1x4/Ledq15UZ6BseUXezBYctQOp
 4dWMf5a+w0W7WlvcLYpVJhrG6oawYFhMzxPCN0Z8bq6QULmDlkhqJSdNT2LY6vVS0c7z
 hhAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772793395; x=1773398195;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3EGe3SmyrzPtlbWZhEG6oNZxtdM4EE/DcJpAMXyPYQ4=;
 b=HesWLlXlLUCJT8FCi2PRnh1Em8FlodC5sBUO2JezcAoANM2gKxExkhL6jCUsGxMcf2
 lsQiH7KHUUkCy5BR73BzUAUWn/T7G0dSnUygKvnTM26LGDd2IYVckvkSLj8oDmldqXvG
 khBOLu8zHBB7a4CVSkDTOoy08tpVJeHGpkOxqQ5aeRuLBQ6mcqGPeI86GJz4AstjBmC4
 GAUJBUxcIQGyeg/PgGmcvl9MTAeHHVgeKu5hwDTM09aabQ5it4NfX3GMBfK2DlfhgQPC
 ulHWSHy12cup7T076NQC8tb6yW9vIIk4hkrVcmCsixCd26y6RZXvVEPuhcXHffjF3xOz
 KpTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYx1breqvTMxOabaSYsEAINwTzAfcoSgVEnwn+uXsX5Kg4awey2wjfv/lTxwV6JZ9BcIha95kLOD0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxFauWdbjjEeqSlEK0wedvQO8RbxGtF+AIXhWSlvp+0PI9U69nV
 FaHg4ADTaquKQ2UU0VkPbt7DCx+yT2FafhdlHJ4BYdMIC/sp3S8pS9F9vWRfde8qOxQ=
X-Gm-Gg: ATEYQzznNLgWPnWMFxgrLbJld3qjrGLYQpagwvIxxOShSlQhS1S9vP2ilnv3d97q0tf
 gi0F00LsbYCy9AN+JOqY+b2o6BRNs0vIdZQW5pnLBOeg05wQOJrY2d4xjKmfFu+OsNAbonUJ53i
 HktO0TxfVkLSi7ywJ6LBYHBkYim+OPlAR8v3Gg2/5e356tLP+XFTjd69+KYKsO2hqKPhGobLkRf
 7FuD7Pby5dW41K046rtEF4viAxU7MU80K5DtFriylNYFAtz88mlaYRlGbQ2Op6/vVuUON0p6RoF
 5xMDrZxDq+WxZY2a0SrnqLZ36whxJARganGBmhg39T2cZa2ozlyoFEkZJZcjzXPEFxnuWR1WT0t
 jkq1RbfKQQhawfDj7zVrGPqeoElTdomBlQXSt8gK4AlmIB8bmkNRIZAIQ0SikhSmA0wxNPaY1ZZ
 piw7yjz4vVRaecl0Vt5e37f4J/CvQ1WQhcbV8t5/CkTYj4v9QoGn0UHaXvnPaf5Su7mFa/1bQcj
 SPQL7B6fkEtCYk=
X-Received: by 2002:a05:6000:230f:b0:439:b7a2:60ff with SMTP id
 ffacd0b85a97d-439da8820f6mr2786963f8f.32.1772793394525; 
 Fri, 06 Mar 2026 02:36:34 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:cbfe:649:7f17:8b95?
 ([2a01:e0a:106d:1080:cbfe:649:7f17:8b95])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dae56300sm2769384f8f.37.2026.03.06.02.36.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Mar 2026 02:36:34 -0800 (PST)
Message-ID: <61cbca48-6e3d-436f-992f-e7548948eb96@linaro.org>
Date: Fri, 6 Mar 2026 11:36:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] dt-bindings: display/msm: move DSI PHY bindings to phy/
 subdir
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
References: <20260305-msm-dsi-phy-v1-1-0a99ac665995@oss.qualcomm.com>
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
In-Reply-To: <20260305-msm-dsi-phy-v1-1-0a99ac665995@oss.qualcomm.com>
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
X-Rspamd-Queue-Id: ACEA821EDC0
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
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:quic_mkrishn@quicinc.com,m:jonathan@marek.ca,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-phy@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,marek.ca];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,dri-devel-bounces@lists.freedesktop.org];
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
	TAGGED_RCPT(0.00)[dri-devel,dt];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Action: no action

On 3/5/26 00:47, Dmitry Baryshkov wrote:
> Historically DSI PHY bindings landed to the display/msm subdir, however
> they describe PHYs and as such they should be in the phy/ subdir.
> Follow the example of other Qualcomm display-related PHYs (HDMI, eDP)
> and move bindings for the Qualcomm DSI PHYs to the correct subdir.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Merge strategy: I'd ask to merge bindings through the msm tree, reducing
> the conflicts for the current kernel development cycle. Starting from
> the cycle after this patch is merged, DSI PHY bindings should go through
> the PHY tree.
> ---
>   .../{display/msm/dsi-phy-10nm.yaml => phy/qcom,dsi-phy-10nm.yaml}     | 4 ++--
>   .../{display/msm/dsi-phy-14nm.yaml => phy/qcom,dsi-phy-14nm.yaml}     | 4 ++--
>   .../{display/msm/dsi-phy-20nm.yaml => phy/qcom,dsi-phy-20nm.yaml}     | 4 ++--
>   .../{display/msm/dsi-phy-28nm.yaml => phy/qcom,dsi-phy-28nm.yaml}     | 4 ++--
>   .../{display/msm/dsi-phy-7nm.yaml => phy/qcom,dsi-phy-7nm.yaml}       | 4 ++--
>   .../{display/msm/dsi-phy-common.yaml => phy/qcom,dsi-phy-common.yaml} | 2 +-
>   6 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml b/Documentation/devicetree/bindings/phy/qcom,dsi-phy-10nm.yaml
> similarity index 96%
> rename from Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
> rename to Documentation/devicetree/bindings/phy/qcom,dsi-phy-10nm.yaml
> index fc9abf090f0d..d98217747ad1 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,dsi-phy-10nm.yaml
> @@ -1,7 +1,7 @@
>   # SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>   %YAML 1.2
>   ---
> -$id: http://devicetree.org/schemas/display/msm/dsi-phy-10nm.yaml#
> +$id: http://devicetree.org/schemas/phy/qcom,dsi-phy-10nm.yaml#
>   $schema: http://devicetree.org/meta-schemas/core.yaml#
>   
>   title: Qualcomm Display DSI 10nm PHY
> @@ -10,7 +10,7 @@ maintainers:
>     - Krishna Manikandan <quic_mkrishn@quicinc.com>
>   
>   allOf:
> -  - $ref: dsi-phy-common.yaml#
> +  - $ref: qcom,dsi-phy-common.yaml#
>   
>   properties:
>     compatible:
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml b/Documentation/devicetree/bindings/phy/qcom,dsi-phy-14nm.yaml
> similarity index 94%
> rename from Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
> rename to Documentation/devicetree/bindings/phy/qcom,dsi-phy-14nm.yaml
> index 206a9a4b3845..be31b9bac9d5 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,dsi-phy-14nm.yaml
> @@ -1,7 +1,7 @@
>   # SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>   %YAML 1.2
>   ---
> -$id: http://devicetree.org/schemas/display/msm/dsi-phy-14nm.yaml#
> +$id: http://devicetree.org/schemas/phy/qcom,dsi-phy-14nm.yaml#
>   $schema: http://devicetree.org/meta-schemas/core.yaml#
>   
>   title: Qualcomm Display DSI 14nm PHY
> @@ -10,7 +10,7 @@ maintainers:
>     - Krishna Manikandan <quic_mkrishn@quicinc.com>
>   
>   allOf:
> -  - $ref: dsi-phy-common.yaml#
> +  - $ref: qcom,dsi-phy-common.yaml#
>   
>   properties:
>     compatible:
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-20nm.yaml b/Documentation/devicetree/bindings/phy/qcom,dsi-phy-20nm.yaml
> similarity index 93%
> rename from Documentation/devicetree/bindings/display/msm/dsi-phy-20nm.yaml
> rename to Documentation/devicetree/bindings/phy/qcom,dsi-phy-20nm.yaml
> index 93570052992a..1d135419d015 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-20nm.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,dsi-phy-20nm.yaml
> @@ -1,7 +1,7 @@
>   # SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>   %YAML 1.2
>   ---
> -$id: http://devicetree.org/schemas/display/msm/dsi-phy-20nm.yaml#
> +$id: http://devicetree.org/schemas/phy/qcom,dsi-phy-20nm.yaml#
>   $schema: http://devicetree.org/meta-schemas/core.yaml#
>   
>   title: Qualcomm Display DSI 20nm PHY
> @@ -10,7 +10,7 @@ maintainers:
>     - Krishna Manikandan <quic_mkrishn@quicinc.com>
>   
>   allOf:
> -  - $ref: dsi-phy-common.yaml#
> +  - $ref: qcom,dsi-phy-common.yaml#
>   
>   properties:
>     compatible:
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml b/Documentation/devicetree/bindings/phy/qcom,dsi-phy-28nm.yaml
> similarity index 94%
> rename from Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
> rename to Documentation/devicetree/bindings/phy/qcom,dsi-phy-28nm.yaml
> index 371befa9f9d2..f8fe75fa29d7 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,dsi-phy-28nm.yaml
> @@ -1,7 +1,7 @@
>   # SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>   %YAML 1.2
>   ---
> -$id: http://devicetree.org/schemas/display/msm/dsi-phy-28nm.yaml#
> +$id: http://devicetree.org/schemas/phy/qcom,dsi-phy-28nm.yaml#
>   $schema: http://devicetree.org/meta-schemas/core.yaml#
>   
>   title: Qualcomm Display DSI 28nm PHY
> @@ -10,7 +10,7 @@ maintainers:
>     - Krishna Manikandan <quic_mkrishn@quicinc.com>
>   
>   allOf:
> -  - $ref: dsi-phy-common.yaml#
> +  - $ref: qcom,dsi-phy-common.yaml#
>   
>   properties:
>     compatible:
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/phy/qcom,dsi-phy-7nm.yaml
> similarity index 95%
> rename from Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> rename to Documentation/devicetree/bindings/phy/qcom,dsi-phy-7nm.yaml
> index 9a9a6c4abf43..d45015e24639 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,dsi-phy-7nm.yaml
> @@ -1,7 +1,7 @@
>   # SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>   %YAML 1.2
>   ---
> -$id: http://devicetree.org/schemas/display/msm/dsi-phy-7nm.yaml#
> +$id: http://devicetree.org/schemas/phy/qcom,dsi-phy-7nm.yaml#
>   $schema: http://devicetree.org/meta-schemas/core.yaml#
>   
>   title: Qualcomm Display DSI 7nm PHY
> @@ -10,7 +10,7 @@ maintainers:
>     - Jonathan Marek <jonathan@marek.ca>
>   
>   allOf:
> -  - $ref: dsi-phy-common.yaml#
> +  - $ref: qcom,dsi-phy-common.yaml#
>   
>   properties:
>     compatible:
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-common.yaml b/Documentation/devicetree/bindings/phy/qcom,dsi-phy-common.yaml
> similarity index 91%
> rename from Documentation/devicetree/bindings/display/msm/dsi-phy-common.yaml
> rename to Documentation/devicetree/bindings/phy/qcom,dsi-phy-common.yaml
> index d0ce85a08b6d..849321e56b2f 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-common.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,dsi-phy-common.yaml
> @@ -1,7 +1,7 @@
>   # SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>   %YAML 1.2
>   ---
> -$id: http://devicetree.org/schemas/display/msm/dsi-phy-common.yaml#
> +$id: http://devicetree.org/schemas/phy/qcom,dsi-phy-common.yaml#
>   $schema: http://devicetree.org/meta-schemas/core.yaml#
>   
>   title: Qualcomm Display DSI PHY Common Properties
> 
> ---
> base-commit: ac47870fd795549f03d57e0879fc730c79119f4b
> change-id: 20260305-msm-dsi-phy-96b063cce7b5
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
