Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 475E3B53FD1
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 03:23:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF14E10E0D4;
	Fri, 12 Sep 2025 01:23:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="d3TxWoP2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E641310E0D4
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 01:23:41 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BIpGVh027099
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 01:23:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=phbp1n99fIqtgMb8Vmy4j4H4
 6BAYfSIrlAEx8Qjq1Sk=; b=d3TxWoP2/LYVaA4Gx0sEwXAL/6dei5QGC1WRhyK7
 E//AnrvxWvAc+hQu5facbEQscD/S7ydLzj/Rk9Uh+fYDyI9jFBus/XEanDKY+Z/b
 E1LJhhr+497Y7asGnsVon0KnMM38vzia5xzqr9FfKbqbSfhB4WLIAZ2phAzrYpc7
 TPVGxbmdsGqWRCw9DftynMpaCrhenT0wUVWNsRT+J8y9gWyH79rigQSv8Lsh+FeB
 T5eCNjBspj43EO2dXA0AalhdF+J3l0GO+Lem+SkDp8yAjnTgU3AySS5k96gdtV5x
 NldL1vfUDh1ND6jl8QcfTkbZBKA3fBrc6xb7n9WzGdfFqA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 493f6h4spc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 01:23:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-81678866c0cso262320885a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 18:23:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757640220; x=1758245020;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=phbp1n99fIqtgMb8Vmy4j4H46BAYfSIrlAEx8Qjq1Sk=;
 b=Ls0AWnZTlDU9zTDF0Ih51AdJpfCjEAP6T17iKhu0LcfgQoPeYJW4uTW4kg8zpYjS7d
 clmlGojWfoFf+akJ0YrtI/m4KyiNEe2AmGtQECz0JgXntKwXI5SbzCue+XKGK9UL8Zw5
 fPpCWsGOS6rnbNwCiSSAlqmPt41XR3lVai67q+75FHLmgb83fej1SGjcUKghOmFXRcaK
 Mc3pvmDQkj79LDF9AUd0VvDgMf2dXqUHZPlxv7EhUqg5ypqDOsrud5TT3S55CGkCyf67
 50RBH0BiLuBVvH9mKJ7f961slFof0jeJx7+Mhg8SeDtCaaVDsUoeRSrj+zj3DDkcVcKg
 3ukQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQsvQssjVD2/HCm8mLUwh4Wzg3ZHhHUmf7v9bmeBQCl7/f4NTQBGqnK2Wv/I2rragFEa5PQHnxpcI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzmgRZFX29xy2LabPZfhfEQn9VppyRuhElZ6sah8oF1oCBz2Xn5
 zA5cp48uK2U3+IB9x+CNGALR7gsnerxqXn/cUU16Mt/6GbS+lF7UTD1UGqwMxvOFHGBv6AHXPGu
 GHiaEocUblL45LpRbxTN73Cgnev/nfM1k9mxZNfuOoRHJUAmLKBAgp+lFShJWDWhDbkjVepw=
X-Gm-Gg: ASbGncuDQ8o3IWbW/hs4Ag8qtDTTHdmOEPKrVvYId67yzi/9KwNNG3xzWZIBiLr/5tr
 o2LRYdlxOKPCwBts2BubTxsz4LazT9tuegV1Qqw9Vp1d0auKcA0ebFVxT9K9HLADT7C5Q/WRVfx
 8J+jhnxY8qMIcxpRUf+vYD5DM49Su9xBppuGGIuK14ksOMagAM3zuUUuYswbJ2+UCcMQdTSDzEh
 mU/pIJH8Z/pT3A+gi+Ks6JYkMI0AT2rfVUBi/RRsuINzYjp4mYAyOtvhCfX4ozYwJ4/VzEBRxYi
 1d3qaZsiwcCYSYrIbn1CgrBMnh3MZ1deMEklletuyYIQJe3+BnNPh/d4heuxxlFPhf1VVbulxkt
 8n6bpa5uk61m6ePJXLhjH80VBDXgGmXkQoPvDnNnpHqXTZZVagH03
X-Received: by 2002:a05:622a:1249:b0:4b5:e72d:dbc5 with SMTP id
 d75a77b69052e-4b77d129e28mr16280141cf.48.1757640219980; 
 Thu, 11 Sep 2025 18:23:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAynI4bz/KxCp5t8jQU11GPgKeKhLD17wiB7Oe2sOXdsf6j6PRyZcg3pJ4ziMN/rj7L8iEeA==
X-Received: by 2002:a05:622a:1249:b0:4b5:e72d:dbc5 with SMTP id
 d75a77b69052e-4b77d129e28mr16279831cf.48.1757640219550; 
 Thu, 11 Sep 2025 18:23:39 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-34f1a820665sm5335571fa.33.2025.09.11.18.23.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 18:23:37 -0700 (PDT)
Date: Fri, 12 Sep 2025 04:23:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
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
 li.liu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v4 03/13] phy: qcom: qmp-usbc: Add DP-related fields for
 USB/DP switchable PHY
Message-ID: <msoxnqzbmyxztzr4e4a44gf34i4alvnkzbq2hxwcymc2k6qdd4@5cij6oq4k6qh>
References: <20250911-add-displayport-support-for-qcs615-platform-v4-0-2702bdda14ed@oss.qualcomm.com>
 <20250911-add-displayport-support-for-qcs615-platform-v4-3-2702bdda14ed@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911-add-displayport-support-for-qcs615-platform-v4-3-2702bdda14ed@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: InDoIcR3vNbWO7dH5GeaouvsOeb2oD5n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEwMDE3NyBTYWx0ZWRfXyz94BRTnyeJR
 Lo3QcoWRwxZGYcrdTzfqO+3ad4TWvtcHzM3HpjwaSaBF/BSKafHC5W//n05GzbbWoUC7YsjlyfI
 XOjlNJGwrpqsloPaJIJueTwhZWPdLC7bqGuOiAUNHC7G6W4kJDPZxHWBu5BPHGQo5SamT8GJpjQ
 J7eOH+Bhlew1COVNS7pV5EG/v30Lu4rawjUmK6OMTyeVyUKQDzcyuOFGzn3ZFqtrUjfouS/ZYQB
 5HmGHkPhxLxJGNlNjopm9KyLeyob1Lz/2aiHxmPH3B4jfel0FBETJPaiYtjQJk9apRDfkiKYsrb
 UslOr55Qf5C+jfwxX04bJPoQw5OUeqtv7FO1rUXj7TnaXRsMRgMqsaKd6xmolKysI4uq7SVR31N
 Wc6E03yL
X-Authority-Analysis: v=2.4 cv=WPB/XmsR c=1 sm=1 tr=0 ts=68c3761d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=vMfMRHGFLa_JFT07zEoA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: InDoIcR3vNbWO7dH5GeaouvsOeb2oD5n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-11_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509100177
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

On Thu, Sep 11, 2025 at 10:55:00PM +0800, Xiangxu Yin wrote:
> Extend qmp_usbc_offsets and qmp_phy_cfg with DP-specific fields,
> including register offsets, init tables, and callback hooks. Also
> update qmp_usbc struct to track DP-related resources and state.
> This enables support for USB/DP switchable Type-C PHYs that operate
> in either mode.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 54 +++++++++++++++++++++++++++-----
>  1 file changed, 46 insertions(+), 8 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
