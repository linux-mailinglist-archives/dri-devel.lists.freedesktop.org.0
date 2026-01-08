Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2EBD0375C
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 15:45:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37F2110E757;
	Thu,  8 Jan 2026 14:45:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hElMPaWp";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="THQmiDbA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFEE110E756
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 14:45:54 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 608EfNIp1838799
 for <dri-devel@lists.freedesktop.org>; Thu, 8 Jan 2026 14:45:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=pq2wpHyoeSeo3GqHlkYEI4kR
 dN2xjLc7p2A7VL8bab8=; b=hElMPaWpSDnK8Nl8T293takM/9sTGm+HwaY6o1Jg
 TYLvhwxU0qLR7N21twWwDB9dbQcH0YpCAsnrJ+n/78w3UaaQGh3HzOaCm4Vhwtn9
 +nogCtGxpb38KlvyCqI1k9mKGyBiBkaUKEFkG2RpuY1Oy90HHI/g2r7IVNwz95CX
 lMO1JdmAzquKjonEadUKAT/KIDZ7YYICF/MFpkyLfUPKhASu1oHDYQZzS8vXjIOq
 Lb7QwxQ74NgUZ/oO3Zyroq/mE+0C9EGMRthaURzydqwp+eq7EaeGoRfvNW+DGZ2W
 Tn3SQOz3i1rC+Vz2dv8BoChN3VJQSeaXG9oOWBGokkEqFA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj8921a14-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 14:45:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8b259f0da04so812820785a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 06:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767883553; x=1768488353;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=pq2wpHyoeSeo3GqHlkYEI4kRdN2xjLc7p2A7VL8bab8=;
 b=THQmiDbA00LDpxDqKUv9tNnddLH6n0UaMVH6pF1LIAyXD9AKE+LkxKPrqER8WnPJys
 yp/7qraZ5kXkwsb5Cd+mHqlH+GstH1fvGC5guNAYjtI4fQMKEIZIdVDS2Fj85HDk+w9Q
 G37aAARDoZG+dEWJv25PtcH3ZsNE8RIXyP/n1+ADzN1EqjkXJzDuo1mSt3ULFgNyz0Kh
 qM/YG2b+y1C+YraQpukTWL6M2kef22MSs8LLFrGq8Glm10W1eaIWgH62ScAtk/k8EB6J
 BO8WAwhRdV107R6dMuWLeZ2UeHv4nqktPrIKWuxRFgccbBIuQPQFG6n5lj0GXn48T+tF
 uHjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767883553; x=1768488353;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pq2wpHyoeSeo3GqHlkYEI4kRdN2xjLc7p2A7VL8bab8=;
 b=Kgu1BObxaNtvbQkOIqSI5GLQOMpAq4lMpFtcFj3b03RKv/xOSI1+J+soF/jG6GCXC3
 FtdyzrFK9//T/SfelS/XFWpR+E5IBY3HK8AQkWjQOpN0Il83G5NKTmqORfdC5Y8GK7SN
 5/oaVBGaf3I5boYV24RnTvr/IjvKbqC9fBZ0/+9zZhxr9JvHNlP3u7ERRWUlQ58wK2gi
 BPC8B3Bft6OBCzgLUOC1L03KbjhXBiXIgaPY0mLvvzMnY5WYptIzc8Qfz2swQRC5Aqu5
 hHjoVUFINVn3HleNeRp7mDnRhQRUtCZIXvqXEDe1iCDefsxffJcsYvp7roTeqoO+IHt8
 IAaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtWees3hAXTBhjLMwUvQ8dSMKnZEDOI/9I1Ym+FY+w4i1gl64hTizFOWkrTGNyw7i9iOEZOHBn6mE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyVKZUGH+sIFfyFNVH1CziW18DNnVKnxLrSrga6i32dExc0CqxU
 k8TN8L8E0+GTDkE+or6hcTCbNRhgDQZRPPUAu0nFzTXmy3qx5Kj3SGYg4Y250gOPGfOaoTYNMrf
 f/zb/ozGrTw63GmrCtAjvNkVHgrqQk8CRllj9oRMEA4jtx1w6dTbsQ8bQDdOEpFgi+M+YaoY=
X-Gm-Gg: AY/fxX5fpUgWFLLHWqmb3Eur/iRON6qXS2kREsJOVdsrfSnrg5RKWeTS+OBkHkPNWhY
 joCecDXrNqU+VupEbc0SS/dzvUAh7fNpTlVcbQ0x2Yh+e4K+CQUy3UUZ1dfPdetyXXaO8h6bauM
 vJhNVx6wcTcHrrIGnbIbyhHPq5M7PURWx0b8573Trzt48ZHIqdhV33WnvvnDT7PlA9NsxVyUiAd
 YsgbHkL6FXGuivvhgKuOD8DzIKY7Y0sxTP0sHsOpPuY1TZyXfgsvoRZtxvbaFKgG6S50YScpaUw
 gsq0iI2hZNmdMG+0o+dVOUmaLmzdTFwNxo6v0fp4LuyzrexOkd/HUo2q0oE/zqu0Zt8Fax7fzVy
 52qdogjsOeT/qm0cymf/VnNZsLRHQ6SRDA9TrQh2yR4wepg96w713Ypzwjwu8+kAVp0iDTLRasE
 bhlt/aW2Rfr61sQTRkla9RZeo=
X-Received: by 2002:a05:620a:3714:b0:8b2:ec1e:fe24 with SMTP id
 af79cd13be357-8c3893ef768mr859429685a.42.1767883553354; 
 Thu, 08 Jan 2026 06:45:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGwxcTdCeqYmfFw81rrVjX1o3tZ6HAubMUWOlK6ohdXbyRzc6ZAmRhgkWfEBnW4WJG0MWoThw==
X-Received: by 2002:a05:620a:3714:b0:8b2:ec1e:fe24 with SMTP id
 af79cd13be357-8c3893ef768mr859422685a.42.1767883552810; 
 Thu, 08 Jan 2026 06:45:52 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-382eb8ad930sm16527261fa.28.2026.01.08.06.45.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 06:45:52 -0800 (PST)
Date: Thu, 8 Jan 2026 16:45:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/3] soc: qcom: ubwc: Get HBB from SMEM
Message-ID: <you4xijwc5g4ngcnhxm4ecn7opexnsdfayvd5wiiqpl7734r7w@bdkpjqmlzxre>
References: <20260108-topic-smem_dramc-v3-0-6b64df58a017@oss.qualcomm.com>
 <20260108-topic-smem_dramc-v3-2-6b64df58a017@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108-topic-smem_dramc-v3-2-6b64df58a017@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=M45A6iws c=1 sm=1 tr=0 ts=695fc322 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=7S24nFsuF8Kv7I6KVrkA:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=zZCYzV9kfG8A:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 81wAIIvr25z4hAw3W0dhrAvQg0oT_h9F
X-Proofpoint-GUID: 81wAIIvr25z4hAw3W0dhrAvQg0oT_h9F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDEwNiBTYWx0ZWRfXyxbTFh4U7z/9
 afGLVMpDQKyeQ5wzo/xZtubyNS//hmLIMTmKG89i33xMLxobxgBLqaXTHCPnO4OHT300gyJ6OeH
 APU03/V8ISExJEbraWsl320lJapIfCC/entY1IlrWI+nf0H3n7XlXqUx93kHthnBM5P87Uy6v6L
 SwswH6yfog7WVIvrfUgWQvNUs2utUj69MByrQhTLq2l1xz9GxFrxIq5I8SPZJQm2x3d1+sgirzL
 CiEdLd4fdNbpmZrZEzbajkJiAmwGgvXE0c8BvK4I4W8aKP1gnTs3XU+V1KLF7hQr//r7ZrMNqnT
 4PqnyBageuTdqyk0o07j5E9/VH7EiCXst9j9pocVee36sdZxxPuZ4SOFMUWO7PPVL2mPcVHNFw4
 1uXN6YuWSa2tWyYtZGrOUQohB8QT1DqyMdXcrnoSgTZVc3czEKQI5mK7Tkb1s4egEAmBlx3lKrW
 jUuyHMse9D3a0EGgR3Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_03,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601080106
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

On Thu, Jan 08, 2026 at 03:21:51PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> To make sure the correct settings for a given DRAM configuration get
> applied, attempt to retrieve that data from SMEM (which happens to be
> what the BSP kernel does, albeit with through convoluted means of the
> bootloader altering the DT with this data).
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> ---
> I'm not sure about this approach - perhaps a global variable storing
> the selected config, which would then be non-const would be better?

I'd prefer if const data was const, split HBB to a separate API.


-- 
With best wishes
Dmitry
