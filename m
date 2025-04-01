Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD78EA7726D
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 03:52:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43AB210E230;
	Tue,  1 Apr 2025 01:52:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XEX1ePXa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7727D10E230
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 01:52:28 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52VFCr06025837
 for <dri-devel@lists.freedesktop.org>; Tue, 1 Apr 2025 01:52:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 KkmvufDkyFM8TbOcd8xfOYX+yJYpC83DnPb8liBX77k=; b=XEX1ePXavfZlFRPn
 b1mJ7V32PodL/X4wT1j1BfpSaEJfHeVviyfLuwnt/9A68l42cJl7h2bQyaar75Z5
 CYkjVypVPOk6/BVW4TL4F/MOXu0l8iagOxDLgxpwoR5yekCV4FT88sUBarF41BuZ
 SrsmU+lpeTaHtK3lQQ0EbV/Wf0bNfwsu1bGsENZB3c5cOWVBUIrKHZ/xfmsrjwJR
 PMw+Q8hWPvUcdywn/D2jpF1O99SF53ASc7SW4gdW1xjy6FCRXQXIevXKPwamaXNU
 pdmvvOc+cRFqo2CrZcRH+ojhZQv6KlTYAG67wiOQZLBwzL7lxoChIwcK1SFxDdtj
 dy1Uig==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p6jhpb0a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Apr 2025 01:52:27 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6e8ed78717eso83863766d6.2
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 18:52:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743472346; x=1744077146;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KkmvufDkyFM8TbOcd8xfOYX+yJYpC83DnPb8liBX77k=;
 b=nMfswLAkN0vFK93uEDuHhXUl3Zbp6ZX+sphX76+OLV3jHwtEpITGYMRT34BuJ9Vxvb
 CIIuiTB91jtjXBvmSEVvlg/j+wtccU3SxW3CZiXx4FGHSmCH1KIdf9VNCO7mC7DW1faE
 cfwS9tIX9u7Lgy54mekDZ0oblK3PyuDyZ4K2JDnhhLpD4dA2okuFxMwv2DvUx7c8G8UY
 Lhzv7QEEasgHrwWdIhHhVj9RJ51d5QRoa9SsKE+6SXIpUt7ah4pIDGnsEzE44oQfsn8L
 bsJau3bijXdcQl+CwLIF7acyL6/hGCYXUiGBdUKZVvO6VrARtevuIiX2cEEB3tEb/mCp
 1y4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmLzZnAZbOa+42qrOziyNTFP9HoF7E6Adb9QABaSyUet95h8w943JLu/z/YyWyw0hPjfjaZKiAvBo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy3LZ3QZCek+edYmMbekSbMksmFR4qYQh2CdcY+CPoy7iKOkpZl
 SVgJTm+Hg8LhufZsqW9JtdWDdTDFz+M+mxDycIAGlebxIwQO8GyaoKE85aWuHx46k+ebJxnroh3
 7TYV9jgM59lD/GYt6Lk8+QAjH1SXSbwI1kx4lnR+QOQse1EG1VP6ADDV9gGOrWGso7QU=
X-Gm-Gg: ASbGnctF/sUTS2nLlH75EgtY6WTCIj7HSVfmdDeGJyW5E7gUKQe6y2seT/yef8A9Zqk
 zRw6NO+f9ddkf5gGugCOSMvY/Wg7AWuPTJBMNEv+4pAHwv9BfmnTEousHvvaWMOOFXWZMxusGzO
 /Z3STrDfh3Qa0l2r1fq3ymR1nBngg89XyP0l3amcn64fGwzOQIxrsbpkKhV7xJObV/YMlrV/fNV
 4fpP0Z03nZsftd/9cbiO1aI8ILcQpB1HvDUwCsHM5v2sAI2Dc9taosOCN9kDgjN6BmamZt+LPuU
 nHil1COiSJqjVtShd6FrQs5TL42dL9FronNyjF7e+EzKw9utUavrUzXSVpDv0g2WPAdV2wzulWz
 Y0zc=
X-Received: by 2002:ad4:5ae7:0:b0:6ed:22ef:19b6 with SMTP id
 6a1803df08f44-6eef5d9d0e0mr23303866d6.14.1743472346499; 
 Mon, 31 Mar 2025 18:52:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdLHhF5AGVHH/2gDMMGVxACUr3BKovVYKx68WKwJC04elu+jzwzyQYLStuMh2K7a7bC5dbmA==
X-Received: by 2002:ad4:5ae7:0:b0:6ed:22ef:19b6 with SMTP id
 6a1803df08f44-6eef5d9d0e0mr23303546d6.14.1743472346094; 
 Mon, 31 Mar 2025 18:52:26 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30dd2b8f92dsm15560831fa.114.2025.03.31.18.52.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Mar 2025 18:52:23 -0700 (PDT)
Date: Tue, 1 Apr 2025 04:52:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Doug Anderson <dianders@chromium.org>
Cc: Tejas Vipin <tejasvipin76@gmail.com>, neil.armstrong@linaro.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 quic_jesszhan@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, asrivats@redhat.com
Subject: Re: [PATCH v2] drm/panel: boe-bf060y8m-aj0: transition to mipi_dsi
 wrapped functions
Message-ID: <mz4axwltt6zhm2hykenerz2k6hp5qb4tqa3seui2vnztsldpoo@hejaeukdu2tg>
References: <20250331061838.167781-1-tejasvipin76@gmail.com>
 <CAD=FV=UbUqNf4WoWzqMe5bDQmxiT+bRG_cn0n1dBrkFRijx0Cw@mail.gmail.com>
 <jlqxx47vzlp6rmwpi3tskig4qu4bgyqd7vletxbzzn7xdpep72@42tzrjkg65lh>
 <CAD=FV=XeHeed5KhHPVVQoF1YPS1-ysmyPu-AAyHRjBLrfqa_aA@mail.gmail.com>
 <y5l6gr7gdrz6syc3kxortl4p52bpygs2cqzkgayhnbsvrjcbcw@hxhel54zw372>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <y5l6gr7gdrz6syc3kxortl4p52bpygs2cqzkgayhnbsvrjcbcw@hxhel54zw372>
X-Proofpoint-GUID: 1LxqOsPNoKIX0Q9Jd0CD4JTzgQhsZiC8
X-Proofpoint-ORIG-GUID: 1LxqOsPNoKIX0Q9Jd0CD4JTzgQhsZiC8
X-Authority-Analysis: v=2.4 cv=bZZrUPPB c=1 sm=1 tr=0 ts=67eb46db cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=a_HvFp4BeVyG9yXqjdkA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_01,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504010010
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

On Tue, Apr 01, 2025 at 04:01:03AM +0300, Dmitry Baryshkov wrote:
> On Mon, Mar 31, 2025 at 03:40:27PM -0700, Doug Anderson wrote:
> > Hi,
> > 
> > On Mon, Mar 31, 2025 at 1:28 PM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >
> > > On Mon, Mar 31, 2025 at 08:06:36AM -0700, Doug Anderson wrote:
> > > > Hi,
> > > >
> > > > On Sun, Mar 30, 2025 at 11:18 PM Tejas Vipin <tejasvipin76@gmail.com> wrote:
> > > > >
> > > > > @@ -157,7 +137,6 @@ static int boe_bf060y8m_aj0_prepare(struct drm_panel *panel)
> > > > >
> > > > >         ret = boe_bf060y8m_aj0_on(boe);
> > > > >         if (ret < 0) {
> > > > > -               dev_err(dev, "Failed to initialize panel: %d\n", ret);
> > > > >                 gpiod_set_value_cansleep(boe->reset_gpio, 1);
> > > > >                 return ret;
> > > >
> > > > It's not new, but the error handling here looks wrong to me. Instead
> > > > of just returning after setting the GPIO, this should be turning off
> > > > the regulators, shouldn't it? That would mean adding a new error label
> > > > for turning off "BF060Y8M_VREG_VCI" and then jumping to that.
> > >
> > > We should not be turning off the regulator in _prepare(), there will be
> > > an unmatched regulator disable call happening in _unprepare(). Of course
> > > it can be handled by adding a boolean, etc, but I think keeping them on
> > > is a saner thing.
> > 
> > Hrmmmm.
> > 
> > The issue is that if we're returning an error from a function the
> > caller should expect that the function undid anything that it did
> > partially. It _has_ to work that way, right? Otherwise we've lost the
> > context of exactly how far we got through the function so we don't
> > know which things to later undo and which things to later not undo.
> 
> Kind of yes. I'd rather make drm_panel functions return void here, as
> that matches panel bridge behaviour. The only driver that actually uses
> return values of those functions is analogix_dp, see
> analogix_dp_prepare_panel(). However most of invocations of that
> function can go away. I'll send a patchset.
> 
> > 
> > ...although I think you said that the DRM framework ignores errors
> > from prepare() and still calls unprepare(). I guess this is in
> > panel_bridge_atomic_pre_enable() where drm_panel_prepare()'s error
> > code is ignored?
> 

Hmm... Most of the drivers ignore the results of the drm_panel_prepare()
/ _unprepare() / _enable() / _disable(), but then the framework handles
error values of the callbacks and skips calling the corresponding
en/dis callback if the previous call has failed. Which means I was
incorrect here.

> 
> > This feels like a bug waiting to happen. Are you
> > saying that boe_bf060y8m_aj0_unprepare() has to be written such that
> > it doesn't hit regulator underflows no matter which fail path
> > boe_bf060y8m_aj0_prepare() hit? That feels wrong.
> 
> Let me try to fix that.
> 
> -- 
> With best wishes
> Dmitry

-- 
With best wishes
Dmitry
