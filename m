Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E8EA8A38B
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 18:01:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 753B610E7ED;
	Tue, 15 Apr 2025 16:01:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mm0OH3+H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19E2310E7ED
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 16:01:32 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tSPB005505
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 16:01:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 5u2T6l4s1t7GjnVZQRXRPhLWe1OIv4ZxKDNlwrBlgUM=; b=Mm0OH3+HMJMDCje5
 MAhJNF8cVWHlQ9+egmRkzxALAqZ/XWfxDocb6dCPK3inhlJ7LV61Hg9kguHuE6Bt
 EzpwJCHb7uKDEw/N9IRH4akbzt7Jo0QcBrpJVswxymvX+lDizQqtO2/eJOtJeBNx
 XO2EUFtztwSAxuPbP8OSw50ZbdCT4r1OCSUWCEuBk6c9ZPGY2EQl0Ylk/jP62+nY
 Jy2dm2PRXYwpiURZX59ONlMr4J5Xvxui5SEPrP+FQSmuQRi2tzgWAY0zFNYL71B9
 c8ETLIKcuKnFBxRWKnGfRdhqI5yClZ35J809tDRiIe+c+qvNbW7ru8NpBDyzLSEE
 XuPLQA==
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhbprfsw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 16:01:31 +0000 (GMT)
Received: by mail-il1-f198.google.com with SMTP id
 e9e14a558f8ab-3d44a3882a0so50686825ab.1
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 09:01:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744732890; x=1745337690;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5u2T6l4s1t7GjnVZQRXRPhLWe1OIv4ZxKDNlwrBlgUM=;
 b=D2bH5QfA5dbxloO+tDn9QArHCKtYJSehJ0DGDVrEcwLghpNAXfKXd2S/v4nAJ5I7kQ
 Z+vaK5+iaepJO+DNKCL3Sf3Ivs5b0Q28wWbtybkmkRPnbDOuwdFFPHG2ucejyJH89dCs
 cKbGlmMFFtCu4QeULmvw9ylCcyKfEqB36lpH1P3pzQCAkWpVGSjS6gTJB3AWmqO9Ocwq
 LsRn7smr/tXgFezsJy6BsjtJFV1f6GkH63/95eughId2JSPfOH/htbAnJxq+LZh3Tnsv
 5HF1G9PgOsmby+YljWb6NqyebMSylkkqZ4OGiqS/N3MhcJJNTQ9SPdHiHg1p3oiE89Gt
 YfUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHsulc6brXAqmq5K+Zmr3BCYJhN9Lgz1NrBKpqm/xvlX0QV8oZBBjW3bIAaTEenq6fGym4ISrZ36I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxbaHvjZM/GSDZ1E8bfNZMoHVUn5cvH/a0UZedlF/z65/n9Ttqb
 OXK+0n7EBHUTwC6pC68xrxPafPq3kOrQ2/J3a4zvxg7G0SycjLaiQTOJm435UDugGu4O4Of3Qho
 pKXtQiAVgWHDCNpAwZJQsA6mDBVYU0HwISF/QOYmvlQa7g9VKjsAiDlAsVGau5fbFVYQ=
X-Gm-Gg: ASbGnctKa8tBKjw8u30QbhvSib7iY0cyki74hp8NBIYk5qOuA83AYbEoy2N8BiFP7/n
 PoXDOLKBsgbb1vYnDqt3LR7hFVkVny+6cLAiRfhm9NsgYcP1FkK99L73BopCi6YDsMiFL7MHJsB
 /m4Or5oF+pKqk7Vw5tsLpkZc0eGUSu75J6mWW7ynjoQJsEMakTAGhvENG+eUfmKDKySrJ685DxP
 YvPBoTLtsgZbgKM/FA+XqhHkLBCtSPw+EKZdYXIs1yh6X8MqkUsUce617PAaVSuIoAlnBQ8hWRw
 0lmYGsx1SGjBCaqCzkpRJFtzT1hv5QOgqne8TLA1Wj/z7cHxPllrSiF5si8Yr9GWpxyoxz3GSCz
 vpsPP3OwAY0V2cwhKkzNS7Pf7Vgxi1gDn5IdJwLWIeXB3Lb4n9toixQG3Pyo7
X-Received: by 2002:a05:6e02:180b:b0:3d6:c2ff:eee2 with SMTP id
 e9e14a558f8ab-3d809cebf2dmr42095035ab.6.1744732889972; 
 Tue, 15 Apr 2025 09:01:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhT2iFWSl8B5lrAhlh2VfACCzUSvDHCQ5wYZeqMP6DgpJHzf63QqS2vwH8kBgKxT+bdulSTQ==
X-Received: by 2002:a05:6e02:180b:b0:3d6:c2ff:eee2 with SMTP id
 e9e14a558f8ab-3d809cebf2dmr42094135ab.6.1744732889148; 
 Tue, 15 Apr 2025 09:01:29 -0700 (PDT)
Received: from ?IPV6:2001:14bb:aa:77bc:a0aa:ce3:e648:8962?
 (2001-14bb-aa-77bc-a0aa-ce3-e648-8962.rev.dnainternet.fi.
 [2001:14bb:aa:77bc:a0aa:ce3:e648:8962])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54d3d51ed80sm1469663e87.230.2025.04.15.09.01.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Apr 2025 09:01:28 -0700 (PDT)
Message-ID: <d923d469-ef1d-4dde-87ce-6b9e840b27fc@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 19:01:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/11] drm/display: add CEC helpers code
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <lumag@kernel.org>
References: <20250407-drm-hdmi-connector-cec-v5-0-04809b10d206@oss.qualcomm.com>
 <20250407-drm-hdmi-connector-cec-v5-6-04809b10d206@oss.qualcomm.com>
 <20250414-determined-kind-peacock-e9a47c@houat>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250414-determined-kind-peacock-e9a47c@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: pDHkTukP8-P_iLVWn4TLTfVvNhMs5tDz
X-Proofpoint-GUID: pDHkTukP8-P_iLVWn4TLTfVvNhMs5tDz
X-Authority-Analysis: v=2.4 cv=I+plRMgg c=1 sm=1 tr=0 ts=67fe82db cx=c_pps
 a=knIvlqb+BQeIC/0qDTJ88A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=FoKcXcNF-cLjYyKC5aEA:9 a=QEXdDO2ut3YA:10
 a=8vIIu0IPYQVSORyX1RVL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_06,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150112
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

On 14/04/2025 17:58, Maxime Ripard wrote:
> On Mon, Apr 07, 2025 at 06:11:03PM +0300, Dmitry Baryshkov wrote:
>> +static void drm_connector_hdmi_cec_adapter_unregister(struct drm_connector *connector)
>> +{
>> +	struct drm_connector_hdmi_cec_data *data = connector->cec.data;
>> +
>> +	cec_delete_adapter(data->adapter);
>> +
>> +	if (data->funcs->uninit)
>> +		data->funcs->uninit(connector);
>> +
>> +	kfree(data);
>> +	connector->cec.data = NULL;
>> +}
>>
>> [...]
>>
>> +int drm_connector_hdmi_cec_register(struct drm_connector *connector,
>> +				    const struct drm_connector_hdmi_cec_funcs *funcs,
>> +				    const char *name,
>> +				    u8 available_las,
>> +				    struct device *dev)
>> +{
>> +	struct drm_connector_hdmi_cec_data *data;
>> +	struct cec_connector_info conn_info;
>> +	struct cec_adapter *cec_adap;
>> +	int ret;
>> +
>> +	if (!funcs->init || !funcs->enable || !funcs->log_addr || !funcs->transmit)
>> +		return -EINVAL;
>> +
>> +	data = kzalloc(sizeof(*data), GFP_KERNEL);
>> +	if (!data)
>> +		return -ENOMEM;
>> +
>> +	data->funcs = funcs;
>> +
>> +	cec_adap = cec_allocate_adapter(&drm_connector_hdmi_cec_adap_ops, connector, name,
>> +					CEC_CAP_DEFAULTS | CEC_CAP_CONNECTOR_INFO,
>> +					available_las ? : CEC_MAX_LOG_ADDRS);
>> +	ret = PTR_ERR_OR_ZERO(cec_adap);
>> +	if (ret < 0)
>> +		goto err_free;
>> +
>> +	cec_fill_conn_info_from_drm(&conn_info, connector);
>> +	cec_s_conn_info(cec_adap, &conn_info);
>> +
>> +	data->adapter = cec_adap;
>> +
>> +	mutex_lock(&connector->cec.mutex);
>> +
>> +	connector->cec.data = data;
>> +	connector->cec.funcs = &drm_connector_hdmi_cec_adapter_funcs;
>> +
>> +	ret = funcs->init(connector);
>> +	if (ret < 0)
>> +		goto err_delete_adapter;
>> +
>> +	ret = cec_register_adapter(cec_adap, dev);
>> +	if (ret < 0)
>> +		goto err_delete_adapter;
> 
> I'm a bit concerned about the respective lifetimes of CEC adapters and
> DRM connectors.
> 
> When you register the CEC adapter, its associated structure is
> kzalloc'd, and freed when the DRM connector is freed (so when nobody has
> any reference to it anymore: either when the device is torn down, or a
> DP-MST hotplug scenario).
> 
> The CEC adapter however will only be freed when its own users will close
> their file descriptor. So we can have a scenario when the CEC adapter is
> still live but the DRM connector has been unregistered. Thus, the CEC
> adapter data will have been kfree'd.

If I understand correctly, CEC core will handle this thanks to the 
cec_is_registered() calls in the important places. Nevertheless it's 
worth adding a comment and a set of drm_dev_enter() / _exit() calls.

> You might consider safe because $REASONS, but those need to be properly
> detailed and explained.
> 
> That's another reason why I think that just putting the connector
> pointer as data is better: connectors are refcounted, so we know those
> aren't an issue.

Not quite. CEC adapter itself doesn't have a refcount on the connector. 
And if add one, we'd create a loop, preventing connector from being 
unregistered.

-- 
With best wishes
Dmitry
