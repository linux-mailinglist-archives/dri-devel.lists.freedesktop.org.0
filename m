Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED300B34E7A
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 23:55:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EC0210E591;
	Mon, 25 Aug 2025 21:55:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bnEXUW47";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 270CA10E590
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 21:55:44 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PDNrNM018862
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 21:55:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=cUqE7qCCjIfKy84Rr0H8Cz13
 kHS6QOxmkyR9AlwzF6w=; b=bnEXUW47jL0w7zec4aFNHejepHoQkNSHY7DZ9tek
 bzcbuSbguIBNE7yvx29VLJVkjPMI8RM6ndrvUJ5lAoxPtjANKfkoQCICsLcGFJUB
 5VW/vG1q1VKUjxcDaKk6vamrDriNQSXWRFb0Ws7IroTvrnttx4bKg4fUWCbr5ycA
 md3x9uy/CZLIQ/m44pVbLbAATU+vi8VwcaaYe7B3SB87xvnfRAzksN596wEqNWb4
 6y6tgUoXlR/L5KDO4G7xuDKVN0FUBTWdgJhKASYYS/uOuTWAvXVFPOmgOLXe7IJI
 uk9x0c1Zi/xpjBjVHkZNdfGTxFtNlu56KQVc6GU3nHv7Bg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xpppn0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 21:55:43 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b29a0b8a6aso121757001cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:55:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756158942; x=1756763742;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cUqE7qCCjIfKy84Rr0H8Cz13kHS6QOxmkyR9AlwzF6w=;
 b=w8wMxdT5s77/P8w0HPRhR05O4xSevQxvxNfVSpYo5eN3SHantJIZCbHNefIfoVVxbv
 AQAjveciSwhQLiBOvFPhjpU/6XE6aSVHyexG6W19dUxi8mSwMQa+EtLoGo5atQEpU/oT
 81ZAzFjLI8w1SZqaEwZhhb0UwTwEqfWoRa/vO6OoBDKjTj58L8Ckegvyh5UXxZVwYAxs
 MoJImCgYIMJKrS3kkTdXDjTndUZsdPJ2pHIkLZ16fqMJL2PGwS+tRtspJlMd9KWKP/Nx
 CN8KP9FUNogM42l0tn9CtIU/nsn+xfoca/UIGHm4PjQkTh2W6UvRZxbb19JPqaoJYEHn
 apVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9ntnb8Mgu7+cZLRxolkmG3OrPP3KZm859Nnv/4AaP7oX43wd5ds+tHPgzTxI8c3ZgNWMB9JNumaA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyPfI97PRKJQesXlNYs8X83cznrsVwt747UqVtsPoqbNiHocLN1
 dUwVcorh/RXIc2Xpq7uMpkZFaafb1m4NqLYVObq+TKudUMFY963sK6b5HknbjV2bxsd3jfPIIcG
 wVLgjrQucF2Y8W2T1EJ5zF/TqxljnlETztuz0zVUpsYTw+M2wxsqL4V8I5vJUgvg6j3UJ4vk=
X-Gm-Gg: ASbGncvmTuJYHqQe2NgyBqKANevZkPhaY1C/iGXWkGVQF6sUhRbtSfd/IGbAds3r79a
 kTbVgtXWcGCxe/4RQEpIH69Vl37hZbA+b69jyIrH2dxuwc/dfElwLlYpFIuk86TlYyclkplJjok
 BUjS8BknzrBp4nkBNjMTbmf40Tva2hJAlP1bM7c+Bav00OfaOlyTRRR0spMSHNDk6IeAZ+M7/Gk
 CrNk+xBvtmDpGunusIZ3SeKqITIP33jIQOQJpgNThLyhojqGm1LfVhJABrGKdwmkM35AD+V9ayo
 DLtHYeOQle9LZdl22o0mcXf+pGa2JHm3z+w9CYd6th1BgAntIAOGTyZzjlSdAuRTwzaT6/xUHDs
 DppvjC3aZWAOu2v2STADo0GGhAjSW+gyJsW9Ii81LvniP17xtcDOu
X-Received: by 2002:ac8:7e8e:0:b0:4af:1bfb:1658 with SMTP id
 d75a77b69052e-4b2aaa196b0mr152453061cf.12.1756158942059; 
 Mon, 25 Aug 2025 14:55:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFoMD3lKyx/+uaoF6/Udx3va33ITgDznogbeIupv27fT8xR/EpMcyEGrE5fvEV0eWAe2Y/LQ==
X-Received: by 2002:ac8:7e8e:0:b0:4af:1bfb:1658 with SMTP id
 d75a77b69052e-4b2aaa196b0mr152452801cf.12.1756158941479; 
 Mon, 25 Aug 2025 14:55:41 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f35c8bacasm1855198e87.97.2025.08.25.14.55.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 14:55:40 -0700 (PDT)
Date: Tue, 26 Aug 2025 00:55:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v3 22/38] drm/msm/dp: Always program
 MST_FIFO_CONSTANT_FILL for MST use cases
Message-ID: <s5a6fpyqg5nybnnbrv7wwjvrsj44tr4cihcojkcfwmz5dc4r5m@rioxbgxvwayn>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-22-01faacfcdedd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-22-01faacfcdedd@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=KOlaDEFo c=1 sm=1 tr=0 ts=68acdbdf cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=1UWbhTYU8iixJmD3m_gA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: AV99s2Ie88Jvxk_LrC0lw_w8-POVr8P7
X-Proofpoint-ORIG-GUID: AV99s2Ie88Jvxk_LrC0lw_w8-POVr8P7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX8XnfoFjz9Pgw
 YZH4Q6YFub9XATRh6M7BWDE8LaPcbkIjiELZn5olPumLGXy6jDDW3MaCPhfaHHkhgTCDgo4cYXe
 qpQ/njmq7g9aOWFeS2wYT6wDeulqHszIQaxDrZBkn04AwjFA3KW/E9YyPiAlLHB0p7Wh9tfHJh8
 XmfhrR5ohppZ/FDiAMqttVGkkZ8UekjW0+xw/vWa74C1FezJYDM2WHHrlZqq6DwwK1Zldot5UvD
 OZiPJDvfGOOf3d/6g7G0e/Gc2leNnGoC0wV1VUIkBttKfgrJ2EaakP2Nwq4sBydkahyMnpy/TrK
 HmTBDRxcqlLrWPBswaf/5Vx43pFe7UYIZ+59vdKnxHcKEEHv4fPbgOMQ+EDbm7xrZgqWi1yc8cw
 a1x4ZnvV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_10,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033
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

On Mon, Aug 25, 2025 at 10:16:08PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> As per the hardware programming guide, MST_FIFO_CONSTANT_FILL must
> always be programmed when operating in MST mode. This patch ensures
> the register is configured accordingly.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c  |  2 ++
>  drivers/gpu/drm/msm/dp/dp_panel.c | 12 ++++++++++++
>  drivers/gpu/drm/msm/dp/dp_panel.h |  2 ++
>  3 files changed, 16 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
