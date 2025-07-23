Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97491B0F180
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 13:41:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B80B010E7AE;
	Wed, 23 Jul 2025 11:41:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="X/RBf5x7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2884F10E7AE
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 11:41:49 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9bjhO007832
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 11:41:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=5JgycBmaJtS6jwA2vObmBGMO
 3gBaJOi2buVdHi6WlBE=; b=X/RBf5x7Zb0y5FRNHMzI70jYsu2GnthGo+/1E8fe
 aC3PYHH6dO/iNq9UDcK+tIhbS62cM/WAOniEpc/gUmlEvJYTWK89fB1AcASMJtDP
 oXO3R+B28Tsi8rRV/gmOeomtScQebzr0ZBllrSij5EdfRld2wVTGHa7DVuWPC+4H
 xj0KVxGk0nSlEcVr7h75pOqOc0K5ri/qCeiq4EpdufmoSzj2iJFI25DFFtJNAPpB
 493mRomaUovaTpXyc0wAlHHysPBGoMxjuIeiBJ1fcOJdhkjoNfqt6h8BI6dOfiJr
 QBA57Rq7gVi95k5+R0JsXbjen64XyDvqUkZI94CFKLLjgw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48047qcytw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 11:41:48 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-706efc88653so36847416d6.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 04:41:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753270907; x=1753875707;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5JgycBmaJtS6jwA2vObmBGMO3gBaJOi2buVdHi6WlBE=;
 b=LLfe/1r53gMVjRevkhLLnNpeC2MgZ/0MxtHmqmG/M82UFU1Z9PeDWD1Um7CKuL/jI1
 csPyWJln5S1URxDWTk/FE0cBTF/HfAcah4UfsQ8w57osWn7oDedA6fpNvxcHVGnKb3kc
 Vs/yPx286EoU9hFDugLCLkCPeTvxXlLopo2PJhQ9Jd7G4VdTTQPNm1g8Lzg+4jhbBOJW
 oBuIuux60KJO9AF5NVLooCce0RTbpTneFYAot5XTRx9RJI/fDXyfXyUVR+a8eGvH41Y6
 tH/a1r62Sdq2Z9w0nEyPYeQ6i3IGrqTL+3NqFr68WKYi4Zgxb568zq0o5Y8T+ztUSSDM
 SxAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8cyu9CC/o9mY3P667JTRows2EzcALJlcMiiwpg6106v1IrZ9HVFJvBek9TLpKyLUkzaG82QIWHkg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxBcZkF2GBez0hjXyZ1PTdn7tu34dEqbHiFu35tNQysRwlvegay
 pNhwWzVpHDOREKzXFk9PBFcNiByBDG2/TN78MLzTkRuwiC31+618lGRgqSsCRzqPE8xC2Ic/jL5
 auNVGv06ZSvR7RHuc3/iRStGuH7LUj2ZO4aQFl2fS624cMNlQIDs1GOS85WGDJ50KDy9n2ts=
X-Gm-Gg: ASbGnct2m+hK5+xrhyc5SYT35Pt8ZprtePpzTwjohzFNk6/pDooXFgHvJ3K9px42Vji
 E7h/v3iT6yw+iDYHZJ7yMS6jBX5ZcKCTQNST1tIK1li6Qv2Dxb2k164TwH5Ps/heX2Qxw3fdjrs
 aqi68mMDHawFs7BmQNMSjJf5Ul/21Cb3gQl62XirVGQKYd3Ehmqj1v4tCR8s3bhrHoLEn2DOrke
 jmv9SGuh6qOLwIpqR+wVjq4/ndpn9JHvV6LN+YjtL6qXRCsc1eukNbmVCFZ2Nfox/aQvunSXli/
 eRMT33bbTJ959LRkeFoJsXDrBQ1wxRiKGzaklJ+Zknn0IOQg8XOLzaAVn/zeggrAK0QPEcQoH4R
 kIN1fw0kU10A5Z9zryMRr8+R+i+swE11hkmk3VWozer0hy2Ebuk7y
X-Received: by 2002:a05:6214:2022:b0:705:227d:a511 with SMTP id
 6a1803df08f44-707006663edmr31545886d6.32.1753270907044; 
 Wed, 23 Jul 2025 04:41:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2d/uJDyGfd7UjhAFgz6WbKdA/P9xAYFLyZl/3beSYNXfadb2NkoYb+5O8+3feDQebbwy+Cw==
X-Received: by 2002:a05:6214:2022:b0:705:227d:a511 with SMTP id
 6a1803df08f44-707006663edmr31545426d6.32.1753270906513; 
 Wed, 23 Jul 2025 04:41:46 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55a31a9b672sm2257705e87.27.2025.07.23.04.41.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jul 2025 04:41:45 -0700 (PDT)
Date: Wed, 23 Jul 2025 14:41:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: linux-kernel@vger.kernel.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Douglas Anderson <dianders@chromium.org>, Heiko Stuebner <heiko@sntech.de>,
 Sugar Zhang <sugar.zhang@rock-chips.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Raag Jadav <raag.jadav@intel.com>, dri-devel@lists.freedesktop.org,
 linux-sound@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH v2 1/3] drm/bridge: dw-hdmi-qp: Return 0 in audio prepare
 when disconnected
Message-ID: <hw5grsaqfef4l55pu7ypsgojnltcynl22l4jqb7w2t6vlo3yxo@d5yhtxcmtroq>
References: <20250722195437.1347865-1-detlev.casanova@collabora.com>
 <20250722195437.1347865-2-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250722195437.1347865-2-detlev.casanova@collabora.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA5OSBTYWx0ZWRfX/kQdubTR1t+m
 Uem/8UC2hFQ4n7UybgYdfSqMymSzWBCu5LdL8Q/YajB43U7XJQn5DTdVlV/3KFtkrsJS9mHXVUW
 4O+vOMSSsddgpdcLSI8MERuqvEVc6KA83TuHWm3q8L8ULppRa3b/yFNZaDirrZoq7PEooTua1kW
 fV/ZDk6cboMrH4z7aSFi+Wpo095/w9i1UfxW2Fs6Joy9kjJ9icwi9SoB89rfPJvVGjCwSJehGCf
 4qBUfVau91CX6sN9ZSar1pMJMjY4mCHnU0FYi6bwqWRaZ1LUKIs0jZpBMSus0OquhnFKFDZQ0AY
 yN6nMYevrAuZElHY06gMahJVZPecf/FRvNpF6q+gh1aLsWoBxueFMiviZ/+Lu9I1xeOuBrDTWC7
 Zz7oZxJwvDqeu4ihfjznbWabFD6cVDKPjY87M2lfQQq3ydAuPNJ0nJ8yVyLOYHaE3jaBJuON
X-Proofpoint-ORIG-GUID: RgxA38pm1gQWGsRGSsFoK0FbVyWDnOmr
X-Proofpoint-GUID: RgxA38pm1gQWGsRGSsFoK0FbVyWDnOmr
X-Authority-Analysis: v=2.4 cv=IrMecK/g c=1 sm=1 tr=0 ts=6880ca7c cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=QX4gbG5DAAAA:8 a=nOY6ST1na_5B9o45XBQA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230099
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 22, 2025 at 03:54:35PM -0400, Detlev Casanova wrote:
> To configure audio registers, the clock of the video port in use must be
> enabled.
> As those clocks are managed by the VOP driver, they can't be enabled here
> to write the registers even when the HDMI cable is disconnected.
> 
> Furthermore, the registers values are computed from the TMDS char rate,
> which is not available when disconnected.
> 
> Returning -ENODEV seemed reasonable at first, but ASoC will log an error
> multiple times if dw_hdmi_qp_audio_prepare() return an error.
> Userspace might also retry multiple times, filling the kernel log with:
> 
> hdmi-audio-codec hdmi-audio-codec.0.auto: ASoC error (-19): at snd_soc_dai_prepare() on i2s-hifi
> 
> This has become even worse with the support of the second HDMI TX port.
> 
> Activating the clocks to write fake data (fake because the TMDS char
> rate is unavailable) would require API changes to communicate between
> VOP and HDMI, which doesn't really make sense.
> 
> Using a cached regmap to be dumped when a cable is connected won't work
> because writing order is important and some data needs to be retrieved
> from registers to write others.
> 
> Returning 0 to silently fail sounds like the best and simplest solution.
> 
> Fixes: fd0141d1a8a2 ("drm/bridge: synopsys: Add audio support for dw-hdmi-qp")
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> index 5e5f8c2f95be1..9b9d43c02e3a5 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> @@ -458,8 +458,16 @@ static int dw_hdmi_qp_audio_prepare(struct drm_connector *connector,
>  	struct dw_hdmi_qp *hdmi = dw_hdmi_qp_from_bridge(bridge);
>  	bool ref2stream = false;
>  
> +	/*
> +	 * Silently return if tmds_char_rate is not set.
> +	 *
> +	 * Writing audio registers requires that the clock of the Video Port currently in
> +	 * use by the VOP (dclk_vp<id>) is enabled.
> +	 * That clock is guaranteed to be enabled when hdmi->tmds_char_rate is set, so we
> +	 * only configure audio when it is set.
> +	 */
>  	if (!hdmi->tmds_char_rate)
> -		return -ENODEV;
> +		return 0;

What if the cable gets diconnected _while_ this function is running?

>  
>  	if (fmt->bit_clk_provider | fmt->frame_clk_provider) {
>  		dev_err(hdmi->dev, "unsupported clock settings\n");
> -- 
> 2.50.1
> 

-- 
With best wishes
Dmitry
