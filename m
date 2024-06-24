Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1C791460B
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 11:17:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D78C10E3C7;
	Mon, 24 Jun 2024 09:17:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IAKYdmgz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5923810E3C7
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 09:17:37 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-421eab59723so30302745e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 02:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719220655; x=1719825455; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=1RjMX4Sxy+yhlFOobpnk3vjTo/Bzp1q3rVeZqfWSaNI=;
 b=IAKYdmgzhI+E0TFDpmMatKlHTk0zmlqffQgdhJZROcp5dgvUgaLQbP7AJCVe7UVF8H
 3Z0ky0I54sC02VDm2+kAvjSBvVMPCjg6lIqGbWbs1QnUG566mTSbLXginxqR7hPlosBt
 xu+j0Oc5vTY4DcCQoSAGS/LzVQ4DG2aYZnjc4HiGcm811ZsbKafGAJqJ27hoNi87QJ2p
 sL4OY3vrXqSRGEi1rwARJpw405GKXu8KKM8DSHYC49cNpq0p8Jrq/KhS2a3UeN8w4j7F
 5JQr53+C1/AGlpnY6e7L3NvtxRNQf72Xv+yZdKNxrIYG0i6vGWImzP93mPPxjV5AdgP3
 Mf7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719220655; x=1719825455;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=1RjMX4Sxy+yhlFOobpnk3vjTo/Bzp1q3rVeZqfWSaNI=;
 b=iOoI5PV6YldHZ6FROXJUjk8bv8uUl618xe4Xq9LJbLTdjzecezgwqebntzN05EWep+
 IOHn5ZHNXK6LCwaheb1COQhEKYBQR1lK/2WkR1GOKNpwTDF9b+ULQOs/z9opLs+JPyi2
 JC4WU6cPFOTYCC4uAYip1DJ+xvP9DfIOTfdiiAW1tBk0N7CYMvEKH+vh3NoNKEMbCKEm
 j7vPkhHevEdM546HXGxg7SJLtfgrUBjtzRbiraoimtbFke2rm76ZaINjpMpQlrZICYQO
 ozO0kfkS8XPNYQm7ccLbezwNe+r+PkPOFueKnMnYzlWutUfQfBaPTIB6P2VYTqCfZ9J/
 8YBQ==
X-Gm-Message-State: AOJu0YyhJuf98Ro0Yc1pJduEcmiojmgpZzrxi70u9QK+GxSgZCmYWhVs
 F/16KTMK99NdC+7cIDKZN4ZdDW2Z1ifNrSyh5Rzd6uYB8E5seZ6MAuBuGA7ShAE=
X-Google-Smtp-Source: AGHT+IHYUewn5hUFbxE8VqrCO8oFQ7eystcAYnrIuM5LjL1p71tVpIu4QEqNxCJfEOFEb8XQ45HPmw==
X-Received: by 2002:a05:600c:12d5:b0:423:b627:e3a5 with SMTP id
 5b1f17b1804b1-42489e677e5mr39275355e9.38.1719220655034; 
 Mon, 24 Jun 2024 02:17:35 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:cf01:774b:55fd:ab74?
 ([2a01:e0a:982:cbb0:cf01:774b:55fd:ab74])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-424817b5549sm132033535e9.23.2024.06.24.02.17.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jun 2024 02:17:34 -0700 (PDT)
Message-ID: <8ab7d216-4eb4-4bbb-8372-60ed527b7d4f@linaro.org>
Date: Mon, 24 Jun 2024 11:17:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 8/8] drm: bridge: dw_hdmi: Use display_info is_hdmi and
 has_audio
To: Jonas Karlman <jonas@kwiboo.se>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240611155108.1436502-1-jonas@kwiboo.se>
 <20240611155108.1436502-9-jonas@kwiboo.se>
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
In-Reply-To: <20240611155108.1436502-9-jonas@kwiboo.se>
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
Reply-To: neil.armstrong@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/06/2024 17:51, Jonas Karlman wrote:
> drm_edid_connector_update() is being called from bridge connector ops
> and from detect and get_modes ops for dw-hdmi connector.
> 
> Change to use is_hdmi and has_audio from display_info directly instead
> of keeping our own state in sink_is_hdmi and sink_has_audio.
> 
> Also remove the old and unused edid struct member and related define.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 32 ++++-------------------
>   1 file changed, 5 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index a9c39584d31b..e162c2786178 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -43,8 +43,6 @@
>   #define DDC_CI_ADDR		0x37
>   #define DDC_SEGMENT_ADDR	0x30
>   
> -#define HDMI_EDID_LEN		512
> -
>   /* DW-HDMI Controller >= 0x200a are at least compliant with SCDC version 1 */
>   #define SCDC_MIN_SOURCE_VERSION	0x1
>   
> @@ -148,8 +146,6 @@ struct dw_hdmi {
>   
>   	int vic;
>   
> -	u8 edid[HDMI_EDID_LEN];
> -
>   	struct {
>   		const struct dw_hdmi_phy_ops *ops;
>   		const char *name;
> @@ -159,8 +155,6 @@ struct dw_hdmi {
>   
>   	struct i2c_adapter *ddc;
>   	void __iomem *regs;
> -	bool sink_is_hdmi;
> -	bool sink_has_audio;
>   
>   	struct pinctrl *pinctrl;
>   	struct pinctrl_state *default_state;
> @@ -2041,7 +2035,7 @@ static void hdmi_av_composer(struct dw_hdmi *hdmi,
>   		HDMI_FC_INVIDCONF_IN_I_P_INTERLACED :
>   		HDMI_FC_INVIDCONF_IN_I_P_PROGRESSIVE;
>   
> -	inv_val |= hdmi->sink_is_hdmi ?
> +	inv_val |= display->is_hdmi ?
>   		HDMI_FC_INVIDCONF_DVI_MODEZ_HDMI_MODE :
>   		HDMI_FC_INVIDCONF_DVI_MODEZ_DVI_MODE;
>   
> @@ -2275,7 +2269,7 @@ static int dw_hdmi_poweron(struct dw_hdmi *hdmi,
>   	if (hdmi->hdmi_data.enc_out_bus_format == MEDIA_BUS_FMT_FIXED)
>   		hdmi->hdmi_data.enc_out_bus_format = MEDIA_BUS_FMT_RGB888_1X24;
>   
> -	hdmi->hdmi_data.rgb_limited_range = hdmi->sink_is_hdmi &&
> +	hdmi->hdmi_data.rgb_limited_range = display->is_hdmi &&
>   		drm_default_rgb_quant_range(mode) ==
>   		HDMI_QUANTIZATION_RANGE_LIMITED;
>   
> @@ -2295,7 +2289,7 @@ static int dw_hdmi_poweron(struct dw_hdmi *hdmi,
>   	/* HDMI Initialization Step B.3 */
>   	dw_hdmi_enable_video_path(hdmi);
>   
> -	if (hdmi->sink_has_audio) {
> +	if (display->has_audio) {
>   		dev_dbg(hdmi->dev, "sink has audio support\n");
>   
>   		/* HDMI Initialization Step E - Configure audio */
> @@ -2304,7 +2298,7 @@ static int dw_hdmi_poweron(struct dw_hdmi *hdmi,
>   	}
>   
>   	/* not for DVI mode */
> -	if (hdmi->sink_is_hdmi) {
> +	if (display->is_hdmi) {
>   		dev_dbg(hdmi->dev, "%s HDMI mode\n", __func__);
>   
>   		/* HDMI Initialization Step F - Configure AVI InfoFrame */
> @@ -2418,29 +2412,13 @@ static const struct drm_edid *dw_hdmi_edid_read(struct dw_hdmi *hdmi,
>   						struct drm_connector *connector)
>   {
>   	const struct drm_edid *drm_edid;
> -	const struct edid *edid;
>   
>   	if (!hdmi->ddc)
>   		return NULL;
>   
>   	drm_edid = drm_edid_read_ddc(connector, hdmi->ddc);
> -	if (!drm_edid) {
> +	if (!drm_edid)
>   		dev_dbg(hdmi->dev, "failed to get edid\n");
> -		return NULL;
> -	}
> -
> -	/*
> -	 * FIXME: This should use connector->display_info.is_hdmi and
> -	 * connector->display_info.has_audio from a path that has read the EDID
> -	 * and called drm_edid_connector_update().
> -	 */
> -	edid = drm_edid_raw(drm_edid);
> -
> -	dev_dbg(hdmi->dev, "got edid: width[%d] x height[%d]\n",
> -		edid->width_cm, edid->height_cm);
> -
> -	hdmi->sink_is_hdmi = drm_detect_hdmi_monitor(edid);
> -	hdmi->sink_has_audio = drm_detect_monitor_audio(edid);
>   
>   	return drm_edid;
>   }

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
