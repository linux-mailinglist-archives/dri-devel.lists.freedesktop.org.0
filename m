Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD7EB45F59
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 18:51:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0A3A10E367;
	Fri,  5 Sep 2025 16:51:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mb7+sxRH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 982F410E367
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 16:51:25 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 585FuEYG013622
 for <dri-devel@lists.freedesktop.org>; Fri, 5 Sep 2025 16:51:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=4xa3n6NDrhRLnjmOPl5k/ZnS
 t/9I4YsaolOfWnhteaA=; b=mb7+sxRHRVew2env8Xw4AqGvdnL5/GQLdGPSqiyW
 MBaqxEzr8eNxsKOmePzhiRkj3R/RwFAy4a4xJ5yjsrfwhR/cbZrRKbOIZ+JgczRW
 QLc61xaTN8I7Tiu4MtH8n/tS4mzMUWeT3dhyeQp9MDCoSfnrHzSpfCN6Rdg2NYz9
 io7YIYfJ+EfNsnArKMcehxFC5UH9u3mhryI6Q+A71f+6wFSKswxUorwE37MixNp7
 1MPpkAdR0YgJ15Todig6xXjGdTp0GBUxeFMhkJ0+9vfnhhfzpnrxBVfWS9umeHLL
 UmHY8AiVMS2/T5Ie76Hn6lDfmmqbdVMXX4t4pKwqZd5wHQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wyfu1n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Sep 2025 16:51:24 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b339e7d107so60840691cf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Sep 2025 09:51:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757091084; x=1757695884;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4xa3n6NDrhRLnjmOPl5k/ZnSt/9I4YsaolOfWnhteaA=;
 b=U3poapdt9mXlTEuNqUmmZdsJ33pLVHU8zJbX4B6VM5LHl6ftRM1HUFin79lK84Sj5d
 9ZO+fgyJsBL65W4R/P+K4unRjVi2bwaickJCK/UwR0bZpF0IlGu5E6vDRFpH9kU6MoI7
 Y/dfJk4GF8+zJC/4voLnE/0rstR4IYdC5QM5hYgmJOCBH/EXQ0fZOkEpVysRr2cVg+h7
 +2sG1G5cF7sffVA3racolDPJ0vt2wrBY87DwArtuzZ7GvGlXwKqqbo+PGnV/wNnVxnr0
 Wg7uVZSOoJnI7+oAy33Mfn1M+IAxXPwRB8B6jdcfnTjLr1k6/3/vUIY5OdjjkCTTWN4J
 LT8Q==
X-Gm-Message-State: AOJu0Yx6aD37MEJNGgVLR6qicC8NPZWbZY6udKFgEoU32DAYKFjsDAtJ
 XWGKiU3I0GqFj15RbkVMScnJd0kfh91VG/HFfvQJH98HLQM2G8WSmDo7KEYjC7m+TcIi8lXimQf
 eq8rVrfeg+IevcVal8nhoGlfLR3lG+3GMq7HDnQ7RbGEmrvIQZdV1S3EjzjPtip73dR3Vl6c=
X-Gm-Gg: ASbGncvY5TiiLkR530J8QvCODBTAljxuWNtLDVLT7PIignIFPjMToZElnluF493YWUD
 jimDocjpg8JLQ4VB9ZmZOGMghLW1S5fwvNccATLmjHbO5uGe2tjcWMpEiJnk3Z8wMGeFkVkfr8X
 MPAJVZ/jXh3KgxAmB1JqHb477uDTKHM1rEFV0W9TEouTwOy3EX2A+uTcJmq0jDTYxy557x1Ht9k
 oqsIccEdUCtlwoVuTCfRZ+JtbAKE47xRG1z8bPMcZt9jf+XhqL6h5IXo1vapDRRqdZkecPHoVIc
 WoJTM74+fLbnuBPhlRMEcgkcxid3cD9UWpYeG/jwI1H+tJjhwrY6WPmjZni8IAQiCPTlx78FMND
 +mK2yD1FIbDsSLXHvsY3p2xmPFTJBavdmAf32IB6U7tPb0+eoejji
X-Received: by 2002:a05:622a:11c3:b0:4b5:e647:fa06 with SMTP id
 d75a77b69052e-4b5e6480197mr64077371cf.31.1757091083891; 
 Fri, 05 Sep 2025 09:51:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGe9NXJNecwnP4ZBhUrbIp/AeRbWzoPY4rSQxPE1jmL8jey4gjRk14sba2Sc9yFWCYAmMMTGg==
X-Received: by 2002:a05:622a:11c3:b0:4b5:e647:fa06 with SMTP id
 d75a77b69052e-4b5e6480197mr64077041cf.31.1757091083297; 
 Fri, 05 Sep 2025 09:51:23 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f4c4ed3csm19832831fa.4.2025.09.05.09.51.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Sep 2025 09:51:22 -0700 (PDT)
Date: Fri, 5 Sep 2025 19:51:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH RESEND v7] drm/vc4: hdmi: switch to generic CEC helpers
Message-ID: <bmbu6dfhr4i37fxlqo7ltalkzz6bocb5whuv34x437k3crie5j@ndtqjrv64n5j>
References: <20250705-drm-hdmi-connector-cec-v7-1-d14fa0c31b74@oss.qualcomm.com>
 <pz5luqbagulactqp7h237apoostl64rcrnvmu53eauvtb6cqly@nsmzsvbfixrr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <pz5luqbagulactqp7h237apoostl64rcrnvmu53eauvtb6cqly@nsmzsvbfixrr>
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68bb150c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=j_c-LHFTLc-8uPKrwYUA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 3-4vu_uHpPBDxbKKFGRFsdqU_ozVufYy
X-Proofpoint-ORIG-GUID: 3-4vu_uHpPBDxbKKFGRFsdqU_ozVufYy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfXxdOHEbwOsxyd
 3GVqJEJ8kUjGVOZYAxswPLSM1tanrTsrg1dXQE/7nNEDTcrffiyk27DN1QK2Yfbh0p0ee+MwKjr
 4D9t6QqC4YxMOw1RLNPA1Ogn5qDm+8JlDZElV76zqsvVjJhFJDNCbMHf01IieCbUv1StEg/1lao
 GMprevvAenzq2JY1Xi0YwAoEAJXImWRYF2MOhlJD7gwOlw89bGN8PPofz+hkl6VWDeMhwwrxbyL
 lSzsdxat85jy4KSqRXpoWbVuIwADwT3QsnAvkNJXKPoPJsVYoJ8XrTbrJCHv1GUKzqTz5QBucEj
 mqCdKzfe9QstwOJ3Hme744N+Z5vxPXDCbY3IWOFCw1t5ISszx49EbZxy47o1b1ja6MVxOgm6OKq
 j58qYr11
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101
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

On Fri, Aug 15, 2025 at 06:11:57PM +0300, Dmitry Baryshkov wrote:
> On Sat, Jul 05, 2025 at 01:05:13PM +0300, Dmitry Baryshkov wrote:
> > Switch VC4 driver to using CEC helpers code, simplifying hotplug and
> > registration / cleanup. The existing vc4_hdmi_cec_release() is kept for
> > now.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Reviewed-by: Maxime Ripard <mripard@kernel.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> > This is a part of the HDMI CEC rework, posting separately to let it be
> > tested by the maintainers.
> > ---
> > Changes in v7:
> > - Dropped all applied patches, keeping just VC4
> > - Link to v6: https://lore.kernel.org/r/20250517-drm-hdmi-connector-cec-v6-0-35651db6f19b@oss.qualcomm.com
> > 
> 
> Can I please get Tested-by for this patch? It has been R-B'ed, but I
> totally don't think it should be applied without testing on the actual
> hardware...

And another ping to get it tested by...

-- 
With best wishes
Dmitry
