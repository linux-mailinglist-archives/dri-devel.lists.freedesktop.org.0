Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F852B23DF3
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 03:52:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0882510E192;
	Wed, 13 Aug 2025 01:52:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="B6K/66g3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 434A310E192
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 01:52:13 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CLaSR7002367
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 01:52:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=azzIjnnFrhGZepf8cF63On31tVI6l+R0n7SE8DktVtY=; b=B6
 K/66g3ltbZTioLlekcBRWaDkXKx5FaDf29+mwd6bhANi2CiCGfU/pSSR0t1FwC+p
 /iEKACkRvSPcaiJVxDDu/SPP+qLBEp5+AMSbbXX4sldx6dqBLx/lgwIpVEcunWOQ
 4Tti/eM8A9U/rqgDs9cBWNgzx4qvIVFYPlxWvZeOK6Ck1qfR/2Z/C72SPPNDJIl7
 m5BVknnQhhKkwz+82zvQ3Bwmht0Yq3ci2NIIMJ/8RGgI6jgUJ4KtLUfGU2te+jha
 YQ2161nV9Z1wFmmaSQpvez/7MQ6k3qgPbM+cdUedVBrdTtr1PNEqasPezSRk2hfr
 f7UQIuTY4HYiHLgx/bMw==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxj4a34m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 01:52:12 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id
 46e09a7af769-741ab0f2e82so1060340a34.1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 18:52:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755049931; x=1755654731;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=azzIjnnFrhGZepf8cF63On31tVI6l+R0n7SE8DktVtY=;
 b=g3Hf05oY0Zsc5ksBhOACYNGRNW+aYrR1FfzFZnh+JYGusFb3wzEGbZ8xO/XMYUQp1E
 9lyUKQNN4LUQyPmg6ckC/ajFcvljUyXBDe9L4dRdhc0Ytoq+LAbfFKq7mPLf1sFvsMOa
 q3L+W2pnc6nXLmlousVNBcKpUKajqXXgpTusfxH3Cek0jUIDzkSLM2uOvMMo2SGW2Pys
 UATf6OEg8Wo9aPfvavpuSTZpLfkmtQt8S6FJasZL99MHBSfD/OZCXMBC9pnRfri+s5Ii
 cNS2ZhEGT+uarBtqrtiRC0RCUzfSS2x9ljm3noVsF9k/1OaaB7JgK82D7gtvEVr/c29t
 6Ebg==
X-Gm-Message-State: AOJu0YwRNlf+pt+BC7O9r270rkrr7DieCFssBV7fKAlVAWnEU+4AFkdF
 kevzzpc2CknxySt0jZOpnwtES/uWDRGr9HEMMX5AunvQ81herjWtgClMxxDrRj0v5uZamT/kxxt
 dnVuoAVfRhY+6TtRILNMniWJfg5ZnzLH1pEQGt27ZP28d4K4AQJJilGAv4ygH2uTR3GShwf2Bl8
 HLoIcHiMIv7mrSopVEeCudC9pGDkfjlbqmcTYlaweh/vcauw==
X-Gm-Gg: ASbGncsS2aXyugwoN5P+rdr9Bs3jOroLnJM3iqUuOIfFZLy6hCjqcgOq1OQPLQoxcAr
 YKPysobfADasxLDpZ96ZWEBBF132wAbLjS1U4s2WqscUuOCB4tZyaG/ai4rohwc7KcKHwCcJMn6
 5FIu8owE+CDY2I4ikcmtg=
X-Received: by 2002:a05:6808:22a9:b0:435:7090:b652 with SMTP id
 5614622812f47-435d42a2575mr1191302b6e.34.1755049931468; 
 Tue, 12 Aug 2025 18:52:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+oxwqW5ocHWrqoj/uh9nhQTzkltL6bf5O3y495PvLUQY65I8XhC+SpjSkN+0X4azk5mUzEknXbe5Iorw4nT8=
X-Received: by 2002:a05:6808:22a9:b0:435:7090:b652 with SMTP id
 5614622812f47-435d42a2575mr1191273b6e.34.1755049931074; Tue, 12 Aug 2025
 18:52:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
 <20250629201530.25775-15-robin.clark@oss.qualcomm.com>
 <b0a36f3d-706a-4622-89a1-f88c6255e4fb@dakr.org>
In-Reply-To: <b0a36f3d-706a-4622-89a1-f88c6255e4fb@dakr.org>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 18:52:00 -0700
X-Gm-Features: Ac12FXxxd6WCPyXXb8MbyAX1gkPmIUnWgdFOtYCj3v3CcVsNgXCk29Md82IFzps
Message-ID: <CACSVV02+hE1j9vN_BU5pwz_4cnJjj==j-L5oPeFWCvEr+1HiFQ@mail.gmail.com>
Subject: Re: [PATCH v9 14/42] drm/msm: Convert vm locking
To: Danilo Krummrich <kernel@dakr.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Danilo Krummrich <dakr@redhat.com>, Rob Clark <robdclark@chromium.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b"
 <linux-media@vger.kernel.org>, 
 "moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b"
 <linaro-mm-sig@lists.linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNyBTYWx0ZWRfXwsfxA3HL/xha
 wCGm4z0JRUrp157BV7C9eXPxmimAF3ZvguTC36jDQBbB64iLLyt8xcD3BGXV2KXbNoX/JX/7nAD
 PU/18A5uamKbHwE42K63R/LJ00ZzdzxEMumBgZENGIi4rHvGeTkS1A9uaosfuVqX0rjnMb2ETy8
 Gt5SyataY4EejdpambKLPm8C/uikoIylduVslSuCx4GqjSz3YcOa946WhY7B5dBHlkpbywR3Hdx
 hYx9B/yLTUd+uYs7CFw0/ZxK0dZF3OER9didryxxUaMRm45Nmo6IUsIfQUxkC7drJ6UlCWuma0Y
 NNe3kY9PMIW2EsNvoNk08f2HTqmQvoVtVUNQpHblORz7fowOGAxqpDFkGa8sn5isUyBTJ/lTBl+
 26tKNqYa
X-Authority-Analysis: v=2.4 cv=fvDcZE4f c=1 sm=1 tr=0 ts=689befcc cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=P-IC7800AAAA:8 a=pbUkqq1XAAAA:8 a=Dc8E7AEoan46jiKjpnQA:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22 a=d3PnA9EDa4IxuAV0gXij:22 a=F7rrpbw-2xKc1p48v2RB:22
X-Proofpoint-ORIG-GUID: ZC1lTLtAStQVWg182y7EJr0S5OlRNG9W
X-Proofpoint-GUID: ZC1lTLtAStQVWg182y7EJr0S5OlRNG9W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090027
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
Reply-To: rob.clark@oss.qualcomm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 12, 2025 at 1:58=E2=80=AFAM Danilo Krummrich <kernel@dakr.org> =
wrote:
>
> On 6/29/25 10:12 PM, Rob Clark wrote:
> > +     /*
> > +      * We mostly want to use DRM_GPUVM_RESV_PROTECTED, except that
> > +      * makes drm_gpuvm_bo_evict() a no-op for extobjs (ie. we loose
> > +      * tracking that an extobj is evicted) :facepalm:
> > +      */
>
> Yeah, it's a consequence of this locking scheme and I really hate it. How=
ever,
> you don't entirely loose tracking:
>
> The next time you call drm_gpuvm_prepare_objects() it will be added to th=
e list
> [1] and hence picked up by subsequent validation through drm_gpuvm_valida=
te().
>
> [1] https://elixir.bootlin.com/linux/v6.16/source/drivers/gpu/drm/drm_gpu=
vm.c#L1154

Hmm, maybe the issue was with legacy (non-vm_bind) contexts, which use
drm_exec directly for locking?  I guess I can try to revisit that..

BR,
-R
