Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8104AA11E9
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 18:47:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF7C910E064;
	Tue, 29 Apr 2025 16:47:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AyYz4jb7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C6D110E064
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 16:47:05 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TAAopw018045
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 16:47:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=eqNoyHjkcctYSQrn1Iq6iSEJ
 8th9hbx8RpiDsByijRQ=; b=AyYz4jb7SvaLjVztP+lerILQhDnC+Xtb4d0Xah/O
 UNRYO9TFWaAEAeAz2YcbU7ozf6e4y0io2N+xwhVq60ZYmSEsRkJBBXaMvz7hM2WW
 lQCQ1i6zwYRU8s6DcEpRaVjTzfiYko0+N5hxXEFeFvwKT0D35wPvDvreSERoF2xb
 5uxwxH2E5jF2gS5rKD18c+N+dOo28Spub+qS5fPoeQa5yB5OcnZpg54J336RwMsV
 0LLR3LXnTli+k0Ju1cgvHvP4S/V6cvul8a+jtCZhb6OVs81jIfTfdXW+Drl3RypC
 uxnrVG9bP/zGVw1r0o6hN4Pxq8UTvoTliHeNVrsoqfevPg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468qq5mcbe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 16:47:04 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-2ff7cf599beso5671250a91.0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 09:47:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745945224; x=1746550024;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eqNoyHjkcctYSQrn1Iq6iSEJ8th9hbx8RpiDsByijRQ=;
 b=JvhnzV8vIvUcDv8T8V18SuKPwOVdiVtoS2GLDRq82xiKeTDHUN8NaJZoABnvYkGNvf
 FU9UCBtkJcMs3YF9msthRfxS9YHIPGBNYu6iXT07IDB2JLrevQajjXSoYToLcKAHPEt/
 sQLeGwFedtW9at0npsQ0bLaLFmU3XZhaKAOrItHsmOBOcx86qDi647gwbvwR5CFbqdxM
 +TppS2UBatlS1L8xuqQL1BcfWv4TGViuyxsUbwoGEYZoLBW4htk3q0vxfLG1M4LWtPZ+
 CeHYie8epTokAvudpc3T2dFFN8EU7fV1STjJ6lTWt0wD+UZXymW+/RvhKPfvVZPrKPWw
 y5Bw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyPLKghodIwkIIce9jGwcd4LJZsdQNwQsUpWuIKYzkERhk/nqV/SbTv2olius/89IsBF7Klqevo1c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YybC7URvpDrBJGSu+yWjcE0qsT1+lZXkCBGGZ50hwOdlNTGs+tR
 h8dhCt1sdHX7IVBuAnSkXxbZE8+uTXReQGaItyRl21SLPtNJqaDyq1Af554P9Gd0cG1F4Sm4mXo
 RgsQdjpOsqBeOqqjxEJt7axiWQeoDOZMrWpuvigGHmY+JlaXOpC1/BQlKjSmtlrTKLkJiN2Gucv
 XZfFp6sYfT3qyXyB5zE9WT7s3I22x0CH176D7u+VMk6g==
X-Gm-Gg: ASbGncs0l1erO41UpaX4brlz1ky/KmGjbJje+v7RHuea1kghAayN1FXVGmlv584OfxN
 p8BxSMywOOhkulUR3Fl8p2C3L2VmDn8Wf8ZG6UbZ459jY3OI+Oj6mXx7ebxV+thIWpg==
X-Received: by 2002:a17:90b:524c:b0:2ff:4e90:3c55 with SMTP id
 98e67ed59e1d1-30a23e269c2mr4781112a91.27.1745945223844; 
 Tue, 29 Apr 2025 09:47:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEi0o3xU62JdXQTxksmJklqUnRMCVyekdyOrSul4P6znsNkMxxaFaRD1beymYiPrXnqc3Ot9cGFwXcfdi/gQBQ=
X-Received: by 2002:a17:90b:524c:b0:2ff:4e90:3c55 with SMTP id
 98e67ed59e1d1-30a23e269c2mr4781067a91.27.1745945223422; Tue, 29 Apr 2025
 09:47:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250407-drm-hdmi-connector-cec-v5-0-04809b10d206@oss.qualcomm.com>
 <20250407-drm-hdmi-connector-cec-v5-4-04809b10d206@oss.qualcomm.com>
 <20250414-hissing-auspicious-goldfish-78b9dc@houat>
 <f59c0ab6-2391-4712-a3d5-18e67f538d4f@oss.qualcomm.com>
 <20250429-whimsical-thankful-chowchow-dfaa5f@houat>
In-Reply-To: <20250429-whimsical-thankful-chowchow-dfaa5f@houat>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 29 Apr 2025 19:46:52 +0300
X-Gm-Features: ATxdqUEub77egclVnE1kar8iYgamQU1KG3_a4GxVycxIOSNztFH1uWmeGtYRIOY
Message-ID: <CAO9ioeUwDVKh5ELE-ces58eLFrsm1ML8ii8=xhXbpfZOmCjHig@mail.gmail.com>
Subject: Re: [PATCH v5 04/11] drm/connector: unregister CEC data
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <lumag@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: wty8Xn5g2GciVk4nqLTtsYmGiKq958wU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDEyNCBTYWx0ZWRfX5DstCv3olfap
 DPfICBJAv7/sMh4el57PSD3pXBKnWkq1+l+6mf2KkiqCpCab093L/nOV4I6HcgTMtlQNvSj0zfB
 FhgTzqSdv9FQTxnOyjeCzn6PK/ryQVNLmKfSJuba2WHjyozrMY47kWsMhpFfTV5V+h3oHuh29lc
 B2/wKS2XQG1vcPSZdZFiIg5F1Enr8CFUx1ilF8CuxCFiac+f2UNNfS45CcbWv5kYdjpBYkdrxRv
 lr6miyFFJYvu3YuxD0PSJzea96bNGihAptw7so5tD0/OP79rQe+/h+NZ3y76vYgyHvKDMCJeP2h
 Vor8WXavDTcCpo05kXX9IE1FOceRIzZd+48AxBdLSBrnXAMeZOvGbUD1GdI2csws7PJMxIFi4be
 UYmORRuLpg52/F6oPQCqXVzOIS7jKfLAkVJRrGx/oxgYD/g7ZqjhQKYcB/qRUGvriR0m8aaj
X-Authority-Analysis: v=2.4 cv=QP1oRhLL c=1 sm=1 tr=0 ts=68110288 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=V8rqUTlK7HnvwxUfKq4A:9
 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: wty8Xn5g2GciVk4nqLTtsYmGiKq958wU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 adultscore=0 mlxscore=0
 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290124
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

On Tue, 29 Apr 2025 at 18:35, Maxime Ripard <mripard@kernel.org> wrote:
>
> On Tue, Apr 15, 2025 at 12:03:23PM +0300, Dmitry Baryshkov wrote:
> > On 14/04/2025 17:47, Maxime Ripard wrote:
> > > Hi,
> > >
> > > On Mon, Apr 07, 2025 at 06:11:01PM +0300, Dmitry Baryshkov wrote:
> > > > In order to make sure that CEC adapters or notifiers are unregistered
> > > > and CEC-related data is properly destroyed make drm_connector_cleanup()
> > > > call CEC's unregister() callback.
> > > >
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > > ---
> > > >   drivers/gpu/drm/drm_connector.c | 9 +++++++++
> > > >   1 file changed, 9 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> > > > index ba08fbd973829e49ea977251c4f0fb6d96ade631..ae9c02ef9ab102db03c2824683ece37cfbcd3300 100644
> > > > --- a/drivers/gpu/drm/drm_connector.c
> > > > +++ b/drivers/gpu/drm/drm_connector.c
> > > > @@ -743,6 +743,13 @@ void drm_connector_cec_phys_addr_set(struct drm_connector *connector)
> > > >   }
> > > >   EXPORT_SYMBOL(drm_connector_cec_phys_addr_set);
> > > > +static void drm_connector_cec_unregister(struct drm_connector *connector)
> > > > +{
> > > > + if (connector->cec.funcs &&
> > > > +     connector->cec.funcs->unregister)
> > > > +         connector->cec.funcs->unregister(connector);
> > > > +}
> > > > +
> > > >   /**
> > > >    * drm_connector_cleanup - cleans up an initialised connector
> > > >    * @connector: connector to cleanup
> > > > @@ -763,6 +770,8 @@ void drm_connector_cleanup(struct drm_connector *connector)
> > > >           platform_device_unregister(connector->hdmi_audio.codec_pdev);
> > > > + drm_connector_cec_unregister(connector);
> > > > +
> > >
> > > Actually, since we know that the HDMI connector is drm-managed, why
> > > can't we make the call to connector->cec.funcs->unregister a drm-managed
> > > action registered by drm_connector_hdmi_cec_register?
> >
> > I haven't settled yet in my mind whether we can/should also use this
> > infrastructure for drm_dp_cec management. So, at this point, I'd prefer to
> > keep a non-managed unregister function. Once we settle on something for
> > drm_dp_cec, we can switch to drmm.
>
> I'd rather do the opposite. Let's go for drmm for now, and if we need to
> change it for DP, we can always change it.
>
> "Nothing is so permanent as a temporary solution", so I'd rather have
> the natural and consistent one for now :)

Ack, I'll change that for the next version.

-- 
With best wishes
Dmitry
