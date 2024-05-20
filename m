Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1396F8C9D63
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 14:33:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48D3510E6CF;
	Mon, 20 May 2024 12:33:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DZOykOjG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1075810E429
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 12:33:22 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-61e01d5ea74so24467497b3.2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 05:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716208402; x=1716813202; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ovkEWaQCA7eBKIybUwU0MV7EJ/U35ld+RDcvKJwMYS0=;
 b=DZOykOjGuR7zq4VU5w0c5x+oxy0oHc3fmrmuwZrMbCN3Z1nmwxJD2OdOAb8ProZNRt
 LJnDdt48T9SEREEETAYg5/cLj6hgXe+40zOCWNUs1X5aSa5s2DusueAoRRssoj1WyTVy
 z3fVrFj5nzUcZ16dfTKTpm+sEXE8iuQfXTNKww4sGncF/xdn4ZUwAMsLSQ5uYZEQ9aLs
 51Zobh0WFaWt0yoWMQazBXlm+Ofhpl5R5JTuTHoOP0kRhP9wrnZBn+kCiiOrXiXT2mzV
 R8uZ2VAVQPgAnaVxnHLixmqKWdb/ci32pMZuLkLNUKuCiX5MSGAsKRIMsWUb1MOQ95Rm
 qVxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716208402; x=1716813202;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ovkEWaQCA7eBKIybUwU0MV7EJ/U35ld+RDcvKJwMYS0=;
 b=e0efcdF9SlVLh2wCY5mfEZ/oEIROH6OClDEqVx8RoyZu+uovymON28ka55tzrhG9Nt
 21tzYyhMO1yjyzUwqXOQbllcujV7g+/JevrbXZhbkqde33vkZC/oo67gjUHa8jjmHaY2
 I1I9HG6EQaXGPoojNjSWg2MOej8mEYFsCeG3rgpVOvlqr3+oYm9an1tKr54MVw4H6u87
 VPDkYfFJn2+Iva6pLii4RiY6QHHba1jd5xR+TnCGiNyq2ELQZ3JaePKrzmiv6s4mKWc3
 bfb5E60dytMZ19KfYCRoj2X/hNrulKLxWJv1tOxnECGayQJFDcMeuMx27gB/50NJ2mHK
 tx5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrA9eVdAcxRlwjWK4HuW/6dfUC8NHTFFsLwIIqvLoXxP69AiFUPT2JFmwdHs4iLY8srujzI5CDKjFCihm18einiA2Ja/psTtCv2HaNfbmW
X-Gm-Message-State: AOJu0YwQXzwcBGn+2Aj43CnGW9iQi/GIS5m928hFPqZNW4WhwVNHvTnz
 uhnt78z7FLd0+z43eDe42CvKfGo7eBvHzfPGubGy/hVfqktKSted2TG68Rckv/Ki9ejRMizCcrJ
 LCIIMNso6SL5P29tASRx5dX9o6QdtAw2+4FWIFA==
X-Google-Smtp-Source: AGHT+IGs0xMhNjXBQwaD1yEBLjIanzDkrGthytqkRz05Fj5APi4G3kf/ZJJYkvM5bAuoB6pl+p9xmBERmiYfprGkWU8=
X-Received: by 2002:a25:ada8:0:b0:de6:17e7:ddd1 with SMTP id
 3f1490d57ef6-dee4f30c3f1mr26969452276.34.1716208401987; Mon, 20 May 2024
 05:33:21 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1715691257.git.jani.nikula@intel.com>
 <93d6c446ed4831dadfb4a77635a67cf5f27e19ff.1715691257.git.jani.nikula@intel.com>
 <i7labithttzkv62nybrtpucoklycz76ykgj2zjf3qnwycjjsyt@wck7s5uxg2bt>
 <871q5wu0u2.fsf@intel.com>
In-Reply-To: <871q5wu0u2.fsf@intel.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 20 May 2024 15:33:09 +0300
Message-ID: <CAA8EJprJg_yzembu2zb3=r8gGTEbq3fiYqpdNFQyBSGw+9+qcA@mail.gmail.com>
Subject: Re: [PATCH 08/11] drm/msm/dp: switch to struct drm_edid
To: Jani Nikula <jani.nikula@intel.com>
Cc: Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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

On Mon, 20 May 2024 at 15:25, Jani Nikula <jani.nikula@intel.com> wrote:
>
> On Sun, 19 May 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> > On Tue, May 14, 2024 at 03:55:14PM +0300, Jani Nikula wrote:
> >> Prefer the struct drm_edid based functions for reading the EDID and
> >> updating the connector.
> >>
> >> Simplify the flow by updating the EDID property when the EDID is read
> >> instead of at .get_modes.
> >>
> >> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> >>
> >> ---
> >
> > The patch looks good to me, I'd like to hear an opinion from Doug (added
> > to CC).
> >
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> Thanks!
>
> > What is the merge strategy for the series? Do you plan to pick up all
> > the patches to drm-misc or should we pick up individual patches into
> > driver trees?
>
> I think all of the patches here are connected in theme, but
> independent. Either way is fine by me.
>
> >
> >
> >>
> >> Cc: Rob Clark <robdclark@gmail.com>
> >> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >> Cc: Sean Paul <sean@poorly.run>
> >> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> >> Cc: linux-arm-msm@vger.kernel.org
> >> Cc: freedreno@lists.freedesktop.org
> >> ---
> >>  drivers/gpu/drm/msm/dp/dp_display.c | 11 +++----
> >>  drivers/gpu/drm/msm/dp/dp_panel.c   | 47 +++++++++--------------------
> >>  drivers/gpu/drm/msm/dp/dp_panel.h   |  2 +-
> >>  3 files changed, 20 insertions(+), 40 deletions(-)
> >
> > [skipped]
> >
> >> @@ -249,10 +228,12 @@ void dp_panel_handle_sink_request(struct dp_panel *dp_panel)
> >>      panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
> >>
> >>      if (panel->link->sink_request & DP_TEST_LINK_EDID_READ) {
> >> +            /* FIXME: get rid of drm_edid_raw() */
> >
> > The code here can get use of something like drm_edid_smth_checksum().
> > 'Something', because I could not come up with the word that would make
> > it clear that it is the declared checksum instead of the actual /
> > computed one.
>
> This is an annoying one, to be honest, and linked to the historical fact
> that we filter some EDID blocks that have an incorrect checksum.

It is a part of the DP test suite if I remember correctly.

>
> (Some blocks, yes. We don't filter all blocks, because there are some
> nasty docks out there that modify the CTA block but fail to update the
> checksum, and filtering the CTA blocks would render the display
> useless. So we accept CTA blocks with incorrect checksums. But reject
> others. Yay.)
>
> IMO the real fix would be to stop mucking with the EDID, and just expose
> it to userspace, warts and all. We could still ignore the EDID blocks
> with incorrect checksum while using it ourselves if we want to. And with
> that, we could just have a function that checks the last EDID block's
> checksum, and stop using this ->real_edid_checksum thing.
>
> Anyway, yes, we could add the function already.
>
> BR,
> Jani.
>
> >
> >> +            const struct edid *edid = drm_edid_raw(dp_panel->drm_edid);
> >>              u8 checksum;
> >>
> >> -            if (dp_panel->edid)
> >> -                    checksum = dp_panel_get_edid_checksum(dp_panel->edid);
> >> +            if (edid)
> >> +                    checksum = dp_panel_get_edid_checksum(edid);
> >>              else
> >>                      checksum = dp_panel->connector->real_edid_checksum;
> >>
>
> --
> Jani Nikula, Intel



-- 
With best wishes
Dmitry
