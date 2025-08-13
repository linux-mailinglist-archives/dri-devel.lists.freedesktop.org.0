Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8F9B25230
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 19:40:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C97B510E03A;
	Wed, 13 Aug 2025 17:40:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WZHLL5AQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C702410E034
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 17:40:29 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DBLeP7012182
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 17:40:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 SGOnx8wASardlLmh6F+MJ3xLLydD3abWl/e37ujFDdw=; b=WZHLL5AQnirT0KJQ
 1IJe83vJhzUs/s44Jt9JxckEh+IY5kC5OixiGT+CLmR1z37ANq7EwwVaiUeN+4S7
 0aCWLW4gZJkrqSdxLm1dQp7XYaWcSEvEw+vjMzimZHhiZeW2P/ZV7inhrnFo7dKI
 G7vZgD+2LFYLvqtx0kcx5FVmksOKvN03zMDNFXecKKnLlikeQci8YdlkLyDi4SVF
 ib7JdMiyEGZpH4tssw7jZ5qP6Vb3eb8xB2wkzCiaktGdyjDzAbdr1AV3Apocvv96
 MRGcpOT7wjh8Aa24mo9X3wRXSdfRqUP6ue3UUQ71yiuF2Gd39D60epy5GvpZYZjT
 zGbLKw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48eqhxauqg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 17:40:28 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b10993f679so2463011cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 10:40:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755106828; x=1755711628;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SGOnx8wASardlLmh6F+MJ3xLLydD3abWl/e37ujFDdw=;
 b=T9aXMrNjFSj23/icnQI/BVZjI9yFfAprwqyj9Gq5F981oKn5cx0bRs0OfynHVkTuxN
 UBxu9RkGDgc0raSyfPlJsFOUVtCO7zbPKEiVHSE0oxnmZNNn4cJitBepj3DjTnYqHHtA
 R41ZR22noZyBZwJvRGWVVJBkB6Jp5LhV41rKQ7bxrPyY3kMBtKQzxpfcbHviNWWlTH1I
 +R8KBDkpTdIQjA5azNqgCDhcfQ1giDd0IXEUjC0f8a168pzUKs1wqidHe3QZrtyUOZba
 Cgdf0gPr1FsHIzX8P+6B0OFRkDoLvJZ7qAci4mZzcuYHBa+0mKKv9ZnqwygW8aTS9wBZ
 w71w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWy+1FAPFWHOfbycjp1AxyjPFRC1lS9vuH5Fwu85FZwD5jsfaarhjDy/vMXZ8fd85QWIhMxjhuuC+I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw4Yqso48CmFUr11KK2fRtQTqeNh5ue6rVtk2oEZET5TWSDBYI2
 7uLpJzrdaKBlVMRjgXLWErFOszU5j/2PNC7tE6N9TVF/29GMnmLhvwxgo4nsMCJcsMrvOo/A037
 Aa/pDnwhkSc9n5lJoic0ocpWGytsNGwT5qUghy86KBifa2dU230PMFJgK8xH628Sc7PKxFfw=
X-Gm-Gg: ASbGncv7XWKFXXzKx7b6lxjO1O9eF0eRxpVCIdjE4i3Rulyhuu1rnpJEufcy/uVCN3E
 Xg52lMrqSX2W91cVyPi8r7gho3vPKbxJPx2Lu9tfbAXxNkDhxT+3UEFfNwMNREZ7mxZD4quWmu6
 KOXYTSl5DME3N8hRf7vlJV8YtGdPHmN0cgGYltKYsAR+TTiSVznnAUe+IhgmqrhYyQOtjoR+Ti4
 xB8/y1glKGu06yYyon3sOuRl2B+/9WjWcr5bm+Z7P+w07hObgIowZOo6be8DQ6LdM1O43i14ckA
 jLDfE+Q9PSzSo096DWOKOWAmiVDUuyTUaeJ1YQ0OHZaTb6z/25/E3cPRP9MEQDBN0/RFLHai92z
 UblaNTMotOiQ+KSsFZWVCMCivTenuGLKv/A3zP/8Wgvtyq8WHWXGG
X-Received: by 2002:a05:622a:1826:b0:4b0:80c7:ba32 with SMTP id
 d75a77b69052e-4b10aa6b551mr698321cf.38.1755106827893; 
 Wed, 13 Aug 2025 10:40:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGSYwB2jPhXDGF7QnvYQoWrDeEZN5VgRz2fGxMg00AQDFPHwe889FhEH4ieuMEs9en12IG6Q==
X-Received: by 2002:a05:622a:1826:b0:4b0:80c7:ba32 with SMTP id
 d75a77b69052e-4b10aa6b551mr697831cf.38.1755106827256; 
 Wed, 13 Aug 2025 10:40:27 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b8898bd63sm5375446e87.20.2025.08.13.10.40.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 10:40:26 -0700 (PDT)
Date: Wed, 13 Aug 2025 20:40:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Chenyuan Yang <chenyuan0y@gmail.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 jessica.zhang@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 tglx@linutronix.de, krzysztof.kozlowski@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Add a null ptr check for
 dpu_encoder_needs_modeset
Message-ID: <2rtdf7azwluus757f3azwjacoiqussnoxfqqxtr3p3l4l7rkrt@dbk5pfdglugu>
References: <20250722211740.3697191-1-chenyuan0y@gmail.com>
 <ciawdvjevycjjuowmykfux2v25lvr66kzey4jklq7t5cjzqalj@qfcva77k2bvr>
 <CALGdzurR2XPoai8qshTX6hzgF-zLQ-FrsWxu5NGjrkjNzWaHaQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALGdzurR2XPoai8qshTX6hzgF-zLQ-FrsWxu5NGjrkjNzWaHaQ@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEwMDA1NyBTYWx0ZWRfX4/VbyJns77Jb
 Kxjnz/SocwGYlo3+K6G+JIqJCzMVcfHxwCyrTpcghxFgFIWpoRG90R0Ghuj98hakT/pMIResvKF
 EZjoFVbIB12eZnmfFpThWJa06ycx3TNotwyiOsAmF3ZNk+pSXTwO9hiAOwhYrl9xSTFhdnAHGhi
 iHddG6Plvpvojn2a5uDMugyAK/12LJjYR3Agmfw0kLDWlRMaclqtWzWFaREDB4zCxI8dZru/hkq
 etQ7rjYdVrs9iun7nK8MRjmaNj9IRM1hUEduWV7xVS7xILs/5MwnkMFrCoFFEP2zzNESYYJioCe
 Gxi5up9KRcw9vJ0GZgWy78vff/0SpY7krvE27z6Hak5o4JNwYK/RVozV7dCGPZWRL0jIUUxntoO
 vlW6y4JQ
X-Proofpoint-GUID: KO_5e5QUObtDd7p4HfZJABjOpIQ22MU3
X-Authority-Analysis: v=2.4 cv=aYNhnQot c=1 sm=1 tr=0 ts=689cce0c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=jpGDCbsBDmrldJ3tXloA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: KO_5e5QUObtDd7p4HfZJABjOpIQ22MU3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508100057
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

On Wed, Jul 23, 2025 at 12:43:06PM -0700, Chenyuan Yang wrote:
> On Wed, Jul 23, 2025 at 12:05 PM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Tue, Jul 22, 2025 at 04:17:40PM -0500, Chenyuan Yang wrote:
> > > The drm_atomic_get_new_connector_state() can return NULL if the
> > > connector is not part of the atomic state. Add a check to prevent
> > > a NULL pointer dereference.
> > >
> > > This follows the same pattern used in dpu_encoder_update_topology()
> > > within the same file, which checks for NULL before using conn_state.
> > >
> > > Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
> > > Fixes: 1ce69c265a53 ("drm/msm/dpu: move resource allocation to CRTC")
> > > ---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > index c0ed110a7d30..4bddb9504796 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > @@ -729,6 +729,8 @@ bool dpu_encoder_needs_modeset(struct drm_encoder *drm_enc, struct drm_atomic_st
> > >               return false;
> > >
> > >       conn_state = drm_atomic_get_new_connector_state(state, connector);
> > > +     if (!conn_state)
> > > +             return false;
> >
> > Did this happen in a real case or is it just
> > yet-another-static-analysys?
> 
> This is a static-analysis detected bug.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> 
> > >
> > >       /**
> > >        * These checks are duplicated from dpu_encoder_update_topology() since
> > > --
> > > 2.34.1
> > >
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
