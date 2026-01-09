Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC27D08323
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 10:29:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B96C110E848;
	Fri,  9 Jan 2026 09:29:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LkuXLcFV";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W4giTUab";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59C1410E848
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 09:29:51 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6094rlZ32765536
 for <dri-devel@lists.freedesktop.org>; Fri, 9 Jan 2026 09:29:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=rRpTpzQR8ExrbdL/F8XL9JZf
 0Q5dvO5YHpixCRZhmJ8=; b=LkuXLcFVJVGueu+PgdtFAUc8KLvOB4MDXyDRZDUt
 fgbw56l0wty9ZvEFcoyYO0c9CEpgKtdvciLPFOny4keFVgkY/OtNfTo4rww8/cVz
 xqeYdsprJGbxZfFB9bObGvjgP4R7evezj33MjETENm+Kg8zY8pllhOxpeds08pom
 t18LZsgGR49y3d4S+6jlONqTb7xTNAOrq0Kg3kl5/Mb1lb/5UnglI/Krdm3J9fTL
 iMkipS5bx7eLzqFi7XozK2vwmreK929gToAbIgJobfA1BnkJF8D8VarVdvw/PK2g
 lETjgihfnOanC/azuvf3KAUi+H6swQy7G0ptnsrvu4ptIw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjfejtt7w-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 09:29:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8b259f0da04so1017003485a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 01:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767950990; x=1768555790;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rRpTpzQR8ExrbdL/F8XL9JZf0Q5dvO5YHpixCRZhmJ8=;
 b=W4giTUabW+nx9wM76Uu8kv0m3aEiWj3ndZVeAiI5byOHGpLHDtUhD5pvQfsO26UfLr
 MxtqbvINoTmUl6/Hh5vbP07KY0ZcmPIYPMa2iOaNrDaYL1xl07PoeIoTLDyMQhDmB0vQ
 eYInKXTcvsfRh37ywBcXvxLm5LMnXw1dmDw+TZGhtNflv4xrHYyNrbE9C1WuTfldcOTM
 650ZI8INIQxb/cSZyoLhP6t6NhSrXuFYsJyiaeaKSd+ookM6lgC1dvf/8MGE4Vd1hhRG
 0WdJwlFq/gh4selmIySax+9vNZhjAQ8Fhug6JYHCkmDBe9pVrkZJ3nyZpIPVjLrcM4aa
 CpiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767950990; x=1768555790;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rRpTpzQR8ExrbdL/F8XL9JZf0Q5dvO5YHpixCRZhmJ8=;
 b=RxX/N/ALQaqam7rLV0Nc37wbTwDy6X3kr1ZVeEOjgWu8rmXV0mImAoGlqad6N8Q7sO
 ifpYH/ShXC4kgmW/ec6WFz24U/8xfQD8hdXDW98qejOw209iFRKxj+b325AGUZ1/HlvJ
 wKB2EFB7BsSEjRDATRpn2j2seaakmtFvX/aZ4q3J3g3oTJ8S4ZRGmPhDwUpQNby4Way7
 60FuUlaZvcizUVBkWGuPwYpKt7eKqnW2qlcXYPKf4xps24LdlW2kvdTA2kcscEboKUX9
 StjTzIiHbbzNGy7FjsqasApjy2YK7m7LbG6b/15CNCLLnIqtL1Kakn632VblLJVcTH0K
 5obQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVl3qLRP5/P8KKRTvBzUCTX1xrpUYbFL/Ns8RGUJn5oF7cFCPFv2Zp3YsU5nBmMbWUolFOE3FVBZjg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzA87MpiUVgnP+mZ7l7M693693+aYCea4qKFr/3Gqim0sXpXMjN
 ITXZCkHPyR5T2ySzoS9AjUmLTBQ+XykfmHfjiFb99sNUcQRJRw1a5Yt7HhZuMcDidACaidDZo4a
 nKMFwg5JnDS45I2ehBvnE5tD4rfds8g4rQB+IjGAAKLtZqdYr52QHaEb4Y9Sai0JlwmRAsCY=
X-Gm-Gg: AY/fxX740OlfkbjMWMVoSWahH8XLn1KiRRRfg1B7aXjWEcAH2EDG9udcstZl70iD5Y4
 SPC3Ejo5u2DunnQytZ8hwDHu9uYXvKk4vAsqeqFXwWRHmojUk8tdjx4lypzemj+K5P1zJyFDEvA
 Kst7dHYIo4gdAIa1HkAs3ifkwP5RHSpEk3cZfam+02MpvU6sq9KDr4CxBtsawbRs4qucdI3m3aI
 82yne+FvLPh8V4UYfYYrTH3MyEubUnA4FO+iM2NEAXMVULZ3nRtNcgLCQ2Rql8UP64rgDX2Q2SU
 1RhVyNDplcUVLi3shyj15stb861nZQZaOoIUuvnt4Fk4YJESYB3vqrFukkBHdHuEDAZYUO3cTeh
 y3FRkZPbtRAAYzB0BSTjk
X-Received: by 2002:a05:620a:4149:b0:8a1:21a6:e04f with SMTP id
 af79cd13be357-8c38939254amr1257045385a.28.1767950989813; 
 Fri, 09 Jan 2026 01:29:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEXoLCG5LO6zefGjgD+xKyAVNrDH56nL2+22oLiyLggqcBqmC9ow0fJTq3cPgpQOVlQjcJAWA==
X-Received: by 2002:a05:620a:4149:b0:8a1:21a6:e04f with SMTP id
 af79cd13be357-8c38939254amr1257042385a.28.1767950989227; 
 Fri, 09 Jan 2026 01:29:49 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.7.10])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b842a4d029bsm1076667766b.41.2026.01.09.01.29.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jan 2026 01:29:48 -0800 (PST)
Date: Fri, 9 Jan 2026 11:29:46 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH 24/27] drm/msm/dsi_phy_14nm: convert from
 divider_round_rate() to divider_determine_rate()
Message-ID: <7t7ctq5vasottsmiuvo6zwqsnlcocc3c72fno7qlhgeqhmhxid@5tsjevpuobty>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
 <20260108-clk-divider-round-rate-v1-24-535a3ed73bf3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108-clk-divider-round-rate-v1-24-535a3ed73bf3@redhat.com>
X-Proofpoint-ORIG-GUID: TqmbP-RdruBWssYWWKMqpYaw0YwElN-O
X-Proofpoint-GUID: TqmbP-RdruBWssYWWKMqpYaw0YwElN-O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA2NSBTYWx0ZWRfX3oDRDHb1Qag6
 tcXDuvjbF6i8uGVjJ/05dz00Sfes7aFzJUBPLT5zL8gLNKSfwTB0U7EzjOZJF9aosFdgfacJ5iS
 dfvz8K6vFN1PBA6sgN1P8FOZJjSwE/78sP64Hz4Kttw0VlHRgDO+0ZhxMclY6QF19Nc78gqvEe7
 AD6HmCrpKmbHW4ywAMovYqfw9TuXKULEP/DbvijQQwrQti655SpBt3ojxIWeUfcyMWB26ksfdf/
 AcFoumALQrl2GZizpPG4AlG3ji1zOKAFYaJAEzXYUkNDJfHJnMdG4bE072e3pNHsVu8CWZID3jx
 B44PsGdR542ONt1dRyLseMxtjJMGxVT/NkrN9qIcgWDK8OTlMAnrjPOcBIvDuKJCHhEC1d+mmBI
 pBjEbeS5OlPMWTuYqJxu1CVz5f7K9iWWZKDfStj90VbVqAk54CHBSsUjYbEtRuTHNTYZbDA/2Nx
 sm8koORUMcnMYcPrO0A==
X-Authority-Analysis: v=2.4 cv=ZfAQ98VA c=1 sm=1 tr=0 ts=6960ca8e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=hZ5Vz02otkLiOpJ15TJmsQ==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=MmoDKESpECQAgM94Xi4A:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090065
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

On 26-01-08 16:16:42, Brian Masney wrote:
> The divider_round_rate() function is now deprecated, so let's migrate
> to divider_determine_rate() instead so that this deprecated API can be
> removed.
> 
> Note that when the main function itself was migrated to use
> determine_rate, this was mistakenly converted to:
> 
>     req->rate = divider_round_rate(...)
> 
> This is invalid in the case when an error occurs since it can set the
> rate to a negative value.
> 
> Fixes: cc41f29a6b04 ("drm/msm/dsi_phy_14nm: convert from round_rate() to determine_rate()")
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
