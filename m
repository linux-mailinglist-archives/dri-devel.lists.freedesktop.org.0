Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4678A8978C
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 11:10:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71E1210E094;
	Tue, 15 Apr 2025 09:10:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HcTnp5Sg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFE4E10E094
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 09:10:10 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tGZm005855
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 09:10:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 IvaaqOAkrzuNTsWTv3Kf3jEZ/2pLBBJyb8FHEjk8WHA=; b=HcTnp5SgRXuwbKJl
 ja/oPv4r/LL3MTxDTLbpHDuFkDPP0oqCA+l4JKhutny6tewGZeMTw3py1xXKX+/N
 7c9oHxi4Tzy5/oVzR+I7WZ0JRPd7Y8SngzjfdWlTTE17nizQ1glpifWTCphZtTgx
 7KFMXxjSvarmMcbOTGFQ2+wQgZBNtnXiqQXWDKQDTeSf9IS2L1SlY6KrWbEt4AIc
 ev/UrA382jSFlBN0UBgx3ksUOdiMOrqefsJmJQ2HUhCYjRCHaPjwtU4C/wYiBUKM
 8/SbYAgso9SqZQ8FbgLFoJFX20QPWFUGGWVHVXvU/A84df1cJuHTmu+STpoC6Msi
 g+xc1w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydvj7mky-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 09:10:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c5f7210995so908309785a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 02:10:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744708208; x=1745313008;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IvaaqOAkrzuNTsWTv3Kf3jEZ/2pLBBJyb8FHEjk8WHA=;
 b=J2viCIHMEkhNc/nyDIgxfO81SuVuTmPPMLLS9TdGzZdLMBPio2MYMNB0dfIF4LgktD
 do0ODUGgTDrADmwhGblnzsO1wMnc/MdNY92WQQpCCYnImoSOgEvfJXA1AoBrZ8TKW7w4
 3kt2/e2zFrxkmkc9PYUQgiyj0HGq6r0Tmt/1BKVEI3zdCEXFdmVLoEUlenDNja0Bw4Hz
 dkoAa0BCeG3rtjKPoNCGD1yZTZBnQwXQ7offlT+Y3u0jE7y21cLhIOI3iGWqV0EuDdAN
 +89HdJIyqdgh5/izLGUo33GIZNFBZYwIEAjH3A3ZpOkGBBGjtug9izKGSueYn3nCo6kv
 14pw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnnPhMNltp3A3WFxFrYoimheXx560nCowVtvk2CGrVm0yhRfqwe5QGLMWpiNOZjajZmMTeIuDXI2s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxku42GekTT3vUqNSw/ZtyW/nm/4eNTG1zFXWGiPSN5Ljq8wVMv
 o1TkB+GlWyktO3OzSqAvc/sz5oXcN1OxJvJjqQl5RGY5ydS0rhG28NSpJUxuQNwMv9Jj6L7P9GZ
 oRcSjeN8YYck1IB59qwaAfTsZzLGy1L2BDQqD7FoPWIWxSt6GwWewlUPc6tP9dI/A/xo=
X-Gm-Gg: ASbGncsNrXDkRV8Xka45wluZ0I72gR/xqN5qjb/0NnlHbAEK84Php7jsSe9q9DJOwtM
 RoIOWhu25RtMl70PPH2b1kFN1tOxnz5L6WgIbOYQJscIXQ1+ujRmUtVO2p2RzDgMoAjT55L5UXV
 oxLRUSRwhsW8o7JOpQYCVCJ9cmg2SnQ2w/0URJ2V8HzJtRY8jbdfimYKVpJaYKB85Ybe42WJ1a6
 1XJIxznXA/4WGizIqOJuwAjaq0t649me4Pf+kseAAVk2AUxXtHfiMcRJmV1LtI6cIrz7Eoc6gwA
 drzvHjSQua2/I/w4KCGydQ7KPkW+/awfyEJ8uIY7iQUJ2EoabVrJ6RgR95qcKmA9pG3q6Xp533f
 WxOQsMbP8m2P/LcAf/jcuAqZFkkr/rsLKutlkOwgMAEtlhpQCpVNggY4aDdIe
X-Received: by 2002:a05:620a:178b:b0:7c5:a542:10a with SMTP id
 af79cd13be357-7c8186f1201mr382319485a.10.1744708208673; 
 Tue, 15 Apr 2025 02:10:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFk0pQD6ni/UlHlkmoHuIXoU927HtTZHt420MA6ysTlRz30A/CV2Hbmxkz35cgOBPGsYUEikQ==
X-Received: by 2002:a05:620a:178b:b0:7c5:a542:10a with SMTP id
 af79cd13be357-7c8186f1201mr382316685a.10.1744708208401; 
 Tue, 15 Apr 2025 02:10:08 -0700 (PDT)
Received: from ?IPV6:2001:14bb:aa:77bc:64e0:30e4:f6ff:5bd?
 (2001-14bb-aa-77bc-64e0-30e4-f6ff-5bd.rev.dnainternet.fi.
 [2001:14bb:aa:77bc:64e0:30e4:f6ff:5bd])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54d3d123603sm1349632e87.21.2025.04.15.02.10.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Apr 2025 02:10:07 -0700 (PDT)
Message-ID: <ac890d36-f61a-456b-9833-4615f691eed6@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 12:10:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/11] drm/connector: add CEC-related fields
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
 <20250407-drm-hdmi-connector-cec-v5-3-04809b10d206@oss.qualcomm.com>
 <20250414-augmented-origami-fulmar-acb97b@houat>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250414-augmented-origami-fulmar-acb97b@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZIrXmW7b c=1 sm=1 tr=0 ts=67fe2272 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=PHxvEjgxzrmEcERRWlUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: -m0Zed2-stcmuxDUKZQv2Ei4u1QyRDx9
X-Proofpoint-ORIG-GUID: -m0Zed2-stcmuxDUKZQv2Ei4u1QyRDx9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150063
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

On 14/04/2025 17:52, Maxime Ripard wrote:
> Hi,
> 
> On Mon, Apr 07, 2025 at 06:11:00PM +0300, Dmitry Baryshkov wrote:
>> +/**
>> + * struct drm_connector_cec - DRM Connector CEC-related structure
>> + */
>> +struct drm_connector_cec {
>> +	/**
>> +	 * @mutex: protects all fields in this structure.
>> +	 */
>> +	struct mutex mutex;
>> +
>> +	/**
>> +	 * @funcs: CEC Control Functions
>> +	 */
>> +	const struct drm_connector_cec_funcs *funcs;
>> +
>> +	/**
>> +	 * @data: CEC implementation-specific data
>> +	 */
>> +	void *data;
> 
> Is there a reason we don't just skip that data? The only user I'm seeing
> so far are the helpers, and they only put the cec_adapter pointer in
> there.
> 
> Can't we pass the connector to CEC and make the adapter part of drm_connector_cec?

It will be either cec_notifier or cec_adapter + 
drm_connector_hdmi_cec_funcs. Initially I sketched a union here, but 
then I thought that a void pointer makes more sense. It allows us to 
make CEC data helper-specific. For example, cec-pin might store platform 
callbacks here. DP CEC might need to store AUX pointer, etc.

-- 
With best wishes
Dmitry
