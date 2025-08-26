Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEE6B358F7
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 11:32:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BCC810E621;
	Tue, 26 Aug 2025 09:32:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TtYTmx7o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE03B10E621
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 09:32:42 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57Q5XHuF026626
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 09:32:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=yw7Fk6HJCJShlv2t9i0lzWI2
 sWKEgdH07td1ipZYTIs=; b=TtYTmx7oQltxw6Oc38y1ihdCLJNaDUO/XHkY7JlG
 iPA1iHeugl7VmWmaaonhvIPPK9qZhmH3WI8oZAfLk6S73i8tvYZMWCV7mW7fC20q
 IaQeEGyhU3G1TQL5c2DbLUz7AZBanjz1Np68EEFeS0eFhGg8xdw1GYTGR2umic8y
 1G6HQ3PHk5H7Cs7dQ3v7/oeu0ykQ3XwpRNspfepw1o7mEx4AfjkWALD8xJjhB0Be
 1GTW83bNMF8D6S9K8uYTymXR2Er1WkB6zGBiTEME2wLXtGn2wgrD86vftJh9rElT
 0pM1wD25Bi916ScgX4hSJm8Z5bNOk594j6DhyimubANMSw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5um8cd4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 09:32:42 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b28434045aso214983031cf.2
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 02:32:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756200761; x=1756805561;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yw7Fk6HJCJShlv2t9i0lzWI2sWKEgdH07td1ipZYTIs=;
 b=ct/mLAzFxTx+kU2wI9X3V4CThACS89brtN5UyYZLiMTfiTlKvXiw9W56FNNwHCL3fA
 gDEfBG44OqeRJk0U4PvQ75BLnaCt441dUWHfrEt2Jv65djaxtV8UmKsV7v8z/IiCOGBF
 CCcdVXMdS4GKwBEEzUPbBilkfLDR099oXYqnQYgbYTU17PGPh7M/sKKs8CfgDCqPiIpM
 jkxw4ImVJ0IhFH9qTTjtetcmeTqSRN2fEMCUaYEW2dKNj+V53MyXF4dglLJ87VSBvbPL
 EP7aEaD7YxD4y+V/27l2vySlAuE5mlZq2gG2MRondJobjvkLdColFqJWfMl0zcIGmb3R
 aqIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9+qG8v+Y+gbWqYoVhmhEP2Jqw4ec5euqQCAWPxOaXRiKxWo9MaOEHY9TfiOkwBdyMO6Qin3rSMEI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7NGdcaTY6dUDbDQTFvlIULApDIps8TIeTSXGw5xHbAgftSJG6
 hO1Hcctwts0N0CbxS8vUqTC8o/cELtUdXU7GLukqr7zimKtcv9s1KKeEMJvkBXMnYMnTURynz0e
 EzburD5g/tfuSZmh8DeFKbBzSRDicrbosA5O0uNGSyCY3zWu/Bfl6lNGFgVKDxo55pQm+tms=
X-Gm-Gg: ASbGncuNcC4BiJGdqVxkJV6VTezMoB9jYw9Ill3l+0GM56y2J+5FA7hKILwZimc0cMl
 +ffkfmboNXjms6qs/wOLzXdHChR8ycBxsFlVrLCipBNSXw+gQTzL1lCuQ0XRHzWWQsQ14m0tsxu
 pnu/TcggsUbrCwTEj0YbAcEyeN98a5nKFiG4e0+bq4yAB90OtqFwm835E32bTs0b9PJKSxHB9Ec
 itM+y2IfwXZm+RI5THNwKeVIOSvxtUgJCgmjvsrB4Ub3IFL0chFDswOAXuQ9Hjp7nXvci4xw4iG
 InFHf2ThjSkT01gX7c21PDTfXZBC0elxD3g1NSLqLaXERdrc4rK9moRWKSt7T7qm88wylOYCB+/
 iXtm4YC48cYDMOMeFQaxMwBlxUpioxpZNJgDlJ/lDSA6h7/avNlrQ
X-Received: by 2002:a05:622a:544d:b0:4b1:c29:22d9 with SMTP id
 d75a77b69052e-4b2aab66b5emr196220531cf.58.1756200760488; 
 Tue, 26 Aug 2025 02:32:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/Pd9IGXO+XQ9K5LfqZoyJqKQgbNRBf/lZhXlh2ogmR33qnivK3QzAsXMGZxpxVrpfTu0QvQ==
X-Received: by 2002:a05:622a:544d:b0:4b1:c29:22d9 with SMTP id
 d75a77b69052e-4b2aab66b5emr196220251cf.58.1756200759935; 
 Tue, 26 Aug 2025 02:32:39 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f35c9a1efsm2142240e87.118.2025.08.26.02.32.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 02:32:39 -0700 (PDT)
Date: Tue, 26 Aug 2025 12:32:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Qianfeng Rong <rongqianfeng@vivo.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Antonino Maniscalco <antomani103@gmail.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: fix incorrect type for ret
Message-ID: <m22aqeeviic76y5dgo6xgvlc6y3nl6xa34gnznp66g4exkgtce@eu2ta774tekb>
References: <20250826092047.224341-1-rongqianfeng@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250826092047.224341-1-rongqianfeng@vivo.com>
X-Authority-Analysis: v=2.4 cv=VtIjA/2n c=1 sm=1 tr=0 ts=68ad7f3a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=1WtWmnkvAAAA:8 a=EUspDBNiAAAA:8 a=b381tfKDLOYfEgrzl5gA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfX3nwoG7MdX5m8
 YU1PfbVCWXXjczHJylR5k7gsLUhRvLtp2DlyjxKlMI7+DdZb1Jvm6rf2VcM5dA5WYx3ktSf/I14
 C1V37EqZqsdDan5zFUUcW6QHtGfi2mIF5pJFR+9wr9fSb6QAzo3gqphx25hDpuL9mW9o5UmbSNF
 huKrmz2mi2zgwL+L+aYJ/IAiDZwTDNl5woHt8Cuhm8iTovuCfzh89gxcCGzV0kQWlXxo2j3264x
 RXMoGQFuwlLa0WJ/53M7ZU5EOsF1a4gX+FiJa6D7a/hyih+uB9MJgrkgKRlKNo5zhKitTJ+Ewcz
 U+igyNBzjlRFVQLwKJhuWxcRLs5gbhhQ1/aarRMgMXeiPniHJY78dZjfdoG8QcFzHEgXJg1B498
 wVj9VFz1
X-Proofpoint-GUID: RalOTbMteBh8uwMX-JlzVCXholxQFcgo
X-Proofpoint-ORIG-GUID: RalOTbMteBh8uwMX-JlzVCXholxQFcgo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230032
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

On Tue, Aug 26, 2025 at 05:20:45PM +0800, Qianfeng Rong wrote:
> Change 'ret' from unsigned long to int, as storing negative error codes
> in an unsigned long makes it never equal to -ETIMEDOUT, causing logical
> errors.
> 
> Fixes: d7d0e73f7de3 ("drm/msm/dpu: introduce the dpu_encoder_phys_* for writeback")
> Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
