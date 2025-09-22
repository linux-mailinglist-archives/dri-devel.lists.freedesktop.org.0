Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C97BEB8FCA5
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 11:40:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AF8E10E11C;
	Mon, 22 Sep 2025 09:40:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pXKZRq/9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAF5110E11C
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 09:40:17 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58M9GqjR024071
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 09:40:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7YluqLjFkeDBsYKSBhPJwBbp0COj/3zoNrL6kINO3I8=; b=pXKZRq/9CE6rRZBi
 Jky4PBi9rEiRdx/UtJ49BKRg39I3qn6KPqZ7JbDsFC+VZ5u7i96zjwhIbWjnyQJw
 OKsskdpkAPiWwJHqpK9W45VCgi4gIRGtbVgyDRaDxLwxnr5WAq+nRDZGKl8EeASH
 92AWXuxGg6RRhILFrJ1caqk5iyvkZ2PgVam+dVTzcPEsXwVe4bUhInEGxOHLoVdR
 VmGbjCkCkPnH+/ksnlrW22jnvtqDPm+Rfzp89mL3AfjDsEnmYC/5C77WAgu1LmOi
 ASjDpqPWKy7lis9fVDzCdoD0iX+5MrkGNfx8xG9xY2miUqdr4soYidhBHd7YcbBD
 U3pDaw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3ny82cg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 09:40:17 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b5f290579aso86612221cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 02:40:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758534007; x=1759138807;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7YluqLjFkeDBsYKSBhPJwBbp0COj/3zoNrL6kINO3I8=;
 b=YyZUa1/eQ/31H7JmrlGatyoEOWwTJiNyjFnucj57lizUfvBb4Id61ljLFY4l5tBode
 Xqkx+G6SegG4e6cmLKrVm9PbIFLnMPMlRAvP7K58TiAW5AqK7jxRaOEZy/wZiB8a9DE1
 XF08OK3FECibx0ZsXLvGoIbgHQN82mczeU7wK1ZlzeA9D7PSn6ooXgBrE1GAzAPofu+j
 nxed94lNJUHTP2+vt4qAAahTPGkk7wZJRuJrt5tbX2d+sqbZk39sywws32zj158ERaOG
 odLetLwqIHC3i2Iz5eoFO8IWBLxU4f6cVWCtIreCXgdCkLZif/nSDocIpOBz93l5xRdu
 AHlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXidoAcPJAwbOl+84Ov05GKbF8ScKWBgA3nt9qbUPnWlrffnXXssZXTrssrpe2Ge3DtT32QxrWr77A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxX2FQ0hOwxC/qCzDpS7xjeb40RtnaS5/YGnOVRe9nGpnj8ipXp
 zhCWcKMgUq8jkx+696RQjyO5j498PT4stm51Qe83njVjhY9otBx/X5DqbfJFsQInijp5cXwRDHQ
 uwmYVIth1sruSXWXz0ixPFj+iByn9bYC25vncPcdf0EnwLgp1mVGZSDwSe77PHD0LlZeW6eA=
X-Gm-Gg: ASbGncuS6bntD8OandhxiO3tk6kw1D7cR/4oSQGrUpHv2dbF6KVlBVlYdvvV37l9ZNx
 IwENSwVr22i2qYgGZNTI2+trh8ZK9TNa8PDS46NHPpoQV9vsJjJWHyY8CKkN0gW/hwKw6N3dmg0
 RhCBsxaExLaRQhjjQ9vlCZTKOmvtHD30qkDWaw50hBhZ3ujKHQVebrVaizq9aKHipU4QRzmajj7
 +rQOc7c2Tpd7rY8gcQUf3xSM7wyL6Heo486U38cIQI1zU+6JaGaFjqhGOy85Fl9WhY4QeWfozCj
 5+5+qa92a4j46EGvSQyVUodQN7R6RaHmeDkD0DVno4JjTA6WFzuOkqlyWPl2ZihXntPnK/PLjKQ
 FaLHjlDizR5zEzgSfDcN0dsg4337/vEhvGa8JgqTfO0sH9wtlr3EN
X-Received: by 2002:a05:622a:3cb:b0:4bd:8a70:8419 with SMTP id
 d75a77b69052e-4c0740771efmr132175951cf.49.1758534006552; 
 Mon, 22 Sep 2025 02:40:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHPdl7qbXwWAyMzAb2xrKkqm9pTpnhem1oin/ZkSbUrYmV5Vp09P9ycfD9quaP9yIYnQ94uw==
X-Received: by 2002:a05:622a:3cb:b0:4bd:8a70:8419 with SMTP id
 d75a77b69052e-4c0740771efmr132175461cf.49.1758534005900; 
 Mon, 22 Sep 2025 02:40:05 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-57e06875b8dsm981204e87.2.2025.09.22.02.40.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 02:40:05 -0700 (PDT)
Date: Mon, 22 Sep 2025 12:40:03 +0300
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
Subject: Re: [PATCH v5 05/14] phy: qcom: qmp-usbc: Move reset config into PHY
 cfg
Message-ID: <ysxjabaah6rcbsjlreteo32zdljjcd547vgqeoxototwicjj74@rwovxeg6rnli>
References: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
 <20250919-add-displayport-support-for-qcs615-platform-v5-5-eae6681f4002@oss.qualcomm.com>
 <z3phuuokrhonbukct2siz3ujear5ymtnoviea2epxzvjdmsvkj@w4puf4c44tmk>
 <83b5a265-1c5f-49f5-a89e-22f466df3304@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <83b5a265-1c5f-49f5-a89e-22f466df3304@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=EuPSrTcA c=1 sm=1 tr=0 ts=68d11981 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=zhdrUoIqCuD_tm7jGOwA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: ew3Yzwwt0k8j-675icCtyUZfttxzUQnQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA5MCBTYWx0ZWRfXzZMgvHgOsWgT
 99rTapqGr5MuLFfYe9sMwv5Q1AhDuhRHZ86eLMhhuV//YZJjTLD4gCPd84OJyGCs7FKB6Wa2EQi
 eBbVAHYX+50JUcSxSEVzoVuKDO2IAV+5dhXloUrdxACJ67O9zC5kS3D9/aoKF4iMGGXTKGEL0eR
 WHt+1cV3oTKBHJY67old5IBJYlXTNRkrAv39GSc/DJcFIS7VxvMrohAU/NUjwwZXbHz22/ioSoQ
 3ot9RHrArzPvWtxbWGuo98FIl+d7/LDkYhInJhDoaUQUR69fBPUk+bckhO35cMA5/9WS4paU+Es
 B9UmwufKgZmS+L5CCL+aZphVq9ZX461moNL8jxZWwHp7Wnpe/JObRvhR0zuLuN+ra8M0DCBhKf+
 jX0a5sh8
X-Proofpoint-ORIG-GUID: ew3Yzwwt0k8j-675icCtyUZfttxzUQnQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220090
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

On Mon, Sep 22, 2025 at 04:04:42PM +0800, Xiangxu Yin wrote:
> 
> On 9/20/2025 12:45 AM, Dmitry Baryshkov wrote:
> > On Fri, Sep 19, 2025 at 10:24:22PM +0800, Xiangxu Yin wrote:
> >> Move resets to qmp_phy_cfg for per-PHY customization. Keep legacy DT
> >> path on the old hardcoded list; non-legacy path uses cfg->reset_list.
> > Why? Start your commit messages with the description of the issue that
> > you are trying to solve.
> 
> 
> The original reset list only works for USB-only PHYs. USB3DP PHYs need different
> reset names like "dp_phy", so they use a separate list. Moving resets to
> qmp_phy_cfg enables per-PHY config without special-case logic in DT parsing.
> I will update commit msg with issue description.
> 
> Or do you suggest using (offs->dp_serdes != 0) to choose the reset list instead
> using new attributes?

You can't because othe DP PHYs supported by this driver will use 3
resets: phy, phy_phy and dp_phy.

> 
> 
> >> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> >> ---
> >>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 18 +++++++++++++++---
> >>  1 file changed, 15 insertions(+), 3 deletions(-)
> >>

-- 
With best wishes
Dmitry
