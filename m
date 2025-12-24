Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FC0CDB0DF
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 02:13:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77C4B10E2F5;
	Wed, 24 Dec 2025 01:12:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QfSbmJzp";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bp74032X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB35810E2F5
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 01:12:57 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BNJCrWg1056218
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 01:12:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=oVGnFQ3gqli1QHEJXbge8cA5
 8T1nSyBsOaPKVoUKLRg=; b=QfSbmJzpQZZ9Y9KiuDEJziTx3vl1Ow4lrUAww0nU
 vHdtIQsSn5onzKEBX2iR4TlgBi0RHksrgVRrhuRCoPgBCz4BShObEVDqexGecluO
 8iUMd1ut9B6C6vhUFVPa7qU++xqLUmRQyi82pEpT8sqBZunWOVZQa9Idj96uciyt
 mLWq11W/IK99/qVoxTXZolu7pXZ+JhSm7M/QLb0DRXntHNicJs0TEsFSmTMQElqW
 D0BKyQf0CfKI3YnBDV0GjeXHXslUxvkht5jRBmpJsgTVBu2h29Yc5MeyZHoOOI3Q
 +tBrCADGA2yq7oOo9DCquPlePC74j7+dHpgBqDqA7KsxPA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b811v0uxg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 01:12:57 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ed6855557aso139818641cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 17:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766538776; x=1767143576;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=oVGnFQ3gqli1QHEJXbge8cA58T1nSyBsOaPKVoUKLRg=;
 b=Bp74032XqkOVjulDNKDMYrfS8qzQHA9TU+E8M6Fy/1jWkuxSohSv0HhuBHQs128586
 wOEZTX7gKl60DGbT+FbLN6/qLOrrWVm3MCTX3WcybLY6n7f2Ynah/uA13XVdebnZdTID
 5xiAMY6OUJCOHo8SLUZtAxzUnV7aoIMlttIkFsYE98G9cYp65pz/QFEP1xXPhXZiOxV7
 Jrf/SRRAL/q+OC+rlewsywevRmcpdv8IP+oZYNXrbr88p/g3pDGz86dH8dSgSSiSkcHu
 iT4hDRbJDjgOdlZUIOYyi9mWn6aSrZGQh+gOWd/AEYRDT4uNeV/UaAdAWngAsOhqajvC
 giHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766538776; x=1767143576;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oVGnFQ3gqli1QHEJXbge8cA58T1nSyBsOaPKVoUKLRg=;
 b=TPPPnrkPffRA2xP1PTCn0+pEcfeBrFn3dcjXY6SUjWFV6DJibEWaJpwKS64Nl3GIFb
 5p9PiAWTrkrtelsWIEEe/QUruFoQOma1mFy+nHDJfuWVteKu33JfNcN2vA24HnjeUwBT
 GNQhch5gWYfJWaRxZPibQiRH3R8E/v+3mZL4jtcFJra4Zo3Ia6srdNtLFNTK3L82cy7D
 5C822VkyMXI99y2J31fS9wqwV0H4lwoswDSYCcN/4rv7XF0y6fkCFNm+ihy7Oa6NtAIC
 ZB1D6QPsUB5lwUCZDs8XsRFPIW/HdaeQfo+Hyj0BODzS0i0Q1fYJWo1OvPCmzQHZ0AFA
 ZncA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0uxOYf6hrHZo/CAXyk+qGJiVfsCRU4HvHV+5LJEPGaa/0oXzypRiGAhEzpyI9ea4D6smq4wYgTQs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2ZzodtyjYKEQS0hR6D8a4oAXkAUC+z+4Zg6ExePcOrQWdiAbS
 bgdRCRQ9KJK9nxX2BQN24xnN2koUHDgMCp1bT+qHVRds+5KutgSXsYjfwWbuWZ2cgZV5n2itpOd
 ePP4AWtceE8LxxKXYef4NDb5/OOs3UVDMME0PZvtCW9gmRjlxA1xDT68pU2SB5Rf4+gzgEbk=
X-Gm-Gg: AY/fxX6qzbMkSEOs3MZwGRFAHOpEKFqYxKw8pUOXezzsEjc6zTuehDxKiK7zQ5aXUq5
 pzaBr4kcRKtcu1kAES6TrgfG1EEtBYUMxAKbNAVl7A3iz4G2fpO6tbfhb2/hCD94GnUrK+H0svl
 txRdrdKPxzEou1j6mKjorvtdxQEOMqGSoDOpHAbfIP5eV+3tGUiulTxBi/VjtgofDBLAXXKw3gp
 JxirNKaAieKtvEzTxy9nDY13GZu4xKAV2NeIvhaRrpFnpHDhm/2nTcBMEnwKRmBqwagvC8v0wza
 87QFHPIRAj0jUZH9FBUImfPY83sqrs3EtPZsemwP6NN1ZqYP1wviBn5+MLTsgwXMYjY6fnqIlAo
 NYW46KPDG5VHIW8wIoi2fdAhsBcapQhlYgYcAAN52fRNRqHQriL3nugRAkuwpK3T52tT5/uPn5/
 EAgTASFqsB2F3eDoqvVxbMzNY=
X-Received: by 2002:ac8:5e53:0:b0:4f1:b362:eed7 with SMTP id
 d75a77b69052e-4f35f4849eamr282708361cf.42.1766538776317; 
 Tue, 23 Dec 2025 17:12:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHE4B7/rPVFuJHrgTNYbucMWLjNHWMuUQI0EU8npl+25cOJb1pV/0Xke+yOfgEQK+FXxdRvVA==
X-Received: by 2002:ac8:5e53:0:b0:4f1:b362:eed7 with SMTP id
 d75a77b69052e-4f35f4849eamr282708001cf.42.1766538775854; 
 Tue, 23 Dec 2025 17:12:55 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a185dd861sm4587300e87.30.2025.12.23.17.12.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Dec 2025 17:12:53 -0800 (PST)
Date: Wed, 24 Dec 2025 03:12:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 Casey Connolly <casey.connolly@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v2 05/11] drm/panel: Add panel driver for Samsung SOFEF01
 DDIC
Message-ID: <7ssxf6rprsllmfte2neuobccnbcxbk4vrintgvrm7aghaqxwma@wivcio66spjh>
References: <20251222-drm-panels-sony-v2-0-82a87465d163@somainline.org>
 <20251222-drm-panels-sony-v2-5-82a87465d163@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222-drm-panels-sony-v2-5-82a87465d163@somainline.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAwOCBTYWx0ZWRfX2JSLolcdwvgd
 C33ngZhxLkh1wkjZDMEGbNBnH8oBTIB5yV+iYZMLqJZTz/0uc7rSOxErxyIQYnbEWV0dDDVWA2R
 owQnhiCNnZupLs6BW3Zx+aDruAHVWlIMFffsBN80fb/QWTpNagWkGRFyMazNrYXsM6D/nIF+bNt
 kjtdh6IrHvKXL//LGOC8c0P2ysE/DcFpcm3BIB+vJEq0tO1IYa7A8H1EzifFF7mS7bXpB+tuK11
 DbSSbWfgm5e07C+Vgq246jqoJoIuJOxf8AG22BVzx+hP0mJs0OwQHN4Xt/yJdsBQUqCcg/mexVy
 BVhXeHcpBIpg8j0pT1FM0IozMHuHpS1ULfLRMaXdLGD5fUpBPC/HzNeLxpks0TiXleV2lPMJR74
 /SfnFqpEhFit8RFIRQ18QVY3dEtIjRs25aJ06VwmgGCCYlxxbdnpynLHAbMHk3Ekv0iO+MEGUXr
 zLwBOhraACVTqQb3C0A==
X-Proofpoint-ORIG-GUID: Cn_kKGz8It-TIi5sHx0_-9IyIt2-Imeo
X-Authority-Analysis: v=2.4 cv=WegBqkhX c=1 sm=1 tr=0 ts=694b3e19 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=tVI0ZWmoAAAA:8 a=EUspDBNiAAAA:8 a=udYctNd6dDZtC2LY4QMA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=-BPWgnxRz2uhmvdm1NTO:22
X-Proofpoint-GUID: Cn_kKGz8It-TIi5sHx0_-9IyIt2-Imeo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_05,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240008
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

On Mon, Dec 22, 2025 at 12:32:11AM +0100, Marijn Suijten wrote:
> This Samsung SOFEF01-M Display-Driver-IC is used to drive 1080x2520@60Hz
> command-mode DSI panels found in many Sony phones:
> - Sony Xperia 5 (kumano bahamut): amb609tc01
> - Sony Xperia 10 II (seine pdx201): ams597ut01
> - Sony Xperia 10 III (lena pdx213): ams597ut04
> - Sony Xperia 10 IV (murray pdx225): ams597ut05
> - Sony Xperia 10 V (zambezi pdx235): ams605dk01
> - Sony Xperia 10 VI (columbia pdx246): ams605dk01
> 
> The amb609tc01 and ams605dk01 come in slightly larger at 6.1" while the
> others are 6.0".
> 
> A "fake" porch calculation is included to artificially bump the clock
> rate necessary to account for "transfer overhead" (DSI packet headers)
> since this is missing from the MSM DSI host driver; porches aren't
> otherwise used on command-mode panels.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  MAINTAINERS                                   |   1 +
>  drivers/gpu/drm/panel/Kconfig                 |  18 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  drivers/gpu/drm/panel/panel-samsung-sofef01.c | 463 ++++++++++++++++++++++++++
>  4 files changed, 483 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
