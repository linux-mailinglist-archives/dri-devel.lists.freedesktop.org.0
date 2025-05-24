Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7643AC308E
	for <lists+dri-devel@lfdr.de>; Sat, 24 May 2025 19:15:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C571110E13C;
	Sat, 24 May 2025 17:15:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="I60MA9Wa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BABC610E0CF
 for <dri-devel@lists.freedesktop.org>; Sat, 24 May 2025 17:15:54 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54OEwUNs010850
 for <dri-devel@lists.freedesktop.org>; Sat, 24 May 2025 17:15:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=HoKB7FoEFd+ZhxUTxnT07Hez
 elPHtrNEFYztHvSBeTM=; b=I60MA9WaCYrQl3K61kG7yKmYGl9ROeRwT/67lMeC
 reb+NGpNPyHnfdqVaAf2cBYgnc/1QzAhQbXQcHSHwwchJBZnWmucKKXIryhgowY4
 vk6Gs5AIVJ0mGfMgmpH7rDumAlHDYh0Lptcnm0vC4hYmrbm7L3rQ55sQ6vbyjS1V
 OLffzTCJkiDbWpEKWpUsTzVS/qN9w9j2JlwYhwlNbL1V5J6SfhXPY/PjmNHCsUTb
 Ei7Rc8o7Gnb63DjMuXrepEITpjmMZr3x9EKikdixyjPeukufEmRKuRwMRaKWH2wx
 5OWKO+ccedjgwHdCZJSP+R/WVHbKrU65gL28Nxpw3OsFsw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u66w8wb5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 24 May 2025 17:15:49 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6f8e7b78eebso24652016d6.2
 for <dri-devel@lists.freedesktop.org>; Sat, 24 May 2025 10:15:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748106949; x=1748711749;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HoKB7FoEFd+ZhxUTxnT07HezelPHtrNEFYztHvSBeTM=;
 b=MN2neLIoUUXy9cdRPWx1pV/Zp7WPI4X9Ym1CclTw84QDVndJUcZ4bYhi9rqbk+Xl1R
 2AbtgN9LlCpT+j7Sgz8mXVCWdoMmacJ9j7IRpqOh+plvpFoRyo3MF5CvezETmKj8oM/S
 wAgmfZCfofyEHLdW54sBICXeKNXlJHkQogAW7oZpZOkYplQPQc3oMuOf31HHqwwecq7n
 8WtpH/1pCu+95ks2D1zQv59Hcs875ljLwgPUo+1MVpY4Cz0QAzSPKiVTGRmc8WL1yeXR
 cu4A/Qol5m+EcD2UAzHo/ZiOfw47nyRZ2whIBinBkkSaJfCk1lMRK3VdKc3JJHMX9B+4
 z1eQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVD4DfY7dOQK9gX34S9ZyW+DmiVDNOEi3RmiR0F7ALZspuUv4xUy3hYFL8iXZ8hen07ScQcG1Sb5sk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YysOrvypLnB23Acvveemsb8huKXiWgdr/hEMz1xTXGB1T7A/rk4
 tILROf0GFQJNso87hyK3/hPVed4REu9YnSnrMGjhufikrDBvuo94taET/sJbytGUQV/R6Gj9RJG
 mleOW2ijH3UGZMyEOvBzP19dcV0Mr0dh4TpJyG6F4zZBSnnM2nCcdaGTlTeS2uahAG0ZUMWo=
X-Gm-Gg: ASbGncvTGZs2j3/ufTDiNX5w+5yQO6nJ5td/jT5D+/Xhsr+a+ozO7usB1zbnOFwoasF
 iG3OdkNMXgT5SCetsNW5xyUdQtastpJhXQonvBpYrtBJtbfREmy45RvYc7bZhuxKwp3dOGUOJhK
 o8/mK6/xVCxloGvD5dpcABLhYWmqwxXSvLO7hcIJNTEcZmOCfrP4oHBCNRW/Qn7pbyjVZFmamj0
 hMB4Z+RdYbs8jDDEgTBAJ4JwHY0cDc7kiSnYvVbE4ki9wS2PrmuL/utOlHSJo7cxee3varO62Tw
 IMfnQS/Q/4ySfrUqRYyfu3FO3JIRk7kbDMtufQiLUnyWrEhYBsMQd5uF9m4MpoJQAQMpzg88spg
 =
X-Received: by 2002:ad4:5bad:0:b0:6f2:c88a:50c5 with SMTP id
 6a1803df08f44-6fa9d28772fmr67452116d6.32.1748106948868; 
 Sat, 24 May 2025 10:15:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIqkv1DDylW1b3GD2ViKAIAcTr7kO7D7YE6wGfo1Ri+34/iDrnom1wZeOY+am9JzCmMIPeew==
X-Received: by 2002:ad4:5bad:0:b0:6f2:c88a:50c5 with SMTP id
 6a1803df08f44-6fa9d28772fmr67451546d6.32.1748106948491; 
 Sat, 24 May 2025 10:15:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-552133120b8sm1112985e87.121.2025.05.24.10.15.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 May 2025 10:15:46 -0700 (PDT)
Date: Sat, 24 May 2025 20:15:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Ryan Eatmon <reatmon@ti.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: Re: [PATCH v2] drivers: gpu: drm: msm: registers: improve
 reproducibility
Message-ID: <6mgmrqmixjdftpjz2hvwjnsyh3wwylxuaih7yez2mdgjpcp3l2@zjr4ai6kkjxn>
References: <20250524-binrep-v2-1-09040177218e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250524-binrep-v2-1-09040177218e@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=aYJhnQot c=1 sm=1 tr=0 ts=6831fec5 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=iGHA9ds3AAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=sozttTNsAAAA:8 a=pGLkceISAAAA:8 a=CEJotdllt_GKsxek9pwA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: QN1NVb6fWN1FzvYdit-QsSfbZjAXpAw8
X-Proofpoint-GUID: QN1NVb6fWN1FzvYdit-QsSfbZjAXpAw8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI0MDE1OCBTYWx0ZWRfX6zJg1VIOogeU
 LnyAyJ43nD16K1JnSR2q2ygxpzGxIFse0XkRaa7iTku7j1FZlwcL4EAZ+tv+oq7ZvC0+jMzP0VX
 GNlq6yK11HUnBCgtzCz/5igz7oZDPfjdAwW1hiG5zxZ3N/t1SOEJ5IUqd5vYw7I+P1yDHUNtWIQ
 ZqOFMNcjwD25CbIpgL1ccFlkxe2dRh3mlvlJaQJ7eZU+WBQW/oyU0N8c0juOZcTWKiLh3g6ce1W
 1RoUd5ByAn3Ymq1ma5WHsB5EctU02t1m0bOhrgHq8Z+RdLecWZTShnSP8ykFFnAitF0m9DDLc5t
 IrBXGmKobdIiVTH5QO3/Ga7trwO6tbBTFplX2AGmWOSGVkivSoiExN83GMCzs3p+kFQQnQy1tP0
 jHTsHr7Ovp1gxNi1lU/bVkJgf1RplqxmO/T/MgApiLWT80pceWf0DAVfMbo4yjbebnW0Gghr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-24_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0
 mlxlogscore=976 lowpriorityscore=0 malwarescore=0 mlxscore=0 spamscore=0
 clxscore=1015 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505240158
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

On Sat, May 24, 2025 at 09:25:37PM +0530, Viswanath Kraleti wrote:
> From: Ryan Eatmon <reatmon@ti.com>
> 
> The files generated by gen_header.py capture the source path to the
> input files and the date.  While that can be informative, it varies
> based on where and when the kernel was built as the full path is
> captured.
> 
> Since all of the files that this tool is run on is under the drivers
> directory, this modifies the application to strip all of the path before
> drivers.  Additionally it prints <stripped> instead of the date.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
> ---
> The files generated by gen_header.py include the source path to the
> input files and the build date. While this information can be useful,
> it inadvertently exposes build system configuration details in the
> binaries. This hinders binary reproducibility, as the output will
> vary if the build environment changes.
> 
> This change was originally submitted to the linux-yocto-dev kernel [1]
> to address binary reproducibility QA errors. However, the fix is generic 
> enough to be applicable to the mainline kernel and would benefit other 
> distributions as well. So proposing it here for broader inclusion.
> 
> [1] https://git.yoctoproject.org/linux-yocto-dev/commit/?id=f36faf0f9f8d8f5b4c43a68e5c6bd83a62253140
> ---
> Changes in v2:
> - Corrected author id
> - Link to v1: https://lore.kernel.org/r/20250523-binrep-v1-1-c3a446518847@oss.qualcomm.com
> ---
>  drivers/gpu/drm/msm/registers/gen_header.py | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Rob, WDYT?

-- 
With best wishes
Dmitry
