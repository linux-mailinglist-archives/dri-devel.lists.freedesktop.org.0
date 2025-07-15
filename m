Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 154E3B059A8
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 14:14:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EDD010E213;
	Tue, 15 Jul 2025 12:14:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pAR7DWyP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D80D10E213
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 12:14:39 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FC8jVY021130
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 12:14:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Jfw3xvfS4NbEz+jsLHsBmAengRL2X8sb/oc+/LO2vCE=; b=pAR7DWyPBxVpTXT0
 h9YnTblgqYuJIXGydih9tv0twZK8VIO7ntLAd9wbUHTHG+jYowx44+BKRoRKCgO3
 pPJI23mQ/lxWGzkwg6OZNqNr0BLKs8D+91giy10Y3oRWGuh2gpEBsoOBS7eERO7+
 28gwND+lghCCxhf+SeEEA02wgWB5/hyCuR6sBKEjrhioUpZAejuHTgvsgjmB8u1x
 JdOWpBBLhPv00bBpVmAew6PkTmi8guAKTNX5m9gjdSIfb4YngOoUXvkWWtrHKwJM
 QSTViKVoXyUfxepVrVVX19kcpG8Cp4EgUKUP3gNBI0qlRDk9J/tCW4TFVCEzRUH8
 iwezdw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dpayeu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 12:14:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7e237c2f4ddso377990085a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 05:14:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752581677; x=1753186477;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jfw3xvfS4NbEz+jsLHsBmAengRL2X8sb/oc+/LO2vCE=;
 b=orLzGFBEx4/AaXBN/HW/UrUWwrFxzQzAWNR/XrEHFqtemR5+a6Y2SaHTwOl0QH/rbv
 404h7X/86LjJy/w8P5Y4FNOIcMz/O3q2j3a3jx3hIXq5HHTQLg1R8CRr/BvZ6H7nkrGy
 cseHCN0ajj1BQqRzvzwkW3BLheScotVucC+MgS/3Pz8ejpUU6WyxqSKIdgEcmhrZBGaL
 5q2myPDYqrltRfyKihTyDjJy2A7yqTF6RR48IhT+pQ+Hv2Ba/2m9nFEcLOMnn5EBjadp
 cpuxy/qK4BF04LSbyhrTcaVQYPx6El36Cm7jK4cy1VBih7WbN7eph6bUHFy4GGH6IljH
 uyuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrGTc99aABH3jLnvh1kRQEKyTtBDjQ4kBLVv9DWph66VNrUMs/W+MjZ5svDsabvhTUpwta/KGMXE4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yynr+ODs09AsLaqDDN+Lq0HIFcdPy6pmELLzyEBLaMLKpAKbFs7
 hQTqzhMfWO8vqTdPgaq9L7AdPGyHU5G4KNxL7yKTxZTmfHligF7W13/hUtA2/QOq/RIGOVqNIb3
 SWIsvnDTgqUQkRBLPFnoEKQER+QxFHihsuq9SdUes6XwiVIeEDYoFnV69OA842MBkuc1aCnU=
X-Gm-Gg: ASbGncvqi6m8Eyq1dZnX9W9ry+F9NgaThikn0QcqhSlykWO1qwPqcydKJCAzHmJcDuW
 OkitBZw+eZIu08PYzincTTzW84Q1JA8DgnF+ONJJ0/6TpGF/Upcm9AxsMYTZC5rYzdg84smTcGn
 mha3BbsBXiectOGAsa2MFdtTI40wgiafDk046SNX2O7I1KFY9WxrBzU/tOl8sNM/BV+rVSDDr7x
 uLUmQXaLlDsKpjVU907h/b7+DRvDEtEeUGyE6DkkqDE6KejVidOlqa3NvYdHO2rRndBGq+6aZCS
 CNDL3fE6awjdlK6E8FChr4bplpaA2KFPFk72wJuIKnkNwH9ql2BB6aB8bFkjHpy6pGrq+S16jxn
 uFJrbufwnV7uGwabuCOJO5N4Y5tKO85N2Vh6oJfO1EfgmtRgDDk8t
X-Received: by 2002:a05:620a:44cc:b0:7d2:1953:a410 with SMTP id
 af79cd13be357-7ddea60f5a4mr2007318085a.17.1752581677196; 
 Tue, 15 Jul 2025 05:14:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPBdsY71vp+xrMliT1xr5TakX7NuGQX6TNVLrGNnn8LGe7tYWNBXLw8v3IZLOAETZNjIReLA==
X-Received: by 2002:a05:620a:44cc:b0:7d2:1953:a410 with SMTP id
 af79cd13be357-7ddea60f5a4mr2007313785a.17.1752581676616; 
 Tue, 15 Jul 2025 05:14:36 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32fa29134fcsm18126581fa.15.2025.07.15.05.14.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 05:14:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andy Yan <andyshrk@163.com>
Cc: simona@ffwll.ch, andrzej.hajda@intel.com, airlied@gmail.com,
 ian.ray@ge.com, jernej.skrabec@gmail.com, jonas@kwiboo.se,
 Laurent.pinchart@ideasonboard.com, maarten.lankhorst@linux.intel.com,
 martyn.welch@collabora.co.uk, mripard@kernel.org,
 neil.armstrong@linaro.org, peter.senna@gmail.com, rfoss@kernel.org,
 tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dixit Ashutosh <ashutosh.dixit@intel.com>
In-Reply-To: <20250715054754.800765-1-andyshrk@163.com>
References: <20250715054754.800765-1-andyshrk@163.com>
Subject: Re: [PATCH] drm/bridge: megachips-stdpxxxx-ge-b850v3-fw: Fix a
 compile error due to bridge->detect parameter changes
Message-Id: <175258167425.3629548.5679606306596835842.b4-ty@oss.qualcomm.com>
Date: Tue, 15 Jul 2025 15:14:34 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDExMSBTYWx0ZWRfX9+NGGyYwJQrx
 ZMTaMRy8MLJvvvo+UbcJ74ymitZO2SN4nn9lhdbOyC7/s8ABdRxkHrf+xoAbdNBZ+zN38ivd/qP
 i4cPQu8Ki9cZpEzg3pgxVAABuxgO+hT4rPRYSG0CKECH7QGugU0xEu9m2gaok6jiL+2kF9oCS3N
 wofuHxu91stNs+uY7U67B07zdnw2gc3nXGCoVKZ2wkbuv5y4xhgScn9d9kNc/vJurRoYURLtB+u
 OW0CPwJ33WOpKzU0oFJ5YoCdVM711fM4r/1AqiNUMZnNqFTg0PJdRaq10n7qD5thQp7ckGLtcyp
 Lnpi4xAlIbrpzsxkFm15HkWUVrdFieRP1m0EeObCyxKZ0pTHaANT7tc5jfkwFygZLuVBSSqIURk
 T3ir6GDtqgk5HMuTZ1wH1kB5t3P3bB/nklOAYDfrfYKTIU8f3rhDuBiO+K9V5DqmwYaKgnCf
X-Proofpoint-GUID: Oaypez1_-CbnJ9goAsrmraKGXiwH_lmL
X-Proofpoint-ORIG-GUID: Oaypez1_-CbnJ9goAsrmraKGXiwH_lmL
X-Authority-Analysis: v=2.4 cv=Y+r4sgeN c=1 sm=1 tr=0 ts=6876462e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=eKgQYgMGIk0790w6_cYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-15_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507150111
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

On Tue, 15 Jul 2025 13:47:52 +0800, Andy Yan wrote:
> Fix the compile error due to bridge->detect parameter changes.
> 
> 

Applied to drm-misc-next, thanks!

[1/1] drm/bridge: megachips-stdpxxxx-ge-b850v3-fw: Fix a compile error due to bridge->detect parameter changes
      commit: a622663dbf874ae5ae2326a9878ceb410c8a34a4

Best regards,
-- 
With best wishes
Dmitry


