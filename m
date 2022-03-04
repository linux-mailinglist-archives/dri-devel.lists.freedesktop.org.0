Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A76914CDFFA
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 22:57:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55CCA113B7D;
	Fri,  4 Mar 2022 21:57:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE949113B7B;
 Fri,  4 Mar 2022 21:57:43 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 o18-20020a05600c4fd200b003826701f847so7340785wmq.4; 
 Fri, 04 Mar 2022 13:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D7TkAsAlGjYObu7TdoSPfW2GLOJ6vTkBbos7TJsttN0=;
 b=BqLiIbJ2zBK8K4Mx2Wc69vkqiE6eSWCmhXdOWjGffvI1NnSyh+d/WjNITwq2v6V6IG
 9CF1Vd1ELchUlXHCi2qtVEPvMP67rMnevW/VefZ/rTFRxHteb7EduhgXZHP8+kgJqJpA
 j8P97CDzjtcfDnIPMBSDzoFJQwggj+2TH2BsAnWLschCKYYWEnUT1KLDCQPcs2JFkpxB
 vIseJhijpjiEb/6de+dXVHR0sC5UDep93zYf6N/8tHJ18wtCD/Am0L6A3LOWCm3b+iDO
 sSg1K1JMQNULPZIbQ/NVL/aHK4rGD14lMcuCjqLBQGblRQS7zCnKEIVqFpYDwh9rVRdZ
 EJsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D7TkAsAlGjYObu7TdoSPfW2GLOJ6vTkBbos7TJsttN0=;
 b=zIIaDIjHL53Ck8P8kHKNcZzTjP0gnH53r7IcFGhfyJk5JhIky522IufbpwhASHgCtx
 rdGHdosIzEmlmS+Nsdf9LgiuRvfj7/YlmFZcHfdVdVA2JNMTM7SCg2BZu8LSuND3RVdY
 bJCeTJeVZoqdEgD2Z9fxp8HxyOfoR7QoRC7wQ/bptofrs7FKonnoZmZiHaYgJBIMAO5u
 yV38Vy6fuEQtCKbnExwPjlesRQq/PM5drSBa2hUt51KsHErKgpFO1R8FFh6KREdzGp7b
 5BRCdzFSARjchfgwj03OmMnJNMgu+9tKWRENS+7Vl8HkJyA2kc1Ai8hhmRJ3rFbia6e1
 GoKQ==
X-Gm-Message-State: AOAM533g1+XWy0Jl2PcKjRid71PX5kGW7C/HY6QtD+u7QxL+u3+iIpXE
 topIfvvnDwIBKl5cmsmsEBmCaidYWpg64jG0owk=
X-Google-Smtp-Source: ABdhPJwO/bkqOVAmUnFtqrqafLEOzfVIo5UA/cHC4Nov19WqzYp+G1wTFEVO22Hl3ZTxVFCeC3Tccb4ArfhCXkYSmTI=
X-Received: by 2002:a7b:cf23:0:b0:385:17a6:9b9f with SMTP id
 m3-20020a7bcf23000000b0038517a69b9fmr298717wmg.151.1646431062329; Fri, 04 Mar
 2022 13:57:42 -0800 (PST)
MIME-Version: 1.0
References: <20220304202406.846485-1-robdclark@gmail.com>
 <CAA8EJprik57F+t0KicoYaRm=oDOgcQHyHSBjJKbekBKjO_-=0A@mail.gmail.com>
In-Reply-To: <CAA8EJprik57F+t0KicoYaRm=oDOgcQHyHSBjJKbekBKjO_-=0A@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 4 Mar 2022 13:58:11 -0800
Message-ID: <CAF6AEGtM+Jhye7ahW3uFg-8PFHH257-T7Qudo=XMU5-AU2LvcA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: Fix missing ARRAY_SIZE() check
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
 freedreno <freedreno@lists.freedesktop.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 4, 2022 at 1:47 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Fri, 4 Mar 2022 at 23:23, Rob Clark <robdclark@gmail.com> wrote:
> >
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Fixes: f6d62d091cfd ("drm/msm/a6xx: add support for Adreno 660 GPU")
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> However see the comment below.
>
> > ---
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > index 02b47977b5c3..6406d8c3411a 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > @@ -687,6 +687,7 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
> >
> >         BUILD_BUG_ON(ARRAY_SIZE(a6xx_protect) > 32);
> >         BUILD_BUG_ON(ARRAY_SIZE(a650_protect) > 48);
> > +       BUILD_BUG_ON(ARRAY_SIZE(a660_protect) > 48);
>
> The magic number 32 and 48 are repeated through this code. I'd suggest
> to define them and use defined names.
> It can come up as a separate commit.
>

Or perhaps instead:
----
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 6406d8c3411a..58c371930fb4 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -683,20 +683,23 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
 {
        struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
        const u32 *regs = a6xx_protect;
-       unsigned i, count = ARRAY_SIZE(a6xx_protect), count_max = 32;
-
-       BUILD_BUG_ON(ARRAY_SIZE(a6xx_protect) > 32);
-       BUILD_BUG_ON(ARRAY_SIZE(a650_protect) > 48);
-       BUILD_BUG_ON(ARRAY_SIZE(a660_protect) > 48);
+       unsigned i, count, count_max;

        if (adreno_is_a650(adreno_gpu)) {
                regs = a650_protect;
                count = ARRAY_SIZE(a650_protect);
                count_max = 48;
+               BUILD_BUG_ON(ARRAY_SIZE(a650_protect) > 48);
        } else if (adreno_is_a660_family(adreno_gpu)) {
                regs = a660_protect;
                count = ARRAY_SIZE(a660_protect);
                count_max = 48;
+               BUILD_BUG_ON(ARRAY_SIZE(a660_protect) > 48);
+       } else {
+               regs = a6xx_protect;
+               count = ARRAY_SIZE(a6xx_protect);
+               count_max = 32;
+               BUILD_BUG_ON(ARRAY_SIZE(a6xx_protect) > 32);
        }

        /*
----

that moves each of the two uses of constant together..  adding three
#defines each used only twice seems a bit silly, IMHO

BR,
-R
