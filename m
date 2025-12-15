Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 955E6CBFA05
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 20:59:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB06510E275;
	Mon, 15 Dec 2025 19:59:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="N5HhAvWl";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MFE8v4Mr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1229710E272
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 19:59:39 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BFBSt1S189422
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 19:59:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=xUvRut4LPhcQJt6yy5jfSYri
 t1yQjmZhCtes6R+h94w=; b=N5HhAvWly81DWc1ywucHiaiDbJNdbpU4q9DwOJEZ
 D7v7QfCtRtHEB9D2lNlKd2ghF1lmxEQ1BHxuBtqPK9nrPuTKNKNpUVzSVO2z/Vay
 VeZiIQa3D4o4w8w395LsQ16cED9Qv92XHMIfzmmZ2NgK4lkTq73QtjA/iBAPghts
 Q70EFbGGa2q9nhuuF7B/ovMfPFrSymyh0RHZRUDdNh8DwH/nOc0m0yxQwEzbMp4q
 PTfN9gbU60WXYxA4edpAuCfttLD4HKbu+IJVmuYgC11VN5unja+ZkL9EJHGZLH9b
 mQgbjJYEdP5K9HbUAJsCpwz9EqoYrrIxKGlm9N56Tqc1Dg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b2hgaseah-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 19:59:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4ee25cd2da3so71827341cf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 11:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765828777; x=1766433577;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xUvRut4LPhcQJt6yy5jfSYrit1yQjmZhCtes6R+h94w=;
 b=MFE8v4Mr2GeHkcxFXdgqfIQ98oWrv4RbNIGb/88Z7a13AeMI+hP9SgkbKcWohEXSkp
 IQtfZ75mh2RjQMhooom1S3x4S06RqpuIMa3WWZpc7A3LFtCdt1gXlacyz9LEG6VIpub8
 7FDlrHJSe3N21O1Ieei6NRdViOmaf6gNKmKzd9iyifLk/z/pCkJ/b3GtdMjU9SKbhdMc
 al2wIe8WkQfyDgSoC/JD3fy6bwt/2SpUqvoGazuCGlPxuTichzrpgczF0cF8/3/WYB6j
 CxwctV0CAqcjMFBtAZVLYqCxMMbvwANn7zHcx+xFbOQedgsWjOIRBC8cHoo03TUl/fFo
 Kx/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765828777; x=1766433577;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xUvRut4LPhcQJt6yy5jfSYrit1yQjmZhCtes6R+h94w=;
 b=o9QmldoB0Xkv3zKACwugew/wD8LBzBRichAd/+phJFfkoW4CT4NY0Ukb4PZPELJkye
 3++SM4rg4P5E+ieNCWCIqmqx+o8RSzdF1tcKvBb8WjPFNmh0+SZ5VcDBXMTmtUJoMwrn
 ArVuvU/3VTqOSY7Or92D0r/JgjHY4vBwjjRVpeJ2fnUM/Qx4vBNJ0eoGrUUjJV/KHPdf
 Djyp5ZzRQAERB5CencXRf8V/wQviummKFHJHmoWFJgkVrDCaJiJ7Uw5fJ562fjYN0Sbm
 BBY8ozb4fk0p2jVk6bUBssmt18RuzgGERLewVaQ4Zc0DtZGWian9Jt/68t81YcH3Yx15
 sYFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjJJupGnx0ZsyfXf2WKyeFu5b9CCLSpINqZIQlXDMvhybnHLxqJqb7nDjqXJ/4kMHwQkbugROUy6Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyNnqNSuJ/f4GcE7YLbEHRiNXtv2RafCEaOi3jWECJlydiSzk2U
 ekV2RfE3zLXDA5YYK6jz6tYNBUmN0p9SZkZ7ffdz7FHeQGslHqmBCA0Qgi6Aykee24r2KuLGiSE
 xR/sxGnemhC1K7XG2KxXFKnA8fexjsIcwTTE/SJXGZH5p0qWe71j1dRSpIKbk8tmbwZtrGMY=
X-Gm-Gg: AY/fxX4PIfCYI3gnttKjCrUQFq6bkTTrsbfQYrVKTr4C8pvQJSW87ODdtb8OzuLbBkx
 LRxrc8tPsjLd38iBsSXaBAGh562/RbpxTzgS0aRb1va0hwuuikCESKnq5M+ZLkkEL6jmMBwH6FU
 uo/PTEg5MYpy9jmJek203Vvz5JSwI8musENzUdeO42a0tbRr/YvA7KJ39et/kBBpHCytkB1NuE+
 W5IEfu8t+LN1ZZuYUm7x9S9BdeHsWhgUlCmwmZvIBJX5Li94nKvPrBPTTe4genVrXetm9TrWac2
 6PxsCB5PwdmvNn/1bBdD+N3/yxi5tOW4bK4Bj3VDBeMC4OfG6RKHrHzHO0KtYo3VvxQSK61DHvm
 5ZYFwHimUQ05H3IkAjypUc3jBObxhhB+c+YBPy7t8fNReeU6dESspvAwKNG6C/6Du7Gqo4kMSdG
 wJwIaOo8i9gAh/K/1Dw/SFL/4=
X-Received: by 2002:ac8:6f1a:0:b0:4ed:b0f9:767f with SMTP id
 d75a77b69052e-4f1d06121ccmr170372221cf.70.1765828777594; 
 Mon, 15 Dec 2025 11:59:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHqqZpdpk/LAjsUwO/CuKVnRywZ44iVAnPHYSr7pn0xdNytnHiFeJJWTaxDzbgkXOhzHtHKLQ==
X-Received: by 2002:ac8:6f1a:0:b0:4ed:b0f9:767f with SMTP id
 d75a77b69052e-4f1d06121ccmr170371811cf.70.1765828777171; 
 Mon, 15 Dec 2025 11:59:37 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-37fdebe61e2sm31399611fa.7.2025.12.15.11.59.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 11:59:36 -0800 (PST)
Date: Mon, 15 Dec 2025 21:59:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
 yongxing.mou@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com
Subject: Re: [PATCH v3 08/11] drm/msm/dpu: Add interrupt registers for DPU
 13.0.0
Message-ID: <rs6cvhftyxh6apvofabt3jgpbguqmfgaq55jue6jaddlfjpbga@sxhofz6qhw3s>
References: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
 <20251215083854.577-9-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215083854.577-9-yuanjie.yang@oss.qualcomm.com>
X-Proofpoint-GUID: v590ZGscgHsbP7QAm9IVeTBeJ6EecoLf
X-Proofpoint-ORIG-GUID: v590ZGscgHsbP7QAm9IVeTBeJ6EecoLf
X-Authority-Analysis: v=2.4 cv=GpxPO01C c=1 sm=1 tr=0 ts=694068aa cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=CTRSWpIYyOKnzFSy8hkA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDE3MSBTYWx0ZWRfX+K2jyoTqE6iV
 WkG2yZX9w1XonBFigzfnfCyn3Jc9YIgWoJZpG+HLAVIhA0krWcY3HrRTFeJVEk/t4V7XEpTyl93
 x1zkFn9k3t1v0tbOB3T3gC+GE54zeDP+1V+CtK68eZaTjUi0sYDPUwNTzl8XYkrDaHuEgk36Cak
 I4WISka5xik9OVLY72N6EIrNATClmBmjclW6uyvfsY3Ct07lkXe/yGhHAQRFZfK783k0Lsllab0
 QbakOVNfOpyzoVLRL4Viqe8Ls2oSH967rBqY9TiTsrka5y0EEVug2B5ODUi5o0Tp/rkMe1Zh0t3
 nqBzH0YGFlr67AQX9WgK1qlqzXd4N7pLzHGb2PPOYTGMcC/bbGLrfaFCZtXdHFnA6I4ZliChBhO
 ce09rNRaGOpZyIjWiCbewadgiJcQ9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_05,2025-12-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150171
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

On Mon, Dec 15, 2025 at 04:38:51PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> DPU version 13.0.0 introduces changes to the interrupt register
> layout. Update the driver to support these modifications for
> proper interrupt handling.
> 
> Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 89 ++++++++++++++++++-
>  1 file changed, 88 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
