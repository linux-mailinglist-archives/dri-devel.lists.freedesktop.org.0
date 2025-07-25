Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3E9B127A3
	for <lists+dri-devel@lfdr.de>; Sat, 26 Jul 2025 01:46:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E29010E134;
	Fri, 25 Jul 2025 23:46:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hu5O37cK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25E0710E134
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 23:46:51 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56PJGYPn018082
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 23:46:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=qXBSNgzMClCengYCrY3ivBRG
 Uf8cHDHLLWL7h/aBi7U=; b=Hu5O37cKi+LOw4ou7TZht2o5Iti4N/xAEKBfdnri
 rPJ0pSuvxhfWnZzJhgd8+BsqVUCmPp5FIo4HkakQ7uvvVy8QgTc3NC2eDCGbfTkT
 OL2YhsX6sVT7pnuMTNIHT/qzvk5+vZCvWWeCiINhxYPOXHbFcplIT7T+wO9hRQG5
 GfCHWtfw6H/EMYm7ZDrOiWaLut5DhotLT/hiHUO0h153pKmRzvP/Otr/h6uIWNdS
 PPhUVTR4m9tlJPXCkv8+9x6fyyaL6ut1w7yKuN2byo/itXCPNxVK1fRfi+jkcPUC
 1pc/lZRdOcyfLERglKA3u2n5TpXCOAIw7VpHy9uVC2vnPA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483w2s3q87-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 23:46:50 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6fb3466271fso44079886d6.0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 16:46:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753487209; x=1754092009;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qXBSNgzMClCengYCrY3ivBRGUf8cHDHLLWL7h/aBi7U=;
 b=FCNnNhE+Q+MGYIC67Mnn2cljRCa9zb4CoGlOmMhx97kM6yrqZF7rH85zc9aZDsj8KH
 EDkZwGfpG9GSbspvodZNEzE+jXtW5p9jOulf1YvdBgpLy16fnoes0GLPnCv9eRq2IJcW
 pWANShzN53a1Z+R4ODRU29k6W1bjNy6bABp/mr9JPW91CR9Av3/Oq6bvc5ViQNW+IKgm
 As4hAa2qtqKs8kkL797+P6zBEcfZZ72gZFOLlREsATWkz6X5DKS1FgBI9jg67fBcEhpA
 8x9u10QN6QCl7cBzllDYiNrhlADp4BXts6OVZkvb94GRJ5Trs1DnXSMQpbTaKWBF38uV
 t4Kw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHTE1taUNa4QFKQL9YjOzMq8MMogZTsCa4yUu/DWf2miBLGJsuqJfFVM3Jb+Lp6FlWV4hmrifRwEg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yznl+TrMVcU+WfC7Sr8yY96V/c+NTUEfEDDY5oBL42epV+Nyeq0
 WS5bwh+vAmh4+Msds8WpWIVlF8WBRy5bk04FeV70PKn10FgeM1SEqs0ie/NZCJb0kEB4evfkMb9
 JrKfHWhXS8X81aJBmF8L/ERQQkoZcU+Dn7vMnUDdFgZ1k6RVCz5cnNwXpwsqatQ8zFuNtgQo=
X-Gm-Gg: ASbGncvi9VlexG+LqLczpPfWNVO0js4hQ9Y3I7Pr69CyiEYTU8WMBv58zp9HVCdVC+M
 BGg9mAY27+3oK0Ts+8dxfGrPFhgBZ1GlXFs3DHt4OC6n1ZlKFXsYqecx+8CAGSQfJJyeTBkr2xV
 qj0Moz4yJoxmvsQDWxJfUISbww1f13BgaHUZecfjzBs68zkHXNxvjlHisqZ7ToS+eMDZvQ3t+kl
 BGKbrXknM1U9Pb6fmpVFnorUsOy+j11eN4UujfQKgrQbi/R+8AcbcW294p+aQufE+fODgqkVy9K
 cwzxfjVR2OIzwj8WT7fX+cDCHzkv1oSi0euk9piylsmjwPxNUd0ADwcAh+mk0677U0cGsD/Clnw
 6NP2cz/xXyAs+39woTHeGNhLmw7z0YjtMofOiJbFE+rZSC3Pzpw1d
X-Received: by 2002:ad4:5963:0:b0:702:d60b:c048 with SMTP id
 6a1803df08f44-7071ff0f2cbmr58647276d6.19.1753487209130; 
 Fri, 25 Jul 2025 16:46:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFy1NIdFUiy+LkfIlb0Nij2OXe6qkzDF3xYJLssxlfhKaFVl8cSqppGR61z2kIummysPqIbXA==
X-Received: by 2002:ad4:5963:0:b0:702:d60b:c048 with SMTP id
 6a1803df08f44-7071ff0f2cbmr58646876d6.19.1753487208652; 
 Fri, 25 Jul 2025 16:46:48 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-331f40b5323sm2034501fa.37.2025.07.25.16.46.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jul 2025 16:46:46 -0700 (PDT)
Date: Sat, 26 Jul 2025 02:46:43 +0300
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
Subject: Re: [PATCH v5 10/10] arm64: dts: rockchip: Enable DP2HDMI for ROCK 5
 ITX
Message-ID: <vncck2eqkvfr7tbnuffopc5pysdct3az744lnc4xesyublfwyr@jz3hyvz3kg7g>
References: <20250716100440.816351-1-andyshrk@163.com>
 <20250716100440.816351-11-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716100440.816351-11-andyshrk@163.com>
X-Proofpoint-ORIG-GUID: GE66VCKBKYXi5URuSyoqYamreHCMIUX_
X-Authority-Analysis: v=2.4 cv=IZyHWXqa c=1 sm=1 tr=0 ts=6884176a cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8 a=mMkY4CccI6nGLkDSWykA:9
 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-GUID: GE66VCKBKYXi5URuSyoqYamreHCMIUX_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDIwNCBTYWx0ZWRfX9zeNVGrOm3/b
 pzMDJfkAsQ7/CufSEnX4kEmIQzRAnf5rTVaOuLzU8JOF7UWlD3cfpVCSHfzxqW6bdCbzWuzJ3Py
 bvj+dRaNgKer6/s7KCYWWTLlTXGAVHVxOlFcuVSjcnKhQ/HbVyNFY4i3ITlYymnoLC7Juw4w+fX
 aqG9GExfjGedVupVBbbCw94pi0ps0csbQBIywoWwiJD8oSNOGobqPFg0ITxb9+Es0CbgWNCJ8up
 qDzzRERo8JfbVRopzZ+jS1n0U7F/j/wV6voAmmDOh0WEPFJ9FH1BfZ0hB2MMgd4DxozRzv+On60
 UhHbaQaxlG4eB77yPvyw6528s8AixpHN43/a79eszHvJMIweEJIcuU0O8HLkuvwtDy1nmRQ8ZiT
 hCiZwvgMPfe/Tiai8W68Zpu6m6+vwXS+uMk2tpdvigNSKio+U4PFX0ippx6Qf8rRMXpyQS2B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_06,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 mlxlogscore=772 mlxscore=0 adultscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
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

On Wed, Jul 16, 2025 at 06:04:37PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> The HDMI0(Port next to Headphone Jack) is drived by DP1 on rk3588
> via RA620(a dp2hdmi converter).
> 
> Add related dt nodes to enable it.
> 
> Note: ROCKCHIP_VOP2_EP_DP1 is defined as 11 in dt-binding header,
> but it will trigger a dtc warning like "graph node unit address
> error, expected "b"" if we use it directly after endpoint, so we
> use "b" instead here.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> 
> ---
> 
> (no changes since v3)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
