Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1991D12200
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 12:02:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14A3A10E091;
	Mon, 12 Jan 2026 11:02:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dK5wC/Hy";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z3GQK1Wk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0476510E0DE
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 11:02:31 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60C7Of1Z555266
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 11:02:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 hgr3rwX6phE1sKitQ5f8gbi3SGsrDPRP11Bp1zyGzhI=; b=dK5wC/Hy7eENKsMi
 yenfvHx2CpdMwHRLCf28CJSwSn8sUDCWIbQHtyE27k82cfXmZhfMTm4UKYFBEPKE
 UWhYHO89l07edcgiiMhUYFIJNmWjDfnbiJ7SA/cDTm2939VR/4HFxPTGuzqlG9qb
 zeHbPAn2VoAVFtWVPiBF9IcVsEWmNE4cTBRbny+1nmj9V792aP9jrUsN309FJJob
 L30nlXaU4EzHDy+BjLKwXJi2KztFIP69cvJUvX/EFjdiuMYArbRggvXalvcdw2dM
 dGNbktdTC++M7oSvLPR8rbAKvJ7DJpHPW9d2tyKqKofQXSLTMqNBS8YRZMVr+YzT
 uM/qZg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmvhw0qh0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 11:02:31 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ee05927183so11581161cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 03:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768215750; x=1768820550;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hgr3rwX6phE1sKitQ5f8gbi3SGsrDPRP11Bp1zyGzhI=;
 b=Z3GQK1WkThDP7nWqSG2qPHEq+1XtOFP/zCFQLUOJAbgxJvzMgPSSUDF5jqn/kNmGmf
 zJNOnshTQvFad0kJvpF8Q/vpUGInHKRjiU3xNh53Fo5qL/lZdjuKiYRAP0vmWm7zGSvB
 It93tbmSfPpfOZ8o9Kq9xLg7gJL+lJjIJVErpkHnqAuJFTLGQjRSCw5QUBjSs01ui4aq
 5uvA1RecK+xJvs1kHozvjRjP9cPLJX8o7Zs5ayebZ0EanmKUjWstBXdg/OdxTNUchZ/R
 QklMFggAhh88+xruLqamNROvV7iaqbRbbsLFxwPNsws8/aVErLU600//S9bNxz38Nw1v
 uZ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768215750; x=1768820550;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hgr3rwX6phE1sKitQ5f8gbi3SGsrDPRP11Bp1zyGzhI=;
 b=Zhu27/LpGuZlBytkNsGKqA22KUfKEjw5A26iN7/RoKeCO2PFxYqoBQ2aUIfhCM/mxS
 EUTl3whjN+N2vSzPHd26ldod2uW4CEXVcJqGaKu66mLgfDdfyI6zcWCNIRPTLg5U9Lik
 LaMXtFdX1WSK6+zvR/N+gDXk4560n8AYvgAyjND1wQpXOc4I/wjgUcnCxTmezp0UVstN
 bBzg3mYPHoAPeqb9SzRH7yk0cZ9fU3d67Fges7SJmVLTfHbOoep5Qu4tOLJK+/XUA6+f
 k6SOpXqPNuspmUF1zFpy9NVtsdmr+C8Wa92HXIBvpSkNedteR/wz3o68lMBJMzzb56ZL
 tNHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEEkTJOzvjQYvPt8HpBvZ3p0I/vHW6kODlWZrMLUfDvSppxJhKlETi6RwZpaDHSNOPTf6bJs3SJs4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxyFzu7/8Mwrltdg7u7orK3ChZXnzUopaHPlWFfxlsACr9kT6cm
 2p0qD0qMHpXmnYlqH/AIhNnaumycaWd394cQWzSX9dIGNFEsTIpmPWwl2lvVjUXBDygY+vseMAL
 nqOf0263bwkYDHAggrIuHNYOTzqiBZnrZ8ihRKLokno8O/ZAF7n0ku+3L5NJt5RY9mbbkKpc=
X-Gm-Gg: AY/fxX5gKwOCjbtJvXRMqlHIYWuN8CZe0y+lHse0H2/evnqxC5pmOgyfrxpK0LEWAnL
 KUeIfDh3TvWzE+6P34B/+8HUmIDB/4rgUfWpCaFd18ihsIyAscEDgrihm/6SXgxEKjfCSLWukmb
 8k9JA/FimIebpLblaPETTEBgn8ezJ9DOq0qhnN2GtksN2w5xzfcc7bDWrQZP27F9fGNqdda0d92
 1LHLShvGyiL3nFPdUJxSsCsAJlOeDTIYo/9odHqxTmd4gcWdGU1YoHoj1dhMkWhqYanr0zDj+QP
 F0dqAubYsS58CMzWYbwod/z0uZnEYf2PNaKEh07+J5wRwvEsR2XcjyUftV0A9ygtxXniV/r8yIT
 pXM+QXzE6Z7skQZAPnOCY5Bi+Vh7/mr7xltWvJ+IeCDzh903+KQJBnS78mD65uY1mMcY=
X-Received: by 2002:a05:622a:408:b0:4ed:6862:cdd0 with SMTP id
 d75a77b69052e-4ffb4a68dc7mr189484301cf.10.1768215750245; 
 Mon, 12 Jan 2026 03:02:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFmAI9yXYwAAD0iHcKhXVU23FUkawySDiFTgiByQEI1XgGg3bSuLF37l4LbUipeTxEIuhvlQQ==
X-Received: by 2002:a05:622a:408:b0:4ed:6862:cdd0 with SMTP id
 d75a77b69052e-4ffb4a68dc7mr189483721cf.10.1768215749607; 
 Mon, 12 Jan 2026 03:02:29 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6507be65197sm17398854a12.19.2026.01.12.03.02.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jan 2026 03:02:28 -0800 (PST)
Message-ID: <3ef982f8-0f0b-4775-b701-d45ac2c05728@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 12:02:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/11] media: iris: don't specify highest_bank_bit in the
 source code
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org
References: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
 <20260110-iris-ubwc-v1-5-dd70494dcd7b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260110-iris-ubwc-v1-5-dd70494dcd7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4NyBTYWx0ZWRfX60GFLdw11SsQ
 Z16N7vS7c901iW8ZbIMLK2ckxVBP+jsUXjKMWW9yaG1HPy/xHa4qQhwUpNgDFoRoMCvQg//Sy2+
 zDp5n/OZoRBVxxO4xbfFNHF4+SUoA/VP+79v2PlS3Txa0VicXkx4o+MGyVxleaBTPePSrckVM5d
 QhVbW1X7vXhYDwu3m/9GLOijmsA148THCNM/qTEaIYgwmx5FAIZ2uuh4GSG5s/B49VqcKFkDNPJ
 dfyVUX71jpEP/7Qa7mwDx0rI7I8DD0y5e5QbSq5X2ZyQ2l0i30pU/zV34p1jTotkXNBiDwlpAj1
 zdHB/7NHCROFQseX4YpX5KG+vi7GGlioGDDUgQN7k7GLu0XBrmBX2NzogBJTRFWv6V5deovjVo2
 XN8DnDAofh6/NgAKJhs18OcRah5ebAn32HcX9JVYu5ejGdIrpRJNI1pwM9dmhx1QpzfRTqq6jLK
 w/B8TlyaKNaCjsimkbg==
X-Authority-Analysis: v=2.4 cv=JP02csKb c=1 sm=1 tr=0 ts=6964d4c7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ss-qTuU1ZYQsC6pQTdcA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: l4X1hDlbsJBC1sqggCMRL7Ef6_hvY-jn
X-Proofpoint-ORIG-GUID: l4X1hDlbsJBC1sqggCMRL7Ef6_hvY-jn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601120087
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

On 1/10/26 8:37 PM, Dmitry Baryshkov wrote:
> The highest_bank_bit param is specified both in the Iris driver and in
> the platform UBWC config. Use the platform UBWC configuration instead of
> specifying it directly in the source.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

