Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A9CD289CC
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 22:06:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29FEA10E7C7;
	Thu, 15 Jan 2026 21:05:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kt2BpJnn";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bdwc1rP5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A966C10E229
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 21:05:53 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60FFYGKk2866215
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 21:05:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0yRH0jhM+jYWwNefo6O7EEWAY8TK9lDYV3nnRimBBgE=; b=kt2BpJnnIOPLzb/t
 T2pQToVIm4jefcFKAFEYgb0B3YH+X5CDOVZEUiMybZNAXiR/gI9BELDAiclL/ekt
 w78XrUzdrmPmC4w2FvkjprATZ8djSOYZE/CbPO0Pq3Wlf0U4AjIasTLI9o8LeB7M
 VRBOYqCMmZXrM7oITIn+IW/RXRICEZrRXolJ5BJE3LPxyKUjX60tP1Ry9sn+WgNb
 xpDmcjD/3GyabZdva9bylTKTgtHuiXheAKseI2cZ2X3+F45KNjaL8in/KoIQwmm9
 eNxeAmTXXGEuUSu2rQT2MXjRc9g1juOY/1umNc+EETJorixJ5pTg9yvN2YYzZomm
 DVk7Ww==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bptu2jfga-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 21:05:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c5e166fb75so335628985a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 13:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768511152; x=1769115952;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0yRH0jhM+jYWwNefo6O7EEWAY8TK9lDYV3nnRimBBgE=;
 b=Bdwc1rP58dwC5yZkqX+kzylYGitkZvPiqcywdiT7jiH+6fCnzliaNl1YlpFyavUcpb
 bp9QI9Nkdji2l9luOXxefNgQcHzj7uUy2xWgVQdstC9vluC2c8EKJRYaHhzi1suFo0kF
 V9K0Z6J7TP/wGMcD6L/p6HbD3e/SmLOCPzDFOL1tjb8SCKZJvZ/govQQ27TIZ6cVZaM1
 9cxtJW3ixLtEDf3R6j9a+TlEa8hO97MifhPgFDEVsMiqv1Y/8s27AawYsLI3iP/K0wZu
 1gjvoE/4nPUrDNMcOgP7efPXV2pdPCLKQxoV5WKn7qGVA1h/eoMi4ZLTDadprayC+nzy
 6ObQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768511152; x=1769115952;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0yRH0jhM+jYWwNefo6O7EEWAY8TK9lDYV3nnRimBBgE=;
 b=b/fNUGmcvasw9UpgLUTqbpWPvnC5UThFlJBH2qieQol5xix43qcyVW93DV1ovFSakL
 nsq0GwXK8CDa+NaP0UepZG5z0OEBEea18MZCbVCuGAwko46K9EBSelNGxdFwSITnKCy4
 HxWgyaMpuVkTLJ18xualm8p4o4JxGO7Js7sLaCiyZsPw653m+bKuetBw9mOGwTOaizv2
 aDrefSC7O+fjBTP9in1FDWIuFMwmkuYBMkKEFmrb5QIcU/A04321pj+5EzRoBoyKgFPH
 ij/MDl0eL6leepa3gekh9F84Y0jMzTdmVZoOM6YdU40lrEgH9H2mSAgDtXGrL55cvq0r
 Ko4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKWvu3ustlqBFSRrvYJu2LzV3G/fou7tsNM81POt4+/iMAaXirUWk50EIHXOOud598skRQ+M/riXs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyCE6XdDLkIU/OwIAgS1JINN/hZZ7jePWfqsgTr2jn24DnRrsPB
 6gRDBJw9f7EjQL6WCkdtDqk8inJK2LZOygiWPulgfkCSBjiqKDyY7gMznxjb5ZtIEgk+sPPd45a
 JG/VmD+Yq+1Dgvg2c6Rjm/zDWzCj9DV1lBjxrqWz0X2s/qKXH7g4P5TaBNpvp6NdB7sNck08=
X-Gm-Gg: AY/fxX4f3nlsewWQiHzobGofkTlYV1ow6B28Lyi61FS94ukz43yBKY9GcMlubbKb8t3
 BhZujIz7mBoSci6OXKu3wpOYXxJ0zZ8vr6iK87l5z7mraS8JftEyX715aaN2BEj4eUUFKKWmxKI
 lzFhv3Gk9Kak3Xiv8Ag4klrSTl6ngweqJkMqFe1ZX1nV7YJmiU2V0ANxh6D8KqjWAuM8BTP3rGM
 Sz0IshNKVfxU0/S6s3zJ1HbNP/042HL4318EtXvlSRrgaLrTeHjluobHMA8cJO7bdq1bWBZYW6I
 3CXoE/2A8OHAC83KSmnAqnQHdSLVat1AYWUQzHoAQIADSR/dhlzU4F1BHmAr/dip9xE8sqsCjMh
 6AyS8NfAuU4pb6SNI1OcnXNQ7M5IuMmQd+hKw5/B4CfWdTfYs+nfu8N/NftxLt26kXg6IoYlGAx
 YXDaCOUOx09xSM7/DGuUF+lcU=
X-Received: by 2002:a05:620a:4155:b0:8a2:bff5:40d9 with SMTP id
 af79cd13be357-8c6a66d1590mr131378385a.16.1768511152117; 
 Thu, 15 Jan 2026 13:05:52 -0800 (PST)
X-Received: by 2002:a05:620a:4155:b0:8a2:bff5:40d9 with SMTP id
 af79cd13be357-8c6a66d1590mr131373485a.16.1768511151666; 
 Thu, 15 Jan 2026 13:05:51 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf397672sm155740e87.61.2026.01.15.13.05.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 13:05:50 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dale Whinham <daleyo@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20de=20Bretagne?= <jerome.debretagne@gmail.com>,
 Steev Klimaszewski <threeway@gmail.com>
Subject: Re: [PATCH v2] drm/msm/dp: Enable support for eDP v1.4+ link rates
 table
Date: Thu, 15 Jan 2026 23:05:49 +0200
Message-ID: <176851111169.3933955.17203821768730103962.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251218-drm-msm-edp14-v2-1-2e56c2338ab1@gmail.com>
References: <20251218-drm-msm-edp14-v2-1-2e56c2338ab1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE2NSBTYWx0ZWRfX0RsSCoeOqIxu
 R9m40cURbSLRhXHEzPDIDn8zUUi3ps7Zvi9lr3EBXA/MYSncjpolWXGQQkUTKhF5/8WtPdV4X8H
 En69SL/9sMdBaiFPc0La9k8xROVvyd6WS5KiVWg4wG169m5Ghy4PkS9LrAjLm4Jyp1og5/8Heqe
 UsuO1mlm0mHbfypYCkPahs0WDBsKE6gabTkWKQsnvkfGuhRq06SBTRsWBz2Cw18v9Hn/Tf+DhFA
 kKpY4FAjITrEG3fbJuqgI7iOwGSLDUscBTBo10ZTty96S6m5WfY57UKQ2tTTfmATY6642aGhe5v
 4Xz7bS59RPRebpo6j8lXDCxus4Ta+F1wlC2bpuugr5DV913UFUGhqIyjUJp27C65q/Ffi4fm4tX
 elRqVJFINxMIjcyz7R8Lb7FLg/AyyFlNaX2B3JMgfMM+glB/eGJmlwYTn5ug4qkzCqIdBCi6LKQ
 LCnqz2O9aGe/a9MVsQQ==
X-Proofpoint-ORIG-GUID: nsUjz3ii0GVXcjky7ULeAisVNEgOeO1v
X-Authority-Analysis: v=2.4 cv=W6Y1lBWk c=1 sm=1 tr=0 ts=696956b0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=uNR7pAaoB_IQ8-4UisQA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: nsUjz3ii0GVXcjky7ULeAisVNEgOeO1v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150165
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

On Thu, 18 Dec 2025 00:19:32 +0000, Dale Whinham wrote:
> The MSM DRM driver currently does not support panels which report their
> supported link rates via the SUPPORTED_LINK_RATES table.
> 
> For panels which do not offer the optional eDP v1.3 fallback via
> MAX_LINK_RATE, this will cause a panel probe failure (e.g. Samsung
> ATNA30DW01-1 as found in Microsoft Surface Pro 11).
> 
> [...]

Applied to msm-next, thanks!

[1/1] drm/msm/dp: Enable support for eDP v1.4+ link rates table
      https://gitlab.freedesktop.org/lumag/msm/-/commit/ed100aa239be

Best regards,
-- 
With best wishes
Dmitry


