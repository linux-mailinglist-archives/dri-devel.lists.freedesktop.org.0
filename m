Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A7DBAE6E9
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 21:20:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5691E10E2CD;
	Tue, 30 Sep 2025 19:20:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QvqfauCo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A82C610E09D
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 19:20:51 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UBPUPv027898
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 19:20:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 KVXK3wyj4xgxBO/QQE/5ijkihmvihUgMziMTP7OJVrk=; b=QvqfauCoLCsFHunX
 BW86ook4l0mDvdjjOiDOGqcsZnMBR0QjXPr5w0Fh1ir4MAaYUxNmE6N3CorKuHcS
 QKTAtV50kLvUayA/gTgxQnrycTPzg4KvRmimnmFUCiVKhAEQxjHx4tdZxfvES3RG
 oTFF1PIpdIK82Q9Z7I+5YFb272irfvWvirWb4OkSI+9/Ldi9J8ogcHCM3H6mbGyw
 K1vSOcf++D5HqneStj8qqQlRJKQLOQ18NF3asMJW1gRAIbj9R/P8vwxt2OBXCsX2
 UTiu3mKqXDwbiLQ+13xAqQqmcQTt/j7yeCJvE5wF2yAzDnBMZ6uXPiee71XLOU3w
 7VoiXQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49fyrf3sma-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 19:20:50 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4de36c623f6so118017031cf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 12:20:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759260049; x=1759864849;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KVXK3wyj4xgxBO/QQE/5ijkihmvihUgMziMTP7OJVrk=;
 b=q1+4Vcnfx6WhPett/I24uIRgIBK9GskuA2tQNLXoLJyoPNAA9IFKvAx+K+Xh63231J
 nXpiaCi1zgsMi5Z9n6vJQiKbmtmkQz2qW2YV/sgjkjFErbD1OUs2CyGEnJ996ZlIbiMg
 z7+b1CRtSNxGU29kMePOrMMce/Syi9+1kgB1zoEhfv8TXx7SnTMa4wvEucI7Hxsf+Gjv
 DJuRRV3IsDJpXfLzECL4G3FBeA9YQ5A8xwOtvQ5W58f3z/0v5jSD4layLPJbSlxtdw1F
 feqcu7PteCs5pUrb+sKWTD/wBhYhbbg4Cdmm5Ye8OUT/nZfzPI1ISBCraiV8NhOGerWr
 MV5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9q2KZxdYeE2AFaxXMmzX3BYao+7MipoaN57S+jy+hWZBmU4YNT8KyiJy9HJI1GTFEJj/do95XZFE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz46wTq97FiWghE93Cxo3gG7XdMLiiAaDfAle2wlPhi0MSpuvt6
 vwPDseHqHEN0YdLrDuUCW1ExniaOoxXA6V8cW37/hxqto6lupshtcMDNJ33HoJu18tNTPIx187e
 oIQYyz+4QsKZ1sJWki9WeFkqykDIaCafH6wZO/tE1aItfppMWDM3kdX4Wpv8vld9vpc980Zg=
X-Gm-Gg: ASbGncsKgqQZSIc0dlGyJYmdvyHabO4pVNqu0BB1jgd8zlKxEZCK+GpXpvgjcjj6c0K
 me9dShtj3BOf3qTzrwzrcm5hYb0ZeRler253G+GmX12SiiAUDhtrREJjQbPeB20aGXmkpbpMBTc
 tcwDZF9Ahq92uAi9u9JtiOX44qqD/R+O6g427Wzf/sVNF5rnr3Oue80NBhGzpQDIXvbls67LLqb
 27yilUJXYEsVQp0yCjYZVCpR7Y2scoh2RdzV6WFSvxBltWakJEZZPFzYOiITB3cbGCzf2jGPc97
 KNqbGg2o86Uw+VWv7XFw6x0Iqvem+pk5WyL7KZdqG1/wanRUkJcHJ6wRbIFogJFAMjio+Y2kmHc
 /fZkNuYZyMBF5DMcwNqgh3jBze2A7rYi+rio6wQyb3zXuJE7QWDLTjWZzEA==
X-Received: by 2002:ac8:6906:0:b0:4d2:d413:1f3a with SMTP id
 d75a77b69052e-4e41e256b01mr10937141cf.64.1759260049469; 
 Tue, 30 Sep 2025 12:20:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGlv8GouDfLH9jxcZXz4sZ9qg6O7hSAY2xOrBu+sewtGI48yKBVhvRDPT2OTQMfLyqgcLMpDQ==
X-Received: by 2002:ac8:6906:0:b0:4d2:d413:1f3a with SMTP id
 d75a77b69052e-4e41e256b01mr10936801cf.64.1759260049035; 
 Tue, 30 Sep 2025 12:20:49 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-583134310bfsm5244156e87.26.2025.09.30.12.20.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Sep 2025 12:20:48 -0700 (PDT)
Date: Tue, 30 Sep 2025 22:20:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH 03/17] drm/msm/adreno: Common-ize PIPE definitions
Message-ID: <ftbecn7dlcp6pqtpfl5v7kv2kevz5m4yqcy7fg3atkdjabkt67@zqwwostqqfou>
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
 <20250930-kaana-gpu-support-v1-3-73530b0700ed@oss.qualcomm.com>
 <xsgnpvswvkyuxiviv4uyb6pxbpi646fut6dy54kpyfisqrxycz@tyfox3zdi26e>
 <CACSVV011=_szCPbdm6YA8aJjm76r_BZP9QFeOzcAGCvqUUTebg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV011=_szCPbdm6YA8aJjm76r_BZP9QFeOzcAGCvqUUTebg@mail.gmail.com>
X-Proofpoint-ORIG-GUID: 7OkOGGpnYbGQMH1RoUAhajYz7LIXW2B2
X-Proofpoint-GUID: 7OkOGGpnYbGQMH1RoUAhajYz7LIXW2B2
X-Authority-Analysis: v=2.4 cv=etzSD4pX c=1 sm=1 tr=0 ts=68dc2d92 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=IkzWstXsGuqL4x2q7pEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI5MDE3NSBTYWx0ZWRfX8lJY43LRkJkL
 QIfdcJJG8UdDl7+6ESjRY7lqOxgR20z+YD+rc4uRb6cGORflDjrTQeZobgKXmCD0oHKZBThfahE
 qRxcrJjPkHXZ234F6Gd/zJ+k652Ok8HYh1CHbQTybcEa8XBU+rAXYpJvP4NVj5OJcnc8My7DwgW
 4mfQBRbqyU7JA21P8uP7pt4qT5OWrxcwj91/QQ17Tjj1bROVUVp9Ij5n8KOTffekTu8g6BEk4wM
 skH3v2zpfA/2pozsUN4JOte9++UwsL0jTPWAfZTIY2XzwH7+RGowAID+u/Epe0n9XWL98LtWPdm
 cHDYqc7VGOZnssZGtaWoQ+OdLj1guaf9uFmBw6siNehx0/MWUPJaJo6fY+MpmiDmM1vJtpC3kd9
 1dGhPlumClMmLHGX10LMFLsgsx6ETw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_04,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509290175
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

On Tue, Sep 30, 2025 at 12:25:55AM -0700, Rob Clark wrote:
> On Tue, Sep 30, 2025 at 12:05 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Tue, Sep 30, 2025 at 11:18:08AM +0530, Akhil P Oommen wrote:
> > > PIPE enum definitions are backward compatible. So move its definition
> > > to adreno_common.xml.
> >
> > What do you mean here by 'backward compatible'. Are they going to be
> > used on a6xx? a5xx? If not, then why do we need to move them?
> 
> Newer gen's introduce pipe enums which do not exist on older gens, but
> the numeric values do not conflict.  Ie. each gen is a superset of the
> previous.

I see.

With the updated commit message:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> 
> BR,
> -R
> 
> > >
> > > Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> > > ---
> > >  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h        |  10 +-
> > >  .../gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h  | 412 +++++++++---------
> > >  .../gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h  | 324 +++++++--------
> > >  .../gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h  | 462 ++++++++++-----------
> > >  drivers/gpu/drm/msm/registers/adreno/a6xx.xml      |   4 +-
> > >  .../gpu/drm/msm/registers/adreno/a7xx_enums.xml    |   7 -
> > >  .../gpu/drm/msm/registers/adreno/adreno_common.xml |  11 +
> > >  7 files changed, 617 insertions(+), 613 deletions(-)
> > >
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
