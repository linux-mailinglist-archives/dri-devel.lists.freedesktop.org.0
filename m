Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1965AF82A0
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 23:27:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0467810E8F6;
	Thu,  3 Jul 2025 21:27:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BGrvMhL0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F32B010E8F6
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jul 2025 21:27:48 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563KCbMN029535
 for <dri-devel@lists.freedesktop.org>; Thu, 3 Jul 2025 21:27:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=B8EhHwVKYpVrPJqxIdjJWt6i
 mKVtstqw6FBfSw5Dfcs=; b=BGrvMhL0TDNFCs2LhwEFqzu7QOyx7f+cCW2mp+kZ
 0wLWqk+5N17jvzzu1Ejzhf6b5Rn5C4e8oNlufBfaxIEAiv6ngFCB8Uoui1q2PqP7
 larACg6xkL6YsWwjNraGORUubtDCBCWV/64XJ5Yg8dVetIFaNAO10I/WdIYmNkoY
 ZhvNxY5PnPdLW3+AYQrEYb8Ftu6+WtnUYzQ9zMhK3jSzheM04/qjbaVX2g97YAin
 KLdDNnC+7V7hW4zi1gbXwYC2uza1NUhPNB0YI0EWgdJczDQ/35bUTDtLe+y4gaVW
 7Ul3qtUlNrw3LTZ0km0RYzuTt3fjoGcN8jZ606Mm+xYJpw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47nh9s3259-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jul 2025 21:27:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c7c30d8986so72507785a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jul 2025 14:27:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751578067; x=1752182867;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B8EhHwVKYpVrPJqxIdjJWt6imKVtstqw6FBfSw5Dfcs=;
 b=Qx5BFPhVLBYl52AIvnE/BikYP9B0aFDnIiP96R8WUCaEE60gMD7ifYZ0cJczYalYXE
 HTVGOvrfM69MSZy/MEXZ6iM2cTE90dYkDsMO6Jm3TlypmXxKb233HdeVS5q5ft5iOxJy
 POHh9GzQ312TpQhc/t30T1VyZZ2i14EvH/0LQskn5tMW0hGW2rkJHOzRAJfioU52lciu
 skEO6UZV+T2IbFBD6OsLRA6IUozbJbC4IBE9ahoQZ4zkUXY6Iv+L6RWELWY9Y1frwiel
 pfHD9egtiY7oO1p2nqIyW3PWhrh0pEre++fkGKv4NJyYVK0HdFt91JdBdEAWvuXRQXhF
 W/mw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMTbGjAsUSmd9u1LroGg4IgB2qgPzzRw0fbzsHBnZqeXRlt4QJp08pGTL8m6mL2jRsHvLj7h9xAio=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzzyLTL+ED93pvzQZ3ClLv4AOEgvmr64JLG8x9mijBCThQYHq2D
 u4ysQGwT72JiFcM5vHmRJg7nRO87vxPfZHVweXxugmPMgwzeJR1dv+VzPvbENdMlATcmO6wj4qT
 YPWH+/YWXlasknczdC+oRzl2yQDnEf3Y9A/xv+WZq5AuxZqwcDZiLOStTEZcmOVzCWolQPzs=
X-Gm-Gg: ASbGnctsUw2oBgkESbf6rQmEWQlAQerzdvz5rWgJR9GVouQharRUDwyiIA3cfsT68G0
 7uC/R16nf3wfFqssHRv9vukJd8Ilj6E2scT3xMgw19MqY9o+T1p+EzWAcBWJ2nWuPF/W4Os6J7O
 I1YOLNwMQaiRRpSzHJo5iHS/vFi1br7q+j3zH52hxKLBA+T4ddAi9bKpTtxFsAX+zBmylE9gQk9
 soeo1IMyMcW61mJ/t/7zq9vfzpuUPzgSec+v/exHl4h+POH39OSqFRfdDOcPJFf/gITp3DE/bSc
 ANZwzycVHdoIEQgYkCdmHqQnkfRtljoBqctV0Q0GSnMqTiAw5191lUY2lhut2nP4KP1mX2iBPkD
 WjJr+J4wU9z3lRk++Z5g0zc/i0UJ3Sh6kzcY=
X-Received: by 2002:a05:620a:3d86:b0:7d5:ca37:79a0 with SMTP id
 af79cd13be357-7d5ddae521cmr2892085a.18.1751578066816; 
 Thu, 03 Jul 2025 14:27:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMJrZqqPZZas9zZzBzoVxAUKC2qdaPz2216jh1dVtgBGxiblPPM6KkbjiAzq0lqA6zcxM0YQ==
X-Received: by 2002:a05:620a:3d86:b0:7d5:ca37:79a0 with SMTP id
 af79cd13be357-7d5ddae521cmr2888085a.18.1751578066366; 
 Thu, 03 Jul 2025 14:27:46 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55638494f6dsm72675e87.123.2025.07.03.14.27.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jul 2025 14:27:44 -0700 (PDT)
Date: Fri, 4 Jul 2025 00:27:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andy Yan <andyshrk@163.com>
Cc: mripard@kernel.org, neil.armstrong@linaro.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org,
 jani.nikula@intel.com, lyude@redhat.com, jonathanh@nvidia.com,
 p.zabel@pengutronix.de, simona@ffwll.ch, victor.liu@nxp.com,
 rfoss@kernel.org, chunkuang.hu@kernel.org,
 cristian.ciocaltea@collabora.com, Laurent.pinchart@ideasonboard.com,
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org,
 Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v3 2/2] drm/bridge: Pass down connector to drm bridge
 detect hook
Message-ID: <chznjpcx6p2vn3i5jt52peikhipzjiwzlr74gx6mzp3wjstr6p@6zhhknnl3zek>
References: <20250703125027.311109-1-andyshrk@163.com>
 <20250703125027.311109-3-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703125027.311109-3-andyshrk@163.com>
X-Authority-Analysis: v=2.4 cv=frrcZE4f c=1 sm=1 tr=0 ts=6866f5d4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8 a=nJWoAq30JnpefaDr-ZMA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDE3NyBTYWx0ZWRfX2A/LU3gLxqcD
 cwPEOtXKxH+jEDhRqxdaMw7x6BIsuAINiBMs0UDPWSmBMsls/oMr3exKMtSUdpAnEcg09J3ZzIa
 nrHpA9vK+QZF+r9/5BJmpHSflbdRLfPrvcW2OfSTLaq0iLnefdMPClosBPuw9jG7hcsUU5yJorH
 iRPoIr7vF+QnzBTHP/gpV44UgB23umNpPFRxNHn4pUv1QwyVCCTZF4cHc/W9mQXubJKydO7iBUb
 V1+RIvbFSTsLua9bfNZBqkQuxwFVG8MddEvsbPtYdRaVAgAMCOiV0uGILPswH9Rqgdg9SoHKSv3
 IMSUmXFDP8Lh5y9n5KX3LTDoDD28E7IVEgnFYUG0ssF8H+Gwa9fLZcfTuR5ZS6FBV0Kb8QL4CKD
 iHq8jjm2sj06+pdBIHaviDePYtIyLeceTpd3YMDJTkD4Vst/cvMKDMZ9Nmv9Qr89Wnlrb6Bt
X-Proofpoint-GUID: QBaxri71Uky0fjziaP46luDC8mRmEsgA
X-Proofpoint-ORIG-GUID: QBaxri71Uky0fjziaP46luDC8mRmEsgA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_05,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=837 bulkscore=0 spamscore=0 adultscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507030177
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

On Thu, Jul 03, 2025 at 08:49:53PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> In some application scenarios, we hope to get the corresponding
> connector when the bridge's detect hook is invoked.
> 
> In most cases, we can get the connector by drm_atomic_get_connector_for_encoder
> if the encoder attached to the bridge is enabled, however there will
> still be some scenarios where the detect hook of the bridge is called
> but the corresponding encoder has not been enabled yet. For instance,
> this occurs when the device is hot plug in for the first time.
> 
> Since the call to bridge's detect is initiated by the connector, passing
> down the corresponding connector directly will make things simpler.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> ---
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
