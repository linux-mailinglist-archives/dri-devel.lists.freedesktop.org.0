Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB854CD291
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 11:40:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 351CE10E43C;
	Fri,  4 Mar 2022 10:40:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 526B010E43C
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Mar 2022 10:40:08 +0000 (UTC)
Received: by mail-qv1-xf35.google.com with SMTP id jr3so6274544qvb.11
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Mar 2022 02:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zbDq9quib58Fk+PBMAEUVZmBaVEvpUtaQmHtuQ7muG8=;
 b=nmtva93elKGwhs2mPAHboSsPjgVtvzntXgTHQIn7C0ttujlW+nc1cXtA25sX3Yk3/2
 wnO9AODGuNmcR2cKayiUz0D0EsrMSt73EFH3eJV2Gsokfsgker6YoAKV7rl5QiVrjKOo
 FNiOj5JTBKWr8E9/J9b+thfZQA2F/MSX3L+m4ld2C23NgaQMyV5iaFhbNmSTPc4Q9ngk
 WQTJ4tMNPM8Qkz+nNSNihGPdw3JqTcCJCB9BHpmFb4J3mmBGT+a0PAFhFb7z2e4bNTaK
 N5907LrF1kn/1bsCjyF1pw57bI7W64A/0sn2Bj+LCK7Ws2nR7o6z+K4nl9lWjx/L12LP
 ITqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zbDq9quib58Fk+PBMAEUVZmBaVEvpUtaQmHtuQ7muG8=;
 b=YLmH61WWfirlV6pnwCw0h/qQJmDexu/A6R/OWqdqT6uQggdqhtYkuPedVh/ONpzsj0
 bUtl4Qr46HJPVvL6sxFG1f0HmBeZEW5NMTiveB2J1q4pvanzu/vckDYXLImVT05Bowg8
 pbaHkq+M7wo6UBAKHNZaPw7ecW4Z8Xz7ftRi0iM5fTNdhu1A8oQbyw6Wo3JNKg6lMuqi
 yNZB0nD9vr/3SYlwavOWShgyA/uX10HRu1+VGtFAblBirzuSmerV17mCMhkQcoi0slyj
 J25mtfH1qmmsapN8pxqcNwRxK7cKP0D9NuW8SGxP9cLW0AcaIOVUtO83V/jcah49SCAL
 PsYw==
X-Gm-Message-State: AOAM530GFOVviQcrW0TQ65rcxienjxDYoPVJNrJdfW1viUWcZDjlJRuP
 +pN2zdfEiWvd4XxkL/3EIWJRNQZTItOf3iV8aEYvbA==
X-Google-Smtp-Source: ABdhPJzFXawxoj+vD6cMYTgvA+eTMfOf8d9Z1o2rob/+npaEevrujz/Cy78Xv54/HE5GQuGkck+XUp+0hSqBumWsqVk=
X-Received: by 2002:ad4:53a4:0:b0:430:1d8c:18ea with SMTP id
 j4-20020ad453a4000000b004301d8c18eamr27277433qvv.115.1646390407361; Fri, 04
 Mar 2022 02:40:07 -0800 (PST)
MIME-Version: 1.0
References: <Yfp8Q6OFqTAvESOi@pendragon.ideasonboard.com>
 <87y22ts948.fsf@intel.com>
 <YfqGbqQQz5vrDaLI@pendragon.ideasonboard.com> <87v8xxs2hz.fsf@intel.com>
 <CAF6AEGtdnWWhGp7U7nAPD4r3Uoe5BJKVm2rQ2MS=q5GqF6MYDA@mail.gmail.com>
 <YhyB0WmJDWVFO1se@pendragon.ideasonboard.com> <871qzn6vmc.fsf@intel.com>
 <Yhy/6+z7QshG+qOo@pendragon.ideasonboard.com>
 <YhzROBOwTUkZw3Ez@pendragon.ideasonboard.com>
 <4d8daabe-10d9-a3cf-d305-68414cffe4ed@quicinc.com>
 <Yh+4EOKA5FgrlZrF@pendragon.ideasonboard.com>
 <0cfd36a2-26e4-309d-d8e9-e3bf8a5d2417@quicinc.com>
 <MWHPR11MB174187335183FC24BE0F1EA5E3059@MWHPR11MB1741.namprd11.prod.outlook.com>
In-Reply-To: <MWHPR11MB174187335183FC24BE0F1EA5E3059@MWHPR11MB1741.namprd11.prod.outlook.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 4 Mar 2022 13:39:56 +0300
Message-ID: <CAA8EJppTVN1EnytD5mCmr4ZTi4M8u9ENOmJuweNyDRkB3LEHnw@mail.gmail.com>
Subject: Re: [PATCH 5/6] drm/rcar_du: changes to rcar-du driver resulting from
 drm_writeback_connector structure changes
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>
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
Cc: Carsten Haitzler <carsten.haitzler@arm.com>, "Nikula,
 Jani" <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, "Murthy,
 Arun R" <arun.r.murthy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, 4 Mar 2022 at 12:56, Kandpal, Suraj <suraj.kandpal@intel.com> wrote=
:
>
> Hi Abhinav,
> > Hi Laurent
> >
> > Ok sure, I can take this up but I need to understand the proposal a lit=
tle bit
> > more before proceeding on this. So we will discuss this in another emai=
l
> > where we specifically talk about the connector changes.
> >
> > Also, I am willing to take this up once the encoder part is done and me=
rged
> > so that atleast we keep moving on that as MSM WB implementation can
> > proceed with that first.
> >
> > Hi Jani and Suraj
> >
> > Any concerns with splitting up the series into encoder and connector OR=
 re-
> > arranging them?
> >
> > Let me know if you can do this OR I can also split this up keeping Sura=
j's
> > name in the Co-developed by tag.
> I was actually thinking of floating a new patch series with both encoder =
and
> connector pointer changes but with a change in initialization functions w=
herein
> we allocate a connector and encoder incase the driver doesn=E2=80=99t hav=
e its own this
> should minimize the effect on other drivers already using current drm wri=
teback
> framework and also allow i915 to create its own connector.

I thought that Laurent was quite strict about the connector. So I'd
suggest targeting drm_writeback_connector with an optionally created
encoder and the builtin connector

> We can work on Laurent's suggestion but that would first require the init=
ial RFC
> patches and then a rework from both of our drivers side to see if they ge=
l well
> with our current code which will take a considerable amount of time. We c=
an for
> now however float the patch series up which minimally affects the current=
 drivers
> and also allows i915 and msm to move forward with its writeback implement=
ation
> off course with a proper documentation stating new drivers shouldn't try =
to make
> their own connectors and encoders and that drm_writeback will do that for=
 them.
> Once that's done and merged we can work with Laurent on his proposal to i=
mprove
> the drm writeback framework so that this issue can be side stepped entire=
ly in future.
> For now I would like to keep the encoder and connector pointer changes to=
gether.


--=20
With best wishes
Dmitry
