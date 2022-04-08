Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5679D4F95F1
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 14:40:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C15310F117;
	Fri,  8 Apr 2022 12:40:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A442410F117
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 12:40:29 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id n35so5387080wms.5
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Apr 2022 05:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=JtXxBqYHvoARiWzEnaLQz1KM8jdVHYhcJ4+dJSrCNho=;
 b=DaN6uMg1mWoy0sJAV0g1YvUeexSJXdw69mB/G8cDTl88B7hvvTMuHBQkKlxH+KxDBa
 H81GzezGvpaDopE334/4Okotf/kCCXHz0vTpmLLKEx+Bku9pLOU5FLpp5gk3GohhXLd2
 zblz1C20kzVUnt868ukX1W9mV9hWWq59Ym5miWpnU+vOc0PlqLBFpI4eiVEtZciOwdpN
 9oRD1RByZh4b3H8vb6DNYjQgBx23gDCP7JeF9fdpNoGmFL1sUyzTBxx/b2Te50F26SqH
 T5Cz05dVjRAjbO/3D1xZCcCuQgILdFS7HDXoHATbCKG4OH8TImR3t40881bgVzivKS3t
 mUHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=JtXxBqYHvoARiWzEnaLQz1KM8jdVHYhcJ4+dJSrCNho=;
 b=0bVxfCsTyEBNeynZ4kiUiCODYhPj+Q2bg5HpFqauseWp5GAkWG0gzxA9/2BpXREArv
 a214bAdksdtCl0+BXMeN2vE2DTIvtGHsPy6LeYXqPoB+a+LjVhKpnbckBQXjE/d1tqXX
 ZR8byJyzLAguOkPN91Jt87QpoKIWVkwTfYd7HbAmnzC31VwhqoM1YBPDTweIyeGX9nmj
 7OLawzMSK6jDhpSNM/7jAMgiSwtZg7sjd5ATjFGsvpienUuIPFGanYk9kHm/hoYQZkjl
 0YqyIbpVYWt8i2Xo34bVga+VzjROTgs2QJi7J7hR7hn2Yy6+AlXkauUSntdho01Y978N
 oczw==
X-Gm-Message-State: AOAM533lfWEKP2Z7GFccmwCZbXxrDup1FVbwYd9aKhPPjuAGK8cZxrKH
 HER8YAwA2pdsbMMFR2NmKvse7w==
X-Google-Smtp-Source: ABdhPJwoCjsjihXGrySnrwKn6BzJl3Dg6+P50meXlcaikWCGLEuuq9Lafl4Wwjjb/OVp8TTTx0TyAg==
X-Received: by 2002:a05:600c:3d86:b0:38d:581:89ad with SMTP id
 bi6-20020a05600c3d8600b0038d058189admr17088800wmb.42.1649421627958; 
 Fri, 08 Apr 2022 05:40:27 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:eacd:ce6:e294:acd1?
 ([2001:861:44c0:66c0:eacd:ce6:e294:acd1])
 by smtp.gmail.com with ESMTPSA id
 u7-20020a05600c19c700b0038cc9aac1a3sm11597138wmq.23.2022.04.08.05.40.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Apr 2022 05:40:27 -0700 (PDT)
Message-ID: <25ca3826-44ee-ca6f-fb6b-1ef62f6da456@baylibre.com>
Date: Fri, 8 Apr 2022 14:40:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 3/5] drm: bridge: dw_hdmi: Enable GCP only for Deep
 Color
Content-Language: en-US
To: Sandor Yu <Sandor.yu@nxp.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, andrzej.hajda@intel.com,
 robert.foss@linaro.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, hverkuil-cisco@xs4all.nl
References: <cover.1649412256.git.Sandor.yu@nxp.com>
 <a0f9def7e7438592f78ef0a16cd0a560be0e6133.1649412256.git.Sandor.yu@nxp.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <a0f9def7e7438592f78ef0a16cd0a560be0e6133.1649412256.git.Sandor.yu@nxp.com>
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
Cc: shengjiu.wang@nxp.com, cai.huoqing@linux.dev, maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/04/2022 12:32, Sandor Yu wrote:
> HDMI1.4b specification section 6.5.3:
> Source shall only send GCPs with non-zero CD to sinks
> that indicate support for Deep Color.
> 
> DW HDMI GCP default enabled, clear gpc_auto bit for 24-bit color depth.

It's right because we do not handle AVMUTE, Pixel Packing nor Default_Phase.

> 
> Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> ---
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 02d8f7e08814..5a7ec066e37a 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -1108,6 +1108,8 @@ static void hdmi_video_packetize(struct dw_hdmi *hdmi)
>   	unsigned int output_select = HDMI_VP_CONF_OUTPUT_SELECTOR_PP;
>   	struct hdmi_data_info *hdmi_data = &hdmi->hdmi_data;
>   	u8 val, vp_conf;
> +	u8 clear_gcp_auto = 0;
> +
>   
>   	if (hdmi_bus_fmt_is_rgb(hdmi->hdmi_data.enc_out_bus_format) ||
>   	    hdmi_bus_fmt_is_yuv444(hdmi->hdmi_data.enc_out_bus_format) ||
> @@ -1117,6 +1119,7 @@ static void hdmi_video_packetize(struct dw_hdmi *hdmi)
>   		case 8:
>   			color_depth = 4;
>   			output_select = HDMI_VP_CONF_OUTPUT_SELECTOR_BYPASS;
> +			clear_gcp_auto = 1;
>   			break;
>   		case 10:
>   			color_depth = 5;
> @@ -1136,6 +1139,7 @@ static void hdmi_video_packetize(struct dw_hdmi *hdmi)
>   		case 0:
>   		case 8:
>   			remap_size = HDMI_VP_REMAP_YCC422_16bit;
> +			clear_gcp_auto = 1;
>   			break;
>   		case 10:
>   			remap_size = HDMI_VP_REMAP_YCC422_20bit;
> @@ -1160,6 +1164,14 @@ static void hdmi_video_packetize(struct dw_hdmi *hdmi)
>   		HDMI_VP_PR_CD_DESIRED_PR_FACTOR_MASK);
>   	hdmi_writeb(hdmi, val, HDMI_VP_PR_CD);
>   
> +	val = hdmi_readb(hdmi, HDMI_FC_DATAUTO3);
> +	if (clear_gcp_auto == 1)
> +		/* disable Auto GCP when 24-bit color */

Maybe add a new define for HDMI_FC_DATAUTO3_GCP_AUTO bit and use it here.

> +		val &= ~0x4;
> +	else
> +		val |= 0x4;
> +	hdmi_writeb(hdmi, val, HDMI_FC_DATAUTO3);

Please also add a comment explaining we clear GCP because we only
transmit CD and do not handle AVMUTE, PP nor Default_Phase (yet).

> +
>   	hdmi_modb(hdmi, HDMI_VP_STUFF_PR_STUFFING_STUFFING_MODE,
>   		  HDMI_VP_STUFF_PR_STUFFING_MASK, HDMI_VP_STUFF);
>   

Thanks,
Neil
