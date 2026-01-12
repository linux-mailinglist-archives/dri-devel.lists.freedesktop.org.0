Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED4CD10E07
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 08:31:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D124210E2F2;
	Mon, 12 Jan 2026 07:31:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="W52GMF38";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j9lpkF1x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7709C10E2EA
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 07:31:21 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60BMstbp3135955
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 07:31:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=aieeUG5t4cx92lVZlSq6w5Iq
 SGyS46OAJyDHIiD8MkU=; b=W52GMF38UzDGl+qereawB+dsAPCnPnKyix4Fsbip
 iuFIk34gxGeDyncv2Lh6ukHKwIUSBlTZV9V1AWO1M/X8mZBVnQTI7IiDKcRGyUde
 P1KW9QoxCm/oqnZfbFuCXQHPv681dzrhgXIA3Dg2GTXV9GhYHVHVjwtba/vqZAw9
 ZMi4Hs255Dm0bpmYFaR8nJsiAB9yADcHKu9PAelNt0Y/qEa8cepRP3soaPXfD+kD
 YIbhxWwZjN0MJLVWPXYflwKu2drfuyCq+5lnePGzuLn4g4ZPlVsRuoGkvCuxx4Xr
 O/MxgfuGgRYzVv2nrXWi2iisKtoGhaYVnwXD5jqlZl9i5w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkf57bxme-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 07:31:20 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-34c38781efcso6499356a91.2
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jan 2026 23:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768203079; x=1768807879;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aieeUG5t4cx92lVZlSq6w5IqSGyS46OAJyDHIiD8MkU=;
 b=j9lpkF1xjMhBwZYAGDuTesfDOcHET8K3v+rlZ+2nX6vRWXcR2BJ5qkwO4qOdUSiKaK
 u2eE+YKLnjIWNaRPFORqofLBIvHxN/UaGHJTQWvbZqbkTiLHowRsrLhsMMg7PYE0tpDi
 Up4PWG8ksgKrn8lFrhzpBUPZ40BtNwd90vEX/co/Chxy0uCUs3YjiY6Fv+EMMxehkv60
 Cs1E6/14D37iL2tTKaYvuqS65kel5Pzjy/B+qScphPUJPhFDEa3lTpyZDmQTDS5L3CE/
 WEBHsu+PQKkTglLkPjvhYQtMKb8VY8G8WCB9Thu51PFSQIUtJS+/Msu/C8mR5X5WZQun
 i6Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768203079; x=1768807879;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aieeUG5t4cx92lVZlSq6w5IqSGyS46OAJyDHIiD8MkU=;
 b=W769duRI7m2Kf9PZdJ2161luXLF5CYwcmrUGeHUXrKWUPrVCh6Oq45Mz8Sk33YSkmx
 5oQv0ms0QfgwdLGoeYMtun3YtPN1I8DCpWQHqqqRGcmrjhyc2HtLD1tT2kytNvThPZ8U
 XXLnuSJDDJkmBp6azX3MqIlitLQhVl8uKMtN5/1EQPzetcZ2Hn6p7jURzTAnh0aUnce4
 2zrRnIghaAAgybSDpmiqSOqNiDtX0UGCREqCkfRiwMzBqL/ZbNNKuj+UJzAgdjGI2gvP
 upcYSe1SeDr/DjwXtEuASFLbGIG0bWtCz/brEBOVz1dOgf6Fo8o2t291PsF6u/L8ARVy
 ZrkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3l7qLy0b1oGBY7K2uNNT6zMRgErTIjJ+7oGrhcvlGpK236edFYVk9GCXa9Ak0IiKv2Vvjz/taeAQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzDwuRGXt5cU2lad0hbZXbjXWy6VVA/82/dY54I1eboQPeCKOBG
 ENhitrZZw1TACYIh+E1l5E0Z22/0fhp26gwQbbN4CzETlFBiAseRNIO0xXPQdJX0CD4+JxP4ZJ4
 3j36ePm0daFnJxmCSgvs2zl5pNZoHBQz/vlnGHV9GpIC922SgTOpnA+Gw03EGo0aTk36SuDNG4k
 l+NgWj4XUpy0xWfS9qCSVHvKEwgIML/OjO8zH6xuBXSMC/vw==
X-Gm-Gg: AY/fxX5jJW/fOxgPGarbjnYQPYIZcsedY4BM0Dck0BNUCkdoEUDer0r3ROR91sbbzQ5
 e/jpq6b4rvS3BmnYO49iW0/L7INYVCmB4G/slb82uUad/Nsj41mbCFP2rZ7OULf2JRF5iMOc7M/
 BY7PpuI5NwQYIjWDVy0g0X29JBgzRgW/cXGk9ltgII7EHMhorj8AuNK0zTIh0eNtYSWJY5t6YVz
 S05VJwQ
X-Received: by 2002:a17:90b:57c4:b0:34c:a211:e52a with SMTP id
 98e67ed59e1d1-34f68cae46emr15271752a91.27.1768203079384; 
 Sun, 11 Jan 2026 23:31:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGVeH0yXzyL99iEdeKLneF+ImcqBHnePS2A59769rwS8dnkwplqXvC3R56OCpCd22vzD6s6AQmmtQNsHGCNhFA=
X-Received: by 2002:a17:90b:57c4:b0:34c:a211:e52a with SMTP id
 98e67ed59e1d1-34f68cae46emr15271737a91.27.1768203078885; Sun, 11 Jan 2026
 23:31:18 -0800 (PST)
MIME-Version: 1.0
References: <20260112-max-mixer-width-v3-0-f98063ea21f5@oss.qualcomm.com>
 <20260112-max-mixer-width-v3-1-f98063ea21f5@oss.qualcomm.com>
 <2E7090A0C462255A+6658f83c-4e5b-4f49-a90b-54eecd61fcbf@radxa.com>
In-Reply-To: <2E7090A0C462255A+6658f83c-4e5b-4f49-a90b-54eecd61fcbf@radxa.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 09:31:07 +0200
X-Gm-Features: AZwV_QiGdaYcA4jSvflgXX6CaLCQduNAeACnn8ngi5rlFmuoNNo_wOw555UhKO4
Message-ID: <CAO9ioeXY=rzZkJi=Lz4-JDASSnE7DWBh59aPawrPSzrFFPCNbw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] drm/msm/dpu: check mode against PINGPONG or DSC
 max width
To: Xilin Wu <sophon@radxa.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=K/sv3iWI c=1 sm=1 tr=0 ts=6964a348 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=ksxQWNrZAAAA:8
 a=EUspDBNiAAAA:8 a=5DgrgJxoGKuf3rDOEbEA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA1NyBTYWx0ZWRfX6g64uhqm26es
 0feIZgnBjrcM+tUQvSYReP7DfqONlkdOGR2ZZ6PEueLF3NlgN5z8VBVowg2VHOBhakaQidRh8Sd
 Q/sieVCGjHGTo/6rwaC3pHRz788wp5avHzr5Lgu4XvQgd4vrSSOUEt2X7UlNbiZ0FhpfAKPJgZS
 naTGFodD2+bgB9hY7gz51J2iAlevD9JKIrWRFeoCfYyW0cn/Ebv9s2O2SmOJID5NsEmUVy5S9IM
 ZrIRg99FZ5EP2q4GNddXsqQt4i05aT4SoGdmEvn/UtLN+FsZKdyu+PzEgRFpmVXNPu1HL+wkvQ3
 SuvdQqGDbCYmDF57WOfVL6Z+2DV7SeEeH9fe8AN2fuyKoGSRRZR2ua9X8TAlWNhtJxbbcnYGDBJ
 +oiL2UvdxTABgB3fhMkIZoSiZ2FGurY4Fe1/k0wrqtZ7XaobWIO3JH4iEnUIJj5avwpG1nuX8lz
 eG6AV8A60kS4LaCrivw==
X-Proofpoint-GUID: JMTXs35yOnJeIJG5Hcjol-CQaud-xCS0
X-Proofpoint-ORIG-GUID: JMTXs35yOnJeIJG5Hcjol-CQaud-xCS0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120057
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

On Mon, 12 Jan 2026 at 09:25, Xilin Wu <sophon@radxa.com> wrote:
>
> On 1/12/2026 11:11 AM, Dmitry Baryshkov wrote:
> > From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> >
> > LM block doesn't have a hardware buffer (unlike PINGPONG and DSC
> > encoders). As such, don't use ephemeral max_mixer_width and
> > MAX_HDISPLAY_SPLIT to validate requested modes. Instead use PP and DSC
> > buffer widths.
> >
> > While on the DPU 8.x+ supports a max linewidth of 8960 for PINGPONG_0,
> > there is some additional logic that needs to be added to the resource
> > manager to specifically try and reserve PINGPONG_0 for modes that are
> > greater than 5k.
> >
> > Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> > Tested-by: Xilin Wu <sophon@radxa.com> # qcs6490-radxa-dragon-q6a
> > [DB: reworked to drop catalog changes, updated commit message]
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>
> Sorry for the late reply, my colleagues are still testing the new series
> on qcs6490.
>
> However, this completely breaks 4K 120Hz display on SC8280XP CRD, which
> was previously functional (albeit with the clock check bypassed [1]).
> The display now shows a solid blue screen. Kernel logs indicate that
> only one layer mixer is being used, instead of the two that were used
> previously.

Interesting, thanks.

>
> [1]
> https://lore.kernel.org/all/F4CDF36128041430+0d030e3b-054c-4910-a132-72273c541948@radxa.com/
>
> --
> Best regards,
> Xilin Wu <sophon@radxa.com>



-- 
With best wishes
Dmitry
