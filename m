Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 971F6B1218C
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 18:14:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 018DF10E367;
	Fri, 25 Jul 2025 16:14:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VFdm9juM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBFF410E367
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 16:14:26 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56P98npS017942
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 16:14:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 pTRAzXltnnQkXzy/4MfHD1BpN0UeO0JYTlGtIooVxhY=; b=VFdm9juMycnYZSHZ
 zUXA92nIOBcEnWTYEaYZVS7emlqydaCowoY21CWFScsHSDVVExvYnMTn3+dlby5s
 4hFLISQiz6TZG5bi9tOohYCb2gCWD9ar+XlLTzhbijgIX5E+1GuC37zcPa/MIpya
 Oo+QWB/wZTSCWzJFBHyT5vIqi3kLN//g/8yaVMd6jODWQHGtad5rkobIVYMVlpGi
 QLhQbu1VTEgSBYOY3iL0IqqWARLFc6G4r96pz9jb5jkIpBrByhITf5ekJy3yUGmo
 cGXUD/bTv2Rbch1TAYQSSp7JiozaHKVfDPiHii4f0OPK+8rFfOAqjLYfe6b2gPOs
 XMi8ug==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483w2wjpr0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 16:14:26 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b115fb801bcso2854488a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 09:14:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753460065; x=1754064865;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pTRAzXltnnQkXzy/4MfHD1BpN0UeO0JYTlGtIooVxhY=;
 b=e3YfNI6V/JowV76hnlmLXZyUxiyETU3ecUOQx+mFRobgGdAh4tPTwrT+2COOwYFm8A
 gJBvfB3IA3aQXfBzb4Z/ZfSyI/Xm05pNhJ4VnGaB2XkVKhczjuusTSg0NT5PPbR6Xm1O
 DINvgjZHISkRVqrw1dW7s8ZpvyoW/CYuL7mp79xQQiQooxa3RGjmZ3YVcOXF/MXU70S3
 +jpmjzKyXLZlPYP+O/SGiopFFfcwwCyGWC462gZfU7bxuvbQEbXkcVMDbTb3PVipikFm
 iwD2M2zu42JTnZhBEDDvPBLQpatNtvvO2roIWpyDj5wqwpZokMNUM+9SvCUPatWgUXan
 Z56w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkd5H23bgC+H85CUeCMfKz8d+vLf1NDsVucrDygMLtR23+pYHAdJSmVh4nEr2DehtFE86UD8jxVOc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxgtwam7zl+TkMHW3wWmX2qTOxVPC0GerYty7hbeBQW0Q81JqIi
 YsMZOvVRXhtQ0PBJUWpAolK6pv8l0VjsprTfLZZJTanA9T0EFWDxqChsMQV5hI8B3ZZwn3jg3Jf
 hVpbMIzIfCP2gK2513B/hnXDHe+3wiGguWtaCB6doL3L2UV5+EELLZkhv4EsK5mKE9l2tfG4=
X-Gm-Gg: ASbGncuEhCv9MWUns3x3JzRS/XibQLxqGjtCluQc0QIgT/GlsxXcZc0cr9YJ8m5tuKO
 RsmEIHrwBT1XO9DC2LT6UBMNFuYaBfm7EyjxdPoAPvILfuhGslo3FNr8ItAw/MN7Ag5nHM7bMqU
 BfKgOxnrSv0achXhjjK43y93WIDDb8wQwmvDOZnGcLzwSo2SL+q9FFpNApndHpDz/CzeG2O/eIe
 CkypL7fBQgXvnm4Y+ycKWfp8jrSb5j1/Mm0A/yAWhFzjeGFVRSe353cRsbU7tywG41vztbwk9v4
 vhY4BcFP68g9y8og2ebsZD/ZwxnvzUH1gWgnhzOiDT9aE6JVaeHk1WDr0I8zxCMyARtp3taZUaX
 SdFwAV3zMfQGVLQ==
X-Received: by 2002:a05:6a20:7288:b0:239:1c1e:3edf with SMTP id
 adf61e73a8af0-23d701eaf4cmr4483523637.40.1753460065415; 
 Fri, 25 Jul 2025 09:14:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEH45mowQM24zNVVrDWA1OAKen9/Rncat1udl96ywd3HTaGlMrzSKhS42XbAwTPbo2lmkT86g==
X-Received: by 2002:a05:6a20:7288:b0:239:1c1e:3edf with SMTP id
 adf61e73a8af0-23d701eaf4cmr4483464637.40.1753460064981; 
 Fri, 25 Jul 2025 09:14:24 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7640b8b0c60sm71215b3a.126.2025.07.25.09.14.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jul 2025 09:14:24 -0700 (PDT)
Message-ID: <12223a91-82f0-4889-8f07-bfa5833c8ffb@oss.qualcomm.com>
Date: Fri, 25 Jul 2025 10:14:21 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 00/10] New DRM accel driver for Rockchip's RKNN NPU
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
 Robert Foss <rfoss@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250721-6-10-rocket-v9-0-77ebd484941e@tomeuvizoso.net>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250721-6-10-rocket-v9-0-77ebd484941e@tomeuvizoso.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YUiUPrTY7Mv3Z4l8OEr1ZL_30Lg-w4Yl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDEzOSBTYWx0ZWRfXwYOwRQMLMgRI
 BzB8zqCNUJFz7nuZ6hVUYpDZ7+qmI+KCt+C2HDBQrLW+HjhH6y3xjicxD1KKy+2CfzlibqDqn28
 dWQ6SgnV2FrXWeAqxQqVRYs5Oc4QOsmSZFmC6dTQfCzgpFYrwwkgovAMWxhHKvYxDlkOoS3kkSF
 2BPne4wg4Clwtr5jACBMSGuSwT3cOScMyELBCo1Ox3OQ3y4oRIvgNH1mfRysOcJi2nd0wt2ofzM
 uV1K4BibCRahWBAFPE3kcbGFSgHrzaYODQ4XA88Gt9mrnNzMQpD/ZbOySGpWR0OBjbg2LhHuriJ
 Cl1ejenO17NS8F7H/xfypdA4xKAn4/Wi+i7gJK0YsbAIY2zE0f8UaLHT4CzD2YRtbJ8vHakNa4l
 kxinmH0Rjqj9qJe6jjA8rQ0+6WsaB3l9y0ADm3amgdfGLp/Ue2jWl86dCqkDeWBEzCWu1A0Q
X-Authority-Analysis: v=2.4 cv=d8b1yQjE c=1 sm=1 tr=0 ts=6883ad62 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=e5mUnYsNAAAA:8 a=DISFzqtZAAAA:8
 a=XWXL-kdBtCKZFopiRrIA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=aug85vrO5LANNmmtkfAW:22
X-Proofpoint-ORIG-GUID: YUiUPrTY7Mv3Z4l8OEr1ZL_30Lg-w4Yl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_04,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 mlxlogscore=826 impostorscore=0
 mlxscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507250139
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

On 7/21/2025 3:17 AM, Tomeu Vizoso wrote:
> This series adds a new driver for the NPU that Rockchip includes in its
> newer SoCs, developed by them on the NVDLA base.
> 
> In its current form, it supports the specific NPU in the RK3588 SoC.
> 
> The userspace driver is part of Mesa and an initial draft can be found at:
> 
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/29698
> 
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>

Patches 1-6 pushed to drm-misc-next.

-Jeff
