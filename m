Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4492B4F58D5
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 11:17:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3245910EC1B;
	Wed,  6 Apr 2022 09:17:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 627B110EC1B
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 09:17:28 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 123-20020a1c1981000000b0038b3616a71aso1197765wmz.4
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Apr 2022 02:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=D4zgoZclwNWAy7GNMBiOgI00ZJJ7Tqwh6A08SCt6pdI=;
 b=4mPdNS6Qp2kPdoY1al0XaQ1vDNLgd+lUfDX/vReaSgLZofqvDUGdVrsfBwmJYUMs9N
 z5LiqsL7du7Pie5rtj20r7RkdcQlbvSbXgq/erE8cZhxEor1vTYwNZGH6nq4nPK/+zIK
 OH7sTQoa7YB0bFSKO7SnAUZe6OxzQcdiN6B7Vh/mNp5/DLBy4scxMXL8tM8WgQ91nBrj
 3Gd0GTdNd2cVjiTo/G5upSvcWhOwwM5oZ33ymRyTatmxsqjWt9/3qqI7WUDX1jPzDfQh
 E98h3/Jd7dj82IAvlluTEYLCtDgtdxHxKlmLimOiXzkgaP1WkuJGbGUfg6RcpeD32yKS
 kAfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=D4zgoZclwNWAy7GNMBiOgI00ZJJ7Tqwh6A08SCt6pdI=;
 b=bCffcc6V/7YjFV/V4rkAsAVVBqJjXn/YZCctSRqv0IWaWbEDD9waT6wELfa1IgPZAs
 omBpdxVDXyz/Q3M5F5kVShtY9NA7A5gOq7Mt87H3mAT03HT9EULD9iBTeCPnk5pC7D7s
 1pNg1cNe3KT8qOFzC9WcP3vU0PkT84jP76ThMhzGVLtq7gxVtfCouubnzgtNItpLZyVC
 DMu7TZOmFznhDD4rHHZ8jgVyrgI9JR8Xhf0BvN34de28OICK5J32qjo4bdiLZYMt1GJR
 ap4r0h9CgQfKNhQTM5VDelyeh8PF8CRTPwhKEcjr3y8/XcaWXkujVurvnMUh/98W+Jb0
 029w==
X-Gm-Message-State: AOAM530wyr/Jd+Fl5m3mJwVIBcxD7QQDzH6SJpFraz7faVidTn2z4qCr
 /1s/NBTUfY05g7oaZswydBwXhQ==
X-Google-Smtp-Source: ABdhPJzBwuDizZnW41jYs5B/56St90jchlAKOjRgc5MGekcmUThSes/DzTUhIvAXEeNy2qomXQzcWQ==
X-Received: by 2002:a05:600c:35d5:b0:38e:3bca:716f with SMTP id
 r21-20020a05600c35d500b0038e3bca716fmr6455019wmq.200.1649236646728; 
 Wed, 06 Apr 2022 02:17:26 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:d960:ec5e:e421:9c9e?
 ([2001:861:44c0:66c0:d960:ec5e:e421:9c9e])
 by smtp.gmail.com with ESMTPSA id
 m3-20020a5d6243000000b001e33760776fsm13918135wrv.10.2022.04.06.02.17.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Apr 2022 02:17:26 -0700 (PDT)
Message-ID: <45668d73-a9fb-b23a-fb32-2e50eb4982aa@baylibre.com>
Date: Wed, 6 Apr 2022 11:17:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 2/5] drm: bridge: dw_hdmi: enable overflow workaround
 for v2.13a
Content-Language: en-US
To: Sandor.yu@nxp.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, andrzej.hajda@intel.com,
 robert.foss@linaro.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com
References: <cover.1649230434.git.Sandor.yu@nxp.com>
 <5339589121b05c0db7ee4befdc48c7e4ab4f1653.1649230434.git.Sandor.yu@nxp.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <5339589121b05c0db7ee4befdc48c7e4ab4f1653.1649230434.git.Sandor.yu@nxp.com>
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
Cc: shengjiu.wang@nxp.com, amuel@sholland.org, cai.huoqing@linux.dev,
 maxime@cerno.tech, hverkuil-cisco@xs4all.nl
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 06/04/2022 10:48, Sandor.yu@nxp.com wrote:
> From: Sandor Yu <Sandor.yu@nxp.com>
> 
> iMX865 HDMI (v2.13a) have been identified as needing the workaround.
> Tests show that one iteration is enough.
> 
> Without the workaround, iMX865 HDMI audio may not work
> after cable plugout/in, because HDMI mode is not really set in
> register HDMI_FC_INVIDCONF.
> 
> Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> ---
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 4befc104d220..b11577de4836 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -2087,9 +2087,9 @@ static void dw_hdmi_clear_overflow(struct dw_hdmi *hdmi)
>   	 *
>   	 * The number of iterations matters and depends on the HDMI TX revision
>   	 * (and possibly on the platform). So far i.MX6Q (v1.30a), i.MX6DL
> -	 * (v1.31a) and multiple Allwinner SoCs (v1.32a) have been identified
> -	 * as needing the workaround, with 4 iterations for v1.30a and 1
> -	 * iteration for others.
> +	 * (v1.31a), iMX865(v2.13a) and multiple Allwinner SoCs (v1.32a)
> +	 * have been identified as needing the workaround,
> +	 * with 4 iterations for v1.30a and 1 iteration for others.
>   	 * The Amlogic Meson GX SoCs (v2.01a) have been identified as needing
>   	 * the workaround with a single iteration.
>   	 * The Rockchip RK3288 SoC (v2.00a) and RK3328/RK3399 SoCs (v2.11a) have
> @@ -2106,6 +2106,7 @@ static void dw_hdmi_clear_overflow(struct dw_hdmi *hdmi)
>   	case 0x201a:
>   	case 0x211a:
>   	case 0x212a:
> +	case 0x213a:
>   		count = 1;
>   		break;

At some point we must consider only v1.30a needs 4, and other needs 1.

It would be simpler to put the "count = 1" in a default case.

The comment change is still welcome so we can track.

Thanks,
Neil

>   	default:

