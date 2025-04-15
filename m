Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D56AA89761
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 11:03:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12B8E10E2AB;
	Tue, 15 Apr 2025 09:03:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="He+BI3s0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D9B210E69D
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 09:03:28 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tIPG031756
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 09:03:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Pi9W8xDLtFpfMCtDZ/I2qyKiiqpdZeuFsiGXpdMBpHo=; b=He+BI3s0YJ/2TUMV
 oO9+aMBAxYo42PxqQhuOKQS4YVmQsPePdK6np0q78+1xWiMYBGAxccIZWVDprg8B
 Of0CfjQ1HxM00+9Uq3pful9EjN/89iSsaU62QX093+sjJQJvRGTAl3ZqXwC1Y/3o
 UsAPGEdyrDDVKmRg+HJP0MHuSmLqhd0UyLwzy6nksJcZoLkWG3YTm6obWFZBU1OU
 dDWTfcfUpoN2V8nbNTgJPPz4X5qH0M14vOaaT4rQlJRX+dRtvBfeiqYx2TAQVedw
 XJLio7UJrQEVyFcByKZXmprkM5ZNvyx5iK9E7mkUlVIOXnyb9heMvMofoouFzyX5
 13Kg3w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfs17edv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 09:03:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c5c82c6d72so962463285a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 02:03:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744707806; x=1745312606;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Pi9W8xDLtFpfMCtDZ/I2qyKiiqpdZeuFsiGXpdMBpHo=;
 b=nocG4ClB4LzQW5LNpGJAQPW8gXIvY4Avrbu9GKqxfCQXIDEDAxqmGS+WHz/n2UexF4
 hJ/KQ3rc02EpaXH9cH0ttavgMTyadJFGp4n/stncvse9lwt5R63k00ui064wUONQN1y1
 PuC7pa/BDqZFzTFlhcq3ua8d9k34ZVB2vtyu+1Wmk8sovJJohSEL0dTiHhroKmPomjth
 OAxrZGMDxpe5g+gyhjxA93MB6vf05s4S+3vnKDZXK/2X9DRayOmYS3Cgy9jngUbltmD0
 DCFRmvQja284VCao707WAKWG0mnO/HQPIn4Z4Awo5Cdjjmmd6lLKsUfOMoXS8aF3VyI8
 hbIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnn5uGzo3L8fApbr1x6Nn3oJl70TD3RZVHfl8nV2nz2OfEml5RgJECbLCK6RnfUOYlSa7ywIzpbWA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyWJl5zF0BvGgKQ9C8M9ykOhBFnpMVrB/qHRSY0rou+29qivTZk
 2o97l9NtDPyyARl+RkOCnKBAhvRDnDPm7cTekBNddKrHHZ8r0g7hxkb+f1qp5yIBjJUa+SrTKkk
 sMZ/nmhTC1jZjwdznT+JhKkEAdSPSgENJ8VPpQ8n0O7DAvnLcJ1RYWH/nCTIeFR1s4rQ=
X-Gm-Gg: ASbGncu13DS3PKBS5VAWESkuQ3WI3+ENOoMswpoLKOWa+l5zxbPKRbwt8opCZDPpFKL
 ekj9F6wyX+pQATiQVNxOIjdkdzNwa9djPLld8igfXQSS6b2VlUjYSH5JTIVUkCWM9cqKp90tXk9
 A5E5d3bpOxG0dDYCKYncX1RXxrpe2tnlpM6hwzO8ZILckgJKymygD5M1zlRPrKDuOhSE6np8V8k
 11rJD3fMYU42D/TGNXTyhg6KbOo0DqMyLI/5q7cywg+lsGuUjpsaTqRVyo/tKjjzJw7VB/Sgorm
 ZfYRmYdD+JI3InQV4hxoYXsDhbWenaxEQxUqD0lBgNg7Xok6lj0hsfJhWBLrhInNkqquD4VsCls
 U4ba0pWLJ3dGvnncNVC+lYd1ZB4WPzgiFOOQplfs8ZFiZTmth1cs2yL9Io3ms
X-Received: by 2002:a05:620a:44d1:b0:7c5:55be:7bff with SMTP id
 af79cd13be357-7c7af114905mr2363266285a.43.1744707806622; 
 Tue, 15 Apr 2025 02:03:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmALGO/49j9P1UWM4GcEnINXzH+/qaxVWP9A1Xi4UfCFAuKfFmnRfD3FeJ10ZTTxf0ZPZJwQ==
X-Received: by 2002:a05:620a:44d1:b0:7c5:55be:7bff with SMTP id
 af79cd13be357-7c7af114905mr2363262685a.43.1744707806221; 
 Tue, 15 Apr 2025 02:03:26 -0700 (PDT)
Received: from ?IPV6:2001:14bb:aa:77bc:64e0:30e4:f6ff:5bd?
 (2001-14bb-aa-77bc-64e0-30e4-f6ff-5bd.rev.dnainternet.fi.
 [2001:14bb:aa:77bc:64e0:30e4:f6ff:5bd])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54d3d520389sm1358576e87.251.2025.04.15.02.03.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Apr 2025 02:03:25 -0700 (PDT)
Message-ID: <f59c0ab6-2391-4712-a3d5-18e67f538d4f@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 12:03:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/11] drm/connector: unregister CEC data
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
 <20250407-drm-hdmi-connector-cec-v5-4-04809b10d206@oss.qualcomm.com>
 <20250414-hissing-auspicious-goldfish-78b9dc@houat>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250414-hissing-auspicious-goldfish-78b9dc@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=P9I6hjAu c=1 sm=1 tr=0 ts=67fe20df cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=0wzSBSrXEAkDLt2uI0EA:9
 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 1bpl34mZt4a2C6te75XssifzgzNOjGiC
X-Proofpoint-ORIG-GUID: 1bpl34mZt4a2C6te75XssifzgzNOjGiC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 mlxscore=0 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150062
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

On 14/04/2025 17:47, Maxime Ripard wrote:
> Hi,
> 
> On Mon, Apr 07, 2025 at 06:11:01PM +0300, Dmitry Baryshkov wrote:
>> In order to make sure that CEC adapters or notifiers are unregistered
>> and CEC-related data is properly destroyed make drm_connector_cleanup()
>> call CEC's unregister() callback.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/drm_connector.c | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
>> index ba08fbd973829e49ea977251c4f0fb6d96ade631..ae9c02ef9ab102db03c2824683ece37cfbcd3300 100644
>> --- a/drivers/gpu/drm/drm_connector.c
>> +++ b/drivers/gpu/drm/drm_connector.c
>> @@ -743,6 +743,13 @@ void drm_connector_cec_phys_addr_set(struct drm_connector *connector)
>>   }
>>   EXPORT_SYMBOL(drm_connector_cec_phys_addr_set);
>>   
>> +static void drm_connector_cec_unregister(struct drm_connector *connector)
>> +{
>> +	if (connector->cec.funcs &&
>> +	    connector->cec.funcs->unregister)
>> +		connector->cec.funcs->unregister(connector);
>> +}
>> +
>>   /**
>>    * drm_connector_cleanup - cleans up an initialised connector
>>    * @connector: connector to cleanup
>> @@ -763,6 +770,8 @@ void drm_connector_cleanup(struct drm_connector *connector)
>>   
>>   	platform_device_unregister(connector->hdmi_audio.codec_pdev);
>>   
>> +	drm_connector_cec_unregister(connector);
>> +
> 
> Actually, since we know that the HDMI connector is drm-managed, why
> can't we make the call to connector->cec.funcs->unregister a drm-managed
> action registered by drm_connector_hdmi_cec_register?

I haven't settled yet in my mind whether we can/should also use this 
infrastructure for drm_dp_cec management. So, at this point, I'd prefer 
to keep a non-managed unregister function. Once we settle on something 
for drm_dp_cec, we can switch to drmm.

-- 
With best wishes
Dmitry
