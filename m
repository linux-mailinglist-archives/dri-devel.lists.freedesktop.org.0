Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBE723F02B
	for <lists+dri-devel@lfdr.de>; Fri,  7 Aug 2020 17:49:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B5FB6E0FA;
	Fri,  7 Aug 2020 15:48:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7082C6E0AD;
 Fri,  7 Aug 2020 15:48:55 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id l2so2099576wrc.7;
 Fri, 07 Aug 2020 08:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yfueNriVUB3p4pHebmB0wN45L+tb5z/FC2duvCDRetg=;
 b=CJ9vNVD3aZLSnY2sCQYl+Y0UKcQT689KbOVAU5udo/ClWsJNreQJZNXU6iAvGe8iDR
 kUAJW4S7GBVyoAtthSfCBaRWUUUBHuimkpYH/5XJ8PNdnJ0eviz+xhFhYSTHH+m1hoS1
 Om3f4I/W2uHDLUkLzi3i0Ls0osGwgF2ZxG1aNXbjGyrts8KjTnTWTJFAEPgA+tZ8/8gq
 rAtbijUFcMirTFEyFAABbC/KVfr4TvvGldj9w0+rqij0vxa1+oe+uTfRS8GVrGTlFISM
 aCs9/zcM6ZIfssVBDnfPocblj1mydfunen5INJAlAuGECk00ksQIJJYfWtYCDmmmXckT
 bTpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yfueNriVUB3p4pHebmB0wN45L+tb5z/FC2duvCDRetg=;
 b=fQIBFrLoitEfWrUHp+jqK3C/rh3Kw9XHP23bpKcgHh5bqGolegp52FkyOEHJNiGEas
 cyfhfFjtTB4WvXN4B8Q5alwz5jpeZz/i2vmDHg/lqY1TInnUgBXxcye5b8SrUSSqNaym
 wPT0pwn5Ib6q7aMjLGX3La5/WYtz3V3aDb0L0XniG2WwiO5feLg/WfngNL1/MFDlBpXe
 hTeRWhsW1tUUf2gcNLhH2NIOhukWZ2NjK2thX/2Ns2rrmvyhRZvzYXUNBWsiDZtp1kM2
 b0DXaVDErrVL48dEa+dDV0Qsk4wREQgnVUFy4WS4jdhKB0isIsK4w/zRAh5H9PeLbOqT
 vuzg==
X-Gm-Message-State: AOAM530kNH/2qZAAaAXxzGPGFQhTx7K+8Uq/PLpHU/EqYlrc/APRfTYk
 +NBmky6ulbUsXGSaPrJCQzDzYGJSCyINMcljfUI=
X-Google-Smtp-Source: ABdhPJytinwBY5iKZBEt+YLwoGWtqqhpouwAznID40D/s5L6USS9h0V+VI8N7EAyG74/0nL5zvsljvf9illVhaeW6Ls=
X-Received: by 2002:a5d:4ad1:: with SMTP id y17mr13545017wrs.132.1596815333975; 
 Fri, 07 Aug 2020 08:48:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200807071718.17937-1-tanmay@codeaurora.org>
 <20200807071718.17937-3-tanmay@codeaurora.org>
 <b0e8415f-53e6-575d-5774-5f4f7adca982@infradead.org>
In-Reply-To: <b0e8415f-53e6-575d-5774-5f4f7adca982@infradead.org>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 7 Aug 2020 08:49:37 -0700
Message-ID: <CAF6AEGvLrR2LPTF2DDEcxRwQY+pEEcooZh=NBSr5WOs+TUk0Dw@mail.gmail.com>
Subject: Re: [PATCH v9 2/5] drm/msm/dp: add displayPort driver support
To: Randy Dunlap <rdunlap@infradead.org>
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
Cc: David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, khsieh@codeaurora.org,
 Sean Paul <seanpaul@chromium.org>, Tanmay Shah <tanmay@codeaurora.org>,
 Guenter Roeck <groeck@chromium.org>, Vara Reddy <varar@codeaurora.org>,
 aravindh@codeaurora.org, freedreno <freedreno@lists.freedesktop.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 7, 2020 at 8:37 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 8/7/20 12:17 AM, Tanmay Shah wrote:
> > diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> > index 6deaa7d01654..ea3c4d094d09 100644
> > --- a/drivers/gpu/drm/msm/Kconfig
> > +++ b/drivers/gpu/drm/msm/Kconfig
> > @@ -57,6 +57,14 @@ config DRM_MSM_HDMI_HDCP
> >       help
> >         Choose this option to enable HDCP state machine
> >
> > +config DRM_MSM_DP
> > +     bool "Enable DP support in MSM DRM driver"
>
>         bool "Enabled DisplayPort support in MSM DRM driver"
>
> > +     depends on DRM_MSM
> > +     help
> > +       Compile in support for DP driver in msm drm driver. DP external
>
>                                               MSM DRM
>
> Also:
> I can't find anywhere in drivers/gpu/drm/msm/ that explains what MSM means.
> What does it mean?

I believe it stands for "Mobile Station Modem".. in the pre-devicetree
days it was the name of the qcom platform.  Things later shifted to
"qcom" instead, but that was after this driver was merged.  At this
point it is just three letters ;-)

BR,
-R

> > +       display support is enabled through this config option. It can
> > +       be primary or secondary display on device.
> > +
> >  config DRM_MSM_DSI
> >       bool "Enable DSI support in MSM DRM driver"
> >       depends on DRM_MSM
>
> thanks.
> --
> ~Randy
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
