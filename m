Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6716BA6526F
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 15:10:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77D1310E40A;
	Mon, 17 Mar 2025 14:10:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iu18zEvO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 558F110E183
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 14:10:23 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52H9qmrK003310
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 14:10:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=1449/WYbuYcaYwnkoadiFehF
 7dXcVB4TA3yA3L94cbU=; b=iu18zEvOu1bcysiTo7+4gc+ahaoAAWo0Bi0YKy8H
 RVs83kjtNbmUim4RzPzGi6PUzyvAvH2HQuKTAD4FOBpbHlrIgbr+Q5bazIIG1ipx
 dQ4KIERWD38Wq0EsOmr+AeMr3o003f6fZbcclnA5pfdrGJsevfwFQYI/aubHw/8n
 sn/c5bljdZWQYkdXgU8LMM1sv6/FjPm8UU7K0UyWI6Sv4cEk03vWeX8viefCnp6e
 hejao6Ve+SWZr1gALc4PLS22MVIQM84ZgW+YxDA4VE39HpKFTBxBTAI9MJ++dTip
 24zdzSiD7b4rbuKLnUdyd0wYbbZIiQD5tYgtIoHB5fdltg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1utvwad-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 14:10:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7bb849aa5fbso1103601185a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 07:10:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742220618; x=1742825418;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1449/WYbuYcaYwnkoadiFehF7dXcVB4TA3yA3L94cbU=;
 b=wVjm2txAdqT/jmHHmYMh8NjMkhUBIOVVGVB6wpa7IbFmu4FH4dxpjLBOtmVJg/yWPh
 4OIIJmfjWWqmJdSeFXcYv25/MxopF+b2YyG4t/J1KFK5gk75OYlBl4p5H42pW2w8AIVK
 K0B/KPOrotf1xBzDA9QA6MoUq3/Nk6rrccF4mqK/4xKtpiZCOQuq0LlnO2ZZPPjgpAgy
 XO4zV0V8AJq9Tx1UIYH3TYYMj4rERBZCkDDbotHU5SGSiJjlnGf+H4deQJ7/JFHP7Cmm
 M5vPlkHFLDH4IoUWfa4Blq2dxwvQZbD+pVR9mHBiaga+AEX3A4n9sK4IXriDCsJbBenY
 YRfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXRY5UA57Y4LMLLhRcnCUiu+UictDermH2BnhnbHzJq3ogFci2jPN/A6bGb8Xox4RhlpZgkgvZVNI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyvYz/JIDCsBnJj8JbYJfbCrz37PPd6D2tRUUU6vrIovKOAz2Xx
 hd4fNTVmwcMahaaxakReKhjs/9c5ew6GOcYmBEjU41m0h8eNnPlB9zS0OzdOdX0/H3iFCoafLMq
 rTSP9sNqHJWzFwfEfmUqVjjfvHs4Hr+vS+xZdMfOvM2+1KntOmCUD21S4ULrCxPQcd6E=
X-Gm-Gg: ASbGncvtR+QaPr9dYqg3Njt4bmbp89qMPrPzycU7ARO7cI9cQ3daBjFksCavGFMJOj6
 rplH6NTr02HpM3027LsY3xIy5Dj7GbQQOAGqe7NJFY3FCGRhnWz0i6rqWNo8nDG2sCn9ShlVBOG
 Yv66mKEJGsupOGrRA5d2NhieIMaWSadKp+FKgZbBJD4q3R4OHZY5Fzm2SdEa3jAW7ZO2/WZ1LlH
 qNTup+oevdHa3EqLspCNRWXpCnG4L/okFweMkrF6Dg+BkLVuH+Jk0CXrhUIV+8GvmRhQ2tuMDJg
 QlCBgfrHRskSdu5PdYOWSIA36SMRYsoocUFPoVmfvrAsFIvOpn51yjaa/7+M8bnGQmWTeml7IzD
 AUIo=
X-Received: by 2002:a05:620a:4089:b0:7c5:6299:3da with SMTP id
 af79cd13be357-7c57c8fc7e7mr1286948285a.39.1742220618326; 
 Mon, 17 Mar 2025 07:10:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJFdSdzFzRlQMfyJs+MkA+3WBZa7mH06t7taxNZZWaQyeYqJOxUH7YxaZmqOhaAH+nbNuARg==
X-Received: by 2002:a05:620a:4089:b0:7c5:6299:3da with SMTP id
 af79cd13be357-7c57c8fc7e7mr1286945285a.39.1742220617964; 
 Mon, 17 Mar 2025 07:10:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549ba882788sm1338685e87.183.2025.03.17.07.10.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 07:10:17 -0700 (PDT)
Date: Mon, 17 Mar 2025 16:10:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, dri-devel@lists.freedesktop.org,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 06/15] drm/msm: Test for imported buffers with
 drm_gem_is_imported()
Message-ID: <xvlixbldl5phzstzayjwuf4c34x7ji2xts62m7dmnhmdcokoqs@2os7zdjrq2ft>
References: <20250317131923.238374-1-tzimmermann@suse.de>
 <20250317131923.238374-7-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250317131923.238374-7-tzimmermann@suse.de>
X-Authority-Analysis: v=2.4 cv=H8Pbw/Yi c=1 sm=1 tr=0 ts=67d82d4b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=pGLkceISAAAA:8 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8
 a=tVI0ZWmoAAAA:8 a=e5mUnYsNAAAA:8
 a=EUspDBNiAAAA:8 a=RpfBGSZpqGWm18XDRZsA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22 a=-BPWgnxRz2uhmvdm1NTO:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: NsQAv2AhoVaBlubKq1G0PFXLuUQLHjTs
X-Proofpoint-ORIG-GUID: NsQAv2AhoVaBlubKq1G0PFXLuUQLHjTs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_05,2025-03-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=738
 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501
 mlxscore=0 suspectscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503170103
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

On Mon, Mar 17, 2025 at 02:06:44PM +0100, Thomas Zimmermann wrote:
> Instead of testing import_attach for imported GEM buffers, invoke
> drm_gem_is_imported() to do the test. The helper tests the dma_buf
> itself while import_attach is just an artifact of the import. Prepares
> to make import_attach optional.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <lumag@kernel.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> ---
>  drivers/gpu/drm/msm/msm_drv.c       | 2 +-
>  drivers/gpu/drm/msm/msm_gem.c       | 4 ++--
>  drivers/gpu/drm/msm/msm_gem.h       | 2 +-
>  drivers/gpu/drm/msm/msm_gem_prime.c | 4 ++--
>  4 files changed, 6 insertions(+), 6 deletions(-)
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
