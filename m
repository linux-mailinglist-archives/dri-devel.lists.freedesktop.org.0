Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2056B8FD3C
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 11:45:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0A9010E16A;
	Mon, 22 Sep 2025 09:45:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QSP6ajeF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13D6110E16A
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 09:45:53 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58M9BAg6029098
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 09:45:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=W0EkpJuNJzvM/UpMfzArfzg8
 rpKA+/ukTR6O+NEzO9M=; b=QSP6ajeF1p/OfoerwhXLINeYQgKv7w2MFtTvWBPH
 VGHxDfpuGAJ8mqotT+1GssKRPo0jOBfkPEK3Ra3PqauPm9iiFiAsVNrHgE5DLi5Y
 hqfWGGmq4hauxTgN/tjREy48YBE5hIUNFu93dHFSXGJiW3c6xxPg4dOnqgeok5DR
 YTWacIRA9Wdk/7QklFfSb2/TRsKfiZBj2iRE5lazQlaheV9YHzX6+zPVsakJTRsj
 cBHN+D4yirfglFJjTLzLz1tAr8V0ypuDfKquibikQc0zF3cpmSDM8kbNrhyBrCDR
 9pJEAnL4MkNO78sauWoVTObFvc7TPYCQy1Ak6r7qLdvlmg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3kk03sm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 09:45:52 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b5d58d226cso93521641cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 02:45:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758534351; x=1759139151;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W0EkpJuNJzvM/UpMfzArfzg8rpKA+/ukTR6O+NEzO9M=;
 b=PWfbSe5MTKm+4YcktF4QobG/JV5xC2f1D0OxLdjMg4GgKQoaQxWM7Fv7+t1WIV2m56
 llqcQJzFW2DIkzYCd1GGRIqWRaiL3PnlC241uFLLPOvy4m/SZ4i7KS7yfXG0os5fsM/k
 4i35wWKqoBBUCFI5+/ljYNpSvw3fs501594GwoDE6rIdMchLUnrJLWvPJaOgvyWTXI3O
 /sdViz0nRRFpRQHVdl+AyUT5AS3/7t8K0Jy8Ta/xsp9ugx7syXs33rGr+C/JhWJx08GS
 KbwGDS2uiY6saNMmwogKYrsKZ0unmcxWf/7SlQgpczTZifyWYbcb3ZXbve6n1OafosB5
 D1Hw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAvWvwIiMAK+iyo+zmlXH72qmBu2h9CGxqUT9L0kv5fzL7EkV+0mxeoD2TKCY4j/EvNghjIBQaXPc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzMwQzCrzCn6HO4j3NTkuzkyQDko3mkh8szdLT3nIqnSFtAJmyQ
 GK6uMxGFO+1Ct6ElQwomt8Gtgbx/EkZpVBGw7/8FGAzYe0hk5nmwiX+a8fBARfbzrE2EzvvioSm
 WXgzuQYcmgwoeceyPYUvHNouIcgmRa33pLqswU6XQjM9PdBmKXnvh4JmRjKyMfZGNENmUaIs=
X-Gm-Gg: ASbGncuxpi6+pKNIuOm1QTpT52Np8tgFKD4SwOyqWrisS+kEp4uT+e6r/OuKSpeV3ng
 N0cJ5mwP3z1AgrPlj1ULVs2j5IMG/AuFGPS1ncitYRWFbY8PY/m5ZgnxGMlQPqY6SjrcBhQD/Kj
 d300JAqgHT5u/VZZxw5dubQg5v8Z+ihk7G+SJVNp6ZPAItl+/75qhEISsz1al/Cm7XlHAPkQZo/
 dSgck+hhfkkaWVrFBsdNtUArq+dow+Lc861hw1jvZqVAMA5jC64hx/cO+XcQvbXuXlD/MnjkZwn
 MOoBdepikg0IItiJr7SqKl/Y4YqKUy4uoe7pM/spW/hjNGcDt+OU7wR1KRiZhJUPem+ADTQ8Dj6
 E0OE089EzEKuVgDaGn+jh4KOkzxW8g2b3gVLAquYIM7yvIoaQf9Ul
X-Received: by 2002:a05:622a:228f:b0:4b5:f5ef:5fe8 with SMTP id
 d75a77b69052e-4c07104b016mr131682591cf.32.1758534351203; 
 Mon, 22 Sep 2025 02:45:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVWjR+4vgOsePjn/CB9WZu/Pei26UIPflbd0gu92L/o+rhj5rmsKA6/RW+80WDu80POfqZfA==
X-Received: by 2002:a05:622a:228f:b0:4b5:f5ef:5fe8 with SMTP id
 d75a77b69052e-4c07104b016mr131682201cf.32.1758534350531; 
 Mon, 22 Sep 2025 02:45:50 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-578a5f44771sm3214997e87.20.2025.09.22.02.45.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 02:45:49 -0700 (PDT)
Date: Mon, 22 Sep 2025 12:45:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v5 12/14] phy: qcom: qmp-usbc: Add QCS615 USB/DP PHY
 config and DP mode support
Message-ID: <2ewxoe76rrii4w3n5b6wl32vmatcp2boj75o65cuq5nx4f2a55@7cn6m7oxzu6c>
References: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
 <20250919-add-displayport-support-for-qcs615-platform-v5-12-eae6681f4002@oss.qualcomm.com>
 <bfpgktxgo2hb6dpzy3i7jdr6w4de5boorx4n6qeapct2vre4sn@4z2mnppridn5>
 <14cdf3a4-714c-4136-8c1d-99392e7911f5@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <14cdf3a4-714c-4136-8c1d-99392e7911f5@oss.qualcomm.com>
X-Proofpoint-GUID: wcG9-mN3GUkLsuyrp-FXe6kiU59mHy27
X-Proofpoint-ORIG-GUID: wcG9-mN3GUkLsuyrp-FXe6kiU59mHy27
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA4OSBTYWx0ZWRfXxsbNQJea3W/2
 GPmCX+dEdEiyOU+8jsPZPwpVizdMLfZsPB742iLQM8Vz5z2pzvaL3tfvuRPPxMYl++sI9XTlM4g
 LsO9NSc0rn8hV91tj33W4kXp5/meqT/MjcMnXSNCZNhCFxhqMFnmxAugMbHGugCXI266Xj53giM
 3+9GO3aX5DhWYr1T46BMlCyvuk38BdqEa3RJ3ejyAGX1zN/XTTl/s/BuhcQtdWHofTNyx2RFRyA
 y4+gfUIawE09/sXev849QZkovdOAIa6zhE01/wFsRqKhe5hCbSGpGnUpvBfdi/6/ehdMZF7Eccv
 o8+wsyBcdsnbeRLqeecdjSs/ztGgG/+C3uz7cW8L/pu8HV7w2Mx5qu4X2CJaViM02MLrsIfHs8s
 9P4vfbRr
X-Authority-Analysis: v=2.4 cv=BabY0qt2 c=1 sm=1 tr=0 ts=68d11ad0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=DpVyi1o0YMp1h5EDp2YA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220089
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

On Mon, Sep 22, 2025 at 02:58:17PM +0800, Xiangxu Yin wrote:
> 
> On 9/20/2025 2:41 AM, Dmitry Baryshkov wrote:
> > On Fri, Sep 19, 2025 at 10:24:29PM +0800, Xiangxu Yin wrote:
> >> Add QCS615-specific configuration for USB/DP PHY, including DP init
> >> routines, voltage swing tables, and platform data. Add compatible
> >> "qcs615-qmp-usb3-dp-phy".
> >>
> >> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> >> ---
> >>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 395 +++++++++++++++++++++++++++++++
> >>  1 file changed, 395 insertions(+)
> >>
> >> +
> >> +	writel(0x3f, qmp->dp_tx + QSERDES_V2_TX_TRANSCEIVER_BIAS_EN);
> >> +	writel(0x10, qmp->dp_tx + QSERDES_V2_TX_HIGHZ_DRVR_EN);
> >> +	writel(0x0a, qmp->dp_tx + QSERDES_V2_TX_TX_POL_INV);
> >> +	writel(0x3f, qmp->dp_tx2 + QSERDES_V2_TX_TRANSCEIVER_BIAS_EN);
> >> +	writel(0x10, qmp->dp_tx2 + QSERDES_V2_TX_HIGHZ_DRVR_EN);
> >> +	writel(0x0a, qmp->dp_tx2 + QSERDES_V2_TX_TX_POL_INV);
> > Are you sure that these don't need to be adjusted based on
> > qmp->orientation or selected lanes count?
> >
> > In fact... I don't see orientation handling for DP at all. Don't we need
> > it?
> 
> 
> Thanks for the review.
> 
> I agree with your reasoning and compared talos 14nm HPG with hana/kona
> 7nm PHY HPG; the 7nm COMBO PHY series has orientation/lane-count dependent
> configs, but the 14nm PHY series does not. On QCS615 (talos), the TX_*
> registers you pointed to are programmed with constant values regardless
> of orientation or lane count. This has been confirmed from both the HPG
> and the downstream reference driver.

Thanks for the confirmation.

> 
> For orientation, from reference the only difference is DP_PHY_MODE, which
> is set by qmp_usbc_configure_dp_mode(). The DP PHY does have an
> SW_PORTSELECT-related register, but due to talos lane mapping from the
> DP controller to the PHY not being the standard <0 1 2 3> sequence, it
> cannot reliably handle orientation flip. Also, QCS615 is a fixed-
> orientation platform (not DP-over-TypeC), so there is no validated hardware
> path for orientation flip on this platform.

Wait... I thought that the the non-standard lane order is handled by the
DP driver, then we should be able to handle the orientation inside PHY
driver as usual.

Anyway, please add a FIXME comment into the source file and a note to
the commit message that SW_PORTSELECT should be handled, but it's not a
part of this patch for the stated reasons.

> 
> 
> >
> >> +
> >> +	writel(0x18, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
> >> +	writel(0x19, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
> >> +
> >> +	if (readl_poll_timeout(qmp->dp_dp_phy + QSERDES_V2_DP_PHY_STATUS,
> >> +			       status,
> >> +			       ((status & BIT(1)) > 0),
> >> +			       500,
> >> +			       10000)){
> >> +		dev_err(qmp->dev, "PHY_READY not ready\n");
> >> +		return -ETIMEDOUT;
> >> +	}
> >> +
> >> +	return 0;
> >> +}
> >> +

-- 
With best wishes
Dmitry
