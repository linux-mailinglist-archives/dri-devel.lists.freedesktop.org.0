Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F261B0A97D
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 19:28:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AB8210EA28;
	Fri, 18 Jul 2025 17:28:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TOjihzHU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBFC810EA28
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 17:28:41 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56IFfAgb000598
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 17:28:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=f6yNaiRLHAcK+6GC8eMfTdPL
 ypI+sKJ1RhRN3e/m+tM=; b=TOjihzHUobpA6dFi1+++Hpb9xgD+bHm3xJHRqLqd
 CV4XWt9vKzLLg51HQ9F+OCmYbxK2s8LfdHOPNyCjtr+1qujPhZivZxfVHGnTjjIl
 OCg6TVvyjhWZvUYXTpjTQy6AnCUtShf8RUcL/+rOxqYWsRRNj6AsyyczA/dT5D2d
 SNEl+EFiynDyIT/mDLsDmGQOhE8CAwmg1hhv5IfU7xzibtcW3chHD4isF52Gqomd
 APa0HuB0GLjFDnwYzvB3859uVjnGpRro63e7kUcI29A+bs7Se991AjQiw6jGc4Uj
 g9fIwhGe8Tt5vJIWUu7P5yCA3kmo+l21eoeKHIlQcDJaDw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dryfy3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 17:28:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c5cd0f8961so424042685a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 10:28:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752859720; x=1753464520;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f6yNaiRLHAcK+6GC8eMfTdPLypI+sKJ1RhRN3e/m+tM=;
 b=HBcURMEWXStJ4eEBA5Qo1dznjdxJGSsiwXiBH9LJQGbrKxUibGP9GqwXZjJgas11Rx
 3lZq8p19u1ESD5gy70+4BUu+IDqvtg3Yf1Bmm2CI1pAfq2+BnpOGVtwRwj8EWQdgSmLy
 Lbredb5kiCXHIfOb33Q1kf33AUiQuK6kAl8QncLOsnMcJpE661OqKr0X7bNlAhkg3fOS
 EKP0Nj1u99EBfNdseszmq0ZfB3eTlozR03CqXGgSUWl6U3Gy4dmQGvYBHxjYML4G4r9S
 iijF9lKXk1ncJQ1lHZCMzM8hTUpXenPQ1Y2PRTCzhpfUwhmO/c/lRbDxKFRmqXwrRH+C
 97+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXm8ps8QJhz5tLyMJU6vvL7uvWaK6fQrh9zplbGuFHNVfiEKuxdCSfoMilnDs/LnPkY6gG+wiAW+cc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxW6NLSTqLxtcj9Xn2mvbrV6c0oV8FwbQKwhufo4TdlqKxWgIn6
 JiVz8u1U98hEWaFMyqft+wkBgLnB185qkmv0jR5/9QxwHXZ3DT26lGPHj2amtbV1tKp7U5j1zRD
 ltnASi450mR+I4CHKSnoA0w4nwGbQJqdp4UIi1zF+H2Y41CvY7FY7ON1G8PwDGt7wvbOVfhg=
X-Gm-Gg: ASbGncu+LB+wVf234Sc2NfJB6fEG9UvUpRT2p+nfgApNvdQbVNo2Qelb2A7myF9JC9L
 Y2RvnmmaJsT13VILSNm0duGbIDriE0Bt5/J+1aBt6fxSBOvL9y9dVcfR+x8DVF0oDPJ0E2aSrw0
 dLTTCSBXusYHIxI/24cHyB1gBJ7UtCbaUBFusBSSNuiP6O9IjPIfFc7UVciXdWOkkmqFlyMMJQ4
 faSc8q2bfxrP6Ekw8eIKu/E8RYujOr51xZ0DUI/k7E8j8IMHtADkP7kImeTAwwRPI74ZXwjOO9k
 eHHaHO2Nbj9uJnObX2kdoB6GaWqodWVGqizl+Co36RfMvp+9bBKh9kVI/ssLgbGuX55Nw/LPT13
 QwFJkzd8I8ikIaFM1y7FH5kxHf5CAZXxxoEJFNo3IB1luGt8jgorA
X-Received: by 2002:a05:620a:4088:b0:7e1:538d:5c5e with SMTP id
 af79cd13be357-7e3436253d2mr1626777585a.46.1752859719433; 
 Fri, 18 Jul 2025 10:28:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1w3sp9zVGjYWBmgKH917pY8I7F8sCh3F9gp3Q6iMWVLnWjt4QkDQ8fFwWBHnJpBaRVJQW4A==
X-Received: by 2002:a05:620a:4088:b0:7e1:538d:5c5e with SMTP id
 af79cd13be357-7e3436253d2mr1626770785a.46.1752859718706; 
 Fri, 18 Jul 2025 10:28:38 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55a31aac76bsm336325e87.68.2025.07.18.10.28.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jul 2025 10:28:37 -0700 (PDT)
Date: Fri, 18 Jul 2025 20:28:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] drm/msm: remove extraneous semicolon after a
 statement
Message-ID: <qjvxpdibdt76vvw2capf6mupiuqvjlcevtfl66dkqp634ot2zd@eau52bnkh5ec>
References: <20250718133404.2047673-1-colin.i.king@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718133404.2047673-1-colin.i.king@gmail.com>
X-Proofpoint-ORIG-GUID: Zwl5-0NHiFhN6HAULX3bGNipYrEJKwP5
X-Authority-Analysis: v=2.4 cv=D4xHKuRj c=1 sm=1 tr=0 ts=687a8449 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=xHVDqe4EictJAN7MuBgA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: Zwl5-0NHiFhN6HAULX3bGNipYrEJKwP5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDEzOCBTYWx0ZWRfX54nnzfvvITPp
 A7C8iBM25tVQvF9fIDAYor/0e0Vt11VC/dPavGaovrhXAwBRdL55jlnrTp8uxN6VdgMK4T2weJJ
 LHGEnZOZ91t933zE2Yz8ZkUL5fOu4AtCdVFCdlw2GHN6MkuxuHuXh0Gj0Ym/bBP+xfD3idHET9J
 9NVQbP89QcRE6jy771ux4qerntw0htMRTRaJpUz+H7mF4Q5ht2nfroYy/hY7eqOqv8ZuwiRBVD5
 nVx0MajM+hjGUVWl1qNPePYd2Vc+OmYMaS93mNhO+nEzl9Wb3JolwdUr/ks3FKhWQiA+QgiYhzb
 S4fugqV33MzqlaOmK5q+D5N+cO5KYLe6RvqtlkiIFN0ycquG3fBEKcZja6/dpzkizJNr6wESdaI
 Iva7wiDJ89nFndiN+CjDCEYFjyfO2OyXxC73nN71feZ7+4yuOxD7MMNgDtNPwpuuWKFL518l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_04,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=806 impostorscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507180138
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

On Fri, Jul 18, 2025 at 02:34:04PM +0100, Colin Ian King wrote:
> There is a statement that has an extraneous semicolon; remove it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/gpu/drm/msm/msm_gpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
