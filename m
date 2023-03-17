Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9985F6BDD8C
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 01:24:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73F5610E24C;
	Fri, 17 Mar 2023 00:24:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A11B210E24C
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 00:24:04 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id b5so1626545iow.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 17:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1679012642;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rFJTRUdrKAQbmJGCN+ld5AkqKv3yfsgaUc2fFe1xZBM=;
 b=nyHkeFF+vvf8xz4aDvAjMN1qF+ht9DiYaEVyzQ425/8YpAIamARYJ9/vJBgcUr5HwQ
 oca3ceBhpgVs+0NLYozznrwIp8IKLIhqntliqewo78Q6AuzXh0KcJ6f8UP2ODGcGBpnW
 oXzQ8AJa5gZug68ZJQ2+nmLiwCNXgJ4w5pwpE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679012642;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rFJTRUdrKAQbmJGCN+ld5AkqKv3yfsgaUc2fFe1xZBM=;
 b=E29WI4b6v1OmVHsjfHBhR52WF/zlaniOESpIfrir0v7M4wS7Mo1ezQh4r1vvCFVRsO
 67NRdLCKQVWjSJJPSDX9h4XZkTdaiW/F1CI9ecUillGZ7UlBLk4ByNuCT1kSXFn0KpD2
 rtzEAxj7h7zktPeqv228RL0ade1I8fTUg8AEtQrxotJMpvufepLGUCaSkukv4pf43nJH
 OLUv/f/nUj+EEWz+72KHrbU3x16uY6FfwA8mRMYqniJLsXE/2w64xt/9EfdKRU1enDWt
 mKD9x39WOpc0/GS0PPjXmV0Dw6STR4vztM5Mq0hl9VYIp/ybwOGQvbp5qLbKtvfUa2V/
 7MYg==
X-Gm-Message-State: AO0yUKWtUaAzV5qSQY2Yemw528O+yOLcPc0xyK8LEjBVx9m0gfsTQ2Uk
 Gaw4QoAV2pbt5US7FWZWQR8FVVHWrJJltbRpUW8=
X-Google-Smtp-Source: AK7set9YCbXwrq0p3bK0nhnwL+YezQi5P4DJmsQCTOvC/V2SfPntmlemgVR1PUELTuDEj9pAM/vEcA==
X-Received: by 2002:a6b:7105:0:b0:753:efbf:767c with SMTP id
 q5-20020a6b7105000000b00753efbf767cmr599787iog.9.1679012641865; 
 Thu, 16 Mar 2023 17:24:01 -0700 (PDT)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com.
 [209.85.166.48]) by smtp.gmail.com with ESMTPSA id
 w29-20020a056638379d00b0040630f8625asm237486jal.13.2023.03.16.17.24.00
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Mar 2023 17:24:00 -0700 (PDT)
Received: by mail-io1-f48.google.com with SMTP id d12so1592443ioe.10
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 17:24:00 -0700 (PDT)
X-Received: by 2002:a02:b192:0:b0:3ad:65e:e489 with SMTP id
 t18-20020a02b192000000b003ad065ee489mr455541jah.1.1679012640151; Thu, 16 Mar
 2023 17:24:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230314114451.8872-1-lujianhua000@gmail.com>
 <CAD=FV=X7K2KQoRCsr17kj-DWiPs7h_zfcYxK_cdBVnC0wR1NwA@mail.gmail.com>
 <ZBEJdX6WVZ3Kqdo0@Gentoo>
In-Reply-To: <ZBEJdX6WVZ3Kqdo0@Gentoo>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 16 Mar 2023 17:23:46 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VgWSvrpCdi2pRr0JctHxcq1-qNJSMAxEVva6nEnv3e_g@mail.gmail.com>
Message-ID: <CAD=FV=VgWSvrpCdi2pRr0JctHxcq1-qNJSMAxEVva6nEnv3e_g@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: Fix panel mode type setting logic
To: Jianhua Lu <lujianhua000@gmail.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


On Tue, Mar 14, 2023 at 4:55=E2=80=AFPM Jianhua Lu <lujianhua000@gmail.com>=
 wrote:
>
> On Tue, Mar 14, 2023 at 10:12:02AM -0700, Doug Anderson wrote:
> > Hi,
> >
> > On Tue, Mar 14, 2023 at 4:45=E2=80=AFAM Jianhua Lu <lujianhua000@gmail.=
com> wrote:
> > >
> > > Some panels set mode type to DRM_MODE_TYPE_PREFERRED by the number
> > > of modes. It isn't reasonable, so set the first mode type to
> > > DRM_MODE_TYPE_PREFERRED. This should be more reasonable.
> > >
> > > Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> > > ---
> > >  drivers/gpu/drm/panel/panel-abt-y030xx067a.c     | 2 +-
> > >  drivers/gpu/drm/panel/panel-auo-a030jtn01.c      | 2 +-
> > >  drivers/gpu/drm/panel/panel-edp.c                | 4 ++--
> > >  drivers/gpu/drm/panel/panel-innolux-ej030na.c    | 2 +-
> > >  drivers/gpu/drm/panel/panel-newvision-nv3051d.c  | 2 +-
> > >  drivers/gpu/drm/panel/panel-newvision-nv3052c.c  | 2 +-
> > >  drivers/gpu/drm/panel/panel-novatek-nt35950.c    | 2 +-
> > >  drivers/gpu/drm/panel/panel-novatek-nt39016.c    | 2 +-
> > >  drivers/gpu/drm/panel/panel-orisetech-ota5601a.c | 2 +-
> > >  drivers/gpu/drm/panel/panel-seiko-43wvf1g.c      | 4 ++--
> > >  drivers/gpu/drm/panel/panel-simple.c             | 4 ++--
> > >  11 files changed, 14 insertions(+), 14 deletions(-)
> >
> > Can you explain more about your motivation here? At least for
> This demonstrates a bad way to set DRM_MODE_TYPE_PREFERRED for panels
> with more than one mode. It mislead the future contributors to send
> a patch with this piece of code. There is also a discussion for it.
> https://lore.kernel.org/lkml/904bc493-7160-32fd-9709-1dcb978ddbab@linaro.=
org/
> > panel-edp and panel-simple it seems like it would be better to leave
> > the logic alone and manually add DRM_MODE_TYPE_PREFERRED to the right
> > mode for the rare panel that actually has more than one mode listed.
> I think we can order it to the first mode if the mode type should be
> DRM_MODE_TYPE_PREFERRED, It's also same.

A pointer to the original discussion would have been super helpful to
be provided in your patch description.

Personally, I still stand by my assertion that I'd rather that
DRM_MODE_TYPE_PREFERRED be placed in the actual data instead of being
done like this in post-processing. To me the old check for "num_modes
=3D=3D 1" is basically saying that the people creating the "static const"
data in this file were lazy and didn't feel like they needed to set a
DRM_MODE_TYPE_PREFERRED when there was only one mode listed. Thus, we
can add it for them. When "num_modes" is more than 1 then we shouldn't
allow the people making the "static const" data to be lazy. We should
force them to set one of the modes to be PREFERRED rather than for
them to have to know about this magic rule.

Thus, for me, my order of preference would be these (note, I've mostly
looked at panel-edp and panel-simple):

1. Leave the check as "num_modes =3D=3D 1" and document that we're
basically allowing the people writing the "static const" structure to
be lazy if there's only one mode. Manually add the
DRM_MODE_TYPE_PREFERRED flag to the small number of cases where there
is more than one mode. Possibly add a warning printout if we end up
without a PREFERRED mode. I'd give a Reviewed-by for this.

2. Fully get rid of this logic and add DRM_MODE_TYPE_PREFERRED to all
of the "static const" data. I guess maybe we can't do that for the
"timings" in panel-edp and panel-simple. I guess for those I'd be OK
with just setting PREFERRED on the first timing like your patch is
doing. I'd give a Reviewed-by for this.

3. Your patch. I won't NAK it since it seems like this is what other
(more senior) DRM folks were suggesting. ...but I don't love it. I
won't give a Reviewed-by for this but won't object to someone else
doing so.

-Doug
