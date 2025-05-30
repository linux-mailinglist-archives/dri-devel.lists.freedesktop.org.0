Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7A1AC926D
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 17:19:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3B2510E21F;
	Fri, 30 May 2025 15:19:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="N1oLCBMt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 872DF10E21F
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 15:19:27 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UBOAmP031530
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 15:19:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /q+YvqYtbRXmX9ePmBvjG6ebJPt80BkopHr/TbJPGwI=; b=N1oLCBMtcPxcYP2t
 kAKFZvZOWcG2YFmX910uA4wtk7ZNKO4QLsANZZJvdDrDLuLB99nuuz10dc49naR9
 i1T1Ajs46/uxGtn1AfXsxnywWxJTD0mFgpgdVYqNLWOsO3zVr4UE9XLra6un6EO9
 vK8JLNJ3jQ8e7RWFOKUneNIBPD3G+erh0motHSX2wmD5sg+lckfE6pNzCVToNkZr
 ySqFKUzuZThT+tY+3vTemB+f1ELohGuxNuxX1eFVk8Nlr1d2hCE0MxWFyO8YHP+I
 AxbXLcqIb+K0/CsLlV3rm92sLp8DSRv5dzjCvhUis2jl0ruwZfP4SEWAxt8u7N3G
 SiSWJw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6vk1kx7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 15:19:25 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-747af0bf0ebso1635038b3a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 08:19:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748618364; x=1749223164;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/q+YvqYtbRXmX9ePmBvjG6ebJPt80BkopHr/TbJPGwI=;
 b=AbT0Njc8t/lejYe+iG0nE4hQ7Q54+Cl/98MgLqXyngPaBZ1Zk0plZRrds7emr+292j
 /oTr65WyITws7/oK2rrxQ98CzbnMlUjne8OyhPmLZNdQFcZBnoj3mmjk2URlmWVclXRF
 iKI21zSTe3NHEqZVDiRrlBHAglNACUO/ZG6+k0NauGkdDt3suNYL6Dt7WWgQoR9UGAXQ
 sCu8UjoaReYDrUZ557/AXMV/PuFfvPasdOifYFd+MpgFPdnNyLRrMf+6i9vwOlgWX+uX
 Ah+7HC13R20f4I4lhHLFSokvRsndbtaowiFGCXmZvaA2BxYEYanmKtkuiJ7hbic+bWny
 LxdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrbAI+mZpuL98EipJHq3nLR8qw+O9kIl/iyjwsuz0OIsp786EZCiW1jA1d+fNO6BlVgy6v1XWycLk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyAp4Ht9xeJuVo5BvVZGfrNwuvKYM+eRcNu68Vow1cNi/NyxTT5
 1c8mR2vmZ3yWshWBGwK1Qxwqd6eTfyEO6fvKbsdqpYduU+A6cuvaJXe+1AsAst8Ghyzo4kJZJPY
 cJwS98iHV9M/qsT85erd5HBieIVtT800GOBE+cDP3A85CydTXBb/QhW80sq44U/t9e95fjNs=
X-Gm-Gg: ASbGncs3mM32g83Z2jLuCcsScATC3d+RgOa7NMS+vi6DORs1MPSrXeMteuClbQfOGdk
 AMBxkJPZuA8AaXUunWbi5/buzoEWJAErag3oNebzYu8AyOXDiIBMtDjD30cuCr1Mkc7OrmzIQ0S
 bROHssjK5a2DsRPrwgqpbUpJMDeX5asUu86NbIm83JmMjUs5roN/ux0XnMOSTJYITVI2vVpKrB2
 3JwgwSdxC7GxDOdQWN8RZ+cmq0Hp1yOIj7BPKNFMMMFFjJLQ6ps5JM8KfcaOad7iKhfww+lYe3Z
 7aTGDg3grpeVEtRIAo7M4e1eZzdCTdZBZa4phJc332QkEa3MwCoSg0ueAydMAg==
X-Received: by 2002:a05:6a00:139f:b0:740:b3d9:c889 with SMTP id
 d2e1a72fcca58-747bda1a211mr4588221b3a.22.1748618364472; 
 Fri, 30 May 2025 08:19:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIsnc65zftF5H9opwbtI65RK9LSqmvQ1w8r/w2RETrAKhTxutQiW9vpS3JmGLmqXeNZ+QMOQ==
X-Received: by 2002:a05:6a00:139f:b0:740:b3d9:c889 with SMTP id
 d2e1a72fcca58-747bda1a211mr4588191b3a.22.1748618364068; 
 Fri, 30 May 2025 08:19:24 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-747affd41d7sm3167879b3a.123.2025.05.30.08.19.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 May 2025 08:19:23 -0700 (PDT)
Message-ID: <ff02633c-e57f-44c0-a3ef-4eb6e044578e@oss.qualcomm.com>
Date: Fri, 30 May 2025 09:19:22 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] accel/qaic: Add Reliability, Accessibility,
 Serviceability (RAS)
To: quic_carlv@quicinc.com, quic_thanson@quicinc.com, lizhi.hou@amd.com,
 jacek.lawrynowicz@linux.intel.com, quic_yabdulra@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20250516160634.1408309-1-jeff.hugo@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250516160634.1408309-1-jeff.hugo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=UOXdHDfy c=1 sm=1 tr=0 ts=6839cc7d cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=53wffJMIMOjkZiTugjoA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: MQb5QZouuFQE0rAnjyNYvdVW5_zmcdq7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDEzNSBTYWx0ZWRfX7Hez4AE/7KoL
 Qxv0kXasvy17jgujR39c0apLOs1n9Nnam96/s2HMNIEHC9N/AS16BTV2l1KfFgwiDV6dVjIp4lO
 Z2o51rKekRK73XfXgwKVT7Qo7eAHAW3K31TugQ8Y0HdWB2K2A5yC4FcnP9j0VqC8R358cHDIwFt
 H6bdJOtzkvxpUDsBk0JNvtbXr4N/ejpjUZGPS0cGY82kC8CrapUi42t7iHeiaiCVgdOt9q3yqwN
 M0BZgG78Te0CJa4UwSSR/OqlrOp7dVUq3hx2W6FnDhNm434b2jUDhGwW9++NS6GdPWwmpy/zon4
 JtbdHqAWrhv9cBZqnVhFMyt3I6lPr0+8WVb4viOs8vwc3jlIj27oiq2r/Wi2Ajn7Hi22z4aQ3gg
 u26q+3JU5fGuHVHmUaSROROYU2o5BUyYhzHPIliIcFwHJS2fagi3vQPjH04HN2xmeLTzeA6Z
X-Proofpoint-GUID: MQb5QZouuFQE0rAnjyNYvdVW5_zmcdq7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_07,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505300135
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

On 5/16/2025 10:06 AM, Jeff Hugo wrote:
> AIC100 devices generates Reliability, Availability, Serviceability events
> via MHI QAIC_STATUS channel. Support such events and print a structured
> log with details of the events, and if the event describes an uncorrected
> error, reset the device to put it back into service. As these events may
> not all be reported via other mechanisms like AER, maintain counts of
> the number of errors observed for each type.
> 
> Signed-off-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

Pushed to drm-misc-next

-Jeff
