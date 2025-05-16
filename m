Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1680AB9EC6
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 16:39:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3D7910EAEE;
	Fri, 16 May 2025 14:39:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bBPYecs6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 002BB10EAEC
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 14:39:06 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GBIogS021298
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 14:39:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 1gBT1HJlDWyal5GYPqOK9+GXpwqSZ6GKRgtmLdLKaGk=; b=bBPYecs6wfR2+b2/
 9w9VSKp3ryoIuHqQORIxFS36SVK3YqFxpJfHX7xQXfEDo/GENT+UNmCH21OI4etG
 rCakqgv67Ts4Dq/88jYcCqW2UMK7bUJvorKOH0VGyEIGuVMRnxmRUFyTYlox7jQB
 kitqBnNwpv9KPFJyrNlxf9m6YIDGFjMCUdXE5TngdSjYJ6AEY/+8ccvhX9eFjo+j
 g/cFKueUsoaykqY53aNmFC4E63SgmDQFqBOXK82xFkIHiR9ugiBYgxX82nU+4fiY
 dixrKMCIh1MlTRIOnCha4eNO3eIHkTreLStkdCabD+XEOnmSMg1ykQY8zMRpJxOn
 MIWrRQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbewa2pj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 14:39:05 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-22fba2426f5so19237735ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 07:39:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747406345; x=1748011145;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1gBT1HJlDWyal5GYPqOK9+GXpwqSZ6GKRgtmLdLKaGk=;
 b=TDbIB912w1OAs+SoGbxTGQiRF9lmfWpCRY+MjfHx8HkfBE5SasbAUGRAPluyE0uMVt
 gS4D31eAYN8GdJ+Zg+x3wfqAEw0Evmq+t8bjWo7vkY1kuJrrVTqOvsDLWoPAz552sTj4
 Y5wAX4ZMuVJZxsZauSXaFt5p6+pmuaj0OQ4HE0UmFTCLvDH16TSpQ0xj6AQ8A7YUNhN7
 EdazBJ0oz1BP8fqsyU9QVMjyxU+YWrTWtbHOammoOs05ztg3c78tLBVFeE5banqpC8md
 zmhtJyfL5p47bMR079387ZTmH5tV/jmUocWdtkZ4VHMUuwYov62lzcqBGf361UbwE8RF
 hq5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUy+ZUs6i6QmUKoa1CjPTIhjaC8UPSvRAQfNHFVYUOtoQV+ff4ig4QFyEVzFzRuWWxJSOScGs4dFSU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy1TjGp/Ra/JXtFt5ycHq7HqWhzJ/dyLfBe4JPlK+oIofG7wXvj
 E6L5JvMKKWoPmzdPz0d7WzwjoKBl1WttBacU9zTSK4efhoSFILo77jtiXZNM5PjkfCRoZ1ErtDO
 dU2evIuFxgkHt6OrUetfvadKgQRwcEiYycITIlVmEfPQonnf+aho/2KZjefxOB21k10QEGgQ=
X-Gm-Gg: ASbGncuVidUGZuEaeJ6jR97+bLrnTgT2cBdSfgXAKNfLzaU4IiprmJhdXbwN3Sr5Ehd
 ILsLa3XDDUNejAh3J0Iseaj85nO1OvhBQo49Vpl6SDVj3F5cGL4rf7U6rvHjs0Sjk77ZlUQMvOZ
 oGE1KzZzI3Ces0c2fIAhJMeFU54HW4mxnq2kbu0muPkYSNSfuirZdmUp3WROMhVKstTx5i6NByE
 4SO+hCOYYo94x8UxaMqZx2oFOnReCphKl6De+K5nj4GhLsqp7ArAXqY0oT0kjcdK5bfdsAEanBC
 0+WvZuuHOzaPC0zDKrEoxk0fpwjH5VeVOB5WW3hnznyPneTw70In4pa2j+5zgg==
X-Received: by 2002:a17:902:dac5:b0:22e:69ee:b286 with SMTP id
 d9443c01a7336-231de37012fmr33904495ad.33.1747406344644; 
 Fri, 16 May 2025 07:39:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+kUliqdQrKj9SgWrA7Dm7+TU60gMuDnKgcGW7KuccOQUmnnGkfAwFQtzcdACxjbfhv/RqBg==
X-Received: by 2002:a17:902:dac5:b0:22e:69ee:b286 with SMTP id
 d9443c01a7336-231de37012fmr33904205ad.33.1747406344253; 
 Fri, 16 May 2025 07:39:04 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-231e26d841dsm11694215ad.29.2025.05.16.07.39.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 May 2025 07:39:03 -0700 (PDT)
Message-ID: <4388de53-5f98-4170-b6c3-1567c5c32e91@oss.qualcomm.com>
Date: Fri, 16 May 2025 08:39:02 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Add inference_timeout_ms module parameter
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: lizhi.hou@amd.com, Karol Wachowski <karol.wachowski@intel.com>
References: <20250515093128.252041-1-jacek.lawrynowicz@linux.intel.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250515093128.252041-1-jacek.lawrynowicz@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mOX8ZCPaHGK5lL1FqlA-wcZ5UefEHYVg
X-Proofpoint-ORIG-GUID: mOX8ZCPaHGK5lL1FqlA-wcZ5UefEHYVg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDE0MSBTYWx0ZWRfX5/uYpmD4B8nr
 9jgCPRdDh8JnyG9Mrwm5wto63Ld8FoNvcJlIE1SsVU/q1UeatZ2IHkuGyZvkvHG1SU2xHT1r5gK
 1hsqkgmI7FAYer00FKaoGe9fjKOyf/e1lvGseL8BIaj5eQLoq7cjIk3eHIVVq+qADbpRX88FmV0
 jxAPi61vMPXbleWGkGgEbTjwI0dIGBAU9TgiLxKIPj0oygNmqYQeYyrfFf+lUXyAen81UWk9EOl
 zCWkIXDQr/SA610bEbWRSdpMHC/oQ9iMXQ0TlZcLvvRsOde7RJH1vZYA06NWPP6nT56wSZAaRFB
 /CLPi3qtNXtsz9F4oy6VIeX02SPYUTuyAA09xqM3BcoFj/GlFL+S0dTnSEskCJpvOb8kc8waDDR
 4eoRYDMJ8/XioMWZVgxhOLIa+ExvKyHd2JmKNyhI3XD/I3HLj2I37Kz4l+rCZMLtvqGIbq1D
X-Authority-Analysis: v=2.4 cv=LOFmQIW9 c=1 sm=1 tr=0 ts=68274e09 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=r1RDq_7L7RqDo2nY834A:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0 bulkscore=0
 clxscore=1015 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160141
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

On 5/15/2025 3:31 AM, Jacek Lawrynowicz wrote:
> From: Karol Wachowski <karol.wachowski@intel.com>
> 
> Add new inference_timeout_ms parameter that allows specifying
> maximum allowed duration in milliseconds that inference can take before
> triggering a recovery.
> 
> Calculate maximum number of heartbeat retries based on ratio between
> inference timeout and tdr timeout.
> 
> Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
