Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BE1BD2B6A
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 13:06:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42FDD10E428;
	Mon, 13 Oct 2025 11:06:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fBEAtij7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D588110E428
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 11:06:11 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id
 4fb4d7f45d1cf-62fc89cd68bso4063759a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 04:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760353570; x=1760958370; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+aUxvhazo+fI5qnE1t9OWiNPdeUT1J2KZzqa5v9i4n4=;
 b=fBEAtij7lJs+NfnOBKyccZb/Q8M3z94RAikU2Da87ARIVxHLLuYOb+/LBaDB2o91if
 3cbhyLjV3INwYESW70lAZItKdCRxpOKlU/Fvj/v05HfYLgv2uAwAQOR+GxMxibpitRzy
 Cya5ijfGfV7IYDAbvfNvE2Mw7n0fsdavD9P3ibgqtIe1O/DWJh0DmlzOyHi+z7hWORzy
 z9Bq8FVFX8pa1/0Z440KCNK5vmdOGD7blS/XuLY/Ab76zsrkCzt33PyYQHyMOS+Y5W3k
 UvS7Fa2WSrqVrQ1g9R2EbaqnKjhNiZRGZ4VXwzsIPCFpfjqU/7qy3AHimg80WEAQ+cNp
 SzTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760353570; x=1760958370;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+aUxvhazo+fI5qnE1t9OWiNPdeUT1J2KZzqa5v9i4n4=;
 b=mdWwyjUF5bgFVVzBsiePk1+k4BpRVWYtI0+AqYno3nxrAgEbSOy3XGJLF7PJ5lq7Mo
 pV4vAcMQKFKEUyq0rWt5lbBc95AKvERg8EFPRdnwPZ8VmcZ3+y1YC09pkZ5QNFs7VLwv
 H9bNUkhrAcoMEslNCCMqbEspejk/rm5gm8X51wvjD1JdO8G+E1ZrsO2+Yy+obuTTR7f8
 mmT68tKwHMRHBcX+TRzvNkgGE4El5hxmg2S3vgu4ocI75FKb0h7i+1N4ntouKpjKHEVU
 Qd7RZKZu7hBLl7zHZUf3B1a7K2YOk5/e0UeuqjPDPKUPqsggR/iPX3dh4IlZuaLjwrSx
 jyig==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyzPsCU3mrHoApFmf12jsXirwcW6DZcdhE6kB6SkJfM/8bwBF94HQeYx0wdfolRGoGbtjS3oa1D64=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz9uwHSTGyprGsuRe9NXnA4h7xARDvj84k++Iz+pzUf2b9GmzyS
 nOsW6KACOb9CJ9cLQMX0nh0t4G/rutVx5gdXPfCVpWbuk5nxaW4HVnKRhaEweFkxat5urZ7v6GT
 ZwzJZmVBIphez0ScttlLOjZCN6WhcHgo=
X-Gm-Gg: ASbGncssOmMs9KV+467dntTMpeligZHezNvAeyFQQ8ESpK8RxeoJnHXj1/RM+l+REKT
 4bHQDwKMkQgfDsjseFaioLZRYcnmeXWL8mDg5z5YzUXxIh54FN66d15vdMAS5whGQtVgsKkpJmQ
 qBzlJD92aNA2/L+pRNvqvIHVUSES7Mgwzcl32+JULMBNIIGuVoY/diDYCxjUBp3YZgg9mXRe3RK
 9CExg/k5JpBpF/7K9gyq1KBmQ==
X-Google-Smtp-Source: AGHT+IGKDAXHZdvVmAlgzfekl2q5ywgCmcwxWyGOCrVIW3K2IvCUoc7P8HxcJHgwR9akx4wiqqa3iRMeNlO7r8vGrAA=
X-Received: by 2002:a05:6402:144e:b0:63a:294:b02a with SMTP id
 4fb4d7f45d1cf-63a0294b35fmr13389237a12.13.1760353570084; Mon, 13 Oct 2025
 04:06:10 -0700 (PDT)
MIME-Version: 1.0
References: <20251001135914.13754-1-caojunjie650@gmail.com>
 <20251001135914.13754-3-caojunjie650@gmail.com>
 <cwgn24f6tnmytd4omr2tul4e5jjin3ijji3ff3qkumqm2xe3t3@ntayu3m5kai3>
 <CAK6c68jBwykcWZm3ckm3nwab-X9Are4rD-eauE4rXA2+XvuX1w@mail.gmail.com>
 <9cafccd5-35d4-46c5-aa57-1b0b8ec116e8@oss.qualcomm.com>
In-Reply-To: <9cafccd5-35d4-46c5-aa57-1b0b8ec116e8@oss.qualcomm.com>
From: Junjie Cao <caojunjie650@gmail.com>
Date: Mon, 13 Oct 2025 19:04:43 +0800
X-Gm-Features: AS18NWAHjO2WhOdNhja1yiGzTv7NF2-hQQdiny2sVnNEXy9aQKZ9xWdUII5sYvA
Message-ID: <CAK6c68iV=n3BvMMa30FuehbMs7-U01s0saZnsYwPVoiyw0VTrg@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/msm/dsi: support DSC configurations with
 slice_per_pkt > 1
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Antonino Maniscalco <antomani103@gmail.com>, 
 Jonathan Marek <jonathan@marek.ca>, Eugene Lepshy <fekz115@gmail.com>,
 Jun Nie <jun.nie@linaro.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2025=E5=B9=B4=
10=E6=9C=8813=E6=97=A5=E5=91=A8=E4=B8=80 17:39=E5=86=99=E9=81=93=EF=BC=9A
> On 13/10/2025 04:52, =E6=9B=B9=E4=BF=8A=E6=9D=B0 wrote:
> >  >Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com
> > <mailto:dmitry.baryshkov@oss.qualcomm.com>> =E4=BA=8E2025=E5=B9=B410=E6=
=9C=882=E6=97=A5=E5=91=A8=E5=9B=9B 10:04=E5=86=99=E9=81=93=EF=BC=9A
> >  >On Wed, Oct 01, 2025 at 09:59:13PM +0800, Junjie Cao wrote:
> >  >> From: Jun Nie <jun.nie@linaro.org <mailto:jun.nie@linaro.org>>
> >  >>
> >  >> Some panels support multiple slice to be sent in a single DSC
> > packet. And
> >  >> this feature is a must for specific panels, such as JDI LPM026M648C=
.
> > Add a
> >  >> dsc_slice_per_pkt member into struct mipi_dsi_device and support th=
e
> >  >> feature in msm mdss driver.
> >  >>
> >  >> Co-developed-by: Jonathan Marek <jonathan@marek.ca
> > <mailto:jonathan@marek.ca>>
> >  >> Signed-off-by: Jonathan Marek <jonathan@marek.ca
> > <mailto:jonathan@marek.ca>>
> >  >> Signed-off-by: Jun Nie <jun.nie@linaro.org <mailto:jun.nie@linaro.o=
rg>>
> >  >> Signed-off-by: Junjie Cao <caojunjie650@gmail.com
> > <mailto:caojunjie650@gmail.com>>
> >  >> ---
> >  >>  drivers/gpu/drm/msm/dsi/dsi_host.c | 25 ++++++++++---------------
> >  >>  include/drm/drm_mipi_dsi.h         |  2 ++
> >  >>  2 files changed, 12 insertions(+), 15 deletions(-)
> >  >
> >  >Please extract the generic part, so that it can be merged through a
> >  >generic tree.
> >  >
> >
> > Sorry, I don't get it.  The generic part, generic tree? Do you mean
> > the drm tree? `slice_per_pkt >=3D 2` is seen on the panels of these
> > tablets that are equipped with qcom chips. I don't know if these
> > panels are used on other platforms, and if it is necessary to do it
> > in drm.
>
> There are two changes here:
> - MIPI DSI header change
> - msm DSI driver
>
> I've asked to split it to those two commits so that he change for
> drm_mipi_dsi.h is more obvious for reviewers and so that it can be
> merged through a drm-misc tree (or through drm-msm tree provided it gets
> a necessary ack).
>

Thanks for your clear explanation.

I don't mind to add the field separately. But should I submit it
with the panel driver together? Otherwise, this field is unused
for a while.

However, as you mentioned, this is not a part of standard, neither
mipi dsi nor VESA DSC. Recently, only Qualcomm devices require it
to calculate parameters, then we use them to program registers. Why
don't we parse the field from devicetree?

>
> --
> With best wishes
> Dmitry

Regards,
Junjie
