Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC114CC291
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 17:23:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDEF410E2BF;
	Thu,  3 Mar 2022 16:23:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E076910E2BF
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 16:23:05 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 m42-20020a05600c3b2a00b00382ab337e14so4452332wms.3
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Mar 2022 08:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=yp0lxWLjzc1AS8YDx4XUct8GVMQ3Pjn+j+MInVB+q7g=;
 b=mqUxNmMzpzSjAWsS0l1IMOn9mS28pOSZ7A8J2gD85d2RA2fu7jSAsu9+GhrDgYUbJT
 h+I67C0rVzPX5tX0I6awQVvpkBYK/9KG/q1G0zq60kbKa/xWpRmXzgffPZQ2i6y8J2kv
 /iF112WYNRFjiFYQq7kPXTxUGiYj7jRooDOfHNXMp8egLdRHqcFWnIOtbRSAZKQ3w/nd
 jX3uVm62NW/8WqXnm+kjNslND6GmzQ0i4QFGQ7+wrOPC6PQc7g7+tY5wJArJoqgjGJBr
 001ON1noqlz9nVPiVSF7A472spgf7CwMT6fwKYkCiSJ62H59ePsW5tu2iGK0zu83R8ox
 Fsyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=yp0lxWLjzc1AS8YDx4XUct8GVMQ3Pjn+j+MInVB+q7g=;
 b=tPLdDe6Yww+vZMxdh4WW9vHYAofuQdJpDLOr87NPkb//hoOgbFxUMPofad2O1hoDrk
 dGZOyV7vZ/npEYHC9hpJnXoj3Wf5CYrMdb4A5BWDEOBLL8Y6h1Qm4WICuAljr6qS0W4g
 59ATqCVDooBmoX9tN7md036WJPVj4i7MWVzbSYOoUsgYNidZSug8oJ7KEm5V1dHU5y4/
 7WZ/E1LCrYd721PmIKZpE3/VT/Ei3wuU1ic0hJqOfB8ZC84z14ZtybH8B+kRK+t/PHeV
 WUlxIfW+sxM2fSWY8uv+ZXi6mgo7YPL3j6tUA4TTZmybXVx2ttQ8VSs+8hHQXAP08j8R
 r8Nw==
X-Gm-Message-State: AOAM5325qRVBNRQ5UfsHj/E716puKj/h8ugy0beLEEAL4P2N6w5OVKAJ
 f2nBCc2E9ExwgZfEDwq2zndm4Q==
X-Google-Smtp-Source: ABdhPJxoIlVHEkIE83zf7MVc/PoKn0SXWD2+bOVsG5E+wTzt6QuOeNX36sf7qDY/zytVXHTjOxnaAA==
X-Received: by 2002:a7b:c19a:0:b0:381:8495:9dd with SMTP id
 y26-20020a7bc19a000000b00381849509ddmr4406271wmi.33.1646324583923; 
 Thu, 03 Mar 2022 08:23:03 -0800 (PST)
Received: from ?IPV6:2001:861:44c0:66c0:2f5b:3553:677f:a39?
 ([2001:861:44c0:66c0:2f5b:3553:677f:a39])
 by smtp.gmail.com with ESMTPSA id
 q7-20020adfcd87000000b001e8a4f58a8csm2345170wrj.66.2022.03.03.08.23.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Mar 2022 08:23:03 -0800 (PST)
Message-ID: <983e9064-17ad-e646-f37d-ca9173ba0967@baylibre.com>
Date: Thu, 3 Mar 2022 17:23:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v16 1/4] drm/bridge: dw-hdmi: introduce
 dw_hdmi_enable_poll()
Content-Language: en-US
To: "H. Nikolaus Schaller" <hns@goldelico.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss
 <robert.foss@linaro.org>, Paul Boddie <paul@boddie.org.uk>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Paul Cercueil <paul@crapouillou.net>,
 Maxime Ripard <maxime@cerno.tech>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
References: <cover.1645895582.git.hns@goldelico.com>
 <e54838849f80454b863f9f5634dd10f79ef7bb8f.1645895582.git.hns@goldelico.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <e54838849f80454b863f9f5634dd10f79ef7bb8f.1645895582.git.hns@goldelico.com>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, letux-kernel@openphoenux.org,
 linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 26/02/2022 18:12, H. Nikolaus Schaller wrote:
> so that specialization drivers like ingenic-dw-hdmi can enable polling.
> 
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 9 +++++++++
>   include/drm/bridge/dw_hdmi.h              | 1 +
>   2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 4befc104d2200..43e375da131e8 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -3217,6 +3217,15 @@ static int dw_hdmi_parse_dt(struct dw_hdmi *hdmi)
>   	return 0;
>   }
>   
> +void dw_hdmi_enable_poll(struct dw_hdmi *hdmi, bool enable)
> +{
> +	if (hdmi->bridge.dev)
> +		hdmi->bridge.dev->mode_config.poll_enabled = enable;
> +	else
> +		dev_warn(hdmi->dev, "no hdmi->bridge.dev");
> +}
> +EXPORT_SYMBOL_GPL(dw_hdmi_enable_poll);
> +
>   struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
>   			      const struct dw_hdmi_plat_data *plat_data)
>   {
> diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
> index 2a1f85f9a8a3f..963960794b40e 100644
> --- a/include/drm/bridge/dw_hdmi.h
> +++ b/include/drm/bridge/dw_hdmi.h
> @@ -196,5 +196,6 @@ enum drm_connector_status dw_hdmi_phy_read_hpd(struct dw_hdmi *hdmi,
>   void dw_hdmi_phy_update_hpd(struct dw_hdmi *hdmi, void *data,
>   			    bool force, bool disabled, bool rxsense);
>   void dw_hdmi_phy_setup_hpd(struct dw_hdmi *hdmi, void *data);
> +void dw_hdmi_enable_poll(struct dw_hdmi *hdmi, bool enable);
>   
>   #endif /* __IMX_HDMI_H__ */

As I understand, this is because the IRQ line of the dw-hdmi IP isn't connected right ? and you use the display-connector ddc gpio instead ?

In this case I think the Ingenic DRM core should call drm_kms_helper_poll_init(drm) instead.

Neil
