Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BEFAB34B45
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 21:59:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2E3D10E547;
	Mon, 25 Aug 2025 19:59:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cjlo3I6k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1219910E547
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 19:59:51 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PGFvJo021722
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 19:59:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 QpMXjjOloTbOcv7VKi87DER32XX876zK5UxtTO2ua/w=; b=cjlo3I6kOhBPZA0p
 cSlGSa5xmLkswO5obuRr3lT6JCUurIBNg29AZt1dNny5CZcBaCf76N4y2nuELyXf
 ncRqJZeHIPP5OcEcaqOMOJYxu/au6gGmi/qrz6pXyz97bbkWG5tLYmRs/XeiF+yD
 jTVcBDyJLiedm65n8oeOgMwmma2GdCDn2L3XAa1xrrUMtfdgOIo8jzytvoZ0xPSe
 3zOrnvWB0JqyUALi0IcShbU8z5qgIs8jonUFjLPaq7uNGFHGz++Aqzqhla827Nbc
 y2L+7qzuNqSvXmUm7IfSuGfmSBEIXVfB1drY7hXAnmBqR+AHxrx30Ia8vLPriTww
 heiRVg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q615e8ex-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 19:59:48 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-70d9f5bdf6aso67100836d6.0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 12:59:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756151986; x=1756756786;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QpMXjjOloTbOcv7VKi87DER32XX876zK5UxtTO2ua/w=;
 b=jFSBGAKMr/6TY72VQ90U+yFtStS4BUKrL4d0iJIKe2SZbN9zCXRNor7zoEb5BEyDCg
 ceq+qwY3qwzjHJmkxE0TyOwI9u5NYeDuVlVceG5iZoe6fblY/R5Y+CWYxDeB8Yh6j6Pw
 +la+WEsHPTrb1YtMOabyfbPfFsZOSFxak3IfTAUYXUwFIWfmczdxVhgC7J720OSHyqJS
 LPFpbMge8xzjDbicWH+PUuCUr7T4vMKbAjq7fjzXgbm8IFsbmM1bKGZERSx290gLhcWx
 lAwsXLYx11WDO0zBHxGMR2BgdyZkmba4697Lxz64pK+fjzTtb9DgWLRgAhcbwZ4CmWzW
 qtSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKTJe23FDtiHwhCc6CgrDb3mWkRx5RV0Kw/eJnra7yYaIr/c1oLyfMctofK9uEBCTDmPxE36mQ6gM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwENUrrw1Fyd89nvqxa7/KgTpTxfTIkngyNxjeTBGqxT9gkAMdT
 TTWVdPNHRySpHbsvSCIU4aYalNa9NtqEalL4wx5Ifhk55lTSEzjhVYnp+zC6BI8bnAbwOCmNWN4
 Y5y8poNtmd3zQs2iLzxOnu0gtH3DjUF/yrl6ECmKhjAiosDRGxaJAcnfJKrXqZxtS9/JKMVs=
X-Gm-Gg: ASbGncujW7d3+L0jU3+CSPMkfXyGzwMspGajY/1kbLKGhAbMeQr7xGfRxBqRMZB+lSY
 tszXmsUschM2JMKJ6d+Rf6YTrJefdh3UTxRQu9TNKsqSi86XDTSvByWscztU2lekDTGb5kkRY73
 P1MGHth4iCcgMmYxlw3Mo5FUn9C5k6dGKMRodDwVQkRrOD9mCPPaigMR7fakF547SRYEdi0lV5v
 9SLKX+/iscoX2hWZCz8i7mcktSt+Layz8NZcEeuq2MM4QzjtXMPX/eoi20h93NOyUXDOGftU6GV
 TR5hiB5bp5RTdqVxBuLXpIWhb3ypYoi9sr3YG/0SiNm1rGQZ2KCrSAg7W2KOTdOrFLPvQTD9iXz
 kbwCMt/X12xxJnDw0Jj8fx06++jg5XmAoVxSR3aTPaPdOSBVdRZTC
X-Received: by 2002:ad4:5de9:0:b0:70d:ac6c:d5e with SMTP id
 6a1803df08f44-70dac6c152cmr97978776d6.17.1756151986351; 
 Mon, 25 Aug 2025 12:59:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQJCEWzdMqyTuDrQVNON3NoBMK6mCKwkSCCF09YR8Rv+ULva4lyyz7WmxFpfIfcvr79oPndg==
X-Received: by 2002:ad4:5de9:0:b0:70d:ac6c:d5e with SMTP id
 6a1803df08f44-70dac6c152cmr97978436d6.17.1756151985824; 
 Mon, 25 Aug 2025 12:59:45 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3365e2687acsm17787781fa.32.2025.08.25.12.59.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 12:59:45 -0700 (PDT)
Date: Mon, 25 Aug 2025 22:59:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Alex Robinson <alex@ironrobin.net>, lumag@kernel.org,
 abhinav.kumar@linux.dev, jessica.zhang@oss.qualcomm.com,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: fix race in Adreno header generation
Message-ID: <7w522k6vkngqw2tfbmrhuvxxcdlby3wwzueaqw75pxud2y7puw@2rjhjl5ikn6c>
References: <20250823020919.9947-1-alex@ironrobin.net>
 <6sdzghcc4uynvmk6r4axpwgqlmgxqzi457ttedqlrql7f7lt47@glsrzu46a63x>
 <CACSVV01R=FPAErpfJJvESKig+Z8=amEkpf6QFnkXHhTjFsPf5g@mail.gmail.com>
 <5a405510-3eec-4262-9855-483dd589d8dc@oss.qualcomm.com>
 <CACSVV03y1s+EdkNm0nWFL7yuR8y=YuBs-OJaKquOh4izwKc_nA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV03y1s+EdkNm0nWFL7yuR8y=YuBs-OJaKquOh4izwKc_nA@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNCBTYWx0ZWRfX8QUDaburo5N+
 TDO1vGTnrLIdHoL3UWVvrPHboYgzzHvphBXmo8b/ers+DxHbmSiNC/6JaPRrJv8pCBM1GzFou/F
 QgkQXMJzR2F5uRaNFMgxYDXgMi3gOQ5HDEDBGXVS8lH0wuLmXFZY/CCN4LlWAk0jBKo4TQJXREy
 jlpBgqVHOVKWpYBhCFwPcsxrt+RmpxaBKRaBQQBNfVEwq0IWSF3Owxp7hxcYr5uWwjuCloRasv6
 +drUbDk4CbKSF5gkCGzG9EzY+dWdnDCP+/j1UdaUBvagAIkLpG+IzfACL3N8Hqx9YOiAf52GqJa
 kvHYEXKEkqNLg1+2CGAlNhe5Gh/A+1lO5LqFSx+UOSlWUJsTYsanqvyI/5imnZMtlU53QpLp4Rt
 y/sQzIW1
X-Proofpoint-GUID: oqrA1v_jPhYP01TsR4n33sZKaoWBofQP
X-Authority-Analysis: v=2.4 cv=K+AiHzWI c=1 sm=1 tr=0 ts=68acc0b4 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=foaXouvCAAAA:8 a=ogmizbzjsSRwc_UF5_MA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=lBkOZJTZZNyIbKe29SIT:22
X-Proofpoint-ORIG-GUID: oqrA1v_jPhYP01TsR4n33sZKaoWBofQP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_09,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230034
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

On Mon, Aug 25, 2025 at 10:48:06AM -0700, Rob Clark wrote:
> On Mon, Aug 25, 2025 at 9:23 AM Akhil P Oommen <akhilpo@oss.qualcomm.com> wrote:
> >
> > On 8/23/2025 7:46 PM, Rob Clark wrote:
> > > On Sat, Aug 23, 2025 at 6:49 AM Dmitry Baryshkov
> > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >>
> > >> On Sat, Aug 23, 2025 at 02:09:39AM +0000, Alex Robinson wrote:
> > >>> Builds can compile msm-y objects (e.g. msm_gpu_devfreq.o)
> > >>> before adreno_common.xml.h is generated in trees that generate Adreno
> > >>> headers at build time. Make msm-y depend on the generated headers,
> > >>> removing the race.
> > >>>
> > >>> Signed-off-by: Alex Robinson <alex@ironrobin.net>
> > >>> ---
> > >>>  drivers/gpu/drm/msm/Makefile | 1 +
> > >>>  1 file changed, 1 insertion(+)
> > >>>
> > >>> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> > >>> index 0c0dfb25f01b..1a918d44ac48 100644
> > >>> --- a/drivers/gpu/drm/msm/Makefile
> > >>> +++ b/drivers/gpu/drm/msm/Makefile
> > >>> @@ -221,6 +221,7 @@ DISPLAY_HEADERS = \
> > >>>       generated/sfpb.xml.h
> > >>>
> > >>>  $(addprefix $(obj)/,$(adreno-y)): $(addprefix $(obj)/,$(ADRENO_HEADERS))
> > >>> +$(addprefix $(obj)/,$(msm-y)): $(addprefix $(obj)/,$(ADRENO_HEADERS))
> > >>
> > >> I'd say, no. The idea was that msm-y should not depend on
> > >> ADRENO_HEADERS. If there is any dependency, please move it to adreno-y.
> > >
> > > probably we should s/adreno/gpu/ and move all the msm_gpu*.* there..
> > >
> > > In the mean time, I think we were going to drop this patch from the IFPC series
> >
> > Yeah. I will drop that patch.
> >
> > Btw, was my usage of adreno_gpu symbol in msm_gpu* files incorrect?
> 
> I suppose _technically_ it is, but the split btwn msm_gpu and adreno
> really only made sense for a2xx, and only if we tried to upstream the
> old 2d core, which never happened

Granted that there seem to be nobody interested in OpenVG anymore, I
suggest we forget that Z180 existed. I think it would be wise to
simplify things for the GPU cores (merging more of the msm_gpu_* into
adreno/).

-- 
With best wishes
Dmitry
