Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F89EA7722D
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 03:01:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32A6110E042;
	Tue,  1 Apr 2025 01:01:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dHmkyx4r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 934D210E042
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 01:01:15 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5310J4O1032238
 for <dri-devel@lists.freedesktop.org>; Tue, 1 Apr 2025 01:01:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 V/9ibitgBcASDxr5q3RadXqeupQXnpmd/gKFHRDbLgw=; b=dHmkyx4rIRI5eVaS
 tPmHYtN4+eG3ExKFx64r121qqlR0uYMb1bG5zPffGw1QAzVJP+2eQK2l7YU7pk36
 Jybj9oQRy8SZmnGjYJV9EWLpxwFu9MD+qbt468kCtWIE+KV2S0Bv2qOEGL5BPNcA
 /C551EaK2M0QkVD4h/gi0rmzpKSVszqEsJDQGt7T+5t6B0Yw9fkS+G8jz92O8LXL
 XNscTLYXGbQYFvPJ9pfH+Mf13S3FIlpXJA4fHWjRVyn1EbE9c9ZrVxuzEhbrf/fP
 lE0QZeri8Yeqrn0b+iQ8aAS82CAVyOIKnKCQwfmJtsFp1MMXDFgfa4dNBfHNOI2n
 49wCvg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p9mjnx9f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Apr 2025 01:01:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c54e9f6e00so968521585a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 18:01:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743469269; x=1744074069;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=V/9ibitgBcASDxr5q3RadXqeupQXnpmd/gKFHRDbLgw=;
 b=CYbTusetunL+kQZYyEos6EU1UhIctnbxoNL3ZY7TL2b5zfef3SQerpY/0RcuzX3TB/
 ewVdxE+Bo5MYfwmig5nn/PsjjWDvFb/8f4S46u83hqa5BTORVEAUszgCKyJhbFq9SGyC
 CV8oT7UzSU8TsXvInrb4kzZFZcFgSLDgCe9YH/u7PFYYJTHC3hhD0/JhzK3SM11Lsnan
 /ZjN9QMt4TaW6UgRTnTSrOGPQN+LiOITlDqUvtknlgbBMkW40fXBNtFOnXVR8ch4j9yd
 4dqrXNBsQL4kDypMboGWCNFo2BW0y7KW3GvQQnOW0qj/PgyU1l/XdDHzWRD5tvXQ0GEX
 zcNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzxicDU5wetLdDA1ZI4HljU7kdavCGixA+BYul4Y6N7VED6/MO+vFi69a6a1XkgJb8slxq4uQP0Jg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwH42cK9YqAGRwTp28DXrk14AJ+MH5tmDoAPT/VXjFfQ1Lg0ea4
 cbtlXW0op+T4zglQShZ5zz+mXDB+dfn2HDiXsMXjrmdA+Wb/0Y83a7bbl+dKr3jQHgP+4JoNv0n
 rpqBm0F//8a4q/PIrKq90/4ljKohW/x9UKh74gdVcaKjX6Y+6spK8wlofn9VgCGweypw=
X-Gm-Gg: ASbGncuoos8icBnM+R97xSMF+VHE0tdNX74Ih1HOvbjqGEV4Z8S3Tnj9wUP2uUgwA7c
 BtwDgSS/shGlDblo3v63dSwO4JQbDpOZWr07WpFgKgs37g79M2OPdLOPENvpOOFq4HXNCwW0p6g
 6pdC9Hgva7tZVInyK2nWwWUG45A9agW9Lm2AMVWT5M4DfwVmrzTZkKRPX6CrpeL6YVvpwFUsBHR
 bWqLVHFGsdNamqIjBAMEJRoBzDtkI0zus0LBP6evstWgi2RE2INTZHlgjfYOcRUoFM5ZasCYyIX
 /3rH/lZ/uYlyIJT/H5amZHRvvAKcnDQWPicAPRfqJNFlpX8HvApMSAjXidFSVDMp7rtwIoTlXVB
 BOeA=
X-Received: by 2002:a05:620a:46ab:b0:7c0:5b5d:c82b with SMTP id
 af79cd13be357-7c5f9c2209cmr1931249385a.28.1743469268728; 
 Mon, 31 Mar 2025 18:01:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmENAiYEDkbekPHoUcYX6zw/CtPDkreD8I08ld5E33xZhRkOLl3IINntmRyYzlmrrjlQVYFA==
X-Received: by 2002:a05:620a:46ab:b0:7c0:5b5d:c82b with SMTP id
 af79cd13be357-7c5f9c2209cmr1931245385a.28.1743469268287; 
 Mon, 31 Mar 2025 18:01:08 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54b094c1a7asm1236328e87.86.2025.03.31.18.01.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Mar 2025 18:01:06 -0700 (PDT)
Date: Tue, 1 Apr 2025 04:01:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Doug Anderson <dianders@chromium.org>
Cc: Tejas Vipin <tejasvipin76@gmail.com>, neil.armstrong@linaro.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 quic_jesszhan@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, asrivats@redhat.com
Subject: Re: [PATCH v2] drm/panel: boe-bf060y8m-aj0: transition to mipi_dsi
 wrapped functions
Message-ID: <y5l6gr7gdrz6syc3kxortl4p52bpygs2cqzkgayhnbsvrjcbcw@hxhel54zw372>
References: <20250331061838.167781-1-tejasvipin76@gmail.com>
 <CAD=FV=UbUqNf4WoWzqMe5bDQmxiT+bRG_cn0n1dBrkFRijx0Cw@mail.gmail.com>
 <jlqxx47vzlp6rmwpi3tskig4qu4bgyqd7vletxbzzn7xdpep72@42tzrjkg65lh>
 <CAD=FV=XeHeed5KhHPVVQoF1YPS1-ysmyPu-AAyHRjBLrfqa_aA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=XeHeed5KhHPVVQoF1YPS1-ysmyPu-AAyHRjBLrfqa_aA@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=Mfhsu4/f c=1 sm=1 tr=0 ts=67eb3ad6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=p7gRr0OnjJBAycR06awA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: FeFhnkgZe9UixVLKxBZzgqQd1GbmHlZf
X-Proofpoint-GUID: FeFhnkgZe9UixVLKxBZzgqQd1GbmHlZf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_11,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=999 suspectscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 mlxscore=0
 bulkscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504010005
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

On Mon, Mar 31, 2025 at 03:40:27PM -0700, Doug Anderson wrote:
> Hi,
> 
> On Mon, Mar 31, 2025 at 1:28 PM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Mon, Mar 31, 2025 at 08:06:36AM -0700, Doug Anderson wrote:
> > > Hi,
> > >
> > > On Sun, Mar 30, 2025 at 11:18 PM Tejas Vipin <tejasvipin76@gmail.com> wrote:
> > > >
> > > > @@ -157,7 +137,6 @@ static int boe_bf060y8m_aj0_prepare(struct drm_panel *panel)
> > > >
> > > >         ret = boe_bf060y8m_aj0_on(boe);
> > > >         if (ret < 0) {
> > > > -               dev_err(dev, "Failed to initialize panel: %d\n", ret);
> > > >                 gpiod_set_value_cansleep(boe->reset_gpio, 1);
> > > >                 return ret;
> > >
> > > It's not new, but the error handling here looks wrong to me. Instead
> > > of just returning after setting the GPIO, this should be turning off
> > > the regulators, shouldn't it? That would mean adding a new error label
> > > for turning off "BF060Y8M_VREG_VCI" and then jumping to that.
> >
> > We should not be turning off the regulator in _prepare(), there will be
> > an unmatched regulator disable call happening in _unprepare(). Of course
> > it can be handled by adding a boolean, etc, but I think keeping them on
> > is a saner thing.
> 
> Hrmmmm.
> 
> The issue is that if we're returning an error from a function the
> caller should expect that the function undid anything that it did
> partially. It _has_ to work that way, right? Otherwise we've lost the
> context of exactly how far we got through the function so we don't
> know which things to later undo and which things to later not undo.

Kind of yes. I'd rather make drm_panel functions return void here, as
that matches panel bridge behaviour. The only driver that actually uses
return values of those functions is analogix_dp, see
analogix_dp_prepare_panel(). However most of invocations of that
function can go away. I'll send a patchset.

> 
> ...although I think you said that the DRM framework ignores errors
> from prepare() and still calls unprepare(). I guess this is in
> panel_bridge_atomic_pre_enable() where drm_panel_prepare()'s error
> code is ignored?

Yes.

> This feels like a bug waiting to happen. Are you
> saying that boe_bf060y8m_aj0_unprepare() has to be written such that
> it doesn't hit regulator underflows no matter which fail path
> boe_bf060y8m_aj0_prepare() hit? That feels wrong.

Let me try to fix that.

-- 
With best wishes
Dmitry
