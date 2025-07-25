Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1475EB1279E
	for <lists+dri-devel@lfdr.de>; Sat, 26 Jul 2025 01:46:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 077A110E054;
	Fri, 25 Jul 2025 23:46:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XESajguf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA95C10E054
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 23:46:15 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56PISD3v026758
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 23:46:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=SS3LsZZUDvLKSs9n5Nw1CMWX
 GcUNaHHXYFnDw2nJXgU=; b=XESajgufqWZpi46/y4tVeJ3PW+PDX5TOLNJDgvIl
 VEwkVpva2gu2Osh/Pi8o9xX/9JEXPc/5s8IwR9ZdLUtTAejkC/GoteVaZrm/2LBR
 l7ho4qz6drtYCf8i1nazKxjZmQaRPG7NpZMB4N5pf0ZP/cYA+Q/+03XlMnKgdgka
 lldkmaeb/8ArWEx+IFAiFWYljr7c0M9S1Djhqxy28Wtvh5ktSW08q7Q7PUW3pgNN
 mUvO+wi/hnhofRR8hTjdFCQQXxxgQnZGj27YWq4v6yTHug4maU2NpPWxIsVJZwCm
 MChIqBdFjPx+OOVGxDFiXlmqSFVmhmXNMwxQGxKaBBXHeQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483w2u3t8d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 23:46:15 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-706ff7f3e4fso51128956d6.3
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 16:46:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753487173; x=1754091973;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SS3LsZZUDvLKSs9n5Nw1CMWXGcUNaHHXYFnDw2nJXgU=;
 b=TXzPnS/Zt2g96sQRenFzGOAX0ozUZaKym0isFOe661Y+0rVzLzyk8sHAPkzCfPRqJO
 CgMcInapAG7UYBS0WI6vayFyT1knEw0fhSGcvFdrLoxfDAlbvzQZO/bwN1vU9EkqXeTR
 FEC1HWOOTLWbA5py0uHxNL3CDXeAh4cwAILk5FDZoKM4gFnYg1CtGSJPaet6BBcQHjWy
 StjTJJPJJ96FQIyyEmHuy1w0sdMZ8FrOLSHuzKz/qvObpCe7+8eQ5WVxAe5KBFhm84lr
 Tal8NFRs3dLWsPzcNhErw3VASKKdEedeNj7Y5Sd7y2daYWlVZAImHyf4nkcrVOmJdAkJ
 D/hQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9AnaliqHH3aSH0q08Hdhr+Kx2VD92QAlS+ri64nINkJhDv2JmFBCFozZHS2Nhl06AF1pgqKJPhg4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHa3CR06QJrslbZIyZIEmBLngUfUwJThxDXYAN7chPHxQPNTAt
 2LlKpecCRXNMu4YRyYnhNqG42VFNZlsKX696ddAbfcLNdDY++soM/kUYr/U0AtnYtnHQ/CEz9vJ
 WkZmbbNF5V6aSvT2/XzQ6p3pQWjr1qMSsvSFtsOzDmvgM1FkK9V06r6Xvz28JYBSfumyDGwQWqY
 1pVic=
X-Gm-Gg: ASbGnctmHV3epV1MroqvRk20CWpJF+ld2irK5o7HfLNKFriXcc5ar3IVrQR1TfXD93b
 Ojh4wm50RuvHrFr4MTZP9IwwgmAQ5lh/q6x6hfIfVCtjmYLGoTZmSQzPJ2j6Kpux/01wNI6brCs
 4n0qsugoaaqv2l/GCMqW/4nzrARSamdliBzOwdvB468s754LXLHogEucYmg3VbwMUMH4/ONfHy3
 oXql48uPi3RBfu1iqP0fujyriIohLks4cUZg+PJlDnZegShPPO5s03XlgsPMCxohK9rRaK2FE0i
 3exahRp8Xfu5lXkUT90L+gDXsQ0i6Ch+eQJQERzuEwH1rgTWh8K0XzTxfmrQTSZHP10D/z/zTu6
 pbnV0rY5hmyGGXdCb++pJOCYaMNLjv2jAqm8rqdTk63Iwri5YHugu
X-Received: by 2002:a05:6214:2aa4:b0:6fb:4e82:6e8 with SMTP id
 6a1803df08f44-707206fc4acmr49971366d6.14.1753487173367; 
 Fri, 25 Jul 2025 16:46:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0Rfyw4lsowFfqFRh0Tw+94/AYPklbtjVdrBLBTfDDOYsM1V7AqVF33x8eAQDradrWbESlSg==
X-Received: by 2002:a05:6214:2aa4:b0:6fb:4e82:6e8 with SMTP id
 6a1803df08f44-707206fc4acmr49971186d6.14.1753487172978; 
 Fri, 25 Jul 2025 16:46:12 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b63363568sm180197e87.94.2025.07.25.16.46.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jul 2025 16:46:12 -0700 (PDT)
Date: Sat, 26 Jul 2025 02:46:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, hjc@rock-chips.com, mripard@kernel.org, naoki@radxa.com, 
 stephen@radxa.com, cristian.ciocaltea@collabora.com,
 neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com,
 yubing.zhang@rock-chips.com, krzk+dt@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, robh@kernel.org,
 sebastian.reichel@collabora.com, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v5 09/10] arm64: dts: rockchip: Enable DisplayPort for
 rk3588s Cool Pi 4B
Message-ID: <gmc6cx62knfffgiburzzjgkxifzjk4c5nh6gwjdtk3uopvq6y3@azpfwhmrsy2x>
References: <20250716100440.816351-1-andyshrk@163.com>
 <20250716100440.816351-10-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716100440.816351-10-andyshrk@163.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDIwNCBTYWx0ZWRfXyfk2vM9WtJj8
 Rb5iE+14PPosRTa4xo3mC89noek1eQsFny8m8yjZirKSnGgWTFpLPoJvI8+opmdGolFZx8BzSVc
 Qs6HIYIjd5TzJrZTshiMa4nlEQpa9e6a8XguG/lJGgYFJNV4tWRBKllUfw7n1NXculRcTM+VC6l
 6HLpmwNEuU8aEvS4XGNGY2gSsoj7lZO9UMlE+/zXO9WVel2COmsyXRrrs5jyafimCXXmre58whN
 c/WZY60ZUxd1M18H0wZmkSfZP6k0fc8rHiumkmNwgy+UYxA3lzP9H02OYoS+UfettmUshW2b/aj
 SFATm61smRDZQo6fZu3gXF+kL+rBly5ofgbTr1P4e7wghuvVTONo43uXLX+e958AQUv1ZsaPktS
 gx0lFp6fngODeo57efJ/dQ8DqGdRf3oNAqrJPtLrTyzQi5zDGE5hfKiJzZ6kGLRqxXGuUnDx
X-Proofpoint-ORIG-GUID: g6PK0jwI8Oq7fQkg9XtzYLYiiMjaEw7A
X-Authority-Analysis: v=2.4 cv=FcA3xI+6 c=1 sm=1 tr=0 ts=68841747 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8 a=tTaqpbVWKKepMg41KaYA:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-GUID: g6PK0jwI8Oq7fQkg9XtzYLYiiMjaEw7A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_06,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=879 clxscore=1015 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507250204
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

On Wed, Jul 16, 2025 at 06:04:36PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> Enable the Mini DisplayPort on this board.
> Note that ROCKCHIP_VOP2_EP_DP0 is defined as 10 in dt-binding header,
> but it will trigger a dtc warning like "graph node unit address error,
> expected "a"" if we use it directly after endpoint, so we use "a"
> instead here.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> 
> ---
> 
> (no changes since v2)
> 
> Changes in v2:
> - Sort in alphabetical order
> 
>  .../boot/dts/rockchip/rk3588s-coolpi-4b.dts   | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
