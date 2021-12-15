Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C82B14762B5
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 21:10:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9537E10E66F;
	Wed, 15 Dec 2021 20:10:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35FAA10E66F;
 Wed, 15 Dec 2021 20:10:00 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id c4so40152505wrd.9;
 Wed, 15 Dec 2021 12:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9fwJJay5x47r2hBghamMydvV9fq4hGtlRRKE3PJ0IAc=;
 b=BKaQzk9NyxAqLkWnM4c8toF7n05vdSF75w7lD8VPAskRuFElT7GXRdHro2MkTBM9Uj
 GFmEO8rsZVEMLm7A/IxB49zMs0kAum00uKlXE6KculfLdpdeZ0VIOpUmhAEy1Djw8Pm6
 9xR8XagaGFUffrcB8IXViHAv6jQe232mySn3WfyJ1PvkqEBj+FFF1+z9xFayw4hBGpxv
 pWV4uGyXFw00ujRNkcOS4zDuT0z7O5bA7Mm/BEvlMZttF6YB7V+f/7MdMNMTN2E5V3O6
 kEtP1rEwsAFj5sOUSByAz+e+uVyOq7q6SsKdm1uUe6ZF2ajHEyJuJrAWlpnIzoAtVnfb
 lXcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9fwJJay5x47r2hBghamMydvV9fq4hGtlRRKE3PJ0IAc=;
 b=0WcaRbGXdEe6ca0pg82k+AcKHW5pqg5RED/xznCLy56Gaj6NcI3p8/LJsZIqwCJ9Jf
 6654wjUMmUlKcduWWVJluVyEEh/Ec9i/AviLp3wP4a4jjCGxtCToeSHt4SX834xtWsZO
 BrcfC7AEG4tKHFVU/UN+TrCmvjqGdHa0PC03tXMaVxlUQQQD5BBTt3ZiZ7rVA+S4MgdJ
 dqvCvJe3I7Ns9xXcDrexHwYC/p/61HBD3+ksw5G9ylKgVob/bVpJ6AS41VmE0WkDmD+e
 GS7CQOy/ArXu5QsPRQiqOJsZzdRXj2y0So0uzrMJLOcytcwnjIdyFcyxZM4Tpx9+gi9y
 RgIQ==
X-Gm-Message-State: AOAM532U5IiMgC6G5GNyVKuKbvPvGyzLRuvx4fp71c3NfWCybGPk/FFm
 aU7KJj3R4+2puqgdccqkta2pxfb9cyhyPAXGwPw=
X-Google-Smtp-Source: ABdhPJwkv3UG4cKShRx3f7/OeRZlRq4dZYeasRuU92iCRfO52EWo3lhGFGjRnkGj59tcU5Y7uA3xvAUmayT0BTzg338=
X-Received: by 2002:adf:eac8:: with SMTP id o8mr4889507wrn.93.1639598998659;
 Wed, 15 Dec 2021 12:09:58 -0800 (PST)
MIME-Version: 1.0
References: <20211215174524.1742389-1-robdclark@gmail.com>
 <20211215174524.1742389-2-robdclark@gmail.com>
 <CAA8EJpri+3AjazR2saJaa3Uo05BhC_2gEsRXHJ5wJ81zs5AUTw@mail.gmail.com>
In-Reply-To: <CAA8EJpri+3AjazR2saJaa3Uo05BhC_2gEsRXHJ5wJ81zs5AUTw@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 15 Dec 2021 12:15:18 -0800
Message-ID: <CAF6AEGsZmQR8FvAN5GrDT9psBsNwFL5mWRZq+i0rFcC8Zf09fQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] drm/msm/disp: Tweak display snapshot to match gpu
 snapshot
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: Rob Clark <robdclark@chromium.org>,
 open list <linux-kernel@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Guo Zhengkui <guozhengkui@vivo.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Doug Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Alexey Dobriyan <adobriyan@gmail.com>, Fernando Ramos <greenfoo@u92.eu>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 15, 2021 at 11:17 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Wed, 15 Dec 2021 at 20:49, Rob Clark <robdclark@gmail.com> wrote:
> >
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Add UTS_RELEASE and show timestamp the same way for consistency.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> > ---
> >  drivers/gpu/drm/msm/disp/msm_disp_snapshot.h      | 4 ++--
> >  drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c | 9 ++++++---
> >  2 files changed, 8 insertions(+), 5 deletions(-)
>
> We should pull this out of disp/, it's no longer disp-specific.

Or possibly just move dsi/etc into disp?  It is disp specific in the
sense that dumping GPU state works quite differently..

BR,
-R

>
> --
> With best wishes
> Dmitry
