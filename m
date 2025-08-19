Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A49B2BFBC
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 13:03:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2348410E5A7;
	Tue, 19 Aug 2025 11:03:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hkLSthcO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FA6B10E5A3
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 11:03:12 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J90YOY021767
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 11:03:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 gwKBRdNGHVkugfe5xXkArXJpDEgU6rTcTO8+Bts+tYk=; b=hkLSthcOjTMFj5GL
 IkyvViVLBcp/DpDscjki6x7Y090YByJwjQaIxDaHMhEsrKGaCQfEgw0k3jMxvxpy
 z0kEU2hEJkO3j9pirrFGPf00UgCK5/f9gAe9sPKN2d8bgXtQtygRD+TH1+pLKlLJ
 pFaRRi2uy+JbSOeDsUvrZKoYN0/pcbXw2OK4AkuEsYPzTiqLnnVABTSRPQ9e7YLq
 S1R2YLGQTzxztVznmHpHWzz0qO6Wt/AhpyfhUb88lztK6rdFf8itxh9SZLl5M0Xc
 lwdi4mgNUGVv2MKhGRsgzHkCPZ4F7XDQG90Bq73JahuUJFYW7lUTB3nNBOcZnZ5/
 nKbfmw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48m71cjygh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 11:03:11 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7e870317642so1250452685a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 04:03:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755601389; x=1756206189;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gwKBRdNGHVkugfe5xXkArXJpDEgU6rTcTO8+Bts+tYk=;
 b=c5M3yJ25osWhjmYbo4M02c95p0ncGlmOZcf+8dQ3N2RL+1PawISnEnxfhSwkCPnhiY
 6GbFVUPZ6GgQQb+Z6ySYr0mLSx2LfNuMp2esQfY66xEENi1WfmqpD+wh5c/HEbVeUzYl
 lgpnvcRwJa/c6KpDiuUGZ6QbUJgak5OBr5x38jOMFcioGAyFQOWkzq3EPoCgSTt9yF0P
 D002Iv2GHAdOkTMpuidA8QUJSM6QixVLjEQSQSsAYTcvnq22VjZrqu4eKcltIoSTBsmh
 kvErIaX0pkrVUjxDghy7Bo5dc2STYEQpUsaiFjUupzS+WegwXODwvhKQZ5aUQ7JETjRd
 fw6A==
X-Gm-Message-State: AOJu0YxSM8mBFC7nwi2BPGmlYJnsDeb1EppWa5/plWYH8mm5Z/iKMwlt
 IR6yPWDg6BVMYq8R1fUkVS+sxXpD0A0sBCghQqqwqYRwJKx/ZCy0yw0X9Ub61zG1ACiz+WIR2FX
 iBpOBRWpgD8ztrJiWessQ9E935rEbiPU7hBtxUlds0/KZWUM9duncRNbdgYtZ9l9tOiHsjT4=
X-Gm-Gg: ASbGnct1vA2o4K+ox5feDyomh3s4UXhuMj5SSvlms6qqNYMRV6OEKeg44vVZJymgmzv
 QjKm0QPO92rS1Kk8bxnqH6jWcmVzaDQ4jREyXmxR7uDqzUmFLcPZjvGqHARFs8s52LON7+v8yeE
 Zc7wv/coRtnX3VTDTzW0BlnIjbi3W/uCbBGbDRierF7e8XCkDaOkJVx6wfYEUPx/ElpzeCbQTDU
 sl0mb7vEzmYgT/XEi7foQzTiV1I1RZMbyQv3tmP3jZXMQ2J116bXstoyvMOq1Vn+6vD00BcNWoD
 OLiiAIfLLxRhsjjJDWHLhuuY53949e8X0fw47bjok7XUnMzaSUwU7ymVP7H5zCh9SLgMrnA9UD+
 fycDQzCdQ2fdrOgRt3w==
X-Received: by 2002:a05:6214:d0e:b0:70b:8a30:ecad with SMTP id
 6a1803df08f44-70c2b6d83e6mr20531996d6.7.1755601388816; 
 Tue, 19 Aug 2025 04:03:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEceijSPE9wsdNVyj+ClLJ7om4jjkcKUS38hEPJHJxuLe4wSFcBG210A5Klf/lWbJjEDmicFA==
X-Received: by 2002:a05:6214:d0e:b0:70b:8a30:ecad with SMTP id
 6a1803df08f44-70c2b6d83e6mr20530806d6.7.1755601387799; 
 Tue, 19 Aug 2025 04:03:07 -0700 (PDT)
Received: from [10.207.49.70] (84-253-220-51.bb.dnainternet.fi.
 [84.253.220.51]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3340a63d860sm21886211fa.65.2025.08.19.04.03.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Aug 2025 04:03:06 -0700 (PDT)
Message-ID: <a4d51cd5-8b99-444a-8f31-e83102c65d14@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 14:03:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] drm/connector: let drivers declare infoframes as
 unsupported
To: Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20250816-drm-limit-infoframes-v1-0-6dc17d5f07e9@oss.qualcomm.com>
 <20250816-drm-limit-infoframes-v1-1-6dc17d5f07e9@oss.qualcomm.com>
 <e9f2c06d-07ee-4f69-887c-caf5efb59f7f@nxp.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <e9f2c06d-07ee-4f69-887c-caf5efb59f7f@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: KDRJY1mYG7HMushOyPpxhYgwiQby-FnT
X-Proofpoint-GUID: KDRJY1mYG7HMushOyPpxhYgwiQby-FnT
X-Authority-Analysis: v=2.4 cv=IvQecK/g c=1 sm=1 tr=0 ts=68a459ef cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=JdIsBVl79nXNK9flUcZCTw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=FlTG0Dy22fcDEStDgbkA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDE0NyBTYWx0ZWRfX+48xXd/bLG0t
 LRQr6i/YhWiVlpqrLMUgdOczMQCqsBK+7ovL9EvQKWPLG9M4n7DyFoa3ix+hfT2YANRggVVY4cD
 OeX/vOZiiyir6WB5g4lJrQQ+6AO/Cv+BMJEi8LDODZ/f3GZjNgO+uDHFRxGm262+OjpaDJHijc8
 2V1dFFecSQX4pGb8KWBSukE2RAVGxnm0NeiBZcuGyvaUFxpkEpVZLK/q75EyqxKHW9wAmMKgdZ/
 Pm2y6VWy8On68A1wmleeph+6et6lBEKfTnBt96MGdyifhrL1ekXJBZENP4N342UCMTrqcmY6H/e
 GPP/DwZ7Ckfu2R0sor0R3RhAJShTAhxGziAu4c181sriNdGaozKDlCqRWwz1MTNw0M5wXzub9Sy
 lN9DthKo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508180147
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

On 19/08/2025 12:42, Liu Ying wrote:
> Hi Dmitry,
> 
> On 08/16/2025, Dmitry Baryshkov wrote:
>> Currently DRM framework expects that the HDMI connector driver supports
>> all infoframe types: it generates the data as required and calls into
>> the driver to program all of them, letting the driver to soft-fail if
>> the infoframe is unsupported. This has a major drawback on userspace
>> API: the framework also registers debugfs files for all Infoframe types,
>> possibly surprising the users when infoframe is visible in the debugfs
>> file, but it is not visible on the wire.
>>
>> Let drivers declare that they support only a subset of infoframes,
>> creating a more consistent interface.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/display/drm_bridge_connector.c     |  6 +++
>>   drivers/gpu/drm/display/drm_hdmi_state_helper.c    | 43 +++++++++++++++++++++-
>>   drivers/gpu/drm/drm_connector.c                    |  4 ++
>>   drivers/gpu/drm/drm_debugfs.c                      | 16 +++++---
>>   drivers/gpu/drm/rockchip/inno_hdmi.c               |  1 +
>>   drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |  1 +
>>   drivers/gpu/drm/tests/drm_connector_test.c         | 28 ++++++++++++++
>>   drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c |  8 ++++
>>   drivers/gpu/drm/vc4/vc4_hdmi.c                     |  4 ++
>>   include/drm/drm_bridge.h                           |  7 ++++
>>   include/drm/drm_connector.h                        | 23 ++++++++++++
>>   11 files changed, 134 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
>> index 8c915427d0538435661d771940efe38b462027a1..b94458d5faa9ae283889fc79496ae323bb4dc88c 100644
>> --- a/drivers/gpu/drm/display/drm_bridge_connector.c
>> +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
>> @@ -781,6 +781,12 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>>   					       &drm_bridge_connector_hdmi_funcs,
>>   					       connector_type, ddc,
>>   					       supported_formats,
>> +					       bridge->supported_infoframes ? :
>> +					       DRM_CONNECTOR_INFOFRAME_AUDIO |
>> +					       DRM_CONNECTOR_INFOFRAME_AVI |
>> +					       DRM_CONNECTOR_INFOFRAME_DRM |
>> +					       DRM_CONNECTOR_INFOFRAME_SPD |
>> +					       DRM_CONNECTOR_INFOFRAME_VENDOR,
> 
> The mask is DRM_CONNECTOR_ALL_INFOFRAMES as defined in drm_connector_test.c
> and drm_hdmi_state_helper_test.c.  Can it be defined in drm_connector.h and
> used here?

I purposedly didn't define it in the top-level header. It would be too 
tempting to use that mask in the drivers, which will break if we add 
more infoframes in future. This one is a band-aid for the next patches. 
Maybe I should drop this chunk as a last patch.

> 
>>   					       max_bpc);
>>   		if (ret)
>>   			return ERR_PTR(ret);
>> diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
>> index a561f124be99a0cd4259dbacf5f5f6651ff8a0ea..fb8b9e3769cb74345f9c6ef6f6ca441a373141c1 100644
>> --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
>> +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
>> @@ -687,6 +687,10 @@ static int hdmi_generate_avi_infoframe(const struct drm_connector *connector,
>>   
>>   	infoframe->set = false;
>>   
>> +	if (!drm_hdmi_connector_supports_infoframe(connector,
>> +						   HDMI_INFOFRAME_TYPE_AVI))
> 
> Nit: The above two lines fit into a single line.  The same applies to similar
> lines added in this file.
> 
>> +		return 0;
>> +
>>   	ret = drm_hdmi_avi_infoframe_from_display_mode(frame, connector, mode);
>>   	if (ret)
>>   		return ret;
>> @@ -718,6 +722,10 @@ static int hdmi_generate_spd_infoframe(const struct drm_connector *connector,
>>   
>>   	infoframe->set = false;
>>   
>> +	if (!drm_hdmi_connector_supports_infoframe(connector,
>> +						   HDMI_INFOFRAME_TYPE_SPD))
>> +		return 0;
>> +
>>   	ret = hdmi_spd_infoframe_init(frame,
>>   				      connector->hdmi.vendor,
>>   				      connector->hdmi.product);
>> @@ -742,6 +750,10 @@ static int hdmi_generate_hdr_infoframe(const struct drm_connector *connector,
>>   
>>   	infoframe->set = false;
>>   
>> +	if (!drm_hdmi_connector_supports_infoframe(connector,
>> +						   HDMI_INFOFRAME_TYPE_DRM))
>> +		return 0;
>> +
>>   	if (connector->max_bpc < 10)
>>   		return 0;
>>   
>> @@ -771,6 +783,10 @@ static int hdmi_generate_hdmi_vendor_infoframe(const struct drm_connector *conne
>>   
>>   	infoframe->set = false;
>>   
>> +	if (!drm_hdmi_connector_supports_infoframe(connector,
>> +						   HDMI_INFOFRAME_TYPE_VENDOR))
>> +		return 0;
>> +
>>   	if (!info->has_hdmi_infoframe)
>>   		return 0;
>>   
>> @@ -905,6 +921,11 @@ static int clear_device_infoframe(struct drm_connector *connector,
>>   		return 0;
>>   	}
>>   
>> +	if (!drm_hdmi_connector_supports_infoframe(connector, type)) {
>> +		drm_dbg_kms(dev, "Infoframe %d not supported, bailing.\n", type);
> 
> %d should be 0x%02x as type's value is 0x8*?

Good catch!

> 
>> +		return 0;
>> +	}
>> +
>>   	ret = funcs->clear_infoframe(connector, type);
>>   	if (ret) {
>>   		drm_dbg_kms(dev, "Call failed: %d\n", ret);
>> @@ -932,21 +953,27 @@ static int write_device_infoframe(struct drm_connector *connector,
>>   	const struct drm_connector_hdmi_funcs *funcs = connector->hdmi.funcs;
>>   	struct drm_device *dev = connector->dev;
>>   	u8 buffer[HDMI_INFOFRAME_SIZE(MAX)];
>> +	enum hdmi_infoframe_type type = frame->any.type;
> 
> Nit: follow reverse x'mas tree fashion.
> 
>>   	int ret;
>>   	int len;
>>   
>> -	drm_dbg_kms(dev, "Writing infoframe type %x\n", frame->any.type);
>> +	drm_dbg_kms(dev, "Writing infoframe type %x\n", type);
>>   
>>   	if (!funcs || !funcs->write_infoframe) {
>>   		drm_dbg_kms(dev, "Function not implemented, bailing.\n");
>>   		return -EINVAL;
>>   	}
>>   
>> +	if (!drm_hdmi_connector_supports_infoframe(connector, type)) {
>> +		drm_dbg_kms(dev, "Infoframe %d not supported, bailing.\n", type);
>> +		return 0;
>> +	}
>> +
>>   	len = hdmi_infoframe_pack(frame, buffer, sizeof(buffer));
>>   	if (len < 0)
>>   		return len;
>>   
>> -	ret = funcs->write_infoframe(connector, frame->any.type, buffer, len);
>> +	ret = funcs->write_infoframe(connector, type, buffer, len);
>>   	if (ret) {
>>   		drm_dbg_kms(dev, "Call failed: %d\n", ret);
>>   		return ret;
>> @@ -1067,6 +1094,12 @@ drm_atomic_helper_connector_hdmi_update_audio_infoframe(struct drm_connector *co
>>   	struct drm_display_info *info = &connector->display_info;
>>   	int ret;
>>   
>> +	if (!drm_hdmi_connector_supports_infoframe(connector,
>> +						   HDMI_INFOFRAME_TYPE_AUDIO)) {
>> +		drm_dbg_kms(connector->dev, "Audio Infoframe not supported, bailing.\n");
> 
> Maybe, print out error message instead of using drm_dbg_kms() since bridge
> should always set HDMI_INFOFRAME_TYPE_AUDIO if it calls this function?

drm_err_once() sounds logical, yes.

> 
>> +		return -EOPNOTSUPP;
>> +	}
>> +
>>   	if (!info->is_hdmi)
>>   		return 0;
>>   
>> @@ -1102,6 +1135,12 @@ drm_atomic_helper_connector_hdmi_clear_audio_infoframe(struct drm_connector *con
>>   	struct drm_display_info *info = &connector->display_info;
>>   	int ret;
>>   
>> +	if (!drm_hdmi_connector_supports_infoframe(connector,
>> +						   HDMI_INFOFRAME_TYPE_AUDIO)) {
>> +		drm_dbg_kms(connector->dev, "Audio Infoframe not supported, bailing.\n");
> 
> Ditto.
> 
>> +		return -EOPNOTSUPP;
>> +	}
>> +
>>   	if (!info->is_hdmi)
>>   		return 0;
>>   
>> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
>> index 272d6254ea4784e97ca894ec4d463beebf9fdbf0..e753de9fc80a26c30b9674c96083328711f32960 100644
>> --- a/drivers/gpu/drm/drm_connector.c
>> +++ b/drivers/gpu/drm/drm_connector.c
>> @@ -553,6 +553,7 @@ EXPORT_SYMBOL(drmm_connector_init);
>>    * @connector_type: user visible type of the connector
>>    * @ddc: optional pointer to the associated ddc adapter
>>    * @supported_formats: Bitmask of @hdmi_colorspace listing supported output formats
>> + * @supported_infoframes: Bitmask of @DRM_CONNECTOR_INFOFRAME listing supported Infoframes
>>    * @max_bpc: Maximum bits per char the HDMI connector supports
>>    *
>>    * Initialises a preallocated HDMI connector. Connectors can be
>> @@ -576,6 +577,7 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
>>   			     int connector_type,
>>   			     struct i2c_adapter *ddc,
>>   			     unsigned long supported_formats,
>> +			     unsigned long supported_infoframes,
>>   			     unsigned int max_bpc)
>>   {
>>   	int ret;
>> @@ -623,6 +625,8 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
>>   
>>   	connector->hdmi.funcs = hdmi_funcs;
>>   
>> +	connector->hdmi.supported_infoframes = supported_infoframes;
>> +
>>   	return 0;
>>   }
>>   EXPORT_SYMBOL(drmm_connector_hdmi_init);
>> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
>> index 365cf337529fa2a88b69516d57360d212419c126..248cb9ea1d8781674160cd8d454113c9422ec691 100644
>> --- a/drivers/gpu/drm/drm_debugfs.c
>> +++ b/drivers/gpu/drm/drm_debugfs.c
>> @@ -672,6 +672,9 @@ static int create_hdmi_audio_infoframe_file(struct drm_connector *connector,
>>   {
>>   	struct dentry *file;
>>   
>> +	if (!drm_hdmi_connector_supports_infoframe(connector, HDMI_INFOFRAME_TYPE_AUDIO))
>> +		return 0;
>> +
>>   	file = debugfs_create_file("audio", 0400, parent, connector, &audio_infoframe_fops);
>>   	if (IS_ERR(file))
>>   		return PTR_ERR(file);
>> @@ -679,7 +682,7 @@ static int create_hdmi_audio_infoframe_file(struct drm_connector *connector,
>>   	return 0;
>>   }
>>   
>> -#define DEFINE_INFOFRAME_FILE(_f) \
>> +#define DEFINE_INFOFRAME_FILE(_f, _F) \
>>   static ssize_t _f##_read_infoframe(struct file *filp, \
>>   				   char __user *ubuf, \
>>   				   size_t count,      \
>> @@ -726,6 +729,9 @@ static int create_hdmi_## _f ## _infoframe_file(struct drm_connector *connector,
>>   { \
>>   	struct dentry *file; \
>>   	\
>> +	if (!drm_hdmi_connector_supports_infoframe(connector, HDMI_INFOFRAME_TYPE_ ## _F)) \
>> +		return 0; \
>> +	\
>>   	file = debugfs_create_file(#_f, 0400, parent, connector, &_f ## _infoframe_fops); \
>>   	if (IS_ERR(file)) \
>>   		return PTR_ERR(file); \
>> @@ -733,10 +739,10 @@ static int create_hdmi_## _f ## _infoframe_file(struct drm_connector *connector,
>>   	return 0; \
>>   }
>>   
>> -DEFINE_INFOFRAME_FILE(avi);
>> -DEFINE_INFOFRAME_FILE(hdmi);
>> -DEFINE_INFOFRAME_FILE(hdr_drm);
>> -DEFINE_INFOFRAME_FILE(spd);
>> +DEFINE_INFOFRAME_FILE(avi, AVI);
>> +DEFINE_INFOFRAME_FILE(hdmi, VENDOR);
>> +DEFINE_INFOFRAME_FILE(hdr_drm, DRM);
>> +DEFINE_INFOFRAME_FILE(spd, SPD);
>>   
>>   static int create_hdmi_infoframe_files(struct drm_connector *connector,
>>   				       struct dentry *parent)
>> diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
>> index 1ab3ad4bde9ea7305021186ea221d2ff9057fdbb..65eed5ae23194200c145cb174acff4f252b3ef1f 100644
>> --- a/drivers/gpu/drm/rockchip/inno_hdmi.c
>> +++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
>> @@ -1065,6 +1065,7 @@ static int inno_hdmi_register(struct drm_device *drm, struct inno_hdmi *hdmi)
>>   				 DRM_MODE_CONNECTOR_HDMIA,
>>   				 hdmi->ddc,
>>   				 BIT(HDMI_COLORSPACE_RGB),
>> +				 DRM_CONNECTOR_INFOFRAME_AVI,
>>   				 8);
>>   
>>   	drm_connector_attach_encoder(&hdmi->connector, encoder);
>> diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
>> index ab0938ba61f7d75dd0bec473807a04a20e1cffbd..0b931da4ea2d4eb58a6224476059b9205e8626b4 100644
>> --- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
>> +++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
>> @@ -640,6 +640,7 @@ static int sun4i_hdmi_bind(struct device *dev, struct device *master,
>>   				       DRM_MODE_CONNECTOR_HDMIA,
>>   				       hdmi->ddc_i2c,
>>   				       BIT(HDMI_COLORSPACE_RGB),
>> +				       DRM_CONNECTOR_INFOFRAME_AVI,
>>   				       8);
>>   	if (ret) {
>>   		dev_err(dev,
>> diff --git a/drivers/gpu/drm/tests/drm_connector_test.c b/drivers/gpu/drm/tests/drm_connector_test.c
>> index 22e2d959eb31459f9981fef488228904d67cb6f9..fd28ed2bf8bcecabaabc67f2f8f5ccc1f42525d3 100644
>> --- a/drivers/gpu/drm/tests/drm_connector_test.c
>> +++ b/drivers/gpu/drm/tests/drm_connector_test.c
>> @@ -641,6 +641,13 @@ static struct kunit_suite drm_connector_dynamic_register_test_suite = {
>>   	.test_cases = drm_connector_dynamic_register_tests,
>>   };
>>   
>> +#define DRM_CONNECTOR_ALL_INFOFRAMES \
>> +	(DRM_CONNECTOR_INFOFRAME_AUDIO | \
>> +	 DRM_CONNECTOR_INFOFRAME_AVI | \
>> +	 DRM_CONNECTOR_INFOFRAME_DRM | \
>> +	 DRM_CONNECTOR_INFOFRAME_SPD | \
>> +	 DRM_CONNECTOR_INFOFRAME_VENDOR)
>> +
>>   /*
>>    * Test that the registration of a bog standard connector works as
>>    * expected and doesn't report any error.
>> @@ -657,6 +664,7 @@ static void drm_test_connector_hdmi_init_valid(struct kunit *test)
>>   				       DRM_MODE_CONNECTOR_HDMIA,
>>   				       &priv->ddc,
>>   				       BIT(HDMI_COLORSPACE_RGB),
>> +				       DRM_CONNECTOR_ALL_INFOFRAMES,
>>   				       8);
>>   	KUNIT_EXPECT_EQ(test, ret, 0);
>>   }
>> @@ -677,6 +685,7 @@ static void drm_test_connector_hdmi_init_null_ddc(struct kunit *test)
>>   				       DRM_MODE_CONNECTOR_HDMIA,
>>   				       NULL,
>>   				       BIT(HDMI_COLORSPACE_RGB),
>> +				       DRM_CONNECTOR_ALL_INFOFRAMES,
>>   				       8);
>>   	KUNIT_EXPECT_EQ(test, ret, 0);
>>   }
>> @@ -697,6 +706,7 @@ static void drm_test_connector_hdmi_init_null_vendor(struct kunit *test)
>>   				       DRM_MODE_CONNECTOR_HDMIA,
>>   				       &priv->ddc,
>>   				       BIT(HDMI_COLORSPACE_RGB),
>> +				       DRM_CONNECTOR_ALL_INFOFRAMES,
>>   				       8);
>>   	KUNIT_EXPECT_LT(test, ret, 0);
>>   }
>> @@ -717,6 +727,7 @@ static void drm_test_connector_hdmi_init_null_product(struct kunit *test)
>>   				       DRM_MODE_CONNECTOR_HDMIA,
>>   				       &priv->ddc,
>>   				       BIT(HDMI_COLORSPACE_RGB),
>> +				       DRM_CONNECTOR_ALL_INFOFRAMES,
>>   				       8);
>>   	KUNIT_EXPECT_LT(test, ret, 0);
>>   }
>> @@ -743,6 +754,7 @@ static void drm_test_connector_hdmi_init_product_valid(struct kunit *test)
>>   				       DRM_MODE_CONNECTOR_HDMIA,
>>   				       &priv->ddc,
>>   				       BIT(HDMI_COLORSPACE_RGB),
>> +				       DRM_CONNECTOR_ALL_INFOFRAMES,
>>   				       8);
>>   	KUNIT_EXPECT_EQ(test, ret, 0);
>>   	KUNIT_EXPECT_MEMEQ(test,
>> @@ -776,6 +788,7 @@ static void drm_test_connector_hdmi_init_product_length_exact(struct kunit *test
>>   				       DRM_MODE_CONNECTOR_HDMIA,
>>   				       &priv->ddc,
>>   				       BIT(HDMI_COLORSPACE_RGB),
>> +				       DRM_CONNECTOR_ALL_INFOFRAMES,
>>   				       8);
>>   	KUNIT_EXPECT_EQ(test, ret, 0);
>>   	KUNIT_EXPECT_MEMEQ(test,
>> @@ -803,6 +816,7 @@ static void drm_test_connector_hdmi_init_product_length_too_long(struct kunit *t
>>   				       DRM_MODE_CONNECTOR_HDMIA,
>>   				       &priv->ddc,
>>   				       BIT(HDMI_COLORSPACE_RGB),
>> +				       DRM_CONNECTOR_ALL_INFOFRAMES,
>>   				       8);
>>   	KUNIT_EXPECT_LT(test, ret, 0);
>>   }
>> @@ -829,6 +843,7 @@ static void drm_test_connector_hdmi_init_vendor_valid(struct kunit *test)
>>   				       DRM_MODE_CONNECTOR_HDMIA,
>>   				       &priv->ddc,
>>   				       BIT(HDMI_COLORSPACE_RGB),
>> +				       DRM_CONNECTOR_ALL_INFOFRAMES,
>>   				       8);
>>   	KUNIT_EXPECT_EQ(test, ret, 0);
>>   	KUNIT_EXPECT_MEMEQ(test,
>> @@ -861,6 +876,7 @@ static void drm_test_connector_hdmi_init_vendor_length_exact(struct kunit *test)
>>   				       DRM_MODE_CONNECTOR_HDMIA,
>>   				       &priv->ddc,
>>   				       BIT(HDMI_COLORSPACE_RGB),
>> +				       DRM_CONNECTOR_ALL_INFOFRAMES,
>>   				       8);
>>   	KUNIT_EXPECT_EQ(test, ret, 0);
>>   	KUNIT_EXPECT_MEMEQ(test,
>> @@ -888,6 +904,7 @@ static void drm_test_connector_hdmi_init_vendor_length_too_long(struct kunit *te
>>   				       DRM_MODE_CONNECTOR_HDMIA,
>>   				       &priv->ddc,
>>   				       BIT(HDMI_COLORSPACE_RGB),
>> +				       DRM_CONNECTOR_ALL_INFOFRAMES,
>>   				       8);
>>   	KUNIT_EXPECT_LT(test, ret, 0);
>>   }
>> @@ -908,6 +925,7 @@ static void drm_test_connector_hdmi_init_bpc_invalid(struct kunit *test)
>>   				       DRM_MODE_CONNECTOR_HDMIA,
>>   				       &priv->ddc,
>>   				       BIT(HDMI_COLORSPACE_RGB),
>> +				       DRM_CONNECTOR_ALL_INFOFRAMES,
>>   				       9);
>>   	KUNIT_EXPECT_LT(test, ret, 0);
>>   }
>> @@ -928,6 +946,7 @@ static void drm_test_connector_hdmi_init_bpc_null(struct kunit *test)
>>   				       DRM_MODE_CONNECTOR_HDMIA,
>>   				       &priv->ddc,
>>   				       BIT(HDMI_COLORSPACE_RGB),
>> +				       DRM_CONNECTOR_ALL_INFOFRAMES,
>>   				       0);
>>   	KUNIT_EXPECT_LT(test, ret, 0);
>>   }
>> @@ -953,6 +972,7 @@ static void drm_test_connector_hdmi_init_bpc_8(struct kunit *test)
>>   				       DRM_MODE_CONNECTOR_HDMIA,
>>   				       &priv->ddc,
>>   				       BIT(HDMI_COLORSPACE_RGB),
>> +				       DRM_CONNECTOR_ALL_INFOFRAMES,
>>   				       8);
>>   	KUNIT_EXPECT_EQ(test, ret, 0);
>>   
>> @@ -994,6 +1014,7 @@ static void drm_test_connector_hdmi_init_bpc_10(struct kunit *test)
>>   				       DRM_MODE_CONNECTOR_HDMIA,
>>   				       &priv->ddc,
>>   				       BIT(HDMI_COLORSPACE_RGB),
>> +				       DRM_CONNECTOR_ALL_INFOFRAMES,
>>   				       10);
>>   	KUNIT_EXPECT_EQ(test, ret, 0);
>>   
>> @@ -1035,6 +1056,7 @@ static void drm_test_connector_hdmi_init_bpc_12(struct kunit *test)
>>   				       DRM_MODE_CONNECTOR_HDMIA,
>>   				       &priv->ddc,
>>   				       BIT(HDMI_COLORSPACE_RGB),
>> +				       DRM_CONNECTOR_ALL_INFOFRAMES,
>>   				       12);
>>   	KUNIT_EXPECT_EQ(test, ret, 0);
>>   
>> @@ -1071,6 +1093,7 @@ static void drm_test_connector_hdmi_init_formats_empty(struct kunit *test)
>>   				       DRM_MODE_CONNECTOR_HDMIA,
>>   				       &priv->ddc,
>>   				       0,
>> +				       DRM_CONNECTOR_ALL_INFOFRAMES,
>>   				       8);
>>   	KUNIT_EXPECT_LT(test, ret, 0);
>>   }
>> @@ -1091,6 +1114,7 @@ static void drm_test_connector_hdmi_init_formats_no_rgb(struct kunit *test)
>>   				       DRM_MODE_CONNECTOR_HDMIA,
>>   				       &priv->ddc,
>>   				       BIT(HDMI_COLORSPACE_YUV422),
>> +				       DRM_CONNECTOR_ALL_INFOFRAMES,
>>   				       8);
>>   	KUNIT_EXPECT_LT(test, ret, 0);
>>   }
>> @@ -1149,6 +1173,7 @@ static void drm_test_connector_hdmi_init_formats_yuv420_allowed(struct kunit *te
>>   				       DRM_MODE_CONNECTOR_HDMIA,
>>   				       &priv->ddc,
>>   				       params->supported_formats,
>> +				       DRM_CONNECTOR_ALL_INFOFRAMES,
>>   				       8);
>>   	KUNIT_EXPECT_EQ(test, ret, params->expected_result);
>>   }
>> @@ -1170,6 +1195,7 @@ static void drm_test_connector_hdmi_init_type_valid(struct kunit *test)
>>   				       connector_type,
>>   				       &priv->ddc,
>>   				       BIT(HDMI_COLORSPACE_RGB),
>> +				       DRM_CONNECTOR_ALL_INFOFRAMES,
>>   				       8);
>>   	KUNIT_EXPECT_EQ(test, ret, 0);
>>   }
>> @@ -1205,6 +1231,7 @@ static void drm_test_connector_hdmi_init_type_invalid(struct kunit *test)
>>   				       connector_type,
>>   				       &priv->ddc,
>>   				       BIT(HDMI_COLORSPACE_RGB),
>> +				       DRM_CONNECTOR_ALL_INFOFRAMES,
>>   				       8);
>>   	KUNIT_EXPECT_LT(test, ret, 0);
>>   }
>> @@ -1482,6 +1509,7 @@ static void drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector(
>>   				       DRM_MODE_CONNECTOR_HDMIA,
>>   				       &priv->ddc,
>>   				       BIT(HDMI_COLORSPACE_RGB),
>> +				       DRM_CONNECTOR_ALL_INFOFRAMES,
>>   				       8);
>>   	KUNIT_EXPECT_EQ(test, ret, 0);
>>   
>> diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
>> index 8bd412735000cb18e66aeca21433b2ebbefe2b44..2901fcb6b12ee318a4a9c727a62d5290d7c9aa84 100644
>> --- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
>> +++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
>> @@ -138,6 +138,13 @@ static const struct drm_connector_funcs dummy_connector_funcs = {
>>   	.reset			= dummy_hdmi_connector_reset,
>>   };
>>   
>> +#define DRM_CONNECTOR_ALL_INFOFRAMES \
>> +	(DRM_CONNECTOR_INFOFRAME_AUDIO | \
>> +	 DRM_CONNECTOR_INFOFRAME_AVI | \
>> +	 DRM_CONNECTOR_INFOFRAME_DRM | \
>> +	 DRM_CONNECTOR_INFOFRAME_SPD | \
>> +	 DRM_CONNECTOR_INFOFRAME_VENDOR)
>> +
>>   static
>>   struct drm_atomic_helper_connector_hdmi_priv *
>>   __connector_hdmi_init(struct kunit *test,
>> @@ -192,6 +199,7 @@ __connector_hdmi_init(struct kunit *test,
>>   				       DRM_MODE_CONNECTOR_HDMIA,
>>   				       NULL,
>>   				       formats,
>> +				       DRM_CONNECTOR_ALL_INFOFRAMES,
>>   				       max_bpc);
>>   	KUNIT_ASSERT_EQ(test, ret, 0);
>>   
>> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
>> index 07c91b450f93ab9e795d040d6f60f485ac71cfe8..f7024fd554e04dbfa38d24f775ec5993ac8db335 100644
>> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
>> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
>> @@ -556,6 +556,10 @@ static int vc4_hdmi_connector_init(struct drm_device *dev,
>>   				       BIT(HDMI_COLORSPACE_RGB) |
>>   				       BIT(HDMI_COLORSPACE_YUV422) |
>>   				       BIT(HDMI_COLORSPACE_YUV444),
>> +				       DRM_CONNECTOR_INFOFRAME_AVI |
>> +				       DRM_CONNECTOR_INFOFRAME_DRM |
>> +				       DRM_CONNECTOR_INFOFRAME_SPD |
>> +				       DRM_CONNECTOR_INFOFRAME_VENDOR,
> 
> I see vc4_hdmi.c calls drm_connector_hdmi_audio_init() (though calls it
> twice...) and hence drm_atomic_helper_connector_hdmi_update_audio_infoframe(),
> so this mask should be DRM_CONNECTOR_ALL_INFOFRAMES as vc4 HDMI seems support
> audio infoframe?

Yes, thanks for the catch!

> 
> However, vc4_hdmi_audio_init() could return early with 0 before calling
> drm_connector_hdmi_audio_init().
> 
>>   				       max_bpc);
>>   	if (ret)
>>   		return ret;
>> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
>> index 620e119cc24c3491c2be5f08efaf51dfa8f708b3..529dcaca1d7924da12d9587170f96ec6a00ad126 100644
>> --- a/include/drm/drm_bridge.h
>> +++ b/include/drm/drm_bridge.h
>> @@ -1153,6 +1153,13 @@ struct drm_bridge {
>>   	 */
>>   	unsigned int max_bpc;
>>   
>> +	/**
>> +	 * @supported_infoframes: Bitmask of DRM_CONNECTOR_INFOFRAME values,
>> +	 * listing supported infoframes. This is only relevant if
>> +	 * @DRM_BRIDGE_OP_HDMI is set.
>> +	 */
>> +	unsigned int supported_infoframes;
>> +
>>   	/**
>>   	 * @hdmi_cec_dev: device to be used as a containing device for CEC
>>   	 * functions.
>> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
>> index 8f34f4b8183d83dccd3e820a444fbf74fb6c16f2..5b4bc1d7d566d28f90f0aa342a1258685dda6bd0 100644
>> --- a/include/drm/drm_connector.h
>> +++ b/include/drm/drm_connector.h
>> @@ -1839,6 +1839,12 @@ struct drm_connector_hdmi {
>>   	 */
>>   	unsigned long supported_formats;
>>   
>> +	/**
>> +	 * @supported_infoframes: Bitmask of infoframe types supported by the
>> +	 * controller. See @DRM_CONNECTOR_INFOFRAME.
>> +	 */
>> +	unsigned long supported_infoframes;
>> +
>>   	/**
>>   	 * @funcs: HDMI connector Control Functions
>>   	 */
>> @@ -2336,6 +2342,7 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
>>   			     int connector_type,
>>   			     struct i2c_adapter *ddc,
>>   			     unsigned long supported_formats,
>> +			     unsigned long supported_infoframes,
>>   			     unsigned int max_bpc);
>>   void drm_connector_attach_edid_property(struct drm_connector *connector);
>>   int drm_connector_register(struct drm_connector *connector);
>> @@ -2488,6 +2495,22 @@ void drm_connector_attach_privacy_screen_provider(
>>   	struct drm_connector *connector, struct drm_privacy_screen *priv);
>>   void drm_connector_update_privacy_screen(const struct drm_connector_state *connector_state);
>>   
>> +#define DRM_CONNECTOR_INFOFRAME(type)	\
>> +	BIT(type - 0x80)
> 
> Nit: the above two lines fit into one single line.  I'd write:
> 
> #define DRM_CONNECTOR_INFOFRAME(type)  BIT((type) - 0x80)
> 
>> +
>> +#define DRM_CONNECTOR_INFOFRAME_AUDIO DRM_CONNECTOR_INFOFRAME(HDMI_INFOFRAME_TYPE_AUDIO)
>> +#define DRM_CONNECTOR_INFOFRAME_AVI DRM_CONNECTOR_INFOFRAME(HDMI_INFOFRAME_TYPE_AVI)
>> +#define DRM_CONNECTOR_INFOFRAME_DRM DRM_CONNECTOR_INFOFRAME(HDMI_INFOFRAME_TYPE_DRM)
>> +#define DRM_CONNECTOR_INFOFRAME_SPD DRM_CONNECTOR_INFOFRAME(HDMI_INFOFRAME_TYPE_SPD)
>> +#define DRM_CONNECTOR_INFOFRAME_VENDOR DRM_CONNECTOR_INFOFRAME(HDMI_INFOFRAME_TYPE_VENDOR)
> 
> Can you align the above macro definitions vertically?

Ack for the formatting suggestions

> 
>> +
>> +static inline bool
>> +drm_hdmi_connector_supports_infoframe(const struct drm_connector *connector,
>> +				      enum hdmi_infoframe_type type)
>> +{
>> +	return connector->hdmi.supported_infoframes & DRM_CONNECTOR_INFOFRAME(type);
>> +}
>> +
>>   /**
>>    * struct drm_tile_group - Tile group metadata
>>    * @refcount: reference count
>>
> 
> 


-- 
With best wishes
Dmitry
