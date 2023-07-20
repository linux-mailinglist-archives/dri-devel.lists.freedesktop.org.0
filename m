Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7FE75B5FC
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 19:58:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19C3910E5F0;
	Thu, 20 Jul 2023 17:58:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BC6D10E5FC
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 17:58:24 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-993a37b79e2so177502766b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 10:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1689875902; x=1690480702;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cqyV84rzqAv60Q1JCmzeDg/z3HBPwnmC8UZiN/jzHpI=;
 b=M/Ju0l4Fy9jRgsTVIXzbhsxyG+1eWp5CIy5y9+dXCCf/ZeFuV4UXiuWmdkLXA05WJT
 vEPAAzhbS1k4Z0/yqi8VHPxs0LinSsOIzr4qTSiTrM+mHgcJ1kSlPnyTUf1ib3jr9EqP
 0V9/ondqiSD4rkuCiXH1dOtE6CGfrHaXIkRUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689875902; x=1690480702;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cqyV84rzqAv60Q1JCmzeDg/z3HBPwnmC8UZiN/jzHpI=;
 b=Ze3XRaDiBzXok+KezI6x8/bB6eSrBfMrIIQDNIoWKiTABMIsm21MEEp0tSAffB0RA3
 QwmVsVHOXpXaBczh9db4sT65BXh8mD/rylEr2fNk7Y4ZhReToagM+rsE2rOF3+q9hMa6
 om66ePZ6WplnP/R1c/V+BCUJZgbO7uBAAtMh96tfzURRbmZF2hQrR30NxbFhT1yEIcNv
 tHnKDdP2zqfbmfzg8B8dqraqszHWeuuo6zWpG57LAasjZTZtkvqtSUsfevmfaczB0BBU
 vWSg659w4j8l7pDzi3Js3FDTwVH7StS4d3h38M1BRrNuusT9sFxem4Glj/ojq0d0VQ7A
 oTIQ==
X-Gm-Message-State: ABy/qLb5BWJzGJyte41DDuEf0ZNM2h845kwfN2QPPwM/V7kC0oofIE7n
 ZBlJXUNUPqurBiOlepG86wEDg13qXlI5TsQFMxbr1A==
X-Google-Smtp-Source: APBJJlELy47gBFlbQguyHJieSy9N22t/ip4TlI85OA7Ktc7gxlhK7Rlm2oLzSNvh5eakj845CYhTdQ==
X-Received: by 2002:a17:906:2a03:b0:99b:4908:1a6d with SMTP id
 j3-20020a1709062a0300b0099b49081a6dmr3294410eje.52.1689875902223; 
 Thu, 20 Jul 2023 10:58:22 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com.
 [209.85.208.54]) by smtp.gmail.com with ESMTPSA id
 bn4-20020a170906c0c400b009829d2e892csm1017554ejb.15.2023.07.20.10.58.21
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jul 2023 10:58:21 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-521db0bb0e8so1431a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 10:58:21 -0700 (PDT)
X-Received: by 2002:a50:9ecd:0:b0:51e:295f:4ef0 with SMTP id
 a71-20020a509ecd000000b0051e295f4ef0mr962edf.5.1689875901136; Thu, 20 Jul
 2023 10:58:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230709162253.464299-1-marex@denx.de>
 <CAD=FV=XoX+weEHHz0Cy7ebx-6dRTLAqNeDWz-ejbj6=fAi-F2g@mail.gmail.com>
In-Reply-To: <CAD=FV=XoX+weEHHz0Cy7ebx-6dRTLAqNeDWz-ejbj6=fAi-F2g@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 20 Jul 2023 10:58:09 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XWiPJp-5RU5K8fW=7N-keSFZRfj==nNq+q23-kg7q5uw@mail.gmail.com>
Message-ID: <CAD=FV=XWiPJp-5RU5K8fW=7N-keSFZRfj==nNq+q23-kg7q5uw@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: simple: Drop prepared_time
To: Marek Vasut <marex@denx.de>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Jul 18, 2023 at 7:23=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Sun, Jul 9, 2023 at 9:23=E2=80=AFAM Marek Vasut <marex@denx.de> wrote:
> >
> > This has been superseded by RPM in commit
> > 3235b0f20a0a ("drm/panel: panel-simple: Use runtime pm to avoid excessi=
ve unprepare / prepare")
> > and the last user of the non-RPM case has been dropped in commit
> > b6d5ffce11dd ("drm/panel-simple: Non-eDP panels don't need "HPD" handli=
ng")
> > whatever is left in this driver is just assigned and never used.
> > Drop the remaining parts.
> >
> > Signed-off-by: Marek Vasut <marex@denx.de>
> > ---
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Douglas Anderson <dianders@chromium.org>
> > Cc: Neil Armstrong <neil.armstrong@linaro.org>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Cc: dri-devel@lists.freedesktop.org
> > ---
> >  drivers/gpu/drm/panel/panel-simple.c | 4 ----
> >  1 file changed, 4 deletions(-)
>
> Thanks for cleaning this up.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> I'm happy to apply this or happy for others to. I'll wait a few more
> days and then apply it if nobody else has.

As promised, I've pushed this to drm-misc-next.

c942e935ff3f drm/panel: simple: Drop prepared_time

I had to manually resolve the context conflict since this patch only
applied cleanly atop your other patch [1]. However, the resolution was
trivial.

[1] https://lore.kernel.org/all/20230709135231.449636-1-marex@denx.de/
