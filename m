Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B682402DE
	for <lists+dri-devel@lfdr.de>; Mon, 10 Aug 2020 09:37:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F1406E39C;
	Mon, 10 Aug 2020 07:36:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5BCC6EA1E
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Aug 2020 16:11:44 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id m22so2629013eje.10
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Aug 2020 09:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y9D1KRUva+vEZ2yw/RUAbLSmKMRhybgAq31n6MCUn2w=;
 b=h8dgkoz8y/OiP85im29r03TQUoi5ZKfJewD54te1FYPtv/KEpTqZ+Da+Zaa0mlPEzE
 csDJUwYUPnrshDjQ6xV40Ux3iDsSemGp/pg5DQtAWRaB1aGrbcaG9gUW+rtMRRyLTgQ1
 ncC2qUcZI2kRdy542DbHxGfUEqUYiTPyZUafAliFIznk/rTpMgi5ASJ+4ySkCniKIYMH
 NT/hAK1qje2Ml/rNoKixLn77hnR0JvTBdLS+KtPpJPZMdhr7cQOtZqWHfQgUL/vZkkk7
 E9brMTW0uk6z/ioIWdFAof0g60jFqE3pnegpob1E+DCmYgk2LVRWhJjiwf5Qz2gjAWiK
 Gb+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y9D1KRUva+vEZ2yw/RUAbLSmKMRhybgAq31n6MCUn2w=;
 b=h7gUTHOlNx0A0Uw7HGzpYCkWcpXE7EcvDLDQd6BT6Kn6kGW4HLyewZXzIQj2En6oS3
 CiC9tztIuCRPdbZZIkml0lgMusd57ypYrbWCHgvvjmRonkApvscM5n+DpSeLsu7KAwdC
 WtFp+l98ZPbA19OjK8pKn6/01yDgG2D76R9bKQfSpoi4AYOlT9dkozm0XmCWB6XdZNwu
 afzqLM6ve0Yyef0Y4TJNJSw0bvfYDOS6Csy0OP2RTe4x/17y8EEH8mhbWNqIuNQn/nRE
 D8lfDs9LnMxy8OHt3wNWIP/lcAmFshNrznX8nX1mQN2PVruQZEVWqgQyLMP9ssvywKLB
 PKkw==
X-Gm-Message-State: AOAM531ZSLSMa948Tsq79ASsEZ9rS6nc0GOorKN6L8LJDW6GC8YTPXaf
 7VDK1qxZmGzNrtJw+mfK1ReFgj79ilRzUa1CYcGIizxD0vI=
X-Google-Smtp-Source: ABdhPJyrYrsX5pEESa8H+K7koPpEjRogCNgaqAF5EHjcrBUY1fHtp+5JeCDPHY/P9J9KeauYe50jhbLLuLbLdMYGuqM=
X-Received: by 2002:a17:906:9399:: with SMTP id
 l25mr9939694ejx.212.1596816703233; 
 Fri, 07 Aug 2020 09:11:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200807071718.17937-1-tanmay@codeaurora.org>
 <20200807071718.17937-3-tanmay@codeaurora.org>
 <b0e8415f-53e6-575d-5774-5f4f7adca982@infradead.org>
 <CAF6AEGvLrR2LPTF2DDEcxRwQY+pEEcooZh=NBSr5WOs+TUk0Dw@mail.gmail.com>
In-Reply-To: <CAF6AEGvLrR2LPTF2DDEcxRwQY+pEEcooZh=NBSr5WOs+TUk0Dw@mail.gmail.com>
From: Guenter Roeck <groeck@google.com>
Date: Fri, 7 Aug 2020 09:11:32 -0700
Message-ID: <CABXOdTeYOVWKNWfJxxVDC6Mdu1aisCs6yDCAdxRQGuUp8r2EQA@mail.gmail.com>
Subject: Re: [PATCH v9 2/5] drm/msm/dp: add displayPort driver support
To: Rob Clark <robdclark@gmail.com>
X-Mailman-Approved-At: Mon, 10 Aug 2020 07:35:58 +0000
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
 Randy Dunlap <rdunlap@infradead.org>, Abhinav Kumar <abhinavk@codeaurora.org>,
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

On Fri, Aug 7, 2020 at 8:48 AM Rob Clark <robdclark@gmail.com> wrote:
>
> On Fri, Aug 7, 2020 at 8:37 AM Randy Dunlap <rdunlap@infradead.org> wrote:
> >
> > On 8/7/20 12:17 AM, Tanmay Shah wrote:
> > > diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> > > index 6deaa7d01654..ea3c4d094d09 100644
> > > --- a/drivers/gpu/drm/msm/Kconfig
> > > +++ b/drivers/gpu/drm/msm/Kconfig
> > > @@ -57,6 +57,14 @@ config DRM_MSM_HDMI_HDCP
> > >       help
> > >         Choose this option to enable HDCP state machine
> > >
> > > +config DRM_MSM_DP
> > > +     bool "Enable DP support in MSM DRM driver"
> >
> >         bool "Enabled DisplayPort support in MSM DRM driver"
> >
> > > +     depends on DRM_MSM
> > > +     help
> > > +       Compile in support for DP driver in msm drm driver. DP external
> >
> >                                               MSM DRM
> >
> > Also:
> > I can't find anywhere in drivers/gpu/drm/msm/ that explains what MSM means.
> > What does it mean?
>
> I believe it stands for "Mobile Station Modem".. in the pre-devicetree
> days it was the name of the qcom platform.  Things later shifted to
> "qcom" instead, but that was after this driver was merged.  At this
> point it is just three letters ;-)
>

FWIW: https://en.wikichip.org/wiki/qualcomm/msm

Guenter

> BR,
> -R
>
> > > +       display support is enabled through this config option. It can
> > > +       be primary or secondary display on device.
> > > +
> > >  config DRM_MSM_DSI
> > >       bool "Enable DSI support in MSM DRM driver"
> > >       depends on DRM_MSM
> >
> > thanks.
> > --
> > ~Randy
> >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
