Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1F8ABA565
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 23:40:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D452B10EBA0;
	Fri, 16 May 2025 21:40:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FZxCk93D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10EDC10EB93
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 21:40:12 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GIrS4L025636
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 21:40:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=WLyt+5Z0AOIejFDuTl8oaCpz
 mlN3FLZTqlnnQr41U2I=; b=FZxCk93DJkNcuvKAn8NQGI5E3U1ByqkuzIlIXHwl
 iS8RWtkTnRKnLl24gpFtA246E5VseX+zuE8I757cgPLvv+mBYyn2IXNBe98hKHP/
 d6VJybk+eyFFuYmNh2tPNuO/t4ibS0r6hxAf2MEduKGtJOuqd3gyFruTFnmJVevW
 feci+RPVlYx9FPqICCUEvrElyV/A9TiY1pWYM8abiQLE6piykZhs86Z2YArc/kSb
 0A7ez0t6JH8/3hJIyXskqiKrFpi7fDEsvDUcOzig0n+8+9pgvJOehdb/z0w0RrUr
 EpMezCOrEcuDmmMkfmIfuhWr9Bs4/p/utgw95xTeoo8PdA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcq361u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 21:40:12 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6f6899cccbdso59855796d6.3
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 14:40:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747431611; x=1748036411;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WLyt+5Z0AOIejFDuTl8oaCpzmlN3FLZTqlnnQr41U2I=;
 b=RY4JLKIq31nGWWd1ACa3BQNrPDg+fHWUWgepTShjsP386RAwy2QNnPi9rpqfxu6QC6
 /D+nFNh1wGe9e4iQGhkBA4A8N0qWm082s1lcY55S87MW3Qr/E1wXRgpPwmxEXnzhpGxf
 RQ8IqEp9tjjzwTC8X2R3Fvi6Jzulso4MLRen4FxpIVjTDV8+gxY6iz4esGb5Qwxw+SIl
 WEkAFw+GxbDxtKJrrXHKdk8y4AZBZnFQzZUZPfJr0OQIHE41kWAetvkLFwlTxo3vIXHx
 VTd1Cc01sHjfxjrPZfg3V5NqNw3qvUOJ3AW0GCsB49YgP+TRlkh9Z2yj2OodJAbLUaht
 oagg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVj1PXcwGUmgtzknIvOCscWhHzlfMk2XQOtMKK+qeERQcq9IFzT3Gw9mOrY6Ht9obrnv8055uli/Js=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyXT18uoSabKRwnrZGCbdejUulS0qiRjMjenBnXhNHeN5r4JEBZ
 Wn5mIwOkKgmgg0XG4tbvhksc0YDCj0OdI9u19mlCF4P4t4oeI2ZFzulX9LKQ6cYkmXRuzSDSwwc
 1LzfDgVJSfY3IZaAX04Nj53RIm2LtxzvU4xOhfSTqecljQwkrmJUryxsOV8udEhjCqhXYVec=
X-Gm-Gg: ASbGncurhq/q6FwlxZjkYoR8WF8+MFb5eVDumC2MYz3nupeHJYpppIkSkyCKmeeN7j7
 dkoPPjaLgVhqJydxSeB+bZGOpyl1iTqHNTxcuDTE+b892B0AZXgAT5FadVEyhuKlEzWythpWOOo
 d67FFDIipMB+jM4gsLWVA5xRG7dYpsJwdLjATKwJU5hS7TiTgKyTcIDxhiSbW1It10Pp44ZtILZ
 fy2cqOpO8pkDT7ub0MbP42/KJ648E+hTAwyTnM7Y9V3RydVCXHm8jcqzbVqZbAmguhn/P3n0Ljr
 svruqAx56VEUuEHBCxlPmbYOFDZftJhnD/Pb1bnOOnUi+LJJh6DYK2rgzwgv2UP2oTvYkekhHck
 =
X-Received: by 2002:a05:6214:2341:b0:6f2:b7cd:7cac with SMTP id
 6a1803df08f44-6f8b08aad53mr84737106d6.31.1747431611230; 
 Fri, 16 May 2025 14:40:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlSkHU/95FW0SPZKEO3RfhsXaoQpKMCqmBdWYPgcm4PwTrfg++Ymk08ToHgTYtlLPYBsZyPQ==
X-Received: by 2002:a05:6214:2341:b0:6f2:b7cd:7cac with SMTP id
 6a1803df08f44-6f8b08aad53mr84736776d6.31.1747431610813; 
 Fri, 16 May 2025 14:40:10 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e7038518sm595002e87.210.2025.05.16.14.40.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 May 2025 14:40:09 -0700 (PDT)
Date: Sat, 17 May 2025 00:40:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] drm/msm/dpu: Filter writeback modes using writeback
 maxlinewidth
Message-ID: <62vhglzixy2hl7uhl3queml5z3vvvqw6kefhaboip3iql6ep4e@kbl4yihvj65g>
References: <20250514-max-mixer-width-v1-0-c8ba0d9bb858@oss.qualcomm.com>
 <20250514-max-mixer-width-v1-4-c8ba0d9bb858@oss.qualcomm.com>
 <CALT56yPxcsLhA2eigirjvNiWR5JBFW4jsOAi7QWkgmJgbMnKXw@mail.gmail.com>
 <65cb9653-e315-4b8c-ad21-14cabb7d2ac0@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <65cb9653-e315-4b8c-ad21-14cabb7d2ac0@oss.qualcomm.com>
X-Proofpoint-GUID: TcH25rAsHD9vmNijQDEh5Qbw3wVElejH
X-Proofpoint-ORIG-GUID: TcH25rAsHD9vmNijQDEh5Qbw3wVElejH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDIxMiBTYWx0ZWRfXy6DgWyehTgaP
 5erxItxWfvylD2OXQAWXAvmVhhvPT1dSLZnvQcs3A3vQSmz2xWR1Csg5s8UeL9T0MYzJXx3KNhr
 OU7JRK0O0Fvr3DxykCDzrzRGw0YImGrd1eSB5w820U6JifX7FUFV+uMQPWNvve4OHTK/cvCrwwO
 /uX5/GCa8Pd5Qw6YqHF/uLVwIadEYdINat8/73Jt2VQSv2xdG7USwkoH77Ek7DjEUE2FZpW/YjB
 ORa7tAYaQIz/I03oM/5Zatur5qUs7p0JDRusx3J7eiqWvzOtXigzbBDKADigINPgr/XYpN7Lhma
 MtAxACgQIZorfPnmDhhuKDjnF2Yh2W8hWR1pdLMazMl1umiXh2p692DwsMAekfb5MascNc8OAkt
 4xiZjm3ff5dmwi0gPrkLQEO6basrfTD6YTDAovoFvxadOnkUTHq8JL1oh7A+4ZywsLv9DU7+
X-Authority-Analysis: v=2.4 cv=KcvSsRYD c=1 sm=1 tr=0 ts=6827b0bc cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=Ey3AjrcxibMDRGd7HuQA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_07,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 impostorscore=0
 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160212
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

On Thu, May 15, 2025 at 05:48:09PM -0700, Jessica Zhang wrote:
> 
> 
> On 5/14/2025 5:17 PM, Dmitry Baryshkov wrote:
> > On Thu, 15 May 2025 at 02:52, Jessica Zhang
> > <jessica.zhang@oss.qualcomm.com> wrote:
> > > 
> > > Since the max mixer width is not a strict hardware limit, use the actual
> > 
> > Is it? What is the actual max width that the mixer can support?
> 
> Hi Dmitry,
> 
> By hardware limit, I mean restrictions based on the size of buffers within
> the hardware block itself.
> 
> PINGPONG, DSC encoder, and WB blocks all have buffers, so they do have a max
> supported width based on the size of their hardware buffers. On the other
> hand, LM doesn't so it isn't necessarily restricted by a max width.
> 
> I can clarify this in the commit message and cover letter.

Yes, please. The text above is perfect for the commit message.

> 
> Thanks,
> 
> Jessica Zhang
> 
> > 
> > > hardware limit (the writeback maxlinewidth) to filter modes.
> > > 
> > > Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> > > ---
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 9 +--------
> > >   1 file changed, 1 insertion(+), 8 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> > > index 8ff496082902..0a198896f656 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> > > @@ -14,14 +14,7 @@ static int dpu_wb_conn_get_modes(struct drm_connector *connector)
> > >          struct msm_drm_private *priv = dev->dev_private;
> > >          struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
> > > 
> > > -       /*
> > > -        * We should ideally be limiting the modes only to the maxlinewidth but
> > > -        * on some chipsets this will allow even 4k modes to be added which will
> > > -        * fail the per SSPP bandwidth checks. So, till we have dual-SSPP support
> > > -        * and source split support added lets limit the modes based on max_mixer_width
> > > -        * as 4K modes can then be supported.
> > > -        */
> > > -       return drm_add_modes_noedid(connector, dpu_kms->catalog->caps->max_mixer_width,
> > > +       return drm_add_modes_noedid(connector, dpu_kms->catalog->wb->maxlinewidth,
> > >                          dev->mode_config.max_height);
> > >   }
> > > 
> > > 
> > > --
> > > 2.49.0
> > > 
> 

-- 
With best wishes
Dmitry
