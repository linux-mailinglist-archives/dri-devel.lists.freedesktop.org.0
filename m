Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E77ECBD3295
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 15:18:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ACB810E0F2;
	Mon, 13 Oct 2025 13:18:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PJZJL7W9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4B6910E0F2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 13:18:32 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id
 4fb4d7f45d1cf-6364eb29e74so7438532a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 06:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760361511; x=1760966311; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W9AiQH+p3Zc9JwwBJl7QXYeZboD0M4kQBWEkieM2TAA=;
 b=PJZJL7W9afTQl46MAuZQXbEZTNvYgGgD1JX9BIXeGlAOow0/uNztlAXOIhwYgNt3Ez
 Qru3nWHwuLh9Nw0D0cELxJg0usccVE77KeReKP3xLgHctLb4sVxTz4A07NbQMf5hQfnI
 1RF4WdG++Eshymxq0/B/lkAchP+MkTMYeGvmSROXGrTxYypXHy4vIRmyFrK2KC2xIK8Q
 SciUI3MO9SNZrLrjY+r8LJjWmGV7iiMZL0WKojr7z4Dl5+sxWmWBVhSeT34kaAbYRkl4
 v96WJ+c1Z51enhEbblpRTHEwfqJ0OvKZSWWAEE5Mt27M5321b891NrKAYmgmJf866rXa
 cC+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760361511; x=1760966311;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W9AiQH+p3Zc9JwwBJl7QXYeZboD0M4kQBWEkieM2TAA=;
 b=kgnrRva8460Y+YJAiwP4hctM62YTSPsJcm+lSbyw4/A1olR/9n2+MhcAlCYQFCEj3G
 fkG31TCgStH0vl/RuQvZev88wbQwBRtH4YMRNfobLm7Go/GKf4KlkWHUpcBh1MYZOI8W
 uw5dmPLGivAhP5EvutFdQkDxHqSUZnLPqPHzaZvc4lUl/kxW/B33zU1cwfjqZw2GfykK
 h8mDfwS5uWhnPS8nc0bM1fYRp2ci0/CFJiIa5I+1eQlrbpfqu8JThGMJOwlwtSpS7YNF
 jxLO6TrGiNWy2DJrohx5Cpz0zGFOBb0EsIdB0+dVPYAi2fsMAEQiHLH/vzNXrXEfX6/7
 XhWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXk4KMIdozoJcYmdafG6miA0IbEX3gkGBBurYftqmbFbyf0fMzwi1uWy9xe/5tzkN3uRzZS54G3k4U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzTKUBfx3hUbLqERFlET47eWeD9qmDFl5hJWO8Tl7qyY6+CCjdd
 7gPtJFGCPxxVOixTBxYGSUbl9J57NPcyHtHEtucc0twWUfU3DQrhJ6lg5WhfS3BHjC34dqvuriM
 2aiZX/0QwhP01EG+3908JGaJdqaFVvLM=
X-Gm-Gg: ASbGncvic5ySLCJFlYFM6BFo95Dj7FnCqD2lin2yC+xMMGoXYk3a/X+nclApF7QatTX
 BsyKdzYKdOyfv5bRGuNhtVw1dLYohwEL2ruWzYRuQ57NJbg/vgw3cvCw3yN/78nZ3eeirEHs4gb
 6OJbNNYo+XK4OFJ2nZrlb0RKwGo827iYCDG9XnK59LexfSppdfKF+X93LSZLlvNqafjQhJ8FwG4
 It/lM52kZYRCubFJ0MwXUZOAo8N2oaoGnVp
X-Google-Smtp-Source: AGHT+IHv7bID+xbm7RowzwKtepEJM2QOtT7nCXsATO274uCHhG9AaqRttSiuceRtheBHXIXQGcJxOUqKR8B8nZHeuYE=
X-Received: by 2002:a05:6402:3554:b0:639:fb11:9935 with SMTP id
 4fb4d7f45d1cf-639fb119b08mr13930852a12.4.1760361510947; Mon, 13 Oct 2025
 06:18:30 -0700 (PDT)
MIME-Version: 1.0
References: <20251001135914.13754-1-caojunjie650@gmail.com>
 <20251001135914.13754-3-caojunjie650@gmail.com>
 <cwgn24f6tnmytd4omr2tul4e5jjin3ijji3ff3qkumqm2xe3t3@ntayu3m5kai3>
 <CAK6c68jBwykcWZm3ckm3nwab-X9Are4rD-eauE4rXA2+XvuX1w@mail.gmail.com>
 <9cafccd5-35d4-46c5-aa57-1b0b8ec116e8@oss.qualcomm.com>
 <CAK6c68iV=n3BvMMa30FuehbMs7-U01s0saZnsYwPVoiyw0VTrg@mail.gmail.com>
 <icj24ghckurcunjormsfhhscng4wfcxiyadl2z5xduitxxqqmp@iws3pssew5dx>
In-Reply-To: <icj24ghckurcunjormsfhhscng4wfcxiyadl2z5xduitxxqqmp@iws3pssew5dx>
From: Junjie Cao <caojunjie650@gmail.com>
Date: Mon, 13 Oct 2025 21:17:04 +0800
X-Gm-Features: AS18NWACwn3Ejqy7Cy6CMtpi1wwkfKvIy2-Q1E725iHTCiZTeN8KHYUSRZ_-JDg
Message-ID: <CAK6c68hZq2o9YXxzd2dv5AXw5-UfKv_58MoUrQfGyfPiONArEg@mail.gmail.com>
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
10=E6=9C=8813=E6=97=A5=E5=91=A8=E4=B8=80 20:31=E5=86=99=E9=81=93=EF=BC=9A
> On Mon, Oct 13, 2025 at 07:04:43PM +0800, Junjie Cao wrote:
> > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2025=E5=
=B9=B410=E6=9C=8813=E6=97=A5=E5=91=A8=E4=B8=80 17:39=E5=86=99=E9=81=93=EF=
=BC=9A
> > > On 13/10/2025 04:52, =E6=9B=B9=E4=BF=8A=E6=9D=B0 wrote:
> > > >  >Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com
> > > > <mailto:dmitry.baryshkov@oss.qualcomm.com>> =E4=BA=8E2025=E5=B9=B41=
0=E6=9C=882=E6=97=A5=E5=91=A8=E5=9B=9B 10:04=E5=86=99=E9=81=93=EF=BC=9A
> > > >  >On Wed, Oct 01, 2025 at 09:59:13PM +0800, Junjie Cao wrote:
> > > >  >> From: Jun Nie <jun.nie@linaro.org <mailto:jun.nie@linaro.org>>
> > > >  >>
> > > >  >> Some panels support multiple slice to be sent in a single DSC
> > > > packet. And
> > > >  >> this feature is a must for specific panels, such as JDI LPM026M=
648C.
> > > > Add a
> > > >  >> dsc_slice_per_pkt member into struct mipi_dsi_device and suppor=
t the
> > > >  >> feature in msm mdss driver.
> > > >  >>
> > > >  >> Co-developed-by: Jonathan Marek <jonathan@marek.ca
> > > > <mailto:jonathan@marek.ca>>
> > > >  >> Signed-off-by: Jonathan Marek <jonathan@marek.ca
> > > > <mailto:jonathan@marek.ca>>
> > > >  >> Signed-off-by: Jun Nie <jun.nie@linaro.org <mailto:jun.nie@lina=
ro.org>>
> > > >  >> Signed-off-by: Junjie Cao <caojunjie650@gmail.com
> > > > <mailto:caojunjie650@gmail.com>>
> > > >  >> ---
> > > >  >>  drivers/gpu/drm/msm/dsi/dsi_host.c | 25 ++++++++++------------=
---
> > > >  >>  include/drm/drm_mipi_dsi.h         |  2 ++
> > > >  >>  2 files changed, 12 insertions(+), 15 deletions(-)
> > > >  >
> > > >  >Please extract the generic part, so that it can be merged through=
 a
> > > >  >generic tree.
> > > >  >
> > > >
> > > > Sorry, I don't get it.  The generic part, generic tree? Do you mean
> > > > the drm tree? `slice_per_pkt >=3D 2` is seen on the panels of these
> > > > tablets that are equipped with qcom chips. I don't know if these
> > > > panels are used on other platforms, and if it is necessary to do it
> > > > in drm.
> > >
> > > There are two changes here:
> > > - MIPI DSI header change
> > > - msm DSI driver
> > >
> > > I've asked to split it to those two commits so that he change for
> > > drm_mipi_dsi.h is more obvious for reviewers and so that it can be
> > > merged through a drm-misc tree (or through drm-msm tree provided it g=
ets
> > > a necessary ack).
> > >
> >
> > Thanks for your clear explanation.
> >
> > I don't mind to add the field separately. But should I submit it
> > with the panel driver together? Otherwise, this field is unused
> > for a while.
> >
> > However, as you mentioned, this is not a part of standard, neither
> > mipi dsi nor VESA DSC. Recently, only Qualcomm devices require it
> > to calculate parameters, then we use them to program registers. Why
> > don't we parse the field from devicetree?
>
> Because the value is uniquelly identified by the panel's compat string.
>

Yes, it is panel specified.
But can we set it for every panel like

&mdss_dsi0 {
    qcom,mdss-dsc-slice-per-pkt =3D <2>;

    status =3D "okay";

    panel: panel@0 {
        compatible =3D "foo,bar";
        reg =3D <0>;
    };
};

or moving the property to panel node? We access it from child node.

> --
> With best wishes
> Dmitry
