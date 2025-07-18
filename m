Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAEFCB0A914
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 19:09:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7306110EA1A;
	Fri, 18 Jul 2025 17:09:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BhVQL7bg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 325C110EA1A
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 17:09:40 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56IEais6030397
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 17:09:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 MvWIjxTgsWqTg+EpU1jF6w7w0dCuZOGk2IF4h2JIZKw=; b=BhVQL7bg08dH1Lyy
 sCNahyhXgLOooPUk6k8lhKr8X6uJk+1Pa2UywOtv1yU1ysnUtDgNZt4yqdpLZuE+
 K0tv2dxCzW6dvx8A4AAJj193IuREjeMHuDLlmtdnunNxuIVo2SkVCir+j0RyVX/M
 DYLgDAHww3n9z70tbq466VWkBPIVGCMhK+FGx8MfhiEBU9WEbLjFPgNtruQac7W4
 H0ncRaq33YzE0XB6rSNXGqFRZcmgcu5MhyjlXY0V7iyZJUiP7XPWZL0Oj9dh/qRa
 WzKiISQhUKpSQuddWBkeXHQ2hpidzoxFHYU6x5T5fvEiwFh+6mY2YvQkzlkNqfQh
 hbR8bA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47x8x7s7db-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 17:09:39 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-23536f7c2d7so38765515ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 10:09:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752858578; x=1753463378;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MvWIjxTgsWqTg+EpU1jF6w7w0dCuZOGk2IF4h2JIZKw=;
 b=NUvgXUzH29XOKIhJ9wJErR4zKmG2r0Yrf23L7/F70981kH265wwgZ9cfDY1sJLWob1
 OVWXxvMOS1ZO93ZFvrumqxiOiflSzLSVSSXTuex96i94pdjWySRVfmuzdOfczV3c8pEX
 gf25y0HWVPGFwA+mxxiJ1PpYfV2oODex3ipW3t52ZzXDUbto6CNA6nWQ+Gp60ybutH2F
 VL3X7k/rAFGsCOCVxEruy+GF1p7JyOQU9JwQCgV+P0p5CBCxpGIzRvwSufmHsJCFkS7J
 MPkfGKOZMKoEbtPxluMD8FBtqIFrt5KxIJu5sfGX5SddAvQWoq/gbRf2fpUDbbOR4ILF
 0pDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBvUdxBYMTUVeVcE/6qROdlbTe+jjQUI4x5F9scThHmEC9aWP23uAlq3ojD3W/C7x/6JKZAw8IBb4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwckpuuwdMKj+/VTC3KJ1sOfv2Mj8J19byN22ozStn+Jkf7tgQO
 rh54OKqtkhtNOB4afqMs2vlqSrIRcOXiEYLR6wbJqousA5d8t2L6NGaxrH9rTRbaH5i2W+KR3xE
 00ab+HEMp4Bb0GVu+mTrZXAyiTwYUdE+KfGfLsdK1wn/Z/QfrcoIu0IKgMqV+I0+H+8OTZoQ=
X-Gm-Gg: ASbGncsZDAd0+t1r57JNJ2n/mQ3lztUGFCxSdhqgdDO1DFhEKe/eCZz5D2dBrnrSjV/
 5Qfs2ws6v1NSqAIeaEt8K1sZfHF72D1FcVmq3D5qJQFQE4/tNjRv+a1KfyhXkUIxzV5ZAkQJP9m
 MMRPQa3jrX0md0m8kLxV5X/Ps3sDQDHzB63ulyFmC7xlN30eSAZ6uGsoXoJcjy15Ky/E5h5R82E
 rylUJdSzRy7BZrGaWh6Y3cWn2Hi6iFx4U+Jl6aXHi+T/fQwosMn/nRqJvMZZEpvzkDfrLucBuos
 iLpWubBPhZXgvt0lOEVZ0JFVOmRB0AjxV5YSBJnC3xgUB7uxyc808ZasRiQXiMb88+CQQC0Wnrj
 Mvp26OTNYyVvUOQ==
X-Received: by 2002:a17:902:c40a:b0:235:1706:1fe7 with SMTP id
 d9443c01a7336-23e25693727mr159582715ad.4.1752858577943; 
 Fri, 18 Jul 2025 10:09:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETvEp5rZykda6Fkwq9ZXpRv9woHFJ3xh4GKGF4HzLDjXZN+/v8QGQrNtiX8DgvikLdgkWCIA==
X-Received: by 2002:a17:902:c40a:b0:235:1706:1fe7 with SMTP id
 d9443c01a7336-23e25693727mr159582215ad.4.1752858577500; 
 Fri, 18 Jul 2025 10:09:37 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b60ec88sm16079385ad.65.2025.07.18.10.09.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jul 2025 10:09:37 -0700 (PDT)
Message-ID: <b7653a05-f747-4764-9c33-793346cae223@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 11:09:33 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 01/10] accel/rocket: Add registers header
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Daniel Stone <daniel@fooishbar.org>, Da Xue <da@libre.computer>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Robert Foss <rfoss@kernel.org>
References: <20250713-6-10-rocket-v8-0-64fa3115e910@tomeuvizoso.net>
 <20250713-6-10-rocket-v8-1-64fa3115e910@tomeuvizoso.net>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250713-6-10-rocket-v8-1-64fa3115e910@tomeuvizoso.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDEzNSBTYWx0ZWRfXxJER+oSVUJL/
 xjGxFFrVK1chegK3ylMkUn3H1Kg8sRghIdg6tkVNAKW9eHxvMaHw8QIiomcHfWY4JI4NC/Wmmps
 w5ef6Pnr79iR3kNsYzhmydJgRynvRCOBbutU5gAkDs4aho/e090RJgPXfA5FZP1GAhaD3CI/Yun
 qUlaMzfunNIQzJRYnsvmVoXofkN3xG0Ohgvot4drPKJUbRwfrx2pvFPWXjpxs3ORzP4mJUChAT/
 cem9Ms1dzfatnzVipMpZ9fLm3ekgXwmBEIx7cjTFRtIo3iP/mJ7rmeS2VsdgiXbnnezGh5NXDbT
 a2VtoCIJzkjwis/8kOpSzlQG9ghQbgVR38uyZ/iskODE651hq7P9yP5Ea9fKgXNC9Xodgq7gZrR
 WfhGtxlTkUbCySrmlAplQSYF1Ob+8BDXanEXZ0WeAPlMMJ/XFhEkClRQ/q/zdqQgIPoCQc0R
X-Proofpoint-GUID: 8XdYIJ1Tgz6Mb0BDNpoHWw5qnllZhnHP
X-Proofpoint-ORIG-GUID: 8XdYIJ1Tgz6Mb0BDNpoHWw5qnllZhnHP
X-Authority-Analysis: v=2.4 cv=N9YpF39B c=1 sm=1 tr=0 ts=687a7fd3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=DISFzqtZAAAA:8
 a=EUspDBNiAAAA:8 a=4Ppn7do-3_l0xiadvqUA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=aug85vrO5LANNmmtkfAW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_04,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 mlxlogscore=884 bulkscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 suspectscore=0 impostorscore=0
 phishscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180135
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

On 7/13/2025 2:38 AM, Tomeu Vizoso wrote:
> A XML file was generated with the data from the TRM, and then this
> header was generated from it.
> 
> The canonical location for the XML file is the Mesa3D repository.
> 
> v3:
> - Make use of GPL-2.0-only for the copyright notice (Jeff Hugo)
> 
> v8:
> - Remove full MIT license blob, to match other files with the same
>    licensing arrangement in the kernel
> 
> Reviewed-by: Robert Foss <rfoss@kernel.org>
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>

Structure of the file and markings look sane. I'm not familiar with the 
hardware specifics, so the autogenerated content is a bit over my head, 
but I guess for something so large using automated generation should 
minimize errors.

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
