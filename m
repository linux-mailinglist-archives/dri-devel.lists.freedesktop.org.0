Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75898A8624E
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 17:50:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 079C910E0EF;
	Fri, 11 Apr 2025 15:49:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ihTF0Tki";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE13F10E0EF
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 15:49:56 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53BFUcvE000667
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 15:49:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 nOgr/lJQkcJXEgWKw01Qzb0eVFBxyZ2fnVs+2qecV/Y=; b=ihTF0Tkie3yC6B4v
 5Zl7rF2Vc6DRfycxMjglrk9Xvprf+EO4H/taZTwainAvuQYbUFi75fqN1O7SJr7n
 E+n5MELVEl2t/WERj+yK+8Uvk1wsbkROyMKUSS1dfZ0f8a23mno8gIWkE+BEdKF+
 +8WcPMxzh/3Caq6bze4FCRLb9d8eUBavWyIXS2G275UvWCiinw0WARhArj+0Qmwv
 ZPER+YddYKi2D5wT3Z1g/hXvBRuqXamYWAQweLIddjTbEeNiBKNd4htMcSkHNLDc
 1Sb9gKPe921D08+fI/d+4BFsn80dC4RTo02U3jusY7nD41BtzzpOJMRQiJFcLy6B
 K6u7cg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd32vr1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 15:49:56 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-736b431ee0dso1671665b3a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 08:49:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744386595; x=1744991395;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nOgr/lJQkcJXEgWKw01Qzb0eVFBxyZ2fnVs+2qecV/Y=;
 b=Ms3Lzs2f6ZfToLbx4HQNAKYwW6VWx2Q4gSaLY/KQNCJdfyCISzAbF0BLWPGCXuVZk0
 2s98ECHJFb1ZPdk/m460k/kfmo0fWXN7rAJ7oLaO5LhY2CN3rgej99jRr44FJedWBBrI
 RcM0HuyUURdNoWbkLR6YrQBlq6kNyDmdry4hWVGUEM+TqDyo8ya7czQzNF+Q84ZecM3m
 Uz0njsmnKoFbRS0oTAex3e7Ij+OacfGFKVXOFLKzoKr/6YxtHpdyeUgi/0wf9wHiim85
 5vEb4O1Jr1o6cCOjr6hSKT2uGef2Cm+8JA04vO45+uzNbQyMhrcPR/rMASYRRIYxOE63
 JWuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDKX43xEl9uz379Mnu6JNvvppMlaj7gbiFPDR3ILl1gobboifN4QmiTII1Oj6uZbfReXNXdJ6dY7o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YweopTVY/UVjtj3ThsjqL7HlOJpGK8iMKK5ewBhFudZoDtfMrJK
 UQJfUZj7pwKUT8E6BsA4MKa6As4okYADyy36BwS1L+gTcFPNvYJbXCfqY9o+BmwNt6R0/f8MY2C
 gAB/qp/3lh1p9hd9o2o2e9dbM1biQ/dW3mYoHaGLdSdEVBE0WE/OcF2L/Tp+Fa9PVuXM=
X-Gm-Gg: ASbGncsLmT8SqfiLbJmBlm4dhY6/hr/IkF6CI3MqM4p7Zu1TaNFgESoD+88DbbZMyTk
 ktdrrWqJQvK1COt+Pcu1jTfYL6USwzRsfZUCkzcR3H4nppRwS9qrYcJxr/emyiXiAKxA2N0Rs4y
 j+VXAdLmw773zuGjkwUDKcUo8QAnDgoDm8WSze39El5wWpWQWdMC29mQKp4XCIZ9nPeRYdmsZNt
 WFTIZV00Wd5z0K0rBsdvM+mmem1L7cB509sWXFIwZEjQuGgGXgFaTFUGuCGOtRSvIW0vtFS1JYZ
 F40PNTIn9lJSlw4UthtZ6LmjOuk/TAfls5083HuUeoHKBAgMMklUqFIsflTbAg==
X-Received: by 2002:a05:6a00:2285:b0:736:7270:4d18 with SMTP id
 d2e1a72fcca58-73bd1209efdmr4404874b3a.14.1744386595148; 
 Fri, 11 Apr 2025 08:49:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESxB/Aa0LVC+V85BMsUOyb5j7KZlMEAnBrnG6ohHuifuY0RJRSaRIDOFUwbgO6GpboJ1anXA==
X-Received: by 2002:a05:6a00:2285:b0:736:7270:4d18 with SMTP id
 d2e1a72fcca58-73bd1209efdmr4404845b3a.14.1744386594755; 
 Fri, 11 Apr 2025 08:49:54 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73bd219894bsm1703279b3a.34.2025.04.11.08.49.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Apr 2025 08:49:54 -0700 (PDT)
Message-ID: <4e7f1b6b-9d24-4f9d-b9e7-efb4c55d9081@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 09:49:53 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] accel/ivpu: Show NPU frequency in sysfs
To: "Falkowski, Maciej" <maciej.falkowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jacek.lawrynowicz@linux.intel.com,
 lizhi.hou@amd.com, Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
References: <20250401155912.4049340-1-maciej.falkowski@linux.intel.com>
 <20250401155912.4049340-3-maciej.falkowski@linux.intel.com>
 <464ccbb4-3c72-4ecf-a0cf-35d2ad9d04a4@oss.qualcomm.com>
 <07d3558d-54c9-45b9-9945-fb948d37e84f@linux.intel.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <07d3558d-54c9-45b9-9945-fb948d37e84f@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: oyGWAG5nb1zwlcZxPIDWH9z5Ue4n5g1f
X-Proofpoint-GUID: oyGWAG5nb1zwlcZxPIDWH9z5Ue4n5g1f
X-Authority-Analysis: v=2.4 cv=NaLm13D4 c=1 sm=1 tr=0 ts=67f93a24 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=QyXUC8HyAAAA:8
 a=G0sXtE8vlGIAxZeaSdMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_06,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 clxscore=1015 phishscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110100
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

On 4/8/2025 8:55 AM, Falkowski, Maciej wrote:
> On 4/4/2025 5:13 PM, Jeff Hugo wrote:
> 
>> On 4/1/2025 9:59 AM, Maciej Falkowski wrote:
>>> From: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
>>>
>>> Add sysfs files that show maximum and current
>>> frequency of the NPU's data processing unit.
>>> New sysfs entries:
>>> - npu_max_frequency_mhz
>>
>> Don't you have an ioctl to get this, which is fixed in patch 1 of the 
>> series?  Why duplicate that with a sysfs?
> 
> We added this to keep it consistent with sysfs entry for current frequency.
> This is more for a convenience but ioctl is still required as user-mode 
> driver requires this.
> Do you think it is justified having this consideration?

The duplication is not great, but I understand the rational.

Also, I think your last message was HTML formatted instead of plain 
text.  I suggest you check your mail client settings.

> 
>>
>>> - npu_current_frequency_mhz
>>
>> Do you have userspace code that consumes these?
> 
> We do have a support for two device monitors in a userspace - 
> resources[1] and  btop[2].
> I develop myself a btop support and have already frequency included, I 
> will also include it in resources.
> 
> [1]: https://github.com/nokyan/resources/blob/main/src/utils/npu/intel.rs
> <https://github.com/nokyan/resources/blob/main/src/utils/npu/ 
> intel.rs>[2]: https://github.com/m-falkowski/btop

It would be good to document this.  Without something in Documentation, 
at least have this in the commit text.

-Jeff
