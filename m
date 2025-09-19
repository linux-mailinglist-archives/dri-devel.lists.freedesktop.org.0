Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D9CB8AA25
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 18:47:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEC8810EA5D;
	Fri, 19 Sep 2025 16:46:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="K+xaXDXh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 181C610E24D
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 16:46:58 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58JERsJN009704
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 16:46:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Um9tx/y2LwR08t9HZZiDTcTu
 T9zUc9djMRm/CbZ+X1A=; b=K+xaXDXh+okpJGZMNks2h/fbPmM1It3/CUsPmBKo
 /ABpAwdjxm57Q5qXX0C6YdG7Shebb22WpRZVdpi7DZr2iYAnHxLRjnrUFDbE16qr
 wFJucqIb3lGuQS4VfzJ7E+RTzCPWZTFYcNissZeif3uisAwVateOyW7AOqkn05WT
 PF3o401V2KKewh7kCA8Naz8NoeD9D1B8QRUkgy7he6fNAbWk4YhNnQCTU8OuRtPG
 wWyx3oX10GhZI0/wHo72nGQ+ykuoj/jni8FT3zttzwWHR7rYkw9HvAuAEwyhh9bu
 GK0aW48pMOde1CF1FYc4POvpMriWTEOgIW2DGaITLgGuDg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 498q9dbk76-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 16:46:57 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b5f6eeb20eso73176491cf.3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 09:46:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758300416; x=1758905216;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Um9tx/y2LwR08t9HZZiDTcTuT9zUc9djMRm/CbZ+X1A=;
 b=k1steD2UMLLL9hCo3xBtgtRbB/OqiONwRyfXObKUV1c7T7xNYfK+R3key4GWk2Vbqm
 QxH3OBIBNmG06bw427oR00Pjqxv9ZLkdFEsDbI8BV9992Di35KHNHpWckaDSVcVrV5k1
 rEePNF7VSGTPtUtsR4/sv9skDqAz3hRssiTrj7TasSgA/rSE3Q1OmG7Oycez7K0E4Dj5
 DGO3MAKJzm7iYQWyDTh2N5QM80JrowCtytfLkLzLGJn4ZAC8WPO5miiK5eLV9aU0dYH1
 kZstg5kXVyF0xcVSXjaYTI/A+gzp9Xw3UDAzFy94J5Knhsg1D7mdSXP+gcQ6B3W1jTmh
 YzmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0thwBTZxjfeZU54FB3M4s0CxDYblVD8uFxwitvkXbhXMkl3CRC+LgB05VDCNl6XHT/3L56gqPlzw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YylGq9vGY4/WRIsMus6FLfW6ssMqyGsLUC7zHf7esDluLV5czdt
 6BIEbBRIYH5XeKzJqWMjMmAZEocONYAyeg2W3r/0muHDp8a0T4s5CRhl9AVU98pNKm7KybbkkdW
 SXomm1CLXy4Ph/QwvgwK3MRgzdoDWISYgPx2h7lKM2ylPaPWF+oohLVYDJmi3GdTLThvGkQc=
X-Gm-Gg: ASbGncs4hU8Ep1YSc6IZLP0cBAGA+Y0tIu98aJld0sB0MLiXsYeoqcOHmPoLt6/CRQ5
 ZEYekHIuhggVQsS6oPNQpFjAMj5yH/+pRwa/s1k5VPnI8NuxMRW1fxCazl81gIh2ZEHMV4WbH4a
 /GZoBxfWFnqtDtt+5xHLsnZ+I8lt4sMNv42/uT4mlPufeSS/2abpCtxgujPXqm8RSFwy0cqE75k
 zEpyLcYPknHetHaqzDgEoKmgb0ZkaJlgcFE5yQNj+BawF+5uIFA71FVq4nWygkNiWXonIe8QjXQ
 +Mso0LJsCrm/vq2sbmub0HTe448PE5jxj5JzI10Gyqny16Y/8zDA+O3Sj+74adqLTkSgV9FKy1L
 9zcefJak3/jwcKTULWzP4scsIek/ibGt5p5eIEpw8w9ii7h22zbzG
X-Received: by 2002:ac8:5f8f:0:b0:4b7:9b61:e6c9 with SMTP id
 d75a77b69052e-4c06e3f84c7mr46464771cf.25.1758300416407; 
 Fri, 19 Sep 2025 09:46:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDuHu+pCXreZlW6yMOlA1oYpTJZZVjarPXitMYqbWZSgljRDCeRfsjix8zFXY3l/JofzsvjQ==
X-Received: by 2002:ac8:5f8f:0:b0:4b7:9b61:e6c9 with SMTP id
 d75a77b69052e-4c06e3f84c7mr46464201cf.25.1758300415762; 
 Fri, 19 Sep 2025 09:46:55 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3624319eb49sm12152421fa.50.2025.09.19.09.46.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Sep 2025 09:46:53 -0700 (PDT)
Date: Fri, 19 Sep 2025 19:46:52 +0300
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
Subject: Re: [PATCH v5 06/14] phy: qcom: qmp-usbc: Add USB/DP switchable PHY
 clk register
Message-ID: <xtosrpz6rzdvtmpyq73gboeckl3c2x23iqehlxzbaszqmzugjd@ixhj25qujqxo>
References: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
 <20250919-add-displayport-support-for-qcs615-platform-v5-6-eae6681f4002@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919-add-displayport-support-for-qcs615-platform-v5-6-eae6681f4002@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=YsAPR5YX c=1 sm=1 tr=0 ts=68cd8901 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=LgMYyniohzYkqyhK0zYA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: qI-9vOoHpIkw-aNeB9nB5FpQl8nqczEj
X-Proofpoint-ORIG-GUID: qI-9vOoHpIkw-aNeB9nB5FpQl8nqczEj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE4MDE2MyBTYWx0ZWRfX1xI8F1G8XSd5
 pD3XNfNguhw9WZrk1e1WfeP2XTemaiG/MAYuLbLyM5mWx79NMpIy0LWFfwtKU8wJBBXsThDip/T
 i3TbVQ2gm1Vo4cbdMJIeGsrqNFflPcMvgL7lb5A6yJseCTEc8rbvYmksqO1idyan6Vf573rJVSw
 nGC98tRxgdj8/6fSeETPwIlSstFQD1O+2kUPIFqkgD/11iZF9dTsK5yj0CKKInSQutFSNovMi65
 mn0LuWfrIrQMHiu8CVgq+Lbl0uhZiI+UYKV5c9WjfAR+ljlNugF/8qWrsZac7Z7nUcNRD+aeJwZ
 Y4lSWJaK4AabRYU8M6oAyK443+Zzojj2kLF5Fs9EVje5pjz2Lt70dixLvnjMJusfUAf5vz5DtLe
 5L9sYw+c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509180163
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

On Fri, Sep 19, 2025 at 10:24:23PM +0800, Xiangxu Yin wrote:
> Add USB/DP switchable PHY clock registration and DT parsing for DP offsets.
> Extend qmp_usbc_register_clocks and clock provider logic to support both
> USB and DP instances.

Why?

> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 210 ++++++++++++++++++++++++++++++-
>  1 file changed, 204 insertions(+), 6 deletions(-)
> 

-- 
With best wishes
Dmitry
