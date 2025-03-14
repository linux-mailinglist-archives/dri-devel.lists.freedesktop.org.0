Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A43A6087B
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 06:50:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B935E10E2E1;
	Fri, 14 Mar 2025 05:50:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="I4B8ihRu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A51F210E2E1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 05:50:35 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DNebfj017140
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 05:50:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=3Vqxj6maQ/0C/cPzwEDinVuW
 MwBoOyHaKfn988vLW5s=; b=I4B8ihRu1/JmzruSlUojarpk8yt/sShTOxcsxqNn
 Qvr49/e5vNMeFJ7g6xmfoONY5yb/tVgZZHdM94piJbjgVYfVk048dtyiQWe2HKYR
 39yETdO3YToK6KHqfoai3VPeYS3q7OiZVvD4VC+PqQbIc/53WOKpj2Gvb/uKPrqm
 Njg9nZ1YHsoGm/UlsK4iqiOi0LMjU+eAt6EgRVhkp3ejw3tf1ql1EztV2sWTq0tb
 HXwEqFvQNtxDjfrcNPi7JE85F4Jxkx8PTf4age/XXe4Nq9ft3B8JteS5K0Is19wu
 GnO+BUJVnDM94+gj3ds6kXoOgLAy3GgW5GQvMVjvm3S6Lw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2p07tx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 05:50:34 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4767816a48cso49520791cf.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 22:50:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741931434; x=1742536234;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3Vqxj6maQ/0C/cPzwEDinVuWMwBoOyHaKfn988vLW5s=;
 b=NPcrsYN/TEFwEZo2M2zDmvg+Mb2cLkJJiTnFA0LSsYes71bwSCFBV6KKJVK17/EvEq
 goO6SNbpEDffddmHiKPp/NlbyoW6IyIq1EK4g2u2xcIdkH6tfzZTKUgtO/WNV26Si/u7
 MUCQcrilag2Un/U6SgG8mjcu0mlJfWbSyT7gF/UKjXf8XjTj866JshEVFH+xWbDHWRUZ
 SBkDLNRfL35rlUxZCjMclqSLPKzJ1M0P/rrctCBY1+jDamb3kT2GtOnCsv34JcbC7Rrz
 AsYl6FK22Kkg+qO3RDjG6ufI7cqM+5M25CVxLUMBUNE8v6iZ0SQpuKdVlJJZw44/2krJ
 zmOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMhiyePMYvoc5TZ7PHhBybaEsyS7VaREX2trA/Pdr5ez9/sJ4RJh0mLcjRgnJpaMYlBTqWksBY3/0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxLXowR0jmaFZQJWXUxE5wQDt9jUuOy9cxJxnHE18hhLiow2Ena
 L+Mz+Ldv5EkleTHu6cU3BukM76Yl77916bFPnC9we8CLsWPTn15htqZo63z8mcnnoUKNFWEHSeQ
 Y86uJ+Xy7lmGb4d+oOnfr5vHoFAM51ELjfnWt+EK2Ezz7ggW979cEUfrfF0FVCctWTV4=
X-Gm-Gg: ASbGncupggh+wb9q/icI1QDXLlHJNWdmbm4d/szDmEqH/faF0J5rYYksIiQBLAAvpw9
 NADxW1RuYoyVomD7w9QLR4pHAVjgFcI/PROM9NleRZUlzHchlKwmqVJnsV88QjuaMh2VIXdBLeF
 AX8h5Ri4Aa2/O1fhinF/3kn8gbbc7kyhrhyAnHPNORtUoo4I/T88y5vGIN8D44ltJQimG9GuzR8
 TJ2SMEGtXzvIPUozsQ3h8eP80A7JRWkTQktkPdyhvPxWKGJ9qkPM4midDQNjBjRQr+jFaTAXTng
 GeT4+vrdydPLtWlSkqZ6qmBREwdimNsTenB7okxHY+or9IGQOWpkxEVJOM+vI6rx//N1frbDDpA
 6Lc0=
X-Received: by 2002:ac8:5802:0:b0:476:7e72:3538 with SMTP id
 d75a77b69052e-476c81d8e94mr24369551cf.50.1741931434040; 
 Thu, 13 Mar 2025 22:50:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERZKvu85dCT1ENeUCj93BWd9WRGZX/y/rSiMeTSVd0DTfMzXYptv9kVVt0BKY5U8uIYW3diw==
X-Received: by 2002:ac8:5802:0:b0:476:7e72:3538 with SMTP id
 d75a77b69052e-476c81d8e94mr24369301cf.50.1741931433761; 
 Thu, 13 Mar 2025 22:50:33 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549ba7a9257sm430070e87.47.2025.03.13.22.50.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 22:50:31 -0700 (PDT)
Date: Fri, 14 Mar 2025 07:50:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andy Yan <andyshrk@163.com>
Cc: lumag@kernel.org, mripard@kernel.org, neil.armstrong@linaro.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org,
 jani.nikula@intel.com, lyude@redhat.com, jonathanh@nvidia.com,
 thierry.reding@gmail.com, victor.liu@nxp.com, rfoss@kernel.org,
 linux-rockchip@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH 3/5] drm/bridge: anx6345: Switch to common helpers to
 power up/down dp link
Message-ID: <srzceyged7kezgn2bmqnroyjo4gxdtwuak6tdwrwmmsw24ziwa@v5i7ku5jun5w>
References: <20250314033856.538352-1-andyshrk@163.com>
 <20250314033856.538352-3-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250314033856.538352-3-andyshrk@163.com>
X-Proofpoint-GUID: _GCdAwTE3dfG-y2T017pVGbzQ8VyD9tN
X-Authority-Analysis: v=2.4 cv=Q4XS452a c=1 sm=1 tr=0 ts=67d3c3aa cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8 a=OWrNmNDVMPCQDSv4SXMA:9
 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-ORIG-GUID: _GCdAwTE3dfG-y2T017pVGbzQ8VyD9tN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_02,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=883 adultscore=0
 lowpriorityscore=0 mlxscore=0 clxscore=1015 phishscore=0 malwarescore=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140044
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

On Fri, Mar 14, 2025 at 11:38:42AM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> Use the common dp link power up/down helpers to avoid duplicating code.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> ---
> 
>  .../drm/bridge/analogix/analogix-anx6345.c    | 30 +------------------
>  1 file changed, 1 insertion(+), 29 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
