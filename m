Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5541ED0CF09
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jan 2026 05:18:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A25810E26C;
	Sat, 10 Jan 2026 04:18:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BfekGxZY";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iDZwrn6e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACFAF10E26C
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 04:18:11 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60A3Ypls2731322
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 04:18:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=YvjR0sBl390qKfGTGwTn1b7N4BohJDG5WI0+S6lfGO0=; b=Bf
 ekGxZYZrvAfw6lK8Y4gHqENufiUBXfU3wkG7ro068gB6oDimVe10D6URbkdZ35cw
 o/Z/Sfe9HKU2EqyccdEWiZu1Vhbw8nQyuCXuko0G8kZld4nuFBIxBo/mOBcdPnWo
 dQoTBAtSOiSwZS3qs2mMm3sBkirrj4RkiKJ2Ha8KvElBXENGufDQkIzgvdufPc03
 0cygvwlLV8VpZHHuUMSqzoCQUq6JOm61jMRuNdphO4ZqKH6lh4FQVrj95PqKN0d+
 M+Dp733rW7Pch3HbOn1GIffgkx7c2DyaxmyMoGi6ya2DwipG8TcpnhCeP84jNxaE
 ZFDjQhFH33HI03eRlLBA==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkf00r22p-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 04:18:11 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id
 5614622812f47-450be8a012cso8468254b6e.0
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 20:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768018690; x=1768623490;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=YvjR0sBl390qKfGTGwTn1b7N4BohJDG5WI0+S6lfGO0=;
 b=iDZwrn6et3+hYL4RivzhAxHnihvPl5gtIA0IPXmc8486WEEcQIiZc2oTW/cI7N/gUH
 q81INWHPEXCr8qdjBXBbCij4Vs8fO3RObZXk5l4ZG/yjsd6rqLhkfamtJC2rM3zuxV4z
 xqJHo/BywFgM9ZxVWE383nj2tABvUugTa1tAXTcuWu2xzWT0QPWHTR1GLzyz4xRepTG+
 bu4YFMF5i9TYYseK0CaW5Oe5jjuHXVtvebsCI6ReTf40acQ8NSXlFnJbERypZr2s4QjR
 TgWz/hkg4rExHURf3qoZLIgnd8IBKLGY0LcQ2eQtLbJ5Be/sx37b+Fy15/M2KIu5uvZG
 q6jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768018690; x=1768623490;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YvjR0sBl390qKfGTGwTn1b7N4BohJDG5WI0+S6lfGO0=;
 b=T9oYwgvkcs9ej0BLKq2TrM83I7BYCKCGET46QyFfmmIaUZ+fc2ou4UDZWPKQvQ0Pgo
 2bPosRqZXzJJfKT4A5+SXrbib21V0ULRK0QbXrHb1YEjsdRkJrcP22b4A6027imMVJZO
 hp1AWsW7lNlHS6L3SSAlqRgTVD04AR1Q/g1Kv+0pVBXBKrycPm6TFyEAYMk5n3soau8W
 LamyNkslwS1o7X/2z3MyNl/6ghu4jlea1/gh74GQy/xhx0uoFbZMTUs3Gon+VOuvDGZB
 METSISkhenpYdVsjJ4l+QZUMtnoe7Sq2+dkt8GRXF4TRcsJQQdRTyYUhlEJVq5wEzitv
 mUEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjVkjjHf0SAoxorx5LxwrfiMf643qJz1DnK9f/6I7oeNXEzy/uGhg5hgpZzlFV6oyqgE51gVCyuXI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzPrKgSXqQiQo+LF3YcQI4T2E6sXeVIDcDjcKH0WzRFlhKLCRxB
 vP+cTosv+CSLY01aEKTRhNDCh7l5e+zD09NJCp9vPkkjaTCCKllHvSxytY3DU8lZnzuScJrkIVO
 pTjp73T2PenteprxWYsAoobpx+VK8czYuKqW3C4BGY/Eik9cZRtapZfNT/DItJACieeFPkX3ZAI
 XZnuxpvmb9O/vdjCv8zs/n1dbSGcTtbuGlxc837ibhOMUAgQ==
X-Gm-Gg: AY/fxX6LoB2Q6xy6PwAVj1oMVwBP4XOxOxcurQYj0/VZE1FBMA2vzqxF9CwwB9AFlDl
 4YcoFqSD9UIsCFqzK1yJeDXf8g3k2KjYlll2u9zayLLW1BlIb4noqEmjsx5A/PB4yHdRg0zwx3m
 rSenM8e7Dz6hWHw57jpBFIt7C7BTCzoHbRmF0DaH3rAkNJiHlGMjSyNcLyhi4ok7jzCg==
X-Received: by 2002:a05:6808:2215:b0:44f:6ab9:4aee with SMTP id
 5614622812f47-45a6befaaeemr6297684b6e.63.1768018685548; 
 Fri, 09 Jan 2026 20:18:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEymw+xBhx5CKa9dPjA1bNNpF9wJib+zhE+Ki6h1wPxpj6SjAHb+30fr/sZ4jiXlFDFMlOvN+MlaY3wAHuPd3g=
X-Received: by 2002:a05:6808:2215:b0:44f:6ab9:4aee with SMTP id
 5614622812f47-45a6befaaeemr6297655b6e.63.1768018684906; Fri, 09 Jan 2026
 20:18:04 -0800 (PST)
MIME-Version: 1.0
References: <20260108-topic-smem_dramc-v3-0-6b64df58a017@oss.qualcomm.com>
 <CACu1E7EDmLPhUFyouD=W6n+U7=oo7+6PY0Gz9=3pVpT2Qu9Z6w@mail.gmail.com>
 <CACSVV00iiAXGOqV2HZs9KREoqatE0eNBZjFH9hSFMmNaX3_RXw@mail.gmail.com>
 <CACu1E7Fh=GbLTiedj6OqtUxWiZbCVcKmsEzV6FYan5G6r1uyUA@mail.gmail.com>
In-Reply-To: <CACu1E7Fh=GbLTiedj6OqtUxWiZbCVcKmsEzV6FYan5G6r1uyUA@mail.gmail.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 9 Jan 2026 20:17:54 -0800
X-Gm-Features: AQt7F2pDX7FL2yQ5nEVGvdEQ4fegGKJEg02gjG594h0T2ZpR_q9rSVNBqJ-Mto8
Message-ID: <CACSVV015qwuGnJrMiZa=eKzu8BeGyGg5gpp=ko7-QgrAjE2phw@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Retrieve information about DDR from SMEM
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Sean Paul <sean@poorly.run>, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=V5lwEOni c=1 sm=1 tr=0 ts=6961d303 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=KgOssdJzQp_kbXOIULcA:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-GUID: 4zHg9vNivJwmpzX0meZqmge3ahiwUAkk
X-Proofpoint-ORIG-GUID: 4zHg9vNivJwmpzX0meZqmge3ahiwUAkk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEwMDAzMSBTYWx0ZWRfX/j+LJJL3I9Ip
 anNel/elDAgV1hK7L/8/k0B+9xtUSt+hBl83ZkKAYYIfLyUFjyYoxfSJXZ0an67HomleeAlmTQ9
 Z0VwFR/yRwoad+5NVBXcGqrpxCkqGkjZtzh/b/bmMFwQJJQ4bLWHt7X7e+44N0OD2wSZudHrawy
 +0IabjX0PXdHRe6/rhu8P9rx+EbXGQECANfma8D6PLpWgnOEWTYxId7GuUqRYSCLKpVB30h903t
 YVjimGzbi1oAHx17k91tIFj6/SL4vQaYcJITcz/DoPpui0FafV4+4DqsHoLGKvWxn71s0kXn3CX
 m5ACHg+KK5q8+QVYM7MNvfyj5IIabB9AMb46/3vF2E91fIq6v0N2tjG7MDBpJ3/sWPJB9iTYAXG
 Hrp7KYz8T25wi98EpL3kiMVHxgsnyRJYcrCgOB9dmBPtkp8vDX2MzSe3MHqH8cEwfItWD4o7Cm9
 f05ymafteUZZ016wIVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-10_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601100031
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

On Fri, Jan 9, 2026 at 1:03=E2=80=AFPM Connor Abbott <cwabbott0@gmail.com> =
wrote:
>
> On Fri, Jan 9, 2026 at 3:41=E2=80=AFPM Rob Clark <rob.clark@oss.qualcomm.=
com> wrote:
> >
> > On Fri, Jan 9, 2026 at 11:11=E2=80=AFAM Connor Abbott <cwabbott0@gmail.=
com> wrote:
> > >
> > > On Thu, Jan 8, 2026 at 9:22=E2=80=AFAM Konrad Dybcio <konradybcio@ker=
nel.org> wrote:
> > > >
> > > > SMEM allows the OS to retrieve information about the DDR memory.
> > > > Among that information, is a semi-magic value called 'HBB', or High=
est
> > > > Bank address Bit, which multimedia drivers (for hardware like Adren=
o
> > > > and MDSS) must retrieve in order to program the IP blocks correctly=
.
> > > >
> > > > This series introduces an API to retrieve that value, uses it in th=
e
> > > > aforementioned programming sequences and exposes available DDR
> > > > frequencies in debugfs (to e.g. pass to aoss_qmp debugfs). More
> > > > information can be exposed in the future, as needed.
> > > >
> > > > Patch 3 should really be merged after 1&2
> > >
> > > No. The HBB value currently returned by the bootloader is *not* alway=
s
> > > the same as what we use currently, because some SoCs (like SM8250)
> > > with the same DT ship with multiple different DRAM configurations and
> > > we've been using a sub-optimal value the whole time. After all, that'=
s
> > > the whole point of using the bootloader value. But patches 1&2 will
> > > only make the DPU use the bootloader value for HBB, not the GPU. So o=
n
> > > one of the affected SoCs, it will introduce a mismatch. You can't
> > > change anything until the GPU side uses the new ubwc config as its
> > > source of truth.
> >
> > Hmm, how is this even working today if DPU is using HBB from the
> > global table but GPU is not?  Are we just getting lucky with
> > compositors that don't know about modifiers and end up scanning out
> > linear?
>
> It works out as well as it's always worked out, i.e. we try to make
> GPU and DPU config match and pray that we didn't mess it up. At least
> now we'll get a warning when they don't match.

I mean, upstream we kinda have a lack of feedback metrics other than
people reporting bugs... so maybe the first step is to break it with

  *cfg =3D *common_cfg;

and see what happens.

> >
> > We do log warnings when the global ubwc config does not match the
> > "fixed up" config.. google search for those msgs doesn't seem to turn
> > up anything other than the patch which introduced them.  Idk if that
> > is conclusive in any way, but I hope that means we could just delete
> > the fixup code on the GPU side.  I suppose we could add:
> >
> >        *cfg =3D *common_cfg;
> >
> > after the warning as a first step.  That would maybe get some bug
> > reports along with enough details in dmesg?
>
> Yes, the plan was always to delete the fixup code in the GPU config.
> And even that first step would be enough to prevent regressions when
> switching to the bootloader HBB value.
>
> There is a problem in that ubwc_swizzle isn't as well tested. Older
> parts supporting UBWC 1.0-3.0 partially or entirely ignore
> ubwc_swizzle, because it wasn't configurable back then, but we rely on
> it being set correctly in Mesa for VK_EXT_host_image_copy and sparse
> textures. So if ubwc_swizzle is incorrect you probably wouldn't
> notice, until you hit the HIC codepath in zink or some game using
> sparse textures. I think we fixed up all the cases where it was
> incorrectly set to 0x1 instead of 0x7, but it would be worth it to
> check again.

There are a lot more things out there than there are things running
games that would hit that.  Idk about zink, but there is a gallium
driver.  Either way, we don't have metrics feedback so the only option
is to break things with enough info in dmesg to figure out what is
going wrong AFAICT.

BR,
-R


>
> Connor
>
> >
> > BR,
> > -R
> >
> > > Connor
> > >
> > > >
> > > > Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > > ---
> > > > Changes in v3:
> > > > - Support v6 and v7 DDRInfo (v7 is used on e.g. Hamoa)
> > > > - Handle rare cases of DDRInfo v5 with additional trailing data
> > > > - Rebase/adjust to SSoT UBWC
> > > > - Expose hbb value in debugfs
> > > > - cosmetic changes
> > > > - Link to v2: https://lore.kernel.org/r/20250410-topic-smem_dramc-v=
2-0-dead15264714@oss.qualcomm.com
> > > >
> > > > Changes in v2:
> > > > - Avoid checking for < 0 on unsigned types
> > > > - Overwrite Adreno UBWC data to keep the data shared with userspace
> > > >   coherent with what's programmed into the hardware
> > > > - Call get_hbb() in msm_mdss_enable() instead of all UBWC setup
> > > >   branches separately
> > > > - Pick up Bjorn's rb on patch 1
> > > > - Link to v1: https://lore.kernel.org/r/20250409-topic-smem_dramc-v=
1-0-94d505cd5593@oss.qualcomm.com
> > > >
> > > > ---
> > > > Konrad Dybcio (3):
> > > >       soc: qcom: smem: Expose DDR data from SMEM
> > > >       soc: qcom: ubwc: Get HBB from SMEM
> > > >       drm/msm/adreno: Trust the SSoT UBWC config
> > > >
> > > >  drivers/gpu/drm/msm/adreno/a5xx_gpu.c   |  11 +-
> > > >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  82 +------
> > > >  drivers/gpu/drm/msm/adreno/adreno_gpu.h |   5 -
> > > >  drivers/soc/qcom/Makefile               |   3 +-
> > > >  drivers/soc/qcom/smem.c                 |  14 +-
> > > >  drivers/soc/qcom/smem.h                 |   9 +
> > > >  drivers/soc/qcom/smem_dramc.c           | 408 ++++++++++++++++++++=
++++++++++++
> > > >  drivers/soc/qcom/ubwc_config.c          |  69 ++++--
> > > >  include/linux/soc/qcom/smem.h           |   4 +
> > > >  9 files changed, 485 insertions(+), 120 deletions(-)
> > > > ---
> > > > base-commit: fc4e91c639c0af93d63c3d5bc0ee45515dd7504a
> > > > change-id: 20250409-topic-smem_dramc-6467187ac865
> > > >
> > > > Best regards,
> > > > --
> > > > Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > >
