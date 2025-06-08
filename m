Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3065AD1543
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 00:36:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38A4210E1FE;
	Sun,  8 Jun 2025 22:36:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BujmzGng";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CD0110E1FE
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jun 2025 22:36:04 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 558LNLnd014607
 for <dri-devel@lists.freedesktop.org>; Sun, 8 Jun 2025 22:36:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=5UMciADcDBohw7l3Afqy21k4
 B5zDCEQKS7YSGnXaHgg=; b=BujmzGngVGPBb8uj3Mj5Gt7f1sKcye6En4vb5nnW
 5LTynp70edvk8QYYqK0naItmgF6aDsUQETuMaFYFa6HTLQm/sdCJIzlKs+NPW7IB
 K0UHG5oWKcP7R9RP1CnAh3An7oPjEhMa175nhsu7LHLAbKnPcTM9BPBcZPZhTxSY
 nOUzr+s3+Z7f3KjJDqJV+S+3pmwtowJG7yCIdR+FpvqAqlgFtNdEWwpkHtsy1+rF
 9jH5DB/mCetSuSuZI6PA5otnNaSk+tCmlMYWBkENEmxblRqTyLZ7vmLlrlTlIBS/
 71O+fiYLKqBIDxoKq9PWu5IlJ+PrlIAwBTC+17hUinOUcA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474b4j42jy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Jun 2025 22:36:03 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c92425a8b1so608431785a.1
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Jun 2025 15:36:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749422162; x=1750026962;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5UMciADcDBohw7l3Afqy21k4B5zDCEQKS7YSGnXaHgg=;
 b=wpUzbdLvHVhBU2t345KCCjWbnByEsH1JYnCzuMQ1OmYWrq1H0gAvXuW7hVfTA/PNQW
 WmxOWV5R9+Za3AuUn+362S2R4FiTlPtZhTwlQIr5mHvaE84p58+/wk8Mwj//pfE1ZjAw
 fiDvStssI6cCR+DYFUmAGBohVJ5JiMaEQR3Iu8n2PJg5jecILu1CiHTHx8VBTp3SQY/H
 sM3KinUoVL1SbcS6H8X8dz9cKqamAT5jNFEvg/Fy3SrOffNqgh0wQZQSJW14xZ8cebIB
 n78oWtueylGF9hUnbJz9z6x5XB/ukiXcXrlHFqh1jFSJM/OJV86M83M8MWKNOI6Bgrzn
 l37g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqGCc+UmjMwsbFeZ3mlp/x960+SzqfJm1XyqKakrEinq2pYkwVrzrzDyNVCPuiksD0NGbW8WvdmbE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJ9++b2IHozkScOWs3CBUbXM/BB/H6BES2HykLnSdXx23nZ5wr
 dmrR1YYYEdmLdQfoE97AF4nmTJp57qifcXCGSyO6KSfm1bXPvLvyTKL2REWoV4U2GfnsgRtu65f
 SlfpY5aWhKMp/p8rGPOXwdet4jR3VaV8B51RCSLOy/ikOPP+RkTWL7ypQ1cWe/n8mQYNYZvI=
X-Gm-Gg: ASbGncszCekcFU/S/QShs3UdJWq5/G7N4xDQ8VqRdgD21X3T3oKKOlkvJ5B9z+3gMEe
 pxO3ldaASja4i82D3vVJVsY5SPJauZ/d/Aujp8634sbSbf39hOTG/Tr/Rn+H2uk4f5+m7LhOv7k
 Vti983iV/u1DRvVnGQJF9sDvjyfeNb7/0u30tfOoymX1F9GkPMY8nghmcU50rbBFNYMm2F/tLb1
 W8P851qfAua4bbm+1Y8cEmu/8tHUvq6kqvnDVZpyzkeSYe2yd7F1IfscKCZ/BL6fDuDD9T5Yz9s
 9zU0WiKOFTufe1C+H2H/JuSi5KMEeiSTGwLXPe9DyPIS2GTwrSdT6pIFau9H+CZguxycsvSo/tz
 MMvHndXjh2w==
X-Received: by 2002:a05:620a:3912:b0:7d0:9a17:7b93 with SMTP id
 af79cd13be357-7d38726d9f7mr1026519185a.25.1749422162524; 
 Sun, 08 Jun 2025 15:36:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXlQeV3tbfCn8ZNJPWj35kb5AP7pQ1oBAPDaVCFROWwmvnWZ9k6Uz3+DKk6ZgzIutglpKe9w==
X-Received: by 2002:a05:620a:3912:b0:7d0:9a17:7b93 with SMTP id
 af79cd13be357-7d38726d9f7mr1026516185a.25.1749422162205; 
 Sun, 08 Jun 2025 15:36:02 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553676d0183sm899166e87.49.2025.06.08.15.35.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jun 2025 15:36:00 -0700 (PDT)
Date: Mon, 9 Jun 2025 01:35:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "James A. MacInnes" <james.a.macinnes@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chandan Uddaraju <chandanu@codeaurora.org>,
 Stephen Boyd <swboyd@chromium.org>, Vara Reddy <quic_varar@quicinc.com>,
 Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Guenter Roeck <groeck@chromium.org>,
 Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH v2 2/2] drm/msm/disp: Correct porch timing for SDM845
Message-ID: <3tmpywm2ipqbdhbu6qga7eb64jk6lcqpqvatmkgwwd36qcqkip@7yazfvwlvwit>
References: <20250212-sdm845_dp-v2-0-4954e51458f4@gmail.com>
 <20250212-sdm845_dp-v2-2-4954e51458f4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212-sdm845_dp-v2-2-4954e51458f4@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDE4NCBTYWx0ZWRfX5okO/3aKylp2
 97vvrqDzD0/rCg+707XJZduMIiA4OKtGeCOy/i9FXCf6v++JzGbwh1Jid8K1zm8zwIQFfEBTv2v
 QoA8Hw+hrikL8R8VF1F3VCVQ+KvifnSd0YHLmGFY8KvFY1LVw40LhTbvV1SvNKTQYYJ/nBN4I+p
 JDSfM9bJMS7Qk+zRSV6rFUnQeEoV7bpYQUeZ5Di+FUzl3+AjfPSsJQlTKc5MoltnH6lE57B0BXO
 18PQHrpPy1/UWBlRCs3QSGIWLvSlsWqtE7dMPNHdZjB8ZzK/UYl6HUVdsdtjlTIq+nM0wsY0yDw
 0LPe1cu8ijIuX3qlXMNskqyl+Tpbsm+TDH6320GvvsBn9tA0dbPaEY4PRTN1pJK1E+dKqSo1GmU
 fiDw7pqYLu3A/UNwpBJj4UCXvVC/0kpN7975Y2wTSnLaIP5vOgwbU2do0za2ATexnaE8nPdm
X-Proofpoint-GUID: QBrJoM9rEShBIWUP48fIRN96aCyAwcKr
X-Authority-Analysis: v=2.4 cv=Te6WtQQh c=1 sm=1 tr=0 ts=68461053 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=OnwjkJn3o8bp6UkAWykA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: QBrJoM9rEShBIWUP48fIRN96aCyAwcKr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 mlxlogscore=999 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506080184
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

On Wed, Feb 12, 2025 at 03:03:47PM -0800, James A. MacInnes wrote:
> Type-C DisplayPort inoperable due to incorrect porch settings.
> - Re-used wide_bus_en as flag to prevent porch shifting
> 
> Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
> Signed-off-by: James A. MacInnes <james.a.macinnes@gmail.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
