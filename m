Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEA9B56DAD
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 02:57:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1943910E26C;
	Mon, 15 Sep 2025 00:57:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WA1pwStE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F86C10E26C
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 00:57:38 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58EN02Yr007451
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 00:57:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=2L1FLDnlDQdQahM+yRQGyhj/
 thPvwKQnlKSQtId8L/o=; b=WA1pwStEpfhMk+jAM+Zgal/bup1tptpQfBpRvO/j
 zcDgwpU25NZPIbaKSN+djE5FDS2meK17SkkgNEVeu5xOcxdDLVOoDf+yuVXPIRBJ
 gA125a+sKFtpSK4HJu7GuFC1DIm0Utb81EOgzs/QpIuXwjNrBKG1cHf6UHi3SagJ
 N46PZszU0KNGEYKoWKfhXWDtHYfLc98iqiTnredIoVblxrTDkZCOzasMqxUHfZMA
 ga/fudl2ZlSQWF/aZG07yAXFPhdxrlov9jgwAVULHS6wZ8SS0C8+PqmRho4hWF3u
 4pisTn2YUdrzWiCTiYRbFFrMjUTIa5Ir8oMQ7x4Mmeujig==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4950pv30vr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 00:57:37 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-7726a3f18a0so28817656d6.2
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Sep 2025 17:57:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757897857; x=1758502657;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2L1FLDnlDQdQahM+yRQGyhj/thPvwKQnlKSQtId8L/o=;
 b=uwlAQzjAEpH2VfXObsdi57+aW13O7yhqs5qdfCS5TCZPVmfBjlCEpF33DswBQZ7/n7
 juG4OpiVUhbEr0bPatC/DaY66oI01k5iD5o4KO9kkLhBi7q4lFGaQK/B7Xpe+wmxIRF5
 ik8b0yxgtsGfg4Z4lseg2wTD7DNrJt5kLlwhPX8EvOBbfK/7FiCbWvwAQ4M6o5hgMeXR
 V0uRMbSUTCQ96NOhbBIc8aLYKl8cHLlbXphHKZwLBKOqFMkLwk4RLPr6iv6xSL87Q590
 4cjbXFButxWC/v7C1e47U5wGKNBKywj0ZXz6CMQJXNcUKzcOeQ6WtlqMlAwpYt72zDMY
 oYqQ==
X-Gm-Message-State: AOJu0Yzz+NYNCDzpRZVfMGaBezbV5Ug8lbrQqi2uhnUUoIW806JGjapV
 Mxuawvcg8l3+QuI6OMDoJ43aIsqtJ0qvWLxX4uuaT+sNMoHUWXEUGbNszU/n+/18mg5yHc+RF3Q
 P4hLuULThVbUQ8L1bF3KGbU28D7DkbcvWm/9W7P25HCQtZY2dOA7hKIx7iIPhws3Ed4VyId4=
X-Gm-Gg: ASbGncvKDg9Ipnv+49A0mbGpjjb7r+Blb3a9SgyX89PJ1cnWgzcaNEkcsYoeb1GIsba
 qTfyMQRw30QZcUX8df+0aF46/Cba+Bh1EciqxAa3hHv3VPv7qBZ0w/QoI3XFo9FbfIKOC5GeeVa
 tf7pA0x62a6fudCCFK9FiIRBmxK4W8yURjvyhk4xX8MKQ1ac6uuX/k6DB3A4L0Xpl5zrjX6SZKH
 U4l6kI4U63+nsr86pOfWKRY8et7Ko+0+U2e2HJMZf2AO+Q+hvhxDaI7vecLMFhYq7xQ4x59DEbt
 nO9xHx0flLa/Zr1DgnV9pGBkg/wH2e+cPVSwjT6fyUIntvMNZiEhQml0ZeOFYBQ4xgnEZqPeSoU
 yZxkhXnyikXzkRm2T9MEk+2fNqjllLAbvs1ji1gZ/OT2Bl/kEDva4
X-Received: by 2002:a05:6214:62d:b0:787:982:2960 with SMTP id
 6a1803df08f44-78709822f64mr2367956d6.53.1757897856896; 
 Sun, 14 Sep 2025 17:57:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAciv0I/FOXPRfywsEjShAB30OfgXsRdy1jyIyFhuY9mQEwStDgqacTJC/8vHeGUzA//cLJw==
X-Received: by 2002:a05:6214:62d:b0:787:982:2960 with SMTP id
 6a1803df08f44-78709822f64mr2367836d6.53.1757897856384; 
 Sun, 14 Sep 2025 17:57:36 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e5cf2f467sm3240497e87.43.2025.09.14.17.57.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Sep 2025 17:57:34 -0700 (PDT)
Date: Mon, 15 Sep 2025 03:57:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Marius Vlad <marius.vlad@collabora.com>
Cc: dri-devel@lists.freedesktop.org, wse@tuxedocomputers.com,
 andri@yngvason.is, sebastian.wick@redhat.com, mripard@kernel.org,
 daniel.stone@collabora.com, jani.nikula@linux.intel.com,
 tzimmermann@suse.de, simona.vetter@ffwll.ch, harry.wentland@amd.com,
 christian.koenig@amd.com, derek.foreman@collabora.com
Subject: Re: [PATCH 3/8] drm: Add new general DRM property "color format"
Message-ID: <6zmp2dzpvcb4hi4kaa66q5o4rlcpdkor75ci4rnvalt2a37f26@lbmvc4t2ow4z>
References: <20250911130739.4936-1-marius.vlad@collabora.com>
 <20250911130739.4936-4-marius.vlad@collabora.com>
 <ssvxorsrhum2eo2uiieradrrmytemivr6m5c3mskalehzaj4ci@nc74epxgjq5w>
 <aMMDxIWN9TadgVyw@xpredator>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMMDxIWN9TadgVyw@xpredator>
X-Proofpoint-ORIG-GUID: kFWFhOBPAsBHwFHBaWuRVzsYpvZ0Kpc8
X-Authority-Analysis: v=2.4 cv=PsWTbxM3 c=1 sm=1 tr=0 ts=68c76481 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=UqCG9HQmAAAA:8 a=yDUiu3_GAAAA:8
 a=QX4gbG5DAAAA:8 a=KS7qJ21DtQHvR8Groz0A:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=gafEeHOdjwYkg5oUpzAY:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: kFWFhOBPAsBHwFHBaWuRVzsYpvZ0Kpc8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAyOSBTYWx0ZWRfX0E00rSCYBw01
 8hBGGpNJuBvI0WLGVYB2xqsy17FNHsryJRKKhIYN8SSMBDlagBVjASUc9aPv8GthiUN353NXjjZ
 AGtU0RpXRFahNi9rlXs0Obivw3mJQcInOqF0hcAKEqirTBMp63Kp+5wb3c0itSKXP7E+WOE9Vch
 1tIXzgdvmnsrU3Zc8x8/PucRE3CD8c+Eee57eOcnpSmQfoEEAD3sRdWBH5x4GoTJoAF8jpimbg7
 lEDrAFDj8EzGxLsYjYUbY7LO88vx9KIINoaqr4df+bDhu2vwbRIO6DHcEWzWZ5rcZzvpFv4MLpM
 pWN/8jKco3swHrsCF0leIEdc7xL/rBsqvzI9KWng8/v+zIqhYGXUQ4zzwH2S75kkaf32ZsLxN/o
 9tSW0yzU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-14_08,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130029
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

On Thu, Sep 11, 2025 at 08:15:48PM +0300, Marius Vlad wrote:
> On Thu, Sep 11, 2025 at 04:50:59PM +0300, Dmitry Baryshkov wrote:
> > On Thu, Sep 11, 2025 at 04:07:34PM +0300, Marius Vlad wrote:
> > > From: Andri Yngvason <andri@yngvason.is>
> > > 
> > > Adds a new general DRM property named "color format" which can be used by
> > > userspace to force the display driver output a particular color format.
> > > 
> > > Possible options are:
> > >     - auto (setup by default, driver internally picks the color format)
> > >     - rgb
> > >     - ycbcr444
> > >     - ycbcr422
> > >     - ycbcr420
> > > 
> > > Drivers should advertise from this list the formats which they support.
> > > Together with this list and EDID data from the sink we should be able
> > > to relay a list of usable color formats to users to pick from.
> > 
> > It's unclear, who should be combining this data: should it be the kernel
> > or the userspace.
> Userspace. I've went a bit into why that is in the cover letter. That
> was a pain point in the previous versions raised by other folks. Drivers
> are free to advertise whatever color formats their HW supports. To
> filter what panel/display supports userspace would look at the EDID and do an
> intersection with the ones with the driver. This not uncommon, userspace
> already looks today at the EDID for color management / HDR purposes. There's
> just too much for the kernel to handle and rather than offloading that
> to the kernel, people suggested previously to let userspace handle that.
> > 
> > From my POV deferring this to the userspace doesn't make sense: there
> > will be different quirks for monitors / panels, e.g. the EDID wrongly
> > advertising YUV or not advertising a knowlingly-working capability.
> Yeah, for sure. There have been some folks also raising that and discussing 
> that a bit further in previous thread on similar topic:
> https://lore.kernel.org/dri-devel/TY4PR01MB14432B688209B2AA416A95228983EA@TY4PR01MB14432.jpnprd01.prod.outlook.com/
> 
> Note that people have added quirks into libdisplay-info library to
> overcome these limitations. It is far more easier to that into a library
> than in the kernel.

This forces everybody who wishes to use this property to use that
library (or to duplicate the code, making it spread over different
projects).

> 
> I think to some extent 'Auto' can fill up this task. Drivers can perform
> these checks on their own, including the ability to look at the EDID data.
> Most likely some of them do that today and performs actions based on
> that (all the Y420 checks for instance).
> 
> > 
> > I think that the property should reflect the kernel view on the possible
> > formats, which should be updated during get_modes() (or every time EDID
> > is being read).
> The property advertises the supported color formats by display driver.
> Userspace just filters these out based on what the sink supports. This
> could just a policy in the compositor / UI.  There's nothing preventing
> you to force push from those advertised formats.

What is the expected behaviour if userspace asks for the colorspace
which is supported by the driver but not by the display?

> > 
> > And that's not to mention that there are enough use-cases where the
> > connector doesn't have EDID at all.
> Totally. But what would be the expectation in that case? Drivers can
> still advertise 'Auto' if they'd like.

I'm trying to point out that this complicates userspace: it is now
required to handle EDID and non-EDID cases for no practical reason. For
all other usecases it is enough to query available modes from the
kernel.

> > 
> > > 
> > > Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> > > Signed-off-by: Andri Yngvason <andri@yngvason.is>
> > > Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
> > > ---
> > >  drivers/gpu/drm/drm_atomic_helper.c |   5 +
> > >  drivers/gpu/drm/drm_atomic_uapi.c   |   4 +
> > >  drivers/gpu/drm/drm_connector.c     | 177 ++++++++++++++++++++++++++++
> > >  include/drm/drm_connector.h         |  54 ++++++++-
> > >  4 files changed, 235 insertions(+), 5 deletions(-)
> > > 
> > 
> > -- 
> > With best wishes
> > Dmitry



-- 
With best wishes
Dmitry
