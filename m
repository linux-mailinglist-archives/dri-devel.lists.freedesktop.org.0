Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A15FDAD2354
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 18:07:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D77B10E3DF;
	Mon,  9 Jun 2025 16:07:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AeebxVQI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D3EB10E3F6
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jun 2025 16:07:20 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 559FOuKm006129
 for <dri-devel@lists.freedesktop.org>; Mon, 9 Jun 2025 16:07:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=+qUNrYBBdbGS3K588n15a3kY
 0CudgwuLNgaq06xok2w=; b=AeebxVQIFSYXIjUw8volmoUkk0g7/rGSysTwCnRp
 F+v9rWYratG5A/8n4mAE9aCLxhFJP2Ytwqt6HnFa0Rlrs8IGFJHEEsmNoRPbOeFD
 h4OuYziaGv6R2f2+LYzgia6EYoNs5DZHdSzFj8h4VKE+5c/unmeNES6LSzE2W1CJ
 QwSjGP3nZVobIsI519w6kYg/qYNHKH9hVvduugmWAFXK9aOjg7+RUryvorWbAfwW
 Z2eJTNPQ0VX/0OPJ+CGXJwRR7j8giOBTfgiWOxOLAgyTxGO1DXRfllBTfIrPQ0he
 iJ2VUjqNkrk2AKEr/9PnGZuOZPbnpDYf0CY2xQnB89YLZw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475g75tumt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 16:07:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c5d608e6f5so1139272885a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 09:07:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749485238; x=1750090038;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+qUNrYBBdbGS3K588n15a3kY0CudgwuLNgaq06xok2w=;
 b=Mto2Vyy5rNW4qpgBr/lF06WhgUxcoeBoVDb9RuZqfHAhDKWvBNMxG6cXCUtShijZNg
 D1uL54XqDZxNKqU00kqAtK8ZyBJYjwGzcIERZ/J+Dd9oW5zzSVc7J5g2Ym8r8TR+7bs6
 IJ0z44vtiMgKWrs1yzjqfiPa5YXuFjYG8nGloJj6lJck4AMCDQTJDjXRDPfqB0iWvqPB
 EbGFxJO/5GZ0bRJxxv4SPVT8/O7F41Xa5kifh4bOmxSgl9KZUmasC4zQrFZIIqVtfb26
 IzDPvzeJcY4wy0+O6Y2omitOmUVnPzhbtEjPyPCmh3irUXM2ns8/PmB6DYdVtOE1g2SS
 L9BA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU29BM5PfmCLQxh/3nU47CaZdxBoAgUimlRcn/NJGpeJi7oYq6/btEFCfeO+kI/ztMqZkEPLOLEVCU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzit1JSZBeRbNf2X1YRnaTqYOfUWu3stdZ499xsYqemX5RDBkZK
 OUHdsHwZaiHEnzFP4F72mwInkMqFXk7ZadN/+j93fHBVdRsH6jou6B+bG51KcPjrgESq2bF3bPf
 VqD8zPvon3W99VoVixIOJWZegdLey2JSw+/OCrGALGcc2u3dic8uQxNoxgzW4gl1X0Jl8EWA=
X-Gm-Gg: ASbGncu6ybLzRHDOgskxAm6DDvx5pf5713/db0uhh9I/Fd+rb886oqh/h53M3CHD7Xt
 ViDl7GhPb9M7d/ZwcyjZmMzd80et1v6uBp4WMgbkqL/A1wkjyM4p3Ee03Okf1fM3WkVcKcuIgYY
 UwwmCuVwH+/Lvnexhvdey21XQ/0Xdtf7yEfP1q3WmjuqE2xusXXaQrOgTdGTLJzE5RrniniJjQN
 bYuYUplsQMct36WYQs5C6EmLLYpxTdK6sJ9yD5eUhFeXCLcdJRsDSCiyaGK7dOdLdZrg8RLnLRo
 Vkq/4hInW4oQsPY0jxOEfet6fGMykoSXVluQ9lsRUEC1sWIBD5DbUr1Q2piIhRXQnMySeygfmF4
 =
X-Received: by 2002:a05:620a:4513:b0:7ca:cd16:8fcb with SMTP id
 af79cd13be357-7d2298d8a80mr1961966485a.37.1749485238166; 
 Mon, 09 Jun 2025 09:07:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVYJSeoW9tp8i95NtJeZMS8aHF8ENwAwCrE9FAY1YpPN3brqQ/9Ah8IyaKKQghe8Xs6Opplg==
X-Received: by 2002:a05:620a:4513:b0:7ca:cd16:8fcb with SMTP id
 af79cd13be357-7d2298d8a80mr1961962285a.37.1749485237767; 
 Mon, 09 Jun 2025 09:07:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32ae1b347f2sm11561811fa.29.2025.06.09.09.07.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 09:07:16 -0700 (PDT)
Date: Mon, 9 Jun 2025 19:07:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v2 00/38] drm/msm/dp: Add MST support for MSM chipsets
Message-ID: <h4zfn52i6jpfbclylgfutdgow7wm2hyl4urtegwcqiw5dkhwef@cfw3fjus4tq5>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
X-Proofpoint-GUID: CWOon_421gk7OKj1RE5jVM7OaoVoS8tu
X-Proofpoint-ORIG-GUID: CWOon_421gk7OKj1RE5jVM7OaoVoS8tu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDExOSBTYWx0ZWRfX0Bvs2LR+oq7q
 fXBfTbrnkTyDaicSND67dKZiKPA8Z4AdcHtDclMEVtOT1K2INs9Ke/tR0GUCqv033jDcA6MQqvW
 i935ZMPn3s+2lJKZIXzchC94g5EM8HGA5Ib5+P13zfnitUpzJOqATuBT+ewwK0Eva2rOqZ3iX04
 k2ZlraOOOWAC+KRJoyM9F9eQfpBSxlSR96oI9XDeUhawUHkMfymv2JPBK7ygmwAXEm+V9crnfR+
 gfyhLgwC2P+n/WIcbiLmK2ItQM/w0F7sN+KD5IprXpdvAyp8d3IE/9435y6Fu8vODr2IeMSEYmK
 p6T63vbS2nGC6aSV5pmCDRwaLB0rvx3pcnvohDeG9f5GQYnhXThxH/saWBEmgwwf/+OGy6bm92U
 ELPU88xNql283/ldOPyHSQyh2utoBpxycMmtxzFjIa0bXdtrF6571iy2JfLHS4QWgmsjZHqo
X-Authority-Analysis: v=2.4 cv=TeqWtQQh c=1 sm=1 tr=0 ts=684706b7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=9hUQRU07m4UGofkZ2RUA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_06,2025-06-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 spamscore=0 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0 clxscore=1015
 phishscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506090119
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

On Mon, Jun 09, 2025 at 08:21:19PM +0800, Yongxing Mou wrote:
> Add support for Multi-stream transport for MSM chipsets that allow
> a single instance of DP controller to send multiple streams. 
> 
> This series has been validated on sa8775p ride platform using multiple
> MST dongles and also daisy chain method on both DP0 and DP1 upto 1080P.
> 
> With 4x4K monitors, due to lack of layer mixers that combination will not
> work but this can be supported as well after some rework on the DPU side.
> 
> In addition, SST was re-validated with all these changes to ensure there
> were no regressions.
> 
> This patch series was made on top of:
> 
> [1] : https://patchwork.freedesktop.org/seriedds/142010/ (v2 to fix up HPD)
> 
> Bindings for the pixel clock for additional stream is available at :
> 
> [2] : https://patchwork.freedesktop.org/series/142016/
> 
> Overall, the patch series has been organized in the following way:
> 
> 1) First set are a couple of fixes made while debugging MST but applicable
> to SST as well so go ahead of everything else
> 2) Prepare the DP driver to get ready to handle multiple streams. This is the bulk
> of the work as current DP driver design had to be adjusted to make this happen.
> 3) Finally, new files to handle MST related operations
> 
> Validation was done on the latest linux-next on top of above changes and
> both FB console and weston compositors were validated with these changes.

I went about a halfway through the series. During that I noticed ignored
feedback, missing reviewer tags, invalid or strange authorship / SoB
tags, overgrown functions, one line wrappers, etc.

Please rebase on top of [3], review the patch series on your own,
removing / reworking all the bits that can catch my eye, implement the
feedback, ask questions where you don't understand it, etc. After that
please post v3. I'll most likely skip the rest of the patches for now.

[3] https://lore.kernel.org/dri-devel/20250518-fd-dp-audio-fixup-v6-0-2f0ec3ec000d@oss.qualcomm.com

-- 
With best wishes
Dmitry
