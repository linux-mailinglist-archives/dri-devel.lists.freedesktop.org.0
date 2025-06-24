Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FEA5AE5A1F
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 04:38:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7CC610E4A0;
	Tue, 24 Jun 2025 02:38:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QUIKAo9J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9A0910E4A0
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 02:38:18 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NKl6OH007961
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 02:38:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=hdLg2oNfmHMNU0HKZgkFa6Rb
 PHtVFDrUey/Iu/89Txo=; b=QUIKAo9JhqBLFYJdadDzaBuEw3kSDIRoyTKFQhw/
 OxPlMFW5QQF/JYiWfDoSd9X817w3ECKTSYNUZ8urNSfkx/90Jxm+qRcxy7cVODa1
 dW+mpGggyirZqYjOqarrHd36BU3SXXHyV9CQ3rz+06MAiWOAYO9UXRDo2lvv1Sfo
 YNGm74ER7QzTAr76FFrGmtutTjszYSpVn9th5gsuZEs978WMzx28j9p7oN7qfQhT
 fq60WAEhfy6E8hbm5WeazeW5F5mu8/RBAbUvvC7FkQ1zN6AB6Hai8dj7WyeWjJFt
 NPmgEJF4H7KZnlgW94Im7wo+zIV+TSL08rVWCmP5DHXNWg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f7ttsreu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 02:38:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c5cd0f8961so983555185a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 19:38:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750732684; x=1751337484;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hdLg2oNfmHMNU0HKZgkFa6RbPHtVFDrUey/Iu/89Txo=;
 b=MzmnaCLrWLArsaUN/ZWIMlSBY+W9ktfiaykEzwSF7ZHF6wxH25GmPio8mmLUxvViLM
 EE/2D/aDcy40gK2CmOy60hWfBM/44lN2D6Mt8zCMwe57UdQz3o8Wg4XEdLHojxcwPsVP
 Yyz8OSP0jcf5faUjBoYPqhcfuuYU1PrzCC40CtyTCXgel6Om3YDiu2UVVBSBtNgNS7Pv
 GD4jIYyuJKza+ACTYb+7SBsKkv+SF1c3aEtPuJ0+R4/Fy1xXSGXNoGJYxd/fT8vs+Bbc
 MjztBSBcZiV9e4mlJegyD+9ZzVz7WpoIIXEcaahfNau01byq0PKlHJTxxtY6fxRzUmmt
 fiGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAlVwr17Pml4fCGt+TK5KWOyR5xdy8R8FwK2CxmabbLCTRA7ahWCOo7ChA+qSqLBXeYGjt0biGui8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/vzVOLX0XnPPD4GC96PnL0lVdhAYfEcJtyn+XW/ZSwcsy9nck
 iDb629B8bTOy8BukrSi/xMYdF6nwBdtNuuQflxAhbZr6jyd0TD4E1zdi3FbuL7a7W6m2vFCKA0X
 R1zfKv9a13Hmhmi796X1+gOHXGnggrx9J906LND4A4d0XESogbVPT/v0jgKUFsiD2H5xMnnU=
X-Gm-Gg: ASbGncvFg0I+vqYFsTZSHXry7buCeskX9VlIY1FppJSjKjhfoiy76/5bCRsji2H+OR5
 N+iHdRVxbc5qeGGPUSMtN4bYdFRo5a6j5ww2CmZQCBBNUJpPXfyMeafaLL0VryUE/2ym//Q85Kb
 vomiebR7zUYUU/O32aFDyAPx5tL30SHMzZXGamGnCtMNhZeFsVnXJi6rfQ87eITArKZT5TbSBe+
 OSvsDYrinRYnuKNK62U1KfKJmhZcok1vTPgQCo9KfyZqe0xHZIU6MpProJRq3PPHzSsZeWFC6+z
 Aub+A0CppQvLZNw/ShJ3Sa5+iDP6407YKYtoXCUdyNd+a4Ri3CXew9UevGEzMcoeeQsyzFY44D5
 aSGG4LAn8c9y6vw6jZsXtvN0Pf5/7tGd4xFU=
X-Received: by 2002:a05:620a:29d4:b0:7cd:27e7:48c1 with SMTP id
 af79cd13be357-7d3f995655bmr2433476685a.48.1750732684206; 
 Mon, 23 Jun 2025 19:38:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmk4ossS3aDlAyhYOxoxigRRcdh8Pf6rHbt2jlN0L4Pq1FMD/jGPhHO0PoS7VAEr/X0dOG3Q==
X-Received: by 2002:a05:620a:29d4:b0:7cd:27e7:48c1 with SMTP id
 af79cd13be357-7d3f995655bmr2433473785a.48.1750732683796; 
 Mon, 23 Jun 2025 19:38:03 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-554e6dc186esm1070601e87.114.2025.06.23.19.38.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jun 2025 19:38:01 -0700 (PDT)
Date: Tue, 24 Jun 2025 05:37:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ling Xu <quic_lxu5@quicinc.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 quic_kuiw@quicinc.com, ekansh.gupta@oss.qualcomm.com,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] misc: fastrpc: add support for gdsp remoteproc
Message-ID: <loeqgkxkep54mrxwchvypqr3omogwpdukgvfc2dwuhp3ilxkhr@vtgxbgdoy2gu>
References: <20250622133820.18369-1-quic_lxu5@quicinc.com>
 <20250622133820.18369-4-quic_lxu5@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250622133820.18369-4-quic_lxu5@quicinc.com>
X-Authority-Analysis: v=2.4 cv=QINoRhLL c=1 sm=1 tr=0 ts=685a0f8c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=lc4KdpPQecCvDiYUKO0A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: jPiYNU6iBjcKp5F9Bp7DMmw7_dSUzSrK
X-Proofpoint-GUID: jPiYNU6iBjcKp5F9Bp7DMmw7_dSUzSrK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDAyMSBTYWx0ZWRfXzii6yfX9An6T
 OW/Dsod8gIk+fTnF4zh15DajW29wejXVccOTSx9LW8I+UZnJJnQ/XPmNhu7Spx9mVKneusmK/DB
 tGpDJSEPik9A6vdf9rMcFNZdWW3J/mW5urGIgzvTXFfhJt9aRxyLnmlTU73+c9eQ5sXpevL75nP
 3eVTYu4mCAbsHR0y1Ccs110MIO1bGISfgiJ22lbZGgrc0PYOfV5ECIZT8gmIsls57E06ug8fVh5
 cm4kJv9onAAMiKva4HF4M4xY8wlXtZHE76vRHUzmG8buZVVI97Ydz4IWG7+GPnJjZK70IFGzZUg
 0xZnr6dIvGjy3dSQDFqFxQKmZCNM4HFL53dQ9JKCYsv72XooUFB9XnOOzTWWTXe5pgxP9qOZmqC
 HvQ1CFbgMXscxUQs6ZCPOIW7xsqomNK/8SH5NF9EwAcCSZ+HflPKeoII/y59T8a3FWtLDWA3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 mlxscore=0
 clxscore=1015 mlxlogscore=992 bulkscore=0 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240021
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

On Sun, Jun 22, 2025 at 07:08:20PM +0530, Ling Xu wrote:
> The fastrpc driver has support for 5 types of remoteprocs. There are
> some products which support GDSP remoteprocs. Add changes to support
> GDSP remoteprocs.

Please don't mix code refactoring with adding new features. Split this
patch accordingly.

> 
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>  drivers/misc/fastrpc.c      | 57 ++++++++++++++++---------------------
>  include/uapi/misc/fastrpc.h | 11 +++++--
>  2 files changed, 33 insertions(+), 35 deletions(-)
> 

-- 
With best wishes
Dmitry
