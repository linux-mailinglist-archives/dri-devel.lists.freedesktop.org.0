Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF426AA1A5C
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 20:21:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5F3510E236;
	Tue, 29 Apr 2025 18:21:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AOTpAYgx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42B8810E236
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 18:21:31 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TA2S5q011802
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 18:21:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=PmqoRG464qsnj0pu8T0c6779
 M0hEG7ElmjAzQA6sfi0=; b=AOTpAYgxnyRsVZRjLRr7VXvigdkz/UwUlNRZ7MPu
 qniHDYs5yr1d8BtuPkqTU/sBWuvBH24kVXmSiAqdM48hGYNC4P9TGyHn4S1IPOX+
 bq5POuQZNvTrrtzgMxXGeXI/mROs3WLNUUY57vTXMmGHoH+Df/y5qSo0hzxJSH4B
 HFaCBTDHCvcxGStbRR225+2yGvR5unAVw26dMVzYFlMy1RqDaDxtBzHmuAqJViDW
 d3KX+41X+sHKyBPn8ZTkwNo8bFBhWuqnR7QVQHHnHuGos4shhcyJs6QQBL5g83Qy
 xJChDYWnI9F2bIYsA5+2advFxHyL5VdS30mWOZS9y7UzzA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468pg9dje5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 18:21:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c791987cf6so1292224785a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 11:21:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745950889; x=1746555689;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PmqoRG464qsnj0pu8T0c6779M0hEG7ElmjAzQA6sfi0=;
 b=hYX6sqqfHDh73dJ7HvDoBGAca2vubHQZ+ViDrL22nKoaU1/W3+TUtfC7XtxxU+oanL
 8w5FINpVAkHiI8JD2SMFPy5sBd1rZB3PXe46Cs7gvEVTKv8URLvCB3VXnd4kdhar8+rc
 ov7FY40XxqvcSIcvnNlmbRLQaJ0Sm11w7FmTtEQ9R6NpH4bdaTsmt1iiq/MJ8ox3cEhm
 foldYp+nDyNBasoXcw1l3tvP0aCQmi2HdXF7XpzF6by2mm5qG3ocrpleZbnVeJIcNF/N
 tVUpgM3AtD0hp3MOD7/0+RhVaVvOG1P1lhmoLuyt0xg8g59JTGTRa7weBCt8czt4xeqL
 ZpDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbCYNPgyTwj27PKOsezqT+AujzuW+OfQSeHhab25CBWyAh+O1/ZAUYmjNvGArgdnJrY3hUtkzCUk8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzsV+6uMBxkeiqXXLI2JCYdk52Ood9DSlNM7IBVpepiTLRsT37s
 qUix1ZZ0Ta4/9qXYRjRpApvlzS6jcnIuNhzd8nD2T+huHy7p55UjPgNVr4FnKVFRYE457xla/nt
 FuSQ7WhS5hOdemW94qNSAOXpnt7EflTsXNGKPqUAIVqHrKEYL5XA0ZBm8Ed1BNX8+4Ow=
X-Gm-Gg: ASbGncs5xSd8uHB4CXR9isMHLtVoflH83ehz6/Toe2+cMSJFLz+06LohzfsCS5Nb+vB
 XmaUrBa/J8cTfWCmxxRILZ6XYSmpPgxRtdqNjDqoTBrWWAfymW3/C5aGlWbnWTTfQUTTO0Cqskk
 cDSp6oIteXwF2dfgAqtHOEYLTQ642l8LruPCbm4t7WDb0x93Tt6x++9Sfdax3lVCI1yH1Kc3bwU
 bYv+G/EglaZJWquIuERATniLq7Dp0ghcygp/4dwuG/9hkxrLB7/Vhtn+x/iHhKYoYHmoMTZH72a
 2tsRufRiJsWbJCd2EsbtFYFu8sOk8bFWvEafNYeObP+oWv/HcOzu0UpBqNwETsgO2JtsDVNjMpA
 =
X-Received: by 2002:a05:620a:c4c:b0:7c9:2612:32d6 with SMTP id
 af79cd13be357-7cac76deb67mr10118485a.48.1745950889435; 
 Tue, 29 Apr 2025 11:21:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEpf9hzPxO+ornriQj5u2UWfhmL7wM+Z3TXsQc5Mtvy+HyZAWYphfNSkz3n79ilJezodpQzrA==
X-Received: by 2002:a05:620a:c4c:b0:7c9:2612:32d6 with SMTP id
 af79cd13be357-7cac76deb67mr10115885a.48.1745950889098; 
 Tue, 29 Apr 2025 11:21:29 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e8fd2d823sm1322651e87.194.2025.04.29.11.21.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Apr 2025 11:21:28 -0700 (PDT)
Date: Tue, 29 Apr 2025 21:21:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: Daniel Stone <daniel@fooishbar.org>, dri-devel@lists.freedesktop.org,
 daniels@collabora.com, helen.fornazier@gmail.com, airlied@gmail.com,
 simona.vetter@ffwll.ch, robdclark@gmail.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 valentine.burley@collabora.com, lumag@kernel.org,
 quic_abhinavk@quicinc.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/3] drm/ci: uprev mesa
Message-ID: <rrrquzr4k64e6b74g4foio7z4pltfx3oxrqbrrw5w3frlmyzkd@x45yj42sgplt>
References: <20250328110239.993685-1-vignesh.raman@collabora.com>
 <20250328110239.993685-4-vignesh.raman@collabora.com>
 <CAPj87rOPHqLaFn3r4rkeMMrQ=OSRQUJ2LLrQ4ZDE6eA1S6zybw@mail.gmail.com>
 <3a3107d4-cc59-42ff-b3f8-2280a357208b@collabora.com>
 <4cac94b9-2445-458c-a39f-5eb72537d6f6@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4cac94b9-2445-458c-a39f-5eb72537d6f6@collabora.com>
X-Authority-Analysis: v=2.4 cv=ZpvtK87G c=1 sm=1 tr=0 ts=681118aa cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=QX4gbG5DAAAA:8 a=xA4-SxEZz4SaK2JE-80A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: gkiTiVbeAilpK3EbjrO6BpftUJ5BFU8-
X-Proofpoint-GUID: gkiTiVbeAilpK3EbjrO6BpftUJ5BFU8-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDEzNSBTYWx0ZWRfX5YlGt786olsT
 /hyJd9K28Hr+5UiSrRwFxmnWDHra5/M/h++EFuhroBmgjUgLDggW08UcI7354yLun62LoV8YLTn
 hsViY6nvtTgaLL2SWKAbUaI/TxSOY4Jhhtct3AyfGsYjZb9XtOsWjMExraNdGvRl98TKDAGl7mi
 FKhbIQymz+e6dMBDO7FgNFp4499v/t5/AqAYf3FUCTXWf8q5j69WqYkrpyOIqzqMajgMGg/a5gX
 lkNjHZSfveoe4PFACOz2YRy1y7oPAWpidV8D1TwyqacPA2C0p4Eyx9GTNLwpSJRCNf6A7SrGeZY
 n5zLAhBi79nIotpVAUjKu1FF+W6ZHB6sCeUPUemipswPd1OmZg8QQTEEAVfgtNCTbII8dxaPYhN
 LXOER53HDFCb1n0SsrmXh1W8u3XGtp/H8//GPeU4vc3+rb3W5yUZOv37tm7fGjv+qV4f/Lzj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290135
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

On Thu, Apr 03, 2025 at 11:29:55AM +0530, Vignesh Raman wrote:
> Hi Daniel,
> 
> On 28/03/25 17:29, Vignesh Raman wrote:
> > Hi Daniel,
> > 
> > On 28/03/25 17:06, Daniel Stone wrote:
> > > Hi Vignesh,
> > > 
> > > On Fri, 28 Mar 2025 at 11:03, Vignesh Raman
> > > <vignesh.raman@collabora.com> wrote:
> > > > The current s3cp implementation does not work anymore after the
> > > > migration, and instead of fixing it and propagating the fix down to us,
> > > > it's simpler to directly use curl. Uprev mesa [1][2] to adapt these
> > > > changes. Also replace broken s3cp command with a curl wrapper call in
> > > > drm-ci.
> > > 
> > > Thanks a lot for fixing this. Sorry the fallout has been so bad.
> > > 
> > > You can also upgrade ci-templates to get an s3cp which works again.
> > 
> > Thanks for fixing this. Will use the latest ci-templates and test it.
> 
> We need to update mesa to use the latest ci-templates and then uprev mesa in
> drm-ci. I will send this in a separate series after fixing it in mesa.

Vignesh, Daniel, any updates on this? Currently drm/ci is broken both in
master and in drm-misc.

-- 
With best wishes
Dmitry
